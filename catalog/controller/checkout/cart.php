<?php
class ControllerCheckoutCart extends Controller {
	public function index() {

		//echo "<pre>";print_r($this->session);exit;
        $this->load->language('checkout/cart');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('common/home'),
			'text' => $this->language->get('text_home')
		);

		$data['breadcrumbs'][] = array(
			'href' => $this->url->link('checkout/cart'),
			'text' => $this->language->get('heading_title')
		);

		if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_recurring_item'] = $this->language->get('text_recurring_item');
			$data['text_next'] = $this->language->get('text_next');
			$data['text_next_choice'] = $this->language->get('text_next_choice');

			$data['column_image'] = $this->language->get('column_image');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_total'] = $this->language->get('column_total');

			$data['button_update'] = $this->language->get('button_update');
			$data['button_remove'] = $this->language->get('button_remove');
			$data['button_shopping'] = $this->language->get('button_shopping');
			$data['button_checkout'] = $this->language->get('button_checkout');

			if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
				//$data['error_warning'] = $this->language->get('error_stock');
                $data['error_warning'] = '';
			} elseif (isset($this->session->data['error'])) {
				$data['error_warning'] = $this->session->data['error'];

				unset($this->session->data['error']);
			} else {
				$data['error_warning'] = '';
			}

			if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
				$data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
			} else {
				$data['attention'] = '';
			}

			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}

			$data['action'] = $this->url->link('checkout/cart/edit', '', true);

			if ($this->config->get('config_cart_weight')) {
				$data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
			} else {
				$data['weight'] = '';
			}

			$this->load->model('tool/image');
			$this->load->model('tool/upload');

			$data['products'] = array();

			$products = $this->cart->getProducts();

			foreach ($products as $product) {
				$product_total = 0;

				foreach ($products as $product_2) {
					if ($product_2['product_id'] == $product['product_id']) {
						$product_total += $product_2['quantity'];
					}
				}

				if ($product['minimum'] > $product_total) {
					$data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
				}

				if ($product['image']) {
					$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = array();

				foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['value'];
					} else {
						$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

						if ($upload_info) {
							$value = $upload_info['name'];
						} else {
							$value = '';
						}
					}

					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
				}

			
				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					
						$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax') ? 'P' : false);					
						$price = $this->currency->format($unit_price, $this->session->data['currency']);
						$total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
												

				} else {
					$price = false;
					$total = false;
				}				
				
				$recurring = '';

				if ($product['recurring']) {
					$frequencies = array(
						'day'        => $this->language->get('text_day'),
						'week'       => $this->language->get('text_week'),
						'semi_month' => $this->language->get('text_semi_month'),
						'month'      => $this->language->get('text_month'),
						'year'       => $this->language->get('text_year'),
					);

					if ($product['recurring']['trial']) {
						$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
					}

					if ($product['recurring']['duration']) {
						$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					} else {
						$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
					}
				}
				

				$data['products'][] = array(
					'cart_id'   => $product['cart_id'],
					'thumb'     => $image,
					'name'      => $product['name'],
					'model'     => $product['model'],
					'option'    => $option_data,
					'recurring' => $recurring,
					'quantity'  => $product['quantity'],
					'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
					'price'     => $price,
					'total'     => $total,
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
				
			}
			

			// Gift Voucher
			$data['vouchers'] = array();

			if (!empty($this->session->data['vouchers'])) {
				foreach ($this->session->data['vouchers'] as $key => $voucher) {
					$data['vouchers'][] = array(
						'key'         => $key,
						'description' => $voucher['description'],
						'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency']),
						'remove'      => $this->url->link('checkout/cart', 'remove=' . $key)
					);
				}
			}

			// Totals
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;
			
			// Because __call can not keep var references so we put them into an array. 			
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);
			
			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);
						
						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);
			}

			$data['totals'] = array();

			foreach ($totals as $total) {

				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
				);
			}
			

			$data['continue'] = $this->url->link('common/home');

			$data['checkout'] = $this->url->link('checkout/checkout', '', true);

			$this->load->model('extension/extension');

			$data['modules'] = array();
			
			$files = glob(DIR_APPLICATION . '/controller/extension/total/*.php');
			
			if ($files) {
				foreach ($files as $file) {
					$result = $this->load->controller('extension/total/' . basename($file, '.php'));
					//echo "<pre>ll";print_r($result);
					if ($result) {
						$data['modules'][] = $result;
					}
				}              
			}		
				
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			$this->response->setOutput($this->load->view('checkout/cart', $data));
		} else {
			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_error'] = $this->language->get('text_empty');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			unset($this->session->data['success']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function add() {		

		/*echo "<pre/>";
		print_r($this->request->post);exit;	*/
		
		$this->load->language('checkout/cart');
        if (isset($this->request->post['product_id'])) {
			$product_id = (int)$this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);
        //echo "<pre>";print_r($this->request->post);exit;
        
        /*set custom error for duplcate product in cart */
        $productincart = $this->cart->getProducts();/*get all cart product*/
        foreach($productincart as $cartpro)
        {
            if($product_id==$cartpro['product_id'])
            {
                $json['error']['duplcateproduct'] ="This package is already in your cart.First you need to remove this package then you will able to add this pckage";       
            }
        }
       
        if ($product_info) {
			if (isset($this->request->post['quantity']) && ((int)$this->request->post['quantity'] >= $product_info['minimum'])) {
				$quantity = (int)$this->request->post['quantity'];
			} else {
				$quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
			}

			if (isset($this->request->post['option'])) {
			 	$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}

			if(isset($this->request->post['custom_price']) && $this->isCustomPriceValid($this->request->post['custom_price'])) {
                $this->session->data[$product_id]['custom_price'] = $this->request->post['custom_price'];
            } 
           
/*parenthidprice-childhidprice
        $this->session->data[$product_id]['child']=$this->request->post['child'];
        $this->session->data[$product_id]['parent']=$this->request->post['parent'];
        */
        if(isset($this->request->post['top_up']))
            {$this->session->data[$product_id]['top_up']=     $this->request->post['top_up'];}
       
       if(isset($this->request->post['travel_type']))
            {$this->session->data[$product_id]['travel_type']=     $this->request->post['travel_type'];}
            
            $this->session->data[$product_id]['child']=$this->request->post['childhidprice'];/*childhidprice is for number of child not price sorry for wrong name*/
            $this->session->data[$product_id]['parent']=$this->request->post['parenthidprice'];/*parenthidprice is for number of Adullt not price sorry for wrong name*/
            
            /*incase of private*/
            // $this->session->data[$product_id]['privatetotal']=$this->request->post['privatetotal'];
            /*tourdate-pickuplocation*/
            $this->session->data[$product_id]['pickuplocation'] = $this->request->post['pickuplocation'];
            $this->session->data[$product_id]['tourdate']       = $this->request->post['tourdate'];
            
            $product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);
            foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
				/* custom fro remove valiadtion comment below line */
                	//$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}

			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}

			$recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);

			if ($recurrings) {
				$recurring_ids = array();

				foreach ($recurrings as $recurring) {
					$recurring_ids[] = $recurring['recurring_id'];
				}

				if (!in_array($recurring_id, $recurring_ids)) {
					$json['error']['recurring'] = $this->language->get('error_recurring_required');
				}
			}else{
				$json='';
			}
			
			///custom section
        	if(isset($this->request->post['product_type']) && ($this->request->post['product_type']=="MP")){
        		
        		$this->load->model('catalog/hotels');
        		$this->load->model('catalog/makepackage');
	        	//rooms section
		        $roomids = array();
		        if($this->request->post['room_options_sel']){
		            foreach($this->request->post['room_options_sel'] as $room_options){
		               
		                if(isset($room_options['room_selected']) && $room_options['room_selected']!=0){
		                    
		                    $roomOptions = $this->model_catalog_makepackage->storeRoomOptions($room_options);
		                    array_push($roomids, $roomOptions); 
		                }
		            }
		        }
		        $this->session->data['make_room_options'] = $roomids;

		         //visa
		        $visaids = array();
		        if(isset($this->request->post['visa_appication'])){
		           
		            $visamaxid = $this->model_catalog_hotels->getVisaMax();
		            if($visamaxid[0]['id']=='' || $visamaxid[0]['id']=='Null'){
		                $maxvisaid=1;
		            }else{
		                $maxvisaid =$visamaxid[0]['id']+1;//Null    
		            }
		            foreach($this->request->post['visa_appication'] as $key=>$applications){

			        	$visainformation['applicant_name']  = $applications['applicant_name'];
			        	$visainformation['visa_option'] 	= $applications['visa_option'];
			        	$visainformation['visa_price'] 		= $applications['visa_price'];

			        	///uploading 
			        	$imageFileTypetravellerspassport = pathinfo($this->request->files['visa_appication']['name'][$key]['travellerspassportfront'],PATHINFO_EXTENSION);
			            $filenametravellerspassport      ='travellerspassport-'.$maxvisaid.'.'.$imageFileTypetravellerspassport;
			            $target_filetravellerspassport  = DIR_IMAGE_VISA . $filenametravellerspassport;
			            move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['travellerspassportfront'], $target_filetravellerspassport);

			            $imageFileTypetravellerspassportback = pathinfo($this->request->files['visa_appication']['name'][$key]['travellerspassportback'],PATHINFO_EXTENSION);
			            $filenametravellerspassportback      ='travellerspassportback-'.$maxvisaid.'.'.$imageFileTypetravellerspassportback;
			            $target_filetravellerspassportback = DIR_IMAGE_VISA . $filenametravellerspassportback;
			            move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['travellerspassportback'], $target_filetravellerspassportback);

			            $imageFileTypepassportphoto = pathinfo($this->request->files['visa_appication']['name'][$key]['passportphoto'],PATHINFO_EXTENSION);
			            $filenamepassportphoto      = 'passportphoto-'.$maxvisaid.'.'.$imageFileTypepassportphoto;
			            $target_filepassportphoto   = DIR_IMAGE_VISA . $filenamepassportphoto;
			            move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['passportphoto'], $target_filepassportphoto);
			        
			        	$visainformation['travellerspassportfront']  = $filenametravellerspassport;
			        	$visainformation['travellerspassportback'] 	 = $filenametravellerspassportback;
			        	$visainformation['travellersimage'] 		 = $filenamepassportphoto;

			        	$maxvisaid = $this->model_catalog_makepackage->addvisainformation($visainformation); 
		            	array_push($visaids, $maxvisaid); 

			        }		           
		                      
		        }  
	        	$this->session->data['make_visa_applications'] = $visaids;
		        ///tours section saving
		        $tourids = array();
		        $tourOptionsArr = array();
		        if($this->request->post['tours']){
		        	foreach($this->request->post['tours'] as $key=>$tours){
		        		if(($tours['totalpriceadult']!=0 || $tours['totalpricechild']!=0) || (isset($tours['privatepricepakage']) && $tours['privatepricepakage']!=0) ){

		        			if((isset($tours['privatepricepakage']) && $tours['privatepricepakage']!=0)){
		        				$privatepricepakage = $tours['privatepricepakage'];
		        			}else{
		        				$privatepricepakage = 0;
		        			}
		        			$customTourOption = array();
		        			$toursOptions['product_id'] = $key;
		        			$toursOptions['top_up'] 	 = $tours['top_up'];
		        			$toursOptions['family_type']= $tours['familytype'];
		        			$toursOptions['total_price_adult']= $tours['totalpriceadult'];
		        			$toursOptions['total_price_child']= $tours['totalpricechild'];
		        			$toursOptions['travel_type']= $tours['travel_type'];
		        			$toursOptions['tour_date']= $tours['tourdate'];
		        			$toursOptions['pickup_location']= $tours['pickuplocation'];
		        			$toursOptions['private_package_price']= $privatepricepakage;
		        			if($tours['travel_type']=='Private'){
		        				$adultnumbers = 0;
		        				$adultnumbers = 0;
		        			}else{
		        				$adultnumbers = $tours['adultnumbers'];
		        				$childumbers  = $tours['childumbers'];
		        			}		        			
		        			$toursOptions['parent_hide_price']= $adultnumbers;
	        				$toursOptions['child_hide_price'] = $childumbers;

		        			$toursOptions['tour_option']= json_encode($tours['option']);
		        			$tourOptionsArr[$key] = $tours['option'];
		        			$tourStoreId = $this->model_catalog_makepackage->storeTours($toursOptions);
		        			array_push($tourids, $tourStoreId);
		        			$this->session->data['tours'][$key]['travel_type']  = $tours['travel_type'];
		        			$this->session->data['tours'][$key]['top_up'] 		= $tours['top_up'];
		        			$this->session->data['tours'][$key]['parent'] 		= $adultnumbers;
		        			$this->session->data['tours'][$key]['child'] 		= $childumbers;
		        		}
		        	}
		        }  
		        $this->session->data['make_tours_selected'] = $tourids;
	       	
		        //parks section saving
		        $parkids = array();
		        $parkOptionsArr = array();
		        if($this->request->post['parks']){
		        	foreach($this->request->post['parks'] as $key=>$parks){
		        		if(($parks['totalpriceadult']!=0 || $parks['totalpricechild']!=0) || (isset($parks['privatepricepakage']) && $parks['privatepricepakage']!=0)){
		        			
		        			if((isset($parks['privatepricepakage']) && $parks['privatepricepakage']!=0)){
		        				$privatepricepakage = $parks['privatepricepakage'];
		        			}else{
		        				$privatepricepakage = 0;
		        			}
		        			$customParkOption = array();
		        			$parksOptions['product_id'] = $key;
		        			$parksOptions['top_up'] 	 = $parks['top_up'];
		        			$parksOptions['family_type']= $parks['familytype'];
		        			$parksOptions['total_price_adult']= $parks['totalpriceadult'];
		        			$parksOptions['total_price_child']= $parks['totalpricechild'];
		        			$parksOptions['travel_type']= $parks['travel_type'];
		        			$parksOptions['tour_date']= $parks['tourdate'];
		        			$parksOptions['pickup_location']= $parks['pickuplocation'];
		        			$parksOptions['private_package_price']= $privatepricepakage ;
		        			$parksOptions['parent_hide_price']= $parks['adultnumbers'];
		        			$parksOptions['child_hide_price']= $parks['childumbers'];
		        			$parksOptions['park_option']= json_encode($parks['option']);		        			
		        			$parkOptionsArr[$key] = $parks['option'];
		        			$parkStoreId =$this->model_catalog_makepackage->storeParks($parksOptions);
		        			array_push($parkids, $parkStoreId);
		        			$this->session->data['parks'][$key]['travel_type']  = $parks['travel_type'];
		        			$this->session->data['parks'][$key]['top_up'] 		= $parks['top_up'];
		        			$this->session->data['parks'][$key]['parent'] 		= $parks['adultnumbers'];
		        			$this->session->data['parks'][$key]['child'] 		= $parks['childumbers'];
		        		}
		        	}
		        }  
		       
		        $this->session->data['make_parks_selected'] = $parkids;
	       
		        //airport transfer
		        $this->session->data['make_transport_id'] = '';
		        if(isset($this->request->post['transfer'])){
		        	if($this->request->post['transfer']['vehicle']!=""){
		        		$transport['vehicle_id']  		= $this->request->post['transfer']['vehicle'];
				        $transport['direction_type']  	= $this->request->post['transfer']['typedirection'];
				        $transport['trip_date']  		= $this->request->post['transfer']['tourdate'];
				        $transport['pickup_location']   = $this->request->post['transfer']['pickuplocation'];
				        $transport['drop_location']  	= $this->request->post['transfer']['dropofflocation'];
				        $transport['pickup_time']  		= $this->request->post['transfer']['pickuptime'];
				        $transport['transfer_option']  	= json_encode($this->request->post['transfer']['transfer_option']);
				      
				        $transport_id = $this->model_catalog_makepackage->storeTransport($transport);
			        	$this->session->data['make_transport_id'] = $transport_id;
		        	}
		        	
		        } 
		        //flight booking
		        $ticketids = array();
		        $this->session->data['make_flight_tickets'] = '';
		        if(isset($this->request->post['flight_ticket']) && !empty($this->request->post['flight_ticket'])){
		        	$ticketmaxid = $this->model_catalog_makepackage->getTicketMax();
		            if($ticketmaxid[0]['id']=='' || $ticketmaxid[0]['id']=='Null'){
		                $maxticketid=1;
		            }else{
		                $maxticketid =$ticketmaxid[0]['id']+1;//Null    
		            }
		        	foreach($this->request->post['flight_ticket'] as $key=>$ticket){
		        		if($ticket['passenger_name'] !=""){
		        			$ticketinformation['passenger_name']  = $ticket['passenger_name'];
			        		///uploading 
			                $imageFileTypeFlightTicket   = pathinfo($this->request->files['flight_ticket']['name'][$key]['travellerflightticket'],PATHINFO_EXTENSION);
			                $filenamepassengerticket     ='travellerspassport-'.$maxticketid.'.'.$imageFileTypeFlightTicket;
			                $target_filepassengerticket  = DIR_IMAGE_TICKET . $filenamepassengerticket;
			                move_uploaded_file($this->request->files['flight_ticket']['tmp_name'][$key]['travellerflightticket'], $target_filepassengerticket);
			                $ticketinformation['flight_ticket']  = $filenamepassengerticket;
			                $maxticketid = $this->model_catalog_makepackage->storeFlightTicket($ticketinformation); 
			                array_push($ticketids, $maxticketid); 
		        		}
		        		
		        	}
		        	$this->session->data['make_flight_tickets'] = $ticketids;
        		}

        	}
        	////end make your package
        	///standard package
        	if(isset($this->request->post['product_type']) && ($this->request->post['product_type']=="SP")){
        		
        		$this->load->model('catalog/hotels');       
		        $this->load->model('catalog/standardpackage');       

		        //rooms section
		        $roomids = array();
		        $this->session->data['standard_room_options'] = '';
		        if($this->request->post['room_options_sel']){
		            foreach($this->request->post['room_options_sel'] as $room_options){
		               
		                if(isset($room_options['room_selected']) && $room_options['room_selected']!=0){
		                    
		                    $roomOptions = $this->model_catalog_standardpackage->storeRoomOptions($room_options);
		                    array_push($roomids, $roomOptions); 
		                }
		            }
		        }
		        $this->session->data['standard_room_options'] = $roomids;
        		
        		//visa
		        $visaids = array();
		        $this->session->data['standard_visa_applications'] = '';
		        if(isset($this->request->post['visa_appication'])){
		           
		            $visamaxid = $this->model_catalog_hotels->getVisaMax();
		            if($visamaxid[0]['id']=='' || $visamaxid[0]['id']=='Null'){
		                $maxvisaid=1;
		            }else{
		                $maxvisaid =$visamaxid[0]['id']+1;//Null    
		            }
		            foreach($this->request->post['visa_appication'] as $key=>$applications){

		                $visainformation['applicant_name']  = $applications['applicant_name'];
		                $visainformation['visa_option']     = $applications['visa_option'];
		                $visainformation['visa_price']      = $applications['visa_price'];

		                ///uploading 
		                $imageFileTypetravellerspassport = pathinfo($this->request->files['visa_appication']['name'][$key]['travellerspassportfront'],PATHINFO_EXTENSION);
		                $filenametravellerspassport      ='travellerspassport-'.$maxvisaid.'.'.$imageFileTypetravellerspassport;
		                $target_filetravellerspassport  = DIR_IMAGE_VISA . $filenametravellerspassport;
		                move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['travellerspassportfront'], $target_filetravellerspassport);

		                $imageFileTypetravellerspassportback = pathinfo($this->request->files['visa_appication']['name'][$key]['travellerspassportback'],PATHINFO_EXTENSION);
		                $filenametravellerspassportback      ='travellerspassportback-'.$maxvisaid.'.'.$imageFileTypetravellerspassportback;
		                $target_filetravellerspassportback = DIR_IMAGE_VISA . $filenametravellerspassportback;
		                move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['travellerspassportback'], $target_filetravellerspassportback);

		                $imageFileTypepassportphoto = pathinfo($this->request->files['visa_appication']['name'][$key]['passportphoto'],PATHINFO_EXTENSION);
		                $filenamepassportphoto      = 'passportphoto-'.$maxvisaid.'.'.$imageFileTypepassportphoto;
		                $target_filepassportphoto   = DIR_IMAGE_VISA . $filenamepassportphoto;
		                move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['passportphoto'], $target_filepassportphoto);
		            
		                $visainformation['travellerspassportfront']  = $filenametravellerspassport;
		                $visainformation['travellerspassportback']   = $filenametravellerspassportback;
		                $visainformation['travellersimage']          = $filenamepassportphoto;

		                $maxvisaid = $this->model_catalog_standardpackage->addvisainformation($visainformation); 
		                array_push($visaids, $maxvisaid); 
		            }           
		                      
		        }  
		        $this->session->data['standard_visa_applications'] = $visaids;
		        //airport transfer
		        $this->session->data['standard_transport_id'] = '';
		        if(isset($this->request->post['transfer'])){
		        	if($this->request->post['transfer']['vehicle']!=""){		        	
			        	$transport['vehicle_id']  		= $this->request->post['transfer']['vehicle'];
				        $transport['direction_type']  	= $this->request->post['transfer']['typedirection'];
				        $transport['trip_date']  		= $this->request->post['transfer']['tourdate'];
				        $transport['pickup_location']   = $this->request->post['transfer']['pickuplocation'];
				        $transport['drop_location']  	= $this->request->post['transfer']['dropofflocation'];
				        $transport['pickup_time']  		= $this->request->post['transfer']['pickuptime'];
				        $transport['transfer_option']  	= json_encode($this->request->post['transfer']['transfer_option']);

				        $transport_id = $this->model_catalog_standardpackage->storeTransport($transport);
				        $this->session->data['standard_transport_id'] = $transport_id;
			        }
		        }  
		        ///store tour options
		        $this->session->data['standard_tour_id'] = '';
		        if(isset($this->request->post['tours'])){
		        	$tours['tour_ids']  	= $this->request->post['tours']['products'];
			        $tours['tour_amount']  	= preg_replace( '/[^.\d]/', '', $this->request->post['tours']['tour_price']);

			        $tour_id = $this->model_catalog_standardpackage->storeTours($tours);
			        $this->session->data['standard_tour_id'] = $tour_id;
		        } 
		        //flight booking
		        $ticketids = array();
		        $this->session->data['standard_flight_tickets'] = '';
		        if(isset($this->request->post['flight_ticket']) && !empty($this->request->post['flight_ticket'])){
		        	$ticketmaxid = $this->model_catalog_standardpackage->getTicketMax();
		            if($ticketmaxid[0]['id']=='' || $ticketmaxid[0]['id']=='Null'){
		                $maxticketid=1;
		            }else{
		                $maxticketid =$ticketmaxid[0]['id']+1;//Null    
		            }
		        	foreach($this->request->post['flight_ticket'] as $key=>$ticket){
		        		if($ticket['passenger_name']!=""){		        		
			        		$ticketinformation['passenger_name']  = $ticket['passenger_name'];
			        		///uploading 
			                $imageFileTypeFlightTicket   = pathinfo($this->request->files['flight_ticket']['name'][$key]['travellerflightticket'],PATHINFO_EXTENSION);
			                $filenamepassengerticket     ='travellerspassport-'.$maxticketid.'.'.$imageFileTypeFlightTicket;
			                $target_filepassengerticket  = DIR_IMAGE_TICKET . $filenamepassengerticket;
			                move_uploaded_file($this->request->files['flight_ticket']['tmp_name'][$key]['travellerflightticket'], $target_filepassengerticket);
			                $ticketinformation['flight_ticket']  = $filenamepassengerticket;
			                $maxticketid = $this->model_catalog_standardpackage->storeFlightTicket($ticketinformation); 
			                array_push($ticketids, $maxticketid); 
			            }
		        	}
		        	$this->session->data['standard_flight_tickets'] = $ticketids;
		        }


        	}///end standrad package
        	if(isset($this->request->post['product_type']) && ($this->request->post['product_type']=="HB")){
        			
        			$this->load->model('catalog/hotels');       

			        //rooms section
			        $roomids = array();
			        if($this->request->post['room_options_sel']){
			            foreach($this->request->post['room_options_sel'] as $room_options){
			               
			                if(isset($room_options['room_selected']) && $room_options['room_selected']!=0){
			                    
			                    $roomOptions = $this->model_catalog_hotels->storeRoomOptions($room_options);
			                    array_push($roomids, $roomOptions); 
			                }
			            }
			        }
			        $this->session->data['hotel_room_options'] = $roomids;

			        //visa
			        $visaids = array();
			        if(isset($this->request->post['visa_appication'])){
			           
			            $visamaxid = $this->model_catalog_hotels->getVisaMax();
			            if($visamaxid[0]['id']=='' || $visamaxid[0]['id']=='Null'){
			                $maxvisaid=1;
			            }else{
			                $maxvisaid =$visamaxid[0]['id']+1;//Null    
			            }
			            foreach($this->request->post['visa_appication'] as $key=>$applications){

			                $visainformation['applicant_name']  = $applications['applicant_name'];
			                $visainformation['visa_option']     = $applications['visa_option'];
			                $visainformation['visa_price']      = $applications['visa_price'];

			                ///uploading 
			                $imageFileTypetravellerspassport = pathinfo($this->request->files['visa_appication']['name'][$key]['travellerspassportfront'],PATHINFO_EXTENSION);
			                $filenametravellerspassport      ='travellerspassport-'.$maxvisaid.'.'.$imageFileTypetravellerspassport;
			                $target_filetravellerspassport  = DIR_IMAGE_VISA . $filenametravellerspassport;
			                move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['travellerspassportfront'], $target_filetravellerspassport);

			                $imageFileTypetravellerspassportback = pathinfo($this->request->files['visa_appication']['name'][$key]['travellerspassportback'],PATHINFO_EXTENSION);
			                $filenametravellerspassportback      ='travellerspassportback-'.$maxvisaid.'.'.$imageFileTypetravellerspassportback;
			                $target_filetravellerspassportback = DIR_IMAGE_VISA . $filenametravellerspassportback;
			                move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['travellerspassportback'], $target_filetravellerspassportback);

			                $imageFileTypepassportphoto = pathinfo($this->request->files['visa_appication']['name'][$key]['passportphoto'],PATHINFO_EXTENSION);
			                $filenamepassportphoto      = 'passportphoto-'.$maxvisaid.'.'.$imageFileTypepassportphoto;
			                $target_filepassportphoto   = DIR_IMAGE_VISA . $filenamepassportphoto;
			                move_uploaded_file($this->request->files['visa_appication']['tmp_name'][$key]['passportphoto'], $target_filepassportphoto);
			            
			                $visainformation['travellerspassportfront']  = $filenametravellerspassport;
			                $visainformation['travellerspassportback']   = $filenametravellerspassportback;
			                $visainformation['travellersimage']          = $filenamepassportphoto;

			                $maxvisaid = $this->model_catalog_hotels->addvisainformation($visainformation); 
			                array_push($visaids, $maxvisaid); 
			            }           
			                      
			        }  
			        $this->session->data['hotel_visa_applications'] = $visaids;
        	}



			$extra =array();
			if (isset($this->request->post['product_type'])) {
				$extra['product_type'] = $this->request->post['product_type'];
			}
			if (isset($this->request->post['nationality'])) {
				$extra['nationality'] = $this->request->post['nationality'];
			}
			if (isset($this->request->post['no_of_days'])) {
				$extra['no_of_days'] = $this->request->post['no_of_days'];
			}
			if (isset($this->request->post['adult_num'])) {
				$extra['adult'] = $this->request->post['adult_num'];
			}
			if (isset($this->request->post['child_num'])) {
				$extra['child'] = $this->request->post['child_num'];
			}
			if (isset($this->request->post['room_options'])) {
				$extra['room_options'] = $this->request->post['room_options'];
			}
			if (isset($this->request->post['discounts'])) {
				$extra['discounts'] = $this->request->post['discounts'];
			}
			if (isset($this->request->post['meals_options'])) {
				$extra['meals_options'] = $this->request->post['meals_options'];
			}
			if (isset($this->request->post['visa_options'])) {
				$extra['visa_options'] = $this->request->post['visa_options'];
			}
			if (isset($this->request->post['tour_options'])) {
				$extra['tours_options'] = $this->request->post['tour_options'];
			}
			if(isset($this->request->post['transfer'])){
				if (isset($this->request->post['transfer']['vehicle'])) {
					$extra['transfer_product'] = $this->request->post['transfer']['vehicle'];
				}
				if (isset($this->request->post['transfer']['transfer_option'])) {
					$extra['transfer_options'] = $this->request->post['transfer']['transfer_option'];
				}
			}			
						
			if (!empty($tourOptionsArr)) {
				$extra['tours_options'] = $tourOptionsArr;
			}
			if (!empty($parkOptionsArr)) {
				$extra['parks_options'] = $parkOptionsArr;
			}
			

			if (!$json) {
				$this->cart->add($this->request->post['product_id'], $quantity, $option, $recurring_id, $extra);
				
				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));


				// Unset all shipping and payment methods
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);

				// Totals
				$this->load->model('extension/extension');

				$totals = array();
				$taxes = $this->cart->getTaxes();
				$total = 0;
		
				// Because __call can not keep var references so we put them into an array. 			
				$total_data = array(
					'totals' => &$totals,
					'taxes'  => &$taxes,
					'total'  => &$total
				);

				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$sort_order = array();

					$results = $this->model_extension_extension->getExtensions('total');

					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
					}

					array_multisort($sort_order, SORT_ASC, $results);

					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('extension/total/' . $result['code']);

							// We have to put the totals in an array so that they pass by reference.
							$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
						}
					}

					$sort_order = array();

					foreach ($totals as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $totals);
				}

				$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		}
//echo "<pre>";print_r($json);exit;
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function edit() {
		$this->load->language('checkout/cart');

		$json = array();
		// Update
		if (!empty($this->request->post['quantity'])) {
			foreach ($this->request->post['quantity'] as $key => $value) {
				$this->cart->update($key, $value);
			}

			$this->session->data['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);

			$this->response->redirect($this->url->link('checkout/cart'));
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function remove() {
		$this->load->language('checkout/cart');

		$json = array();

		// Remove
		if (isset($this->request->post['key'])) {
			$this->cart->remove($this->request->post['key']);

			unset($this->session->data['vouchers'][$this->request->post['key']]);

			$json['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);
			
			// Totals
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array. 			
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('extension/total/' . $result['code']);

						// We have to put the totals in an array so that they pass by reference.
						$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
					}
				}

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);
			}

			$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function isCustomPriceValid($custom_price){
		if($custom_price==""){
			return false;
		}else{
			return true;
		}

	}
}
