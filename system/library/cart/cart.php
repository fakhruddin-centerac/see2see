<?php
namespace Cart;
class Cart {
	private $data = array();

	public function __construct($registry) {
		
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

		// Remove all the expired carts with no customer ID
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE (api_id > '0' OR customer_id = '0') AND date_added < DATE_SUB(NOW(), INTERVAL 1 HOUR)");

		if ($this->customer->getId()) {
			// We want to change the session ID on all the old items in the customers cart
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET session_id = '" . $this->db->escape($this->session->getId()) . "' WHERE api_id = '0' AND customer_id = '" . (int)$this->customer->getId() . "'");

			// Once the customer is logged in we want to update the customers cart
			$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '0' AND customer_id = '0' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

			foreach ($cart_query->rows as $cart) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart['cart_id'] . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "custom_cart WHERE cart_id = '" . (int)$cart['cart_id'] . "'");

				// The advantage of using $this->add is that it will check if the products already exist and increaser the quantity if necessary.
				$this->add($cart['product_id'], $cart['quantity'], json_decode($cart['option']), $cart['recurring_id']);
			}
		}

	}

	public function getProducts() {
		$product_data = array();
		/*echo "<pre/>";
		print_r($this->session->data);exit;*/
		$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

		foreach ($cart_query->rows as $cart) {

			$stock = true;

			$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store p2s LEFT JOIN " . DB_PREFIX . "product p ON (p2s.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND p2s.product_id = '" . (int)$cart['product_id'] . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");

			if ($product_query->num_rows && ($cart['quantity'] > 0)) {
				$option_price = 0;
				$option_points = 0;
				$option_weight = 0;

				$option_data = array();

				foreach (json_decode($cart['option']) as $product_option_id => $value) {
					$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$cart['product_id'] . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

					if ($option_query->num_rows) {
						if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio') {
						  //echo "SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points,pov.child_price,pov.top_up_child,pov.top_up_adults, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
							$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points,pov.child_price,pov.top_up_child,pov.top_up_adults, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

							if ($option_value_query->num_rows) {
								if ($option_value_query->row['price_prefix'] == '+') {
								   
								    if(isset($this->session->data[$cart['product_id']]['top_up']))
                                     {
                                        if($this->session->data[$cart['product_id']]['top_up']==0)
                                        {
                                           $option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
                                           $option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
                                        }
    								     else
                                         {
                                            if($this->session->data[$cart['product_id']]['travel_type']!="without_transfer")
                                              {
                                                 $option_price += $option_value_query->row['top_up_adults'] * $this->session->data[$cart['product_id']]['parent'];
                                                 $option_price += $option_value_query->row['top_up_child'] * $this->session->data[$cart['product_id']]['child'];
                                                 $option_price += $option_value_query->row['price'];
                                              }
                                             else
                                             {
                                                $option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
                                                $option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
                                                
                                             } 
                                            
                                         }
                                        
                                     }
                                    else
                                    {
                                        $option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
                                        $option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
                                    } 
                                    
                                } elseif ($option_value_query->row['price_prefix'] == '-') {
									$option_price -= $option_value_query->row['price'];
								}

								if ($option_value_query->row['points_prefix'] == '+') {
									$option_points += $option_value_query->row['points'];
								} elseif ($option_value_query->row['points_prefix'] == '-') {
									$option_points -= $option_value_query->row['points'];
								}

								if ($option_value_query->row['weight_prefix'] == '+') {
									$option_weight += $option_value_query->row['weight'];
								} elseif ($option_value_query->row['weight_prefix'] == '-') {
									$option_weight -= $option_value_query->row['weight'];
								}

								if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
									$stock = false;
								}

								$option_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => $value,
									'option_id'               => $option_query->row['option_id'],
									'option_value_id'         => $option_value_query->row['option_value_id'],
									'name'                    => $option_query->row['name'],
									'value'                   => $option_value_query->row['name'],
									'type'                    => $option_query->row['type'],
									'quantity'                => $option_value_query->row['quantity'],
									'subtract'                => $option_value_query->row['subtract'],
									'price'                   => $option_value_query->row['price'],
                                    /*custom add*/
                                    'child_price'                   => $option_value_query->row['child_price'],
                                    /*close*/
									'price_prefix'            => $option_value_query->row['price_prefix'],
									'points'                  => $option_value_query->row['points'],
									'points_prefix'           => $option_value_query->row['points_prefix'],
									'weight'                  => $option_value_query->row['weight'],
									'weight_prefix'           => $option_value_query->row['weight_prefix']
								);
							}
						} elseif ($option_query->row['type'] == 'checkbox' && is_array($value)) {
							foreach ($value as $product_option_value_id) {
								$option_value_query = $this->db->query("SELECT pov.option_value_id, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix, ovd.name FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (pov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

								if ($option_value_query->num_rows) {
									if ($option_value_query->row['price_prefix'] == '+') {
										$option_price += $option_value_query->row['price'];
									} elseif ($option_value_query->row['price_prefix'] == '-') {
										$option_price -= $option_value_query->row['price'];
									}

									if ($option_value_query->row['points_prefix'] == '+') {
										$option_points += $option_value_query->row['points'];
									} elseif ($option_value_query->row['points_prefix'] == '-') {
										$option_points -= $option_value_query->row['points'];
									}

									if ($option_value_query->row['weight_prefix'] == '+') {
										$option_weight += $option_value_query->row['weight'];
									} elseif ($option_value_query->row['weight_prefix'] == '-') {
										$option_weight -= $option_value_query->row['weight'];
									}

									if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
										$stock = false;
									}

									$option_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $product_option_value_id,
										'option_id'               => $option_query->row['option_id'],
										'option_value_id'         => $option_value_query->row['option_value_id'],
										'name'                    => $option_query->row['name'],
										'value'                   => $option_value_query->row['name'],
										'type'                    => $option_query->row['type'],
										'quantity'                => $option_value_query->row['quantity'],
										'subtract'                => $option_value_query->row['subtract'],
										'price'                   => $option_value_query->row['price'],
										'price_prefix'            => $option_value_query->row['price_prefix'],
										'points'                  => $option_value_query->row['points'],
										'points_prefix'           => $option_value_query->row['points_prefix'],
										'weight'                  => $option_value_query->row['weight'],
										'weight_prefix'           => $option_value_query->row['weight_prefix']
									);
								}
							}
						} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
							$option_data[] = array(
								'product_option_id'       => $product_option_id,
								'product_option_value_id' => '',
								'option_id'               => $option_query->row['option_id'],
								'option_value_id'         => '',
								'name'                    => $option_query->row['name'],
								'value'                   => $value,
								'type'                    => $option_query->row['type'],
								'quantity'                => '',
								'subtract'                => '',
								'price'                   => '',
								'price_prefix'            => '',
								'points'                  => '',
								'points_prefix'           => '',
								'weight'                  => '',
								'weight_prefix'           => ''
							);
						}
					}
				}
				
				///custom pricing
				$custom_price = 0;
				$custom_cart_result = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_cart WHERE cart_id = '" . (int)$cart['cart_id'] . "' ");

				if($custom_cart_result->num_rows > 0){
					
					$custom_cart = $custom_cart_result->row;

					
					if(!empty($custom_cart['room_options'])){
						
						if($custom_cart['nationality']==99){
							$price_field 			= 'ind_market_price';
							$BB_adult_price_field 	= 'ind_adult_BB_price';
							$BB_child_price_field 	= 'ind_child_BB_price';
							$HB_adult_price_field 	= 'ind_adult_HB_price';
							$HB_child_price_field 	= 'ind_child_HB_price';
							$FB_adult_price_field 	= 'ind_adult_FB_price';
							$FB_child_price_field 	= 'ind_child_FB_price';
						}else{
							$price_field 			= 'all_market_price';
							$BB_adult_price_field 	= 'all_adult_BB_price';
							$BB_child_price_field 	= 'all_child_BB_price';
							$HB_adult_price_field 	= 'all_adult_HB_price';
							$HB_child_price_field 	= 'all_child_HB_price';
							$FB_adult_price_field 	= 'all_adult_FB_price';
							$FB_child_price_field 	= 'all_child_FB_price';
						}
						$room_total_price = 0;
						$adult_meal_price = 0;
						$child_meal_price = 0;
						$meal_total_price = 0;
						$room_options = explode(',',$custom_cart['room_options']);						
						$discounts = explode(',',$custom_cart['discounts']);						
						$meals_options = explode(',',$custom_cart['meals_options']);

						foreach($room_options as $key=>$room){
							
							$rooms_result = $this->db->query("SELECT $price_field as room_price,$BB_adult_price_field as BB_adult_price,$BB_child_price_field as BB_child_price,$HB_adult_price_field as HB_adult_price,$HB_child_price_field as HB_child_price,$FB_adult_price_field as FB_adult_price,$FB_child_price_field as FB_child_price FROM " . DB_PREFIX . "product_room_option WHERE product_room_option_id = '" . (int)$room . "' ")->row;
							/*echo "<pre/>";
							print_r($rooms_result);*/
							$room_amount = (round($rooms_result['room_price']) * $custom_cart['no_of_days']);
							if($discounts[$key]!= 0){ 

	                            $discount_amount = ($discounts[$key] / 100) * round($rooms_result['room_price']);
	                            $room_amount = ($rooms_result['room_price'] - $discount_amount) * $custom_cart['no_of_days'];
	                        }
	                       
	                        //adult meals price 
	                        if($custom_cart['adult'] > 0){
	                        	if($meals_options[$key]=='NA'){
	                        		$adult_meal_price = 0;
	                        	}else{
	                        		$adult_meal_price = (round($rooms_result["$meals_options[$key]"."_adult_price"]) * $custom_cart['no_of_days']);
	                        	} 
	                        }
	                      
	                        //child meals price 
	                        if($custom_cart['child'] > 0){
	                        	if($meals_options[$key]=='NA'){
	                        		$child_meal_price = 0;
	                        	}else{
		                        	$child_meal_price = (round($rooms_result["$meals_options[$key]"."_child_price"]) * $custom_cart['no_of_days']);
		                        }
	                        }	                        
	                        $meal_total_price = $adult_meal_price + $child_meal_price;
	                       
	                        $room_total_price = $room_total_price + $room_amount + $meal_total_price;
	                       
						}						

					}
					
					//exit;
					$custom_price = $custom_price + $room_total_price;
					 
					if($custom_cart['product_type']=='HB'){
						$visa_total = 0;
						if(!empty($custom_cart['visa_options'])){
							$visa_options = explode(',',$custom_cart['visa_options']);
						
							if(!empty($visa_options)){
								foreach($visa_options as $visa){
									if($visa !=""){
										$visa_price = $this->db->query("SELECT price FROM " . DB_PREFIX . "product WHERE product_id='". $visa."' ")->row;
										$visa_total = $visa_total + $visa_price['price'];
									}
									
								}	
							}
							$custom_price = $custom_price + $visa_total;
						}
						
					}


					
					if($custom_cart['product_type']=='SP'){
						$visa_total = 0;						
						$visa_options = explode(',',$custom_cart['visa_options']);
						if(!empty($visa_options)){
							foreach($visa_options as $visa){
								$visa_price = $this->db->query("SELECT value FROM " . DB_PREFIX . "product_option WHERE product_id='". (int)$cart['product_id'] ."' AND option_id='".$visa."' ")->row;
								$visa_total = $visa_total + $visa_price['value'];
							}	

						}
						
						$custom_price = $custom_price + $visa_total;
						///////transfer option price
						if(!empty($custom_cart['transfer_options'])){
							$transfer_options  = json_decode($custom_cart['transfer_options']);
							$transfer_option_price = 0;
							$transfer_option_data = array();

							foreach (json_decode($custom_cart['transfer_options']) as $product_option_id => $value) {
								$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$custom_cart['transfer_product'] . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

								if ($option_query->num_rows) {
									if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio') {
									  //echo "SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points,pov.child_price,pov.top_up_child,pov.top_up_adults, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
										$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points,pov.child_price,pov.top_up_child,pov.top_up_adults, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

										if ($option_value_query->num_rows) {
											if ($option_value_query->row['price_prefix'] == '+') {
											   
											    if(isset($this->session->data[$cart['product_id']]['top_up']))
			                                     {
			                                        if($this->session->data[$cart['product_id']]['top_up']==0)
			                                        {
			                                           $transfer_option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
			                                           $transfer_option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
			                                        }
			    								     else
			                                         {
			                                            if($this->session->data[$cart['product_id']]['travel_type']!="without_transfer")
			                                              {
			                                                 $transfer_option_price += $option_value_query->row['top_up_adults'] * $this->session->data[$cart['product_id']]['parent'];
			                                                 $transfer_option_price += $option_value_query->row['top_up_child'] * $this->session->data[$cart['product_id']]['child'];
			                                                 $transfer_option_price += $option_value_query->row['price'];
			                                              }
			                                             else
			                                             {
			                                                $transfer_option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
			                                                $transfer_option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
			                                                
			                                             } 
			                                            
			                                         }
			                                        
			                                     }
			                                    else
			                                    {
			                                        $transfer_option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
			                                        $transfer_option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
			                                    } 
			                                    
			                                } elseif ($option_value_query->row['price_prefix'] == '-') {
												$transfer_option_price -= $option_value_query->row['price'];
											}

											if ($option_value_query->row['points_prefix'] == '+') {
												$option_points += $option_value_query->row['points'];
											} elseif ($option_value_query->row['points_prefix'] == '-') {
												$option_points -= $option_value_query->row['points'];
											}

											if ($option_value_query->row['weight_prefix'] == '+') {
												$option_weight += $option_value_query->row['weight'];
											} elseif ($option_value_query->row['weight_prefix'] == '-') {
												$option_weight -= $option_value_query->row['weight'];
											}

											if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
												$stock = false;
											}

											$transfer_option_data[] = array(
												'product_option_id'       => $product_option_id,
												'product_option_value_id' => $value,
												'option_id'               => $option_query->row['option_id'],
												'option_value_id'         => $option_value_query->row['option_value_id'],
												'name'                    => $option_query->row['name'],
												'value'                   => $option_value_query->row['name'],
												'type'                    => $option_query->row['type'],
												'quantity'                => $option_value_query->row['quantity'],
												'subtract'                => $option_value_query->row['subtract'],
												'price'                   => $option_value_query->row['price'],
			                                    /*custom add*/
			                                    'child_price'                   => $option_value_query->row['child_price'],
			                                    /*close*/
												'price_prefix'            => $option_value_query->row['price_prefix'],
												'points'                  => $option_value_query->row['points'],
												'points_prefix'           => $option_value_query->row['points_prefix'],
												'weight'                  => $option_value_query->row['weight'],
												'weight_prefix'           => $option_value_query->row['weight_prefix']
											);
										}
									} elseif ($option_query->row['type'] == 'checkbox' && is_array($value)) {
										foreach ($value as $product_option_value_id) {
											$option_value_query = $this->db->query("SELECT pov.option_value_id, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix, ovd.name FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (pov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

											if ($option_value_query->num_rows) {
												if ($option_value_query->row['price_prefix'] == '+') {
													$transfer_option_price += $option_value_query->row['price'];
												} elseif ($option_value_query->row['price_prefix'] == '-') {
													$transfer_option_price -= $option_value_query->row['price'];
												}

												if ($option_value_query->row['points_prefix'] == '+') {
													$option_points += $option_value_query->row['points'];
												} elseif ($option_value_query->row['points_prefix'] == '-') {
													$option_points -= $option_value_query->row['points'];
												}

												if ($option_value_query->row['weight_prefix'] == '+') {
													$option_weight += $option_value_query->row['weight'];
												} elseif ($option_value_query->row['weight_prefix'] == '-') {
													$option_weight -= $option_value_query->row['weight'];
												}

												if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
													$stock = false;
												}

												$transfer_option_data[] = array(
													'product_option_id'       => $product_option_id,
													'product_option_value_id' => $product_option_value_id,
													'option_id'               => $option_query->row['option_id'],
													'option_value_id'         => $option_value_query->row['option_value_id'],
													'name'                    => $option_query->row['name'],
													'value'                   => $option_value_query->row['name'],
													'type'                    => $option_query->row['type'],
													'quantity'                => $option_value_query->row['quantity'],
													'subtract'                => $option_value_query->row['subtract'],
													'price'                   => $option_value_query->row['price'],
													'price_prefix'            => $option_value_query->row['price_prefix'],
													'points'                  => $option_value_query->row['points'],
													'points_prefix'           => $option_value_query->row['points_prefix'],
													'weight'                  => $option_value_query->row['weight'],
													'weight_prefix'           => $option_value_query->row['weight_prefix']
												);
											}
										}
									} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
										$transfer_option_data[] = array(
											'product_option_id'       => $product_option_id,
											'product_option_value_id' => '',
											'option_id'               => $option_query->row['option_id'],
											'option_value_id'         => '',
											'name'                    => $option_query->row['name'],
											'value'                   => $value,
											'type'                    => $option_query->row['type'],
											'quantity'                => '',
											'subtract'                => '',
											'price'                   => '',
											'price_prefix'            => '',
											'points'                  => '',
											'points_prefix'           => '',
											'weight'                  => '',
											'weight_prefix'           => ''
										);
									}
								}
							}



							$custom_price = $custom_price + $transfer_option_price;
						}
						
						///////tour pricing
						$total_tour_price = 0;
						if(json_decode($custom_cart['tour_options'])==3){
							$total_people = $custom_cart['adult'] + $custom_cart['child'];
		 					$total_tour_price = (200 * $total_people);							
		 				}
		 				if(json_decode($custom_cart['tour_options'])==4){
		 					$total_people = $custom_cart['adult'] + $custom_cart['child'];
		 					$total_tour_price = (300 * $total_people);							
		 				}
		 				if(json_decode($custom_cart['tour_options'])==5){
		 					$total_people = $custom_cart['adult'] + $custom_cart['child'];
		 					$total_tour_price = (350 * $total_people);							
		 				} 						

						$custom_price = $custom_price + $total_tour_price;

					}
					/*echo "<pre/>";
					print_r($this->session->data);exit;*/

					if($custom_cart['product_type']=='MP'){						
						$visa_total = 0;	
						if(!empty($custom_cart['visa_options'])){
							$visa_options = explode(',',$custom_cart['visa_options']);							
							foreach($visa_options as $visa){
								$visa_price = $this->db->query("SELECT value FROM " . DB_PREFIX . "product_option WHERE product_id='". (int)$cart['product_id'] ."' AND option_id='".$visa."' ")->row;
								$visa_total = $visa_total + $visa_price['value'];
							}	
						}	
						
						$custom_price = $custom_price + $visa_total;

						///////transfer option price
						if(!empty($custom_cart['transfer_options'])){
							$transfer_options  = json_decode($custom_cart['transfer_options']);
							$transfer_option_price = 0;
							$transfer_option_data = array();

							foreach (json_decode($custom_cart['transfer_options']) as $product_option_id => $value) {
								$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$custom_cart['transfer_product'] . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

								if ($option_query->num_rows) {
									if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio') {
									  //echo "SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points,pov.child_price,pov.top_up_child,pov.top_up_adults, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
										$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points,pov.child_price,pov.top_up_child,pov.top_up_adults, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

										if ($option_value_query->num_rows) {
											if ($option_value_query->row['price_prefix'] == '+') {
											   
											    if(isset($this->session->data[$cart['product_id']]['top_up']))
			                                     {
			                                        if($this->session->data[$cart['product_id']]['top_up']==0)
			                                        {
			                                           $transfer_option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
			                                           $transfer_option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
			                                        }
			    								     else
			                                         {
			                                            if($this->session->data[$cart['product_id']]['travel_type']!="without_transfer")
			                                              {
			                                                 $transfer_option_price += $option_value_query->row['top_up_adults'] * $this->session->data[$cart['product_id']]['parent'];
			                                                 $transfer_option_price += $option_value_query->row['top_up_child'] * $this->session->data[$cart['product_id']]['child'];
			                                                 $transfer_option_price += $option_value_query->row['price'];
			                                              }
			                                             else
			                                             {
			                                                $transfer_option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
			                                                $transfer_option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
			                                                
			                                             } 
			                                            
			                                         }
			                                        
			                                     }
			                                    else
			                                    {
			                                        $transfer_option_price += $option_value_query->row['price'] * $this->session->data[$cart['product_id']]['parent'];
			                                        $transfer_option_price += $option_value_query->row['child_price'] * $this->session->data[$cart['product_id']]['child'];
			                                    } 
			                                    
			                                } elseif ($option_value_query->row['price_prefix'] == '-') {
												$transfer_option_price -= $option_value_query->row['price'];
											}

											if ($option_value_query->row['points_prefix'] == '+') {
												$option_points += $option_value_query->row['points'];
											} elseif ($option_value_query->row['points_prefix'] == '-') {
												$option_points -= $option_value_query->row['points'];
											}

											if ($option_value_query->row['weight_prefix'] == '+') {
												$option_weight += $option_value_query->row['weight'];
											} elseif ($option_value_query->row['weight_prefix'] == '-') {
												$option_weight -= $option_value_query->row['weight'];
											}

											if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
												$stock = false;
											}

											$transfer_option_data[] = array(
												'product_option_id'       => $product_option_id,
												'product_option_value_id' => $value,
												'option_id'               => $option_query->row['option_id'],
												'option_value_id'         => $option_value_query->row['option_value_id'],
												'name'                    => $option_query->row['name'],
												'value'                   => $option_value_query->row['name'],
												'type'                    => $option_query->row['type'],
												'quantity'                => $option_value_query->row['quantity'],
												'subtract'                => $option_value_query->row['subtract'],
												'price'                   => $option_value_query->row['price'],
			                                    /*custom add*/
			                                    'child_price'                   => $option_value_query->row['child_price'],
			                                    /*close*/
												'price_prefix'            => $option_value_query->row['price_prefix'],
												'points'                  => $option_value_query->row['points'],
												'points_prefix'           => $option_value_query->row['points_prefix'],
												'weight'                  => $option_value_query->row['weight'],
												'weight_prefix'           => $option_value_query->row['weight_prefix']
											);
										}
									} elseif ($option_query->row['type'] == 'checkbox' && is_array($value)) {
										foreach ($value as $product_option_value_id) {
											$option_value_query = $this->db->query("SELECT pov.option_value_id, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix, ovd.name FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (pov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

											if ($option_value_query->num_rows) {
												if ($option_value_query->row['price_prefix'] == '+') {
													$transfer_option_price += $option_value_query->row['price'];
												} elseif ($option_value_query->row['price_prefix'] == '-') {
													$transfer_option_price -= $option_value_query->row['price'];
												}

												if ($option_value_query->row['points_prefix'] == '+') {
													$option_points += $option_value_query->row['points'];
												} elseif ($option_value_query->row['points_prefix'] == '-') {
													$option_points -= $option_value_query->row['points'];
												}

												if ($option_value_query->row['weight_prefix'] == '+') {
													$option_weight += $option_value_query->row['weight'];
												} elseif ($option_value_query->row['weight_prefix'] == '-') {
													$option_weight -= $option_value_query->row['weight'];
												}

												if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
													$stock = false;
												}

												$transfer_option_data[] = array(
													'product_option_id'       => $product_option_id,
													'product_option_value_id' => $product_option_value_id,
													'option_id'               => $option_query->row['option_id'],
													'option_value_id'         => $option_value_query->row['option_value_id'],
													'name'                    => $option_query->row['name'],
													'value'                   => $option_value_query->row['name'],
													'type'                    => $option_query->row['type'],
													'quantity'                => $option_value_query->row['quantity'],
													'subtract'                => $option_value_query->row['subtract'],
													'price'                   => $option_value_query->row['price'],
													'price_prefix'            => $option_value_query->row['price_prefix'],
													'points'                  => $option_value_query->row['points'],
													'points_prefix'           => $option_value_query->row['points_prefix'],
													'weight'                  => $option_value_query->row['weight'],
													'weight_prefix'           => $option_value_query->row['weight_prefix']
												);
											}
										}
									} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
										$transfer_option_data[] = array(
											'product_option_id'       => $product_option_id,
											'product_option_value_id' => '',
											'option_id'               => $option_query->row['option_id'],
											'option_value_id'         => '',
											'name'                    => $option_query->row['name'],
											'value'                   => $value,
											'type'                    => $option_query->row['type'],
											'quantity'                => '',
											'subtract'                => '',
											'price'                   => '',
											'price_prefix'            => '',
											'points'                  => '',
											'points_prefix'           => '',
											'weight'                  => '',
											'weight_prefix'           => ''
										);
									}
								}
							}

							//echo 'transfer option:'.$transfer_option_price;exit;

							$custom_price = $custom_price + $transfer_option_price;
						}
						
						/*echo "custom price:".$custom_price;exit;*/
						//echo "<pre/>";print_r($this->session->data);exit;
						///////tour pricing
						if(!empty($custom_cart['tour_options'])){

							$tour_option_price = 0;
							
							foreach(json_decode($custom_cart['tour_options']) as $key=>$options){

									$transfer_option_data = array();
									
									foreach ($options as $product_option_id => $value) {
										$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$key . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

										if ($option_query->num_rows) {
											if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio') {
											
												$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points,pov.child_price,pov.top_up_child,pov.top_up_adults, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

												if ($option_value_query->num_rows) {
													if ($option_value_query->row['price_prefix'] == '+') {
													   
													    if(isset($this->session->data['tours'][$key]['top_up']))
					                                    {
					                                        if($this->session->data['tours'][$key]['top_up']==0)
					                                        {
					                                           $tour_option_price += $option_value_query->row['price'] * $this->session->data['tours'][$key]['parent'];
					                                           $tour_option_price += $option_value_query->row['child_price'] * $this->session->data['tours'][$key]['child'];
					                                        }
					    								    else
					                                        {
					                                            if($this->session->data[$cart['product_id']]['travel_type']!="without_transfer")
					                                            {
					                                                 $tour_option_price += $option_value_query->row['top_up_adults'] * $this->session->data['tours'][$key]['parent'];
					                                                 $tour_option_price += $option_value_query->row['top_up_child'] * $this->session->data['tours'][$key]['child'];
					                                                 $tour_option_price += $option_value_query->row['price'];
					                                            }
					                                            else
					                                            {
					                                                $tour_option_price += $option_value_query->row['price'] * $this->session->data['tours'][$key]['parent'];
					                                                $tour_option_price += $option_value_query->row['child_price'] * $this->session->data['tours'][$key]['child'];
					                                                
					                                            } 
					                                            
					                                         }
					                                        
					                                     }else{

					                                        $tour_option_price += $option_value_query->row['price'] * $this->session->data['tours'][$key]['parent'];
					                                        $tour_option_price += $option_value_query->row['child_price'] * $this->session->data['tours'][$key]['child'];
					                                    } 
					                                   // echo "tour option price:".$tour_option_price;
					                                    
					                                } elseif ($option_value_query->row['price_prefix'] == '-') {
														$tour_option_price -= $option_value_query->row['price'];
													}

													if ($option_value_query->row['points_prefix'] == '+') {
														$option_points += $option_value_query->row['points'];
													} elseif ($option_value_query->row['points_prefix'] == '-') {
														$option_points -= $option_value_query->row['points'];
													}

													if ($option_value_query->row['weight_prefix'] == '+') {
														$option_weight += $option_value_query->row['weight'];
													} elseif ($option_value_query->row['weight_prefix'] == '-') {
														$option_weight -= $option_value_query->row['weight'];
													}

													if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
														$stock = false;
													}

													$transfer_option_data[] = array(
														'product_option_id'       => $product_option_id,
														'product_option_value_id' => $value,
														'option_id'               => $option_query->row['option_id'],
														'option_value_id'         => $option_value_query->row['option_value_id'],
														'name'                    => $option_query->row['name'],
														'value'                   => $option_value_query->row['name'],
														'type'                    => $option_query->row['type'],
														'quantity'                => $option_value_query->row['quantity'],
														'subtract'                => $option_value_query->row['subtract'],
														'price'                   => $option_value_query->row['price'],
					                                    /*custom add*/
					                                    'child_price'                   => $option_value_query->row['child_price'],
					                                    /*close*/
														'price_prefix'            => $option_value_query->row['price_prefix'],
														'points'                  => $option_value_query->row['points'],
														'points_prefix'           => $option_value_query->row['points_prefix'],
														'weight'                  => $option_value_query->row['weight'],
														'weight_prefix'           => $option_value_query->row['weight_prefix']
													);
												}
											} elseif ($option_query->row['type'] == 'checkbox' && is_array($value)) {
												foreach ($value as $product_option_value_id) {
													$option_value_query = $this->db->query("SELECT pov.option_value_id, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix, ovd.name FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (pov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

													if ($option_value_query->num_rows) {
														if ($option_value_query->row['price_prefix'] == '+') {
															$tour_option_price += $option_value_query->row['price'];
														} elseif ($option_value_query->row['price_prefix'] == '-') {
															$tour_option_price -= $option_value_query->row['price'];
														}

														if ($option_value_query->row['points_prefix'] == '+') {
															$option_points += $option_value_query->row['points'];
														} elseif ($option_value_query->row['points_prefix'] == '-') {
															$option_points -= $option_value_query->row['points'];
														}

														if ($option_value_query->row['weight_prefix'] == '+') {
															$option_weight += $option_value_query->row['weight'];
														} elseif ($option_value_query->row['weight_prefix'] == '-') {
															$option_weight -= $option_value_query->row['weight'];
														}

														if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
															$stock = false;
														}

														$transfer_option_data[] = array(
															'product_option_id'       => $product_option_id,
															'product_option_value_id' => $product_option_value_id,
															'option_id'               => $option_query->row['option_id'],
															'option_value_id'         => $option_value_query->row['option_value_id'],
															'name'                    => $option_query->row['name'],
															'value'                   => $option_value_query->row['name'],
															'type'                    => $option_query->row['type'],
															'quantity'                => $option_value_query->row['quantity'],
															'subtract'                => $option_value_query->row['subtract'],
															'price'                   => $option_value_query->row['price'],
															'price_prefix'            => $option_value_query->row['price_prefix'],
															'points'                  => $option_value_query->row['points'],
															'points_prefix'           => $option_value_query->row['points_prefix'],
															'weight'                  => $option_value_query->row['weight'],
															'weight_prefix'           => $option_value_query->row['weight_prefix']
														);
													}
												}
											} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
												$transfer_option_data[] = array(
													'product_option_id'       => $product_option_id,
													'product_option_value_id' => '',
													'option_id'               => $option_query->row['option_id'],
													'option_value_id'         => '',
													'name'                    => $option_query->row['name'],
													'value'                   => $value,
													'type'                    => $option_query->row['type'],
													'quantity'                => '',
													'subtract'                => '',
													'price'                   => '',
													'price_prefix'            => '',
													'points'                  => '',
													'points_prefix'           => '',
													'weight'                  => '',
													'weight_prefix'           => ''
												);
											}
										}
									}								

							}

		 				
							$custom_price = $custom_price + $tour_option_price;
		 				}///end tour options
		 				
		 				///////parks pricing
						if(!empty($custom_cart['parks_options'])){

							$park_option_price = 0;
							foreach(json_decode($custom_cart['parks_options']) as $key=>$options){							
									$transfer_option_data = array();
									
									foreach ($options as $product_option_id => $value) {
										$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$key . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

										if ($option_query->num_rows) {
											if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio') {
											
												$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points,pov.child_price,pov.top_up_child,pov.top_up_adults, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

												if ($option_value_query->num_rows) {
													if ($option_value_query->row['price_prefix'] == '+') {
													
													    if(isset($this->session->data['parks'][$key]['top_up']))
					                                     {
					                                        if($this->session->data['parks'][$key]['top_up']==0)
					                                        {
					                                           $park_option_price += $option_value_query->row['price'] * $this->session->data['parks'][$key]['parent'];
					                                           $park_option_price += $option_value_query->row['child_price'] * $this->session->data['parks'][$key]['child'];
					                                        }
					    								     else
					                                         {
					                                            if($this->session->data['parks'][$key]['travel_type']!="without_transfer")
					                                              {
					                                                 $park_option_price += $option_value_query->row['top_up_adults'] * $this->session->data['parks'][$key]['parent'];
					                                                 $park_option_price += $option_value_query->row['top_up_child'] * $this->session->data['parks'][$key]['child'];
					                                                 $park_option_price += $option_value_query->row['price'];
					                                              }
					                                             else
					                                             {
					                                                $park_option_price += $option_value_query->row['price'] * $this->session->data['parks'][$key]['parent'];
					                                                $park_option_price += $option_value_query->row['child_price'] * $this->session->data['parks'][$key]['child'];
					                                                
					                                             } 
					                                            
					                                         }
					                                        
					                                     }
					                                    else
					                                    {
					                                        $park_option_price += $option_value_query->row['price'] * $this->session->data['parks'][$key]['parent'];
					                                        $park_option_price += $option_value_query->row['child_price'] * $this->session->data['parks'][$key]['child'];
					                                    } 
					                                    
					                                } elseif ($option_value_query->row['price_prefix'] == '-') {
														$park_option_price -= $option_value_query->row['price'];
													}

													if ($option_value_query->row['points_prefix'] == '+') {
														$option_points += $option_value_query->row['points'];
													} elseif ($option_value_query->row['points_prefix'] == '-') {
														$option_points -= $option_value_query->row['points'];
													}

													if ($option_value_query->row['weight_prefix'] == '+') {
														$option_weight += $option_value_query->row['weight'];
													} elseif ($option_value_query->row['weight_prefix'] == '-') {
														$option_weight -= $option_value_query->row['weight'];
													}

													if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
														$stock = false;
													}

													$transfer_option_data[] = array(
														'product_option_id'       => $product_option_id,
														'product_option_value_id' => $value,
														'option_id'               => $option_query->row['option_id'],
														'option_value_id'         => $option_value_query->row['option_value_id'],
														'name'                    => $option_query->row['name'],
														'value'                   => $option_value_query->row['name'],
														'type'                    => $option_query->row['type'],
														'quantity'                => $option_value_query->row['quantity'],
														'subtract'                => $option_value_query->row['subtract'],
														'price'                   => $option_value_query->row['price'],
					                                    /*custom add*/
					                                    'child_price'                   => $option_value_query->row['child_price'],
					                                    /*close*/
														'price_prefix'            => $option_value_query->row['price_prefix'],
														'points'                  => $option_value_query->row['points'],
														'points_prefix'           => $option_value_query->row['points_prefix'],
														'weight'                  => $option_value_query->row['weight'],
														'weight_prefix'           => $option_value_query->row['weight_prefix']
													);
												}
											} elseif ($option_query->row['type'] == 'checkbox' && is_array($value)) {
												foreach ($value as $product_option_value_id) {
													$option_value_query = $this->db->query("SELECT pov.option_value_id, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix, ovd.name FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (pov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

													if ($option_value_query->num_rows) {
														if ($option_value_query->row['price_prefix'] == '+') {
															$park_option_price += $option_value_query->row['price'];
														} elseif ($option_value_query->row['price_prefix'] == '-') {
															$park_option_price -= $option_value_query->row['price'];
														}

														if ($option_value_query->row['points_prefix'] == '+') {
															$option_points += $option_value_query->row['points'];
														} elseif ($option_value_query->row['points_prefix'] == '-') {
															$option_points -= $option_value_query->row['points'];
														}

														if ($option_value_query->row['weight_prefix'] == '+') {
															$option_weight += $option_value_query->row['weight'];
														} elseif ($option_value_query->row['weight_prefix'] == '-') {
															$option_weight -= $option_value_query->row['weight'];
														}

														if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $cart['quantity']))) {
															$stock = false;
														}

														$transfer_option_data[] = array(
															'product_option_id'       => $product_option_id,
															'product_option_value_id' => $product_option_value_id,
															'option_id'               => $option_query->row['option_id'],
															'option_value_id'         => $option_value_query->row['option_value_id'],
															'name'                    => $option_query->row['name'],
															'value'                   => $option_value_query->row['name'],
															'type'                    => $option_query->row['type'],
															'quantity'                => $option_value_query->row['quantity'],
															'subtract'                => $option_value_query->row['subtract'],
															'price'                   => $option_value_query->row['price'],
															'price_prefix'            => $option_value_query->row['price_prefix'],
															'points'                  => $option_value_query->row['points'],
															'points_prefix'           => $option_value_query->row['points_prefix'],
															'weight'                  => $option_value_query->row['weight'],
															'weight_prefix'           => $option_value_query->row['weight_prefix']
														);
													}
												}
											} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
												$transfer_option_data[] = array(
													'product_option_id'       => $product_option_id,
													'product_option_value_id' => '',
													'option_id'               => $option_query->row['option_id'],
													'option_value_id'         => '',
													'name'                    => $option_query->row['name'],
													'value'                   => $value,
													'type'                    => $option_query->row['type'],
													'quantity'                => '',
													'subtract'                => '',
													'price'                   => '',
													'price_prefix'            => '',
													'points'                  => '',
													'points_prefix'           => '',
													'weight'                  => '',
													'weight_prefix'           => ''
												);
											}
										}
									}
								

							}
							
							$custom_price = $custom_price + $park_option_price;
		 				}///end tour options
		 				
					}				

				}
				
				if($custom_price!=0){
					$price = $custom_price;
				}else{
					$price = $product_query->row['price'];
				}



				/*if(isset($this->session->data[$product_query->row['product_id']]['custom_price'])){
					$price = $this->session->data[$product_query->row['product_id']]['custom_price'];
				}else{
					$price = $product_query->row['price'];
				}*/
				
				//$price = $product_query->row['price'];
				
				// Product Discounts
				$discount_quantity = 0;

				foreach ($cart_query->rows as $cart_2) {
					if ($cart_2['product_id'] == $cart['product_id']) {
						$discount_quantity += $cart_2['quantity'];
					}
				}

				$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");

				if ($product_discount_query->num_rows) {
					$price = $product_discount_query->row['price'];
				}

				// Product Specials
				$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

				if ($product_special_query->num_rows) {
					$price = $product_special_query->row['price'];
				}

				// Reward Points
				$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$cart['product_id'] . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($product_reward_query->num_rows) {
					$reward = $product_reward_query->row['points'];
				} else {
					$reward = 0;
				}

				// Downloads
				$download_data = array();

				$download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id = '" . (int)$cart['product_id'] . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

				foreach ($download_query->rows as $download) {
					$download_data[] = array(
						'download_id' => $download['download_id'],
						'name'        => $download['name'],
						'filename'    => $download['filename'],
						'mask'        => $download['mask']
					);
				}

				// Stock
				if (!$product_query->row['quantity'] || ($product_query->row['quantity'] < $cart['quantity'])) {
					$stock = false;
				}

				$recurring_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring r LEFT JOIN " . DB_PREFIX . "product_recurring pr ON (r.recurring_id = pr.recurring_id) LEFT JOIN " . DB_PREFIX . "recurring_description rd ON (r.recurring_id = rd.recurring_id) WHERE r.recurring_id = '" . (int)$cart['recurring_id'] . "' AND pr.product_id = '" . (int)$cart['product_id'] . "' AND rd.language_id = " . (int)$this->config->get('config_language_id') . " AND r.status = 1 AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

				if ($recurring_query->num_rows) {
					$recurring = array(
						'recurring_id'    => $cart['recurring_id'],
						'name'            => $recurring_query->row['name'],
						'frequency'       => $recurring_query->row['frequency'],
						'price'           => $recurring_query->row['price'],
						'cycle'           => $recurring_query->row['cycle'],
						'duration'        => $recurring_query->row['duration'],
						'trial'           => $recurring_query->row['trial_status'],
						'trial_frequency' => $recurring_query->row['trial_frequency'],
						'trial_price'     => $recurring_query->row['trial_price'],
						'trial_cycle'     => $recurring_query->row['trial_cycle'],
						'trial_duration'  => $recurring_query->row['trial_duration']
					);
				} else {
					$recurring = false;
				}

				$product_data[] = array(
					'cart_id'         => $cart['cart_id'],
					'product_id'      => $product_query->row['product_id'],
                    /*custom add*/
                    'product_tp'      => $product_query->row['product_tp'],
                    /**/
                    
					'name'            => $product_query->row['name'],
					'model'           => $product_query->row['model'],
					//'shipping'        => $product_query->row['shipping'],
					'shipping'        => 0,
					'image'           => $product_query->row['image'],
					'option'          => $option_data,
					'download'        => $download_data,
					'quantity'        => $cart['quantity'],
					'minimum'         => $product_query->row['minimum'],
					'subtract'        => $product_query->row['subtract'],
					'stock'           => $stock,
					'price'           => ($price + $option_price),
					'total'           => ($price + $option_price) * $cart['quantity'],
					'reward'          => $reward * $cart['quantity'],
					'points'          => ($product_query->row['points'] ? ($product_query->row['points'] + $option_points) * $cart['quantity'] : 0),
					'tax_class_id'    => $product_query->row['tax_class_id'],
					'weight'          => ($product_query->row['weight'] + $option_weight) * $cart['quantity'],
					'weight_class_id' => $product_query->row['weight_class_id'],
					'length'          => $product_query->row['length'],
					'width'           => $product_query->row['width'],
					'height'          => $product_query->row['height'],
					'length_class_id' => $product_query->row['length_class_id'],
					'recurring'       => $recurring
				);
			} else {
				$this->remove($cart['cart_id']);
			}
		}
		
		return $product_data;
	}

	public function add($product_id, $quantity = 1, $option = array(), $recurring_id = 0, $extra = array()) {
		

		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");

		if (!$query->row['total']) {
			$this->db->query("INSERT " . DB_PREFIX . "cart SET api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "', customer_id = '" . (int)$this->customer->getId() . "', session_id = '" . $this->db->escape($this->session->getId()) . "', product_id = '" . (int)$product_id . "', recurring_id = '" . (int)$recurring_id . "', `option` = '" . $this->db->escape(json_encode($option)) . "', quantity = '" . (int)$quantity . "', date_added = NOW()");
			
			$this->session->data['my_cart_id'] = $this->db->getLastId();
		    ////set custom cart data
		    if(!empty($extra)){
		    	$this->db->query("INSERT " . DB_PREFIX . "custom_cart SET cart_id = '" .$this->db->getLastId(). "', product_type='".(isset($extra['product_type']) ? $extra['product_type'] : '')."', nationality='".(isset($extra['nationality']) ? (int)$extra['nationality'] : 0)."', no_of_days='".(isset($extra['no_of_days']) ? (int)$extra['no_of_days'] : 0)."', adult='".(isset($extra['adult']) ? (int)$extra['adult'] : 0)."', child='".(isset($extra['child']) ? (int)$extra['child'] : 0)."', room_options = '" . (isset($extra['room_options']) ? $extra['room_options'] : '') . "', discounts = '" . (isset($extra['discounts']) ? $extra['discounts'] : '') . "', meals_options = '" . (isset($extra['meals_options']) ? $extra['meals_options'] : '') . "', visa_options = '" . (isset($extra['visa_options']) ? $extra['visa_options'] : '') . "', tour_options = '" . (isset($extra['tours_options']) ? json_encode($extra['tours_options']) : '') . "', parks_options = '" . (isset($extra['parks_options']) ? json_encode($extra['parks_options']) : '') . "', transfer_product = '" . (isset($extra['transfer_product']) ? $extra['transfer_product'] : '') . "', transfer_options = '" . (isset($extra['transfer_options']) ? json_encode($extra['transfer_options']) : '') . "' ");
		    }


		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = (quantity + " . (int)$quantity . ") WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "' AND product_id = '" . (int)$product_id . "' AND recurring_id = '" . (int)$recurring_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'");
		}
	}

	public function update($cart_id, $quantity) {
		$this->db->query("UPDATE " . DB_PREFIX . "cart SET quantity = '" . (int)$quantity . "' WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	}

	public function remove($cart_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "' AND api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "custom_cart WHERE cart_id = '" . (int)$cart_id . "' ");
	}

	public function clear() {
		$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND session_id = '" . $this->db->escape($this->session->getId()) . "'");
	}

	public function getRecurringProducts() {
		$product_data = array();

		foreach ($this->getProducts() as $value) {
			if ($value['recurring']) {
				$product_data[] = $value;
			}
		}

		return $product_data;
	}

	public function getWeight() {
		$weight = 0;

		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				$weight += $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
			}
		}

		return $weight;
	}

	public function getSubTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $product['total'];
		}

		return $total;
	}

	public function getTaxes() {
		$tax_data = array();

		foreach ($this->getProducts() as $product) {
			if ($product['tax_class_id']) {
				$tax_rates = $this->tax->getRates($product['price'], $product['tax_class_id']);

				foreach ($tax_rates as $tax_rate) {
					if (!isset($tax_data[$tax_rate['tax_rate_id']])) {
						$tax_data[$tax_rate['tax_rate_id']] = ($tax_rate['amount'] * $product['quantity']);
					} else {
						$tax_data[$tax_rate['tax_rate_id']] += ($tax_rate['amount'] * $product['quantity']);
					}
				}
			}
		}

		return $tax_data;
	}

	public function getTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
	}

	public function countProducts() {
		$product_total = 0;

		$products = $this->getProducts();

		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}

		return $product_total;
	}

	public function hasProducts() {
		return count($this->getProducts());
	}

	public function hasRecurringProducts() {
		return count($this->getRecurringProducts());
	}

	public function hasStock() {
		foreach ($this->getProducts() as $product) {
			if (!$product['stock']) {
				return false;
			}
		}

		return true;
	}

	public function hasShipping() {
		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				return true;
			}
		}

		return false;
	}

	public function hasDownload() {
		foreach ($this->getProducts() as $product) {
			if ($product['download']) {
				return true;
			}
		}

		return false;
	}
}
