<?php
class ModelCatalogHotels extends Model {
	public function addProduct($data) {
		//echo "<pre>";print_r($data);exit;	

        $this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW(), product_tp ='HB'");

		$hotel_id = $this->db->getLastId();

		if(isset($data['hotel_roomtype'])){
			$room_count = 0;
			foreach ($data['hotel_roomtype'] as $roomtype) {				
				$roomname 	= $roomtype['roomname'];
				$facilities ='';
								
				//inser room category into product custom table
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_custom SET product_id='". (int)$hotel_id ."', room_category='".$roomname."', blackout_dates='' ");
				$hotel_custom_id = $this->db->getLastId();
				
				if(isset($roomtype['room_options'])){
					foreach($roomtype['room_options'] as $room_option){

						$stay_period 	= explode('/',str_replace(' ', '', $room_option['stay_period']));
						$booking_period = explode('/',str_replace(' ', '', $room_option['booking_period']));
						$meals_options  = implode(",",$room_option['meal_option']);
						//adding room options into product room option table
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_room_option SET product_id='". (int)$hotel_id ."',room_category_id='". (int)$hotel_custom_id ."', stay_period_start='". $this->db->escape($stay_period[0]) ."',stay_period_end='". $this->db->escape($stay_period[1]) ."',all_market_price='".(float)$room_option['all_market_price']."',ind_market_price='". (float)$room_option['indian_market_price'] ."',all_adult_BB_price='".(float)$room_option['all_adult_bed_breakfast_price']."',all_child_BB_price='".(float)$room_option['all_child_bed_breakfast_price']."',all_adult_HB_price='". (float)$room_option['all_adult_half_board_price'] ."',all_child_HB_price='".(float)$room_option['all_child_half_board_price']."',all_adult_FB_price='".(float)$room_option['all_adult_full_board_price']."',all_child_FB_price='".(float)$room_option['all_child_full_board_price']."',ind_adult_BB_price='".(float)$room_option['ind_adult_bed_breakfast_price']."',ind_child_BB_price='".(float)$room_option['ind_child_bed_breakfast_price']."',ind_adult_HB_price='".(float)$room_option['ind_adult_half_board_price']."',ind_child_HB_price='".(float)$room_option['ind_child_half_board_price']."',ind_adult_FB_price='".(float)$room_option['ind_adult_full_board_price']."',ind_child_FB_price='".(float)$room_option['ind_child_full_board_price']."',book_period_start='". $this->db->escape($booking_period[0]) ."',book_period_end='". $this->db->escape($booking_period[1]) ."',ind_discount_percentage='".(int)$room_option['ind_ebd_discount']."',all_discount_percentage='".(int)$room_option['all_ebd_discount']."',meal_options='".$this->db->escape($meals_options)."',adult_occupancy='".(int)$room_option['adult_occupancy']."',child_occupancy='".(int)$room_option['child_occupancy']."' ");
					}

				}

				$room_count++;
				
			}
			//update total room count as popup in product table
			$this->db->query("UPDATE " . DB_PREFIX . "product SET top_up = '" . $this->db->escape($room_count) . "' WHERE product_id = '" . (int)$hotel_id . "'");
		}
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$hotel_id . "'");
		}

		foreach ($data['hotel_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$hotel_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
				///update blackout dates into product custom table
				//$this->db->query("UPDATE " . DB_PREFIX . "product_custom SET blackout_dates = '" . $this->db->escape($value['balckout_date']) . "' WHERE product_id = '" . (int)$hotel_id . "'");
		}

		if (isset($data['hotel_store'])) {
			foreach ($data['hotel_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$hotel_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['hotel_attribute'])) {
			foreach ($data['hotel_attribute'] as $hotel_attribute) {
				if ($hotel_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$hotel_id . "' AND attribute_id = '" . (int)$hotel_attribute['attribute_id'] . "'");

					foreach ($hotel_attribute['hotel_attribute_description'] as $language_id => $hotel_attribute_description) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$hotel_id . "' AND attribute_id = '" . (int)$hotel_attribute['attribute_id'] . "' AND language_id = '" . (int)$language_id . "'");

						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$hotel_id . "', attribute_id = '" . (int)$hotel_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($hotel_attribute_description['text']) . "'");
					}
				}
			}
		}

		if (isset($data['hotel_option'])) {
			foreach ($data['hotel_option'] as $hotel_option) {
				if ($hotel_option['type'] == 'select' || $hotel_option['type'] == 'radio' || $hotel_option['type'] == 'checkbox' || $hotel_option['type'] == 'image') {
					if (isset($hotel_option['hotel_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$hotel_id . "', option_id = '" . (int)$hotel_option['option_id'] . "', required = '" . (int)$hotel_option['required'] . "'");

						$hotel_option_id = $this->db->getLastId();

						foreach ($hotel_option['hotel_option_value'] as $hotel_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$hotel_option_id . "', product_id = '" . (int)$hotel_id . "', option_id = '" . (int)$hotel_option['option_id'] . "', option_value_id = '" . (int)$hotel_option_value['option_value_id'] . "', quantity = '" . (int)$hotel_option_value['quantity'] . "', subtract = '" . (int)$hotel_option_value['subtract'] . "', price = '" . (float)$hotel_option_value['price'] . "' , child_price = '" . (float)$hotel_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($hotel_option_value['price_prefix']) . "', points = '" . (int)$hotel_option_value['points'] . "', points_prefix = '" . $this->db->escape($hotel_option_value['points_prefix']) . "', weight = '" . (float)$hotel_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($hotel_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$hotel_id . "', option_id = '" . (int)$hotel_option['option_id'] . "', value = '" . $this->db->escape($hotel_option['value']) . "', required = '" . (int)$hotel_option['required'] . "'");
				}
			}
		}

		if (isset($data['hotel_discount'])) {
			foreach ($data['hotel_discount'] as $hotel_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$hotel_id . "', customer_group_id = '" . (int)$hotel_discount['customer_group_id'] . "', quantity = '" . (int)$hotel_discount['quantity'] . "', priority = '" . (int)$hotel_discount['priority'] . "', price = '" . (float)$hotel_discount['price'] . "', date_start = '" . $this->db->escape($hotel_discount['date_start']) . "', date_end = '" . $this->db->escape($hotel_discount['date_end']) . "'");
			}
		}

		if (isset($data['hotel_special'])) {
			foreach ($data['hotel_special'] as $hotel_special) {			
				$blackout_dates 	= explode('/',str_replace(' ', '', $hotel_special['balckout_date']));		
				
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$hotel_id . "', customer_group_id = '', priority = '', price = '', date_start = '" . $this->db->escape($blackout_dates[0]) . "', date_end = '" . $this->db->escape($blackout_dates[1]) . "'");
			}
		}

		if (isset($data['hotel_images'])) {
			foreach ($data['hotel_images'] as $hotel_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$hotel_id . "', image = '" . $this->db->escape($hotel_image['image']) . "', sort_order = '" . (int)$hotel_image['sort_order'] . "'");
			}
		}

		if (isset($data['hotel_download'])) {
			foreach ($data['hotel_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$hotel_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		if (isset($data['facility_provinding'])) {
			foreach ($data['facility_provinding'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$hotel_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['hotel_filter'])) {
			foreach ($data['hotel_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$hotel_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		if (isset($data['hotel_related'])) {
			foreach ($data['hotel_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$hotel_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$hotel_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$hotel_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$hotel_id . "'");
			}
		}

		if (isset($data['hotel_reward'])) {
			foreach ($data['hotel_reward'] as $customer_group_id => $hotel_reward) {
				if ((int)$hotel_reward['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$hotel_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$hotel_reward['points'] . "'");
				}
			}
		}

		if (isset($data['hotel_layout'])) {
			foreach ($data['hotel_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$hotel_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$hotel_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		if (isset($data['hotel_recurring'])) {
			foreach ($data['hotel_recurring'] as $recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$hotel_id . ", customer_group_id = " . (int)$recurring['customer_group_id'] . ", `recurring_id` = " . (int)$recurring['recurring_id']);
			}
		}

		$this->cache->delete('hotel');

		return $hotel_id;
	}

	public function editProduct($hotel_id, $data) {
		//echo "<pre>";print_r($data); exit;		

        $this->db->query("UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE product_id = '" . (int)$hotel_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "product_custom WHERE product_id = '" . (int)$hotel_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_room_option WHERE product_id = '" . (int)$hotel_id . "'");
        if(isset($data['hotel_roomtype'])){
        	$room_count = 0;
			foreach ($data['hotel_roomtype'] as $roomtype) {				
				$roomname 	= $roomtype['roomname'];
				$facilities ='';
								
				//inser room category into product custom table
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_custom SET product_id='". (int)$hotel_id ."', room_category='".$roomname."', blackout_dates='' ");
				$hotel_custom_id = $this->db->getLastId();
				
				if(isset($roomtype['room_options'])){
					foreach($roomtype['room_options'] as $room_option){
						$stay_period 	= explode('/',str_replace(' ', '', $room_option['stay_period']));
						$booking_period = explode('/',str_replace(' ', '', $room_option['booking_period']));
						$meals_options = implode(",",$room_option['meal_option']);
						
						//adding room options into product room option table
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_room_option SET product_id='". (int)$hotel_id ."',room_category_id='". (int)$hotel_custom_id ."', stay_period_start='". date('Y-m-d',strtotime($stay_period[0])) ."',stay_period_end='". date('Y-m-d',strtotime($stay_period[1])) ."',all_market_price='".(float)$room_option['all_market_price']."',ind_market_price='". (float)$room_option['indian_market_price'] ."',all_adult_BB_price='".(float)$room_option['all_adult_bed_breakfast_price']."',all_child_BB_price='".(float)$room_option['all_child_bed_breakfast_price']."',all_adult_HB_price='". (float)$room_option['all_adult_half_board_price'] ."',all_child_HB_price='".(float)$room_option['all_child_half_board_price']."',all_adult_FB_price='".(float)$room_option['all_adult_full_board_price']."',all_child_FB_price='".(float)$room_option['all_child_full_board_price']."',ind_adult_BB_price='".(float)$room_option['ind_adult_bed_breakfast_price']."',ind_child_BB_price='".(float)$room_option['ind_child_bed_breakfast_price']."',ind_adult_HB_price='".(float)$room_option['ind_adult_half_board_price']."',ind_child_HB_price='".(float)$room_option['ind_child_half_board_price']."',ind_adult_FB_price='".(float)$room_option['ind_adult_full_board_price']."',ind_child_FB_price='".(float)$room_option['ind_child_full_board_price']."',book_period_start='".date('Y-m-d',strtotime($booking_period[0]))."',book_period_end='".date('Y-m-d',strtotime($booking_period[1]))."',ind_discount_percentage='".(int)$room_option['ind_ebd_discount']."',all_discount_percentage='".(int)$room_option['all_ebd_discount']."',meal_options='".$this->db->escape($meals_options)."',adult_occupancy='".(int)$room_option['adult_occupancy']."',child_occupancy='".(int)$room_option['child_occupancy']."' ");
					}

				}

				$room_count++;				
			}
			//update total room count as popup in product table
			$this->db->query("UPDATE " . DB_PREFIX . "product SET top_up = '" . $this->db->escape($room_count) . "' WHERE product_id = '" . (int)$hotel_id . "'");
		}
		
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$hotel_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($data['hotel_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$hotel_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
			///update blackout dates into product custom table
			//$this->db->query("UPDATE " . DB_PREFIX . "product_custom SET blackout_dates = '" . $this->db->escape($value['balckout_date']) . "' WHERE product_id = '" . (int)$hotel_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_store'])) {
			foreach ($data['hotel_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$hotel_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$hotel_id . "'");

		if (!empty($data['hotel_attribute'])) {
			foreach ($data['hotel_attribute'] as $hotel_attribute) {
				if ($hotel_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$hotel_id . "' AND attribute_id = '" . (int)$hotel_attribute['attribute_id'] . "'");

					foreach ($hotel_attribute['hotel_attribute_description'] as $language_id => $hotel_attribute_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$hotel_id . "', attribute_id = '" . (int)$hotel_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($hotel_attribute_description['text']) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_option'])) {
			foreach ($data['hotel_option'] as $hotel_option) {
				if ($hotel_option['type'] == 'select' || $hotel_option['type'] == 'radio' || $hotel_option['type'] == 'checkbox' || $hotel_option['type'] == 'image') {
					if (isset($hotel_option['hotel_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$hotel_option['hotel_option_id'] . "', product_id = '" . (int)$hotel_id . "', option_id = '" . (int)$hotel_option['option_id'] . "', required = '" . (int)$hotel_option['required'] . "'");

						$hotel_option_id = $this->db->getLastId();

						foreach ($hotel_option['hotel_option_value'] as $hotel_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_value_id = '" . (int)$hotel_option_value['hotel_option_value_id'] . "', product_option_id = '" . (int)$hotel_option_id . "', product_id = '" . (int)$hotel_id . "', option_id = '" . (int)$hotel_option['option_id'] . "', option_value_id = '" . (int)$hotel_option_value['option_value_id'] . "', quantity = '" . (int)$hotel_option_value['quantity'] . "', subtract = '" . (int)$hotel_option_value['subtract'] . "', price = '" . (float)$hotel_option_value['price'] . "',  child_price = '" . (float)$hotel_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($hotel_option_value['price_prefix']) . "', points = '" . (int)$hotel_option_value['points'] . "', points_prefix = '" . $this->db->escape($hotel_option_value['points_prefix']) . "', weight = '" . (float)$hotel_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($hotel_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$hotel_option['hotel_option_id'] . "', product_id = '" . (int)$hotel_id . "', option_id = '" . (int)$hotel_option['option_id'] . "', value = '" . $this->db->escape($hotel_option['value']) . "', required = '" . (int)$hotel_option['required'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_discount'])) {
			foreach ($data['hotel_discount'] as $hotel_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$hotel_id . "', customer_group_id = '" . (int)$hotel_discount['customer_group_id'] . "', quantity = '" . (int)$hotel_discount['quantity'] . "', priority = '" . (int)$hotel_discount['priority'] . "', price = '" . (float)$hotel_discount['price'] . "', date_start = '" . $this->db->escape($hotel_discount['date_start']) . "', date_end = '" . $this->db->escape($hotel_discount['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_special'])) {
			foreach ($data['hotel_special'] as $hotel_special) {			
				$blackout_dates = explode('/',str_replace(' ', '', $hotel_special['balckout_date']));	
				
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$hotel_id . "', customer_group_id = '', priority = '', price = '', date_start = '" . $this->db->escape($blackout_dates[0]) . "', date_end = '" . $this->db->escape($blackout_dates[1]) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_images'])) {
			foreach ($data['hotel_images'] as $hotel_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$hotel_id . "', image = '" . $this->db->escape($hotel_image['image']) . "', sort_order = '" . (int)$hotel_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_download'])) {
			foreach ($data['hotel_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$hotel_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['facility_provinding'])) {
			foreach ($data['facility_provinding'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$hotel_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_filter'])) {
			foreach ($data['hotel_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$hotel_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_related'])) {
			foreach ($data['hotel_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$hotel_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$hotel_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$hotel_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$hotel_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_reward'])) {
			foreach ($data['hotel_reward'] as $customer_group_id => $value) {
				if ((int)$value['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$hotel_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$hotel_id . "'");

		if (isset($data['hotel_layout'])) {
			foreach ($data['hotel_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$hotel_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$hotel_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$hotel_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = " . (int)$hotel_id);

		if (isset($data['hotel_recurring'])) {
			foreach ($data['hotel_recurring'] as $hotel_recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$hotel_id . ", customer_group_id = " . (int)$hotel_recurring['customer_group_id'] . ", `recurring_id` = " . (int)$hotel_recurring['recurring_id']);
			}
		}

		$this->cache->delete('hotels');
	}

	public function copyProduct($hotel_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$hotel_id . "'");

		if ($query->num_rows) {
			$data = $query->row;

			$data['sku'] = '';
			$data['upc'] = '';
			$data['viewed'] = '0';
			$data['keyword'] = '';
			$data['status'] = '0';

			$data['hotel_attribute'] = $this->getProductAttributes($hotel_id);
			$data['hotel_description'] = $this->getProductDescriptions($hotel_id);
			$data['hotel_discount'] = $this->getProductDiscounts($hotel_id);
			$data['hotel_filter'] = $this->getProductFilters($hotel_id);
			$data['hotel_image'] = $this->getProductImages($hotel_id);
			$data['hotel_option'] = $this->getProductOptions($hotel_id);
			$data['hotel_related'] = $this->getProductRelated($hotel_id);
			$data['hotel_reward'] = $this->getProductRewards($hotel_id);
			$data['hotel_special'] = $this->getProductSpecials($hotel_id);
			$data['hotel_category'] = $this->getProductCategories($hotel_id);
			$data['hotel_download'] = $this->getProductDownloads($hotel_id);
			$data['hotel_layout'] = $this->getProductLayouts($hotel_id);
			$data['hotel_store'] = $this->getProductStores($hotel_id);
			$data['hotel_recurrings'] = $this->getRecurrings($hotel_id);

			$this->addProduct($data);
		}
	}

	public function deleteProduct($hotel_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$hotel_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_custom WHERE product_id = '" . (int)$hotel_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_room_option WHERE product_id = '" . (int)$hotel_id . "'");

		$this->cache->delete('hotel');
	}

	public function getProduct($hotel_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$hotel_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$hotel_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}
    /*
    public function getProductsByCat($data = array())
    {
            $sql= 
        
    }
    */
    public function getProducts($data = array()) {
		
      $add_sql='';
       if (isset($data['filter_category_id']) && !is_null($data['filter_category_id'])) {
			$add_sql="LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)";
           // $sql .= " AND ptc.category_id = '" . (int)$data['filter_category_id'] . "'";
		}
        
        
        $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
         ".$add_sql."
         WHERE p.product_tp ='HB' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}
        if (isset($data['filter_category_id']) && !is_null($data['filter_category_id'])) {
		  $sql .= " AND ptc.category_id = '" . (int)$data['filter_category_id'] . "'";
		}
		if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
			if ($data['filter_image'] == 1) {
				$sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
			} else {
				$sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
			}
		}
        

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'p.price',
			'p.quantity',
			'p.status',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY pd.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
   //echo $sql;exit;
		$query = $this->db->query($sql);

		return $query->rows;
	}
	public function getProducts_old($data = array()) {
		/*$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id) WHERE p.product_tp ='VS' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";*/
        //echo "<pre>";print_r($data);exit;
        $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)  WHERE p.product_tp ='HB' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        
        
//echo $sql;exit;
		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
		}
        
        
        /*custom add for filter in autocomplayte category*/
           /*Custom add     */        
        if (isset($data['filter_category_id']) && !is_null($data['filter_category_id'])) {
			$sql .= " AND ptc.category_id = '" . (int)$data['filter_category_id'] . "'";
		}
        
        

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
			if ($data['filter_image'] == 1) {
				$sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
			} else {
				$sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
			}
		}

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'p.price',
			'p.quantity',
			'p.status',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY pd.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
 
		$query_tp = $this->db->query($sql);
       
		return $query_tp->rows;
	}

	public function getProductsByCategoryId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2c.category_id = '" . (int)$category_id . "' ORDER BY pd.name ASC");

		return $query->rows;
	}

	public function getProductDescriptions($hotel_id) {
		$hotel_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$hotel_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			);
		}

		return $hotel_description_data;
	}

	public function getProductCategories($hotel_id) {
		$hotel_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$hotel_category_data[] = $result['category_id'];
		}

		return $hotel_category_data;
	}


	public function getProductFilters($hotel_id) {
		$hotel_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$hotel_filter_data[] = $result['filter_id'];
		}

		return $hotel_filter_data;
	}

	public function getProductAttributes($hotel_id) {
		$hotel_attribute_data = array();

		$hotel_attribute_query = $this->db->query("SELECT attribute_id FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$hotel_id . "' GROUP BY attribute_id");

		foreach ($hotel_attribute_query->rows as $hotel_attribute) {
			$hotel_attribute_description_data = array();

			$hotel_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$hotel_id . "' AND attribute_id = '" . (int)$hotel_attribute['attribute_id'] . "'");

			foreach ($hotel_attribute_description_query->rows as $hotel_attribute_description) {
				$hotel_attribute_description_data[$hotel_attribute_description['language_id']] = array('text' => $hotel_attribute_description['text']);
			}

			$hotel_attribute_data[] = array(
				'attribute_id'                  => $hotel_attribute['attribute_id'],
				'hotel_attribute_description' => $hotel_attribute_description_data
			);
		}

		return $hotel_attribute_data;
	}
	public function getHotelRoomOptions($hotel_id){
		$roomResult = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_custom WHERE product_id='".(int)$hotel_id."' ");
		$roomoption = array();
		foreach($roomResult->rows as $rooms){			
			$roomoption[$rooms['product_custom_id']]['product_custom_id'] =  $rooms['product_custom_id'];
			$roomoption[$rooms['product_custom_id']]['room_category'] 	  =  $rooms['room_category'];
			$roomoption[$rooms['product_custom_id']]['blackout_dates'] 	  =  $rooms['blackout_dates'];
			$product_id = $rooms['product_id'];

			$roomCategories = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_room_option WHERE room_category_id='".(int)$rooms['product_custom_id']."' ");
			
			$categorylist=array();
			$items = array();
			$roomoption[$rooms['product_custom_id']]['rooms_added'] = '';
			foreach($roomCategories->rows as $category){
				
				$items['product_room_option_id'] = $category['product_room_option_id'];
				$items['product_id'] = $category['product_id'];
                $items['room_category_id'] = $category['room_category_id'];
                $items['stay_period_start'] = $category['stay_period_start']; 
                $items['stay_period_end'] = $category['stay_period_end'];
                $items['stay_period_end'] = $category['stay_period_end'];
                $items['all_market_price'] = $category['all_market_price'];
                $items['ind_market_price'] = $category['ind_market_price'];
                $items['all_adult_BB_price'] = $category['all_adult_BB_price'];
                $items['all_child_BB_price'] = $category['all_child_BB_price']; 
                $items['all_adult_HB_price'] = $category['all_adult_HB_price'];
                $items['all_child_HB_price'] = $category['all_child_HB_price']; 
                $items['all_adult_FB_price'] = $category['all_adult_FB_price'];
                $items['all_child_FB_price'] = $category['all_child_FB_price'];
                $items['ind_adult_BB_price'] = $category['ind_adult_BB_price'];
                $items['ind_child_BB_price'] = $category['ind_child_BB_price'];
                $items['ind_adult_HB_price'] = $category['ind_adult_HB_price'];
                $items['ind_child_HB_price'] = $category['ind_child_HB_price'];
                $items['ind_adult_FB_price'] = $category['ind_adult_FB_price'];
                $items['ind_child_FB_price'] = $category['ind_child_FB_price'];
                $items['book_period_start'] 	= $category['book_period_start'];
                $items['book_period_end'] 	= $category['book_period_end'];
                $items['ind_discount_percentage'] = $category['ind_discount_percentage'];
                $items['all_discount_percentage'] = $category['all_discount_percentage'];
                $items['meal_options'] 		= $category['meal_options'];
                $items['adult_occupancy'] = $category['adult_occupancy'];
                $items['child_occupancy'] = $category['child_occupancy'];
               
               	//$list[$category['room_category_id']][] = $items;
                $roomoption[$rooms['product_custom_id']]['rooms_added'][] =$items;
			}		
			
		}
		return $roomoption;
		
	}
public function getProductOptionsAdd() {
		$hotel_option_data = array();

//		$visa_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $hotel_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='HB' ");
		//echo "<pre>";print_r($visa_option_query);exit;
        foreach ($hotel_option_query->rows as $hotel_option) {
			$hotel_option_value_data = array();

			//$visa_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$visa_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $hotel_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$hotel_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($visa_option_value_query);exit;
			foreach ($hotel_option_value_query->rows as $hotel_option_value) {
				
                $hotel_option_value_data[] = array(
					/*'visa_option_value_id' => $visa_option_value['product_option_value_id'],*/
                    'hotel_option_value_id' => '',
					'option_value_id'         => $hotel_option_value['option_value_id'],
					/*'quantity'                => $visa_option_value['quantity'],
					'subtract'                => $visa_option_value['subtract'],
					'price'                   => $visa_option_value['price'],
					'price_prefix'            => $visa_option_value['price_prefix'],
					'points'                  => $visa_option_value['points'],
					'points_prefix'           => $visa_option_value['points_prefix'],
					'weight'                  => $visa_option_value['weight'],
					'weight_prefix'           => $visa_option_value['weight_prefix']*/
                    'quantity'                => '',
					'subtract'                => '',
					'price'                   => '',
                    'child_price'             => '',
					'price_prefix'            => '',
					'points'                  => '',
					'points_prefix'           => '',
					'weight'                  => '',
					'weight_prefix'           => ''
				);
			}

			$hotel_option_data[] = array(
				/*'visa_option_id'    => $visa_option['product_option_id'],
				'product_option_value' => $visa_option_value_data,
				'option_id'            => $visa_option['option_id'],
				'name'                 => $visa_option['name'],
				'type'                 => $visa_option['type'],
				'value'                => $visa_option['value'],
				'required'             => $visa_option['required']*/
                'hotel_option_id'    => '',
				'hotel_option_value' => $hotel_option_value_data,
				'option_id'            => $hotel_option['option_id'],
				'name'                 => $hotel_option['name'],
				'type'                 => $hotel_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $hotel_option_data;
	}




	public function getProductOptions($hotel_id) {
		$hotel_option_data = array();

		$hotel_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$hotel_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($hotel_option_query->rows as $hotel_option) {
			$hotel_option_value_data = array();

			$hotel_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$hotel_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

			foreach ($hotel_option_value_query->rows as $hotel_option_value) {
				$hotel_option_value_data[] = array(
					'hotel_option_value_id' => $hotel_option_value['product_option_value_id'],
					'option_value_id'         => $hotel_option_value['option_value_id'],
					'quantity'                => $hotel_option_value['quantity'],
					'subtract'                => $hotel_option_value['subtract'],
					'child_price'             => $hotel_option_value['child_price'],
                    'price'                   => $hotel_option_value['price'],
					'price_prefix'            => $hotel_option_value['price_prefix'],
					'points'                  => $hotel_option_value['points'],
					'points_prefix'           => $hotel_option_value['points_prefix'],
					'weight'                  => $hotel_option_value['weight'],
					'weight_prefix'           => $hotel_option_value['weight_prefix']
				);
			}

			$hotel_option_data[] = array(
				'hotel_option_id'    => $hotel_option['product_option_id'],
				'hotel_option_value' => $hotel_option_value_data,
				'option_id'            => $hotel_option['option_id'],
				'name'                 => $hotel_option['name'],
				'type'                 => $hotel_option['type'],
				'value'                => $hotel_option['value'],
				'required'             => $hotel_option['required']
			);
		}

		return $hotel_option_data;
	}

	public function getProductOptionValue($hotel_id, $hotel_option_value_id) {
		$query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$hotel_id . "' AND pov.product_option_value_id = '" . (int)$hotel_option_value_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProductImages($hotel_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$hotel_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductDiscounts($hotel_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$hotel_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}

	public function getProductSpecials($hotel_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$hotel_id . "' ORDER BY priority, price");
       
		return $query->rows;
	}

	public function getProductRewards($hotel_id) {
		$hotel_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$hotel_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $hotel_reward_data;
	}

	public function getProductDownloads($hotel_id) {
		$hotel_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$hotel_download_data[] = $result['download_id'];
		}

		return $hotel_download_data;
	}

	public function getProductStores($hotel_id) {
		$hotel_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$hotel_store_data[] = $result['store_id'];
		}

		return $hotel_store_data;
	}

	public function getProductLayouts($hotel_id) {
		$hotel_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$hotel_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $hotel_layout_data;
	}

	public function getProductRelated($hotel_id) {
		$hotel_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$hotel_id . "'");

		foreach ($query->rows as $result) {
			$hotel_related_data[] = $result['related_id'];
		}

		return $hotel_related_data;
	}

	public function getRecurrings($hotel_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = '" . (int)$hotel_id . "'");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
/* cutomize for filter addtionaly add by category
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";
*/
$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.product_tp ='HB'";
//echo $sql;exit;
		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
		}
        
        
        
            /*Custom add     */        
        if (isset($data['filter_category']) && !is_null($data['filter_category'])) {
			$sql .= " AND ptc.category_id = '" . (int)$data['filter_category'] . "'";
		}
        



		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
			if ($data['filter_image'] == 1) {
				$sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
			} else {
				$sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
			}
		}
//echo $sql;exit;
		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalProductsByTaxClassId($tax_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE tax_class_id = '" . (int)$tax_class_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByStockStatusId($stock_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE stock_status_id = '" . (int)$stock_status_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByWeightClassId($weight_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE weight_class_id = '" . (int)$weight_class_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByLengthClassId($length_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE length_class_id = '" . (int)$length_class_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByDownloadId($download_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_to_download WHERE download_id = '" . (int)$download_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByManufacturerId($manufacturer_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByAttributeId($attribute_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_attribute WHERE attribute_id = '" . (int)$attribute_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByOptionId($option_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_option WHERE option_id = '" . (int)$option_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByProfileId($recurring_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_recurring WHERE recurring_id = '" . (int)$recurring_id . "'");

		return $query->row['total'];
	}

	public function getTotalProductsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}
