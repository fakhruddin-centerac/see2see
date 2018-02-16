<?php
class ModelCatalogTours extends Model {
	public function addProduct($data) {
		//echo "<pre>";print_r($data);exit;
        if(isset($data['video']))
        {
            $videourl = $data['video'];
        }
        else
        {
            $videourl ='';
        }
        $this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', family = '" . (int)$data['family'] . "', video_url = '" . $videourl . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW(), product_tp ='TE'");
        $tours_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$tours_id . "'");
		}

		foreach ($data['tours_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$tours_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['tours_store'])) {
			foreach ($data['tours_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$tours_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['tours_attribute'])) {
			foreach ($data['tours_attribute'] as $tours_attribute) {
				if ($tours_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$tours_id . "' AND attribute_id = '" . (int)$tours_attribute['attribute_id'] . "'");

					foreach ($tours_attribute['tours_attribute_description'] as $language_id => $tours_attribute_description) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$tours_id . "' AND attribute_id = '" . (int)$tours_attribute['attribute_id'] . "' AND language_id = '" . (int)$language_id . "'");

						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$tours_id . "', attribute_id = '" . (int)$tours_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($tours_attribute_description['text']) . "'");
					}
				}
			}
		}

		if (isset($data['tours_option'])) {
			foreach ($data['tours_option'] as $tours_option) {
				if ($tours_option['type'] == 'select' || $tours_option['type'] == 'radio' || $tours_option['type'] == 'checkbox' || $tours_option['type'] == 'image') {
					if (isset($tours_option['tours_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$tours_id . "', option_id = '" . (int)$tours_option['option_id'] . "', required = '" . (int)$tours_option['required'] . "'");

						$tours_option_id = $this->db->getLastId();

						foreach ($tours_option['tours_option_value'] as $tours_option_value) {
						  if(isset($tours_option_value['time_val']))
                            {
                                $timeval = $tours_option_value['time_val'];
                            }
                            else
                            {
                                $timeval ='';
                            }
                            if(isset($tours_option_value['price_type']))
                            {
                                $pricetype = $tours_option_value['price_type'];
                            }
                            else
                            {
                                $pricetype = '';
                            }
						      $this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$tours_option_id . "', product_id = '" . (int)$tours_id . "', option_id = '" . (int)$tours_option['option_id'] . "', option_value_id = '" . (int)$tours_option_value['option_value_id'] . "', quantity = '" . (int)$tours_option_value['quantity'] . "', subtract = '" . (int)$tours_option_value['subtract'] . "', price = '" . (float)$tours_option_value['price'] . "' , child_price = '" . (float)$tours_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($tours_option_value['price_prefix']) . "', points = '" . (int)$tours_option_value['points'] . "', points_prefix = '" . $this->db->escape($tours_option_value['points_prefix']) . "', weight = '" . (float)$tours_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($tours_option_value['weight_prefix']) . "', time_val = '". $timeval ."',price_type = '". $pricetype ."'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$tours_id . "', option_id = '" . (int)$tours_option['option_id'] . "', value = '" . $this->db->escape($tours_option['value']) . "', required = '" . (int)$tours_option['required'] . "'");
				}
			}
		}

		if (isset($data['tours_discount'])) {
			foreach ($data['tours_discount'] as $tours_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$tours_id . "', customer_group_id = '" . (int)$tours_discount['customer_group_id'] . "', quantity = '" . (int)$tours_discount['quantity'] . "', priority = '" . (int)$tours_discount['priority'] . "', price = '" . (float)$tours_discount['price'] . "', date_start = '" . $this->db->escape($tours_discount['date_start']) . "', date_end = '" . $this->db->escape($tours_discount['date_end']) . "'");
			}
		}

		if (isset($data['tours_special'])) {
			foreach ($data['tours_special'] as $tours_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$tours_id . "', customer_group_id = '" . (int)$tours_special['customer_group_id'] . "', priority = '" . (int)$tours_special['priority'] . "', price = '" . (float)$tours_special['price'] . "', date_start = '" . $this->db->escape($tours_special['date_start']) . "', date_end = '" . $this->db->escape($tours_special['date_end']) . "'");
			}
		}

		if (isset($data['tours_images'])) {
			foreach ($data['tours_images'] as $tours_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$tours_id . "', image = '" . $this->db->escape($tours_image['image']) . "', sort_order = '" . (int)$tours_image['sort_order'] . "'");
			}
		}

		if (isset($data['tours_download'])) {
			foreach ($data['tours_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$tours_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		if (isset($data['tours_category'])) {
			foreach ($data['tours_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$tours_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['tours_filter'])) {
			foreach ($data['tours_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$tours_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		if (isset($data['tours_related'])) {
			foreach ($data['tours_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$tours_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$tours_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$tours_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$tours_id . "'");
			}
		}

		if (isset($data['tours_reward'])) {
			foreach ($data['tours_reward'] as $customer_group_id => $tours_reward) {
				if ((int)$tours_reward['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$tours_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$tours_reward['points'] . "'");
				}
			}
		}

		if (isset($data['tours_layout'])) {
			foreach ($data['tours_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$tours_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$tours_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		if (isset($data['tours_recurring'])) {
			foreach ($data['tours_recurring'] as $recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$tours_id . ", customer_group_id = " . (int)$recurring['customer_group_id'] . ", `recurring_id` = " . (int)$recurring['recurring_id']);
			}
		}

		$this->cache->delete('tours');

		return $tours_id;
	}

	public function editProduct($tours_id, $data) {
		  //echo "<pre>";print_r($data);
          //echo "UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', family = '" . (int)$data['family'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE product_id = '" . (int)$tours_id . "'";
          //exit;
        /*for water sports*/
        if(isset($data['video']))
        {
            $videourl = $data['video'];
        }
        else
        {
            $videourl ='';
        }
        
        $this->db->query("UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', video_url = '" . $videourl . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', family = '" . (int)$data['family'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$tours_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($data['tours_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$tours_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_store'])) {
			foreach ($data['tours_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$tours_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$tours_id . "'");

		if (!empty($data['tours_attribute'])) {
			foreach ($data['tours_attribute'] as $tours_attribute) {
				if ($tours_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$tours_id . "' AND attribute_id = '" . (int)$tours_attribute['attribute_id'] . "'");

					foreach ($tours_attribute['tours_attribute_description'] as $language_id => $tours_attribute_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$tours_id . "', attribute_id = '" . (int)$tours_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($tours_attribute_description['text']) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_option'])) {
			foreach ($data['tours_option'] as $tours_option) {
				if ($tours_option['type'] == 'select' || $tours_option['type'] == 'radio' || $tours_option['type'] == 'checkbox' || $tours_option['type'] == 'image') {
					if (isset($tours_option['tours_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$tours_option['tours_option_id'] . "', product_id = '" . (int)$tours_id . "', option_id = '" . (int)$tours_option['option_id'] . "', required = '" . (int)$tours_option['required'] . "'");

						$tours_option_id = $this->db->getLastId();

						foreach ($tours_option['tours_option_value'] as $tours_option_value) {
							//time_val = '".$tours_option_value['time_val'] ."',price_type = '".$tours_option_value['price_type'] ."'
                            if(isset($tours_option_value['time_val']))
                            {
                                $timeval = $tours_option_value['time_val'];
                            }
                            else
                            {
                                $timeval ='';
                            }
                            if(isset($tours_option_value['price_type']))
                            {
                                $pricetype = $tours_option_value['price_type'];
                            }
                            else
                            {
                                $pricetype = '';
                            }
                            $this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_value_id = '" . (int)$tours_option_value['tours_option_value_id'] . "', product_option_id = '" . (int)$tours_option_id . "', product_id = '" . (int)$tours_id . "', option_id = '" . (int)$tours_option['option_id'] . "', option_value_id = '" . (int)$tours_option_value['option_value_id'] . "', quantity = '" . (int)$tours_option_value['quantity'] . "', subtract = '" . (int)$tours_option_value['subtract'] . "', price = '" . (float)$tours_option_value['price'] . "',  child_price = '" . (float)$tours_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($tours_option_value['price_prefix']) . "', points = '" . (int)$tours_option_value['points'] . "', points_prefix = '" . $this->db->escape($tours_option_value['points_prefix']) . "', weight = '" . (float)$tours_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($tours_option_value['weight_prefix']) . "', time_val = '". $timeval ."',price_type = '". $pricetype ."' ");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$tours_option['tours_option_id'] . "', product_id = '" . (int)$tours_id . "', option_id = '" . (int)$tours_option['option_id'] . "', value = '" . $this->db->escape($tours_option['value']) . "', required = '" . (int)$tours_option['required'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_discount'])) {
			foreach ($data['tours_discount'] as $tours_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$tours_id . "', customer_group_id = '" . (int)$tours_discount['customer_group_id'] . "', quantity = '" . (int)$tours_discount['quantity'] . "', priority = '" . (int)$tours_discount['priority'] . "', price = '" . (float)$tours_discount['price'] . "', date_start = '" . $this->db->escape($tours_discount['date_start']) . "', date_end = '" . $this->db->escape($tours_discount['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_special'])) {
			foreach ($data['tours_special'] as $tours_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$tours_id . "', customer_group_id = '" . (int)$tours_special['customer_group_id'] . "', priority = '" . (int)$tours_special['priority'] . "', price = '" . (float)$tours_special['price'] . "', date_start = '" . $this->db->escape($tours_special['date_start']) . "', date_end = '" . $this->db->escape($tours_special['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_images'])) {
			foreach ($data['tours_images'] as $tours_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$tours_id . "', image = '" . $this->db->escape($tours_image['image']) . "', sort_order = '" . (int)$tours_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_download'])) {
			foreach ($data['tours_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$tours_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_category'])) {
			foreach ($data['tours_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$tours_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_filter'])) {
			foreach ($data['tours_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$tours_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_related'])) {
			foreach ($data['tours_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$tours_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$tours_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$tours_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$tours_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_reward'])) {
			foreach ($data['tours_reward'] as $customer_group_id => $value) {
				if ((int)$value['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$tours_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$tours_id . "'");

		if (isset($data['tours_layout'])) {
			foreach ($data['tours_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$tours_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$tours_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$tours_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = " . (int)$tours_id);

		if (isset($data['tours_recurring'])) {
			foreach ($data['tours_recurring'] as $tours_recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$tours_id . ", customer_group_id = " . (int)$tours_recurring['customer_group_id'] . ", `recurring_id` = " . (int)$tours_recurring['recurring_id']);
			}
		}

		$this->cache->delete('tours');
	}

	public function copyProduct($tours_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$tours_id . "'");

		if ($query->num_rows) {
			$data = $query->row;

			$data['sku'] = '';
			$data['upc'] = '';
			$data['viewed'] = '0';
			$data['keyword'] = '';
			$data['status'] = '0';
            $data['family'] = '0';

			$data['tours_attribute'] = $this->getProductAttributes($tours_id);
			$data['tours_description'] = $this->getProductDescriptions($tours_id);
			$data['tours_discount'] = $this->getProductDiscounts($tours_id);
			$data['tours_filter'] = $this->getProductFilters($tours_id);
			$data['tours_image'] = $this->getProductImages($tours_id);
			$data['tours_option'] = $this->getProductOptions($tours_id);
			$data['tours_related'] = $this->getProductRelated($tours_id);
			$data['tours_reward'] = $this->getProductRewards($tours_id);
			$data['tours_special'] = $this->getProductSpecials($tours_id);
			$data['tours_category'] = $this->getProductCategories($tours_id);
			$data['tours_download'] = $this->getProductDownloads($tours_id);
			$data['tours_layout'] = $this->getProductLayouts($tours_id);
			$data['tours_store'] = $this->getProductStores($tours_id);
			$data['tours_recurrings'] = $this->getRecurrings($tours_id);

			$this->addProduct($data);
		}
	}

	public function deleteProduct($tours_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$tours_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$tours_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$tours_id . "'");

		$this->cache->delete('tours');
	}

	public function getProduct($tours_id) {
		
        $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$tours_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$tours_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

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
         WHERE p.product_tp ='TE' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
        if (isset($data['filter_family']) && !is_null($data['filter_family'])) {
			$sql .= " AND p.family = '" . (int)$data['filter_family'] . "'";
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
            'p.family',
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
		/*$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id) WHERE p.product_tp ='TE' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";*/
        //echo "<pre>";print_r($data);exit;
        $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)  WHERE p.product_tp ='TE' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        
        
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
        
        if (isset($data['filter_family']) && !is_null($data['filter_family'])) {
			$sql .= " AND p.family = '" . (int)$data['filter_family'] . "'";
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
            'p.family',
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

	public function getProductDescriptions($tours_id) {
		$tours_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($query->rows as $result) {
			$tours_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			);
		}

		return $tours_description_data;
	}

	public function getProductCategories($tours_id) {
		$tours_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($query->rows as $result) {
			$tours_category_data[] = $result['category_id'];
		}

		return $tours_category_data;
	}

	public function getProductFilters($tours_id) {
		$tours_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($query->rows as $result) {
			$tours_filter_data[] = $result['filter_id'];
		}

		return $tours_filter_data;
	}

	public function getProductAttributes($tours_id) {
		$tours_attribute_data = array();

		$tours_attribute_query = $this->db->query("SELECT attribute_id FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$tours_id . "' GROUP BY attribute_id");

		foreach ($tours_attribute_query->rows as $tours_attribute) {
			$tours_attribute_description_data = array();

			$tours_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$tours_id . "' AND attribute_id = '" . (int)$tours_attribute['attribute_id'] . "'");

			foreach ($tours_attribute_description_query->rows as $tours_attribute_description) {
				$tours_attribute_description_data[$tours_attribute_description['language_id']] = array('text' => $tours_attribute_description['text']);
			}

			$tours_attribute_data[] = array(
				'attribute_id'                  => $tours_attribute['attribute_id'],
				'tours_attribute_description' => $tours_attribute_description_data
			);
		}

		return $tours_attribute_data;
	}
public function getProductOptionsAdd() {
		$tours_option_data = array();

//		$tours_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $tours_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='C2C' ");
		//echo "<pre>";print_r($tours_option_query);exit;
        foreach ($tours_option_query->rows as $tours_option) {
			$tours_option_value_data = array();

			//$tours_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$tours_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $tours_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$tours_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($tours_option_value_query);exit;
			foreach ($tours_option_value_query->rows as $tours_option_value) {
				
                $tours_option_value_data[] = array(
					/*'tours_option_value_id' => $tours_option_value['product_option_value_id'],*/
                    'tours_option_value_id' => '',
					'option_value_id'         => $tours_option_value['option_value_id'],
					/*'quantity'                => $tours_option_value['quantity'],
					'subtract'                => $tours_option_value['subtract'],
					'price'                   => $tours_option_value['price'],
					'price_prefix'            => $tours_option_value['price_prefix'],
					'points'                  => $tours_option_value['points'],
					'points_prefix'           => $tours_option_value['points_prefix'],
					'weight'                  => $tours_option_value['weight'],
					'weight_prefix'           => $tours_option_value['weight_prefix']*/
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

			$tours_option_data[] = array(
				/*'tours_option_id'    => $tours_option['product_option_id'],
				'product_option_value' => $tours_option_value_data,
				'option_id'            => $tours_option['option_id'],
				'name'                 => $tours_option['name'],
				'type'                 => $tours_option['type'],
				'value'                => $tours_option['value'],
				'required'             => $tours_option['required']*/
                'tours_option_id'    => '',
				'tours_option_value' => $tours_option_value_data,
				'option_id'            => $tours_option['option_id'],
				'name'                 => $tours_option['name'],
				'type'                 => $tours_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $tours_option_data;
	}

    /*TEWS*/
    public function getProductOptionsAddWSTE() {
		$tours_option_data = array();

//		$tours_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $tours_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='TEWS' ");
		//echo "<pre>";print_r($tours_option_query);exit;
        foreach ($tours_option_query->rows as $tours_option) {
			$tours_option_value_data = array();

			//$tours_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$tours_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $tours_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$tours_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($tours_option_value_query);exit;
			foreach ($tours_option_value_query->rows as $tours_option_value) {
				
                $tours_option_value_data[] = array(
					/*'tours_option_value_id' => $tours_option_value['product_option_value_id'],*/
                    'tours_option_value_id' => '',
					'option_value_id'         => $tours_option_value['option_value_id'],
					/*'quantity'                => $tours_option_value['quantity'],
					'subtract'                => $tours_option_value['subtract'],
					'price'                   => $tours_option_value['price'],
					'price_prefix'            => $tours_option_value['price_prefix'],
					'points'                  => $tours_option_value['points'],
					'points_prefix'           => $tours_option_value['points_prefix'],
					'weight'                  => $tours_option_value['weight'],
					'weight_prefix'           => $tours_option_value['weight_prefix']*/
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

			$tours_option_data[] = array(
				/*'tours_option_id'    => $tours_option['product_option_id'],
				'product_option_value' => $tours_option_value_data,
				'option_id'            => $tours_option['option_id'],
				'name'                 => $tours_option['name'],
				'type'                 => $tours_option['type'],
				'value'                => $tours_option['value'],
				'required'             => $tours_option['required']*/
                'tours_option_id'    => '',
				'tours_option_value' => $tours_option_value_data,
				'option_id'            => $tours_option['option_id'],
				'name'                 => $tours_option['name'],
				'type'                 => $tours_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $tours_option_data;
	}


	public function getProductOptions($tours_id) {
		$tours_option_data = array();

		$tours_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$tours_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($tours_option_query->rows as $tours_option) {
			$tours_option_value_data = array();

			$tours_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$tours_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

			foreach ($tours_option_value_query->rows as $tours_option_value) {
				$tours_option_value_data[] = array(
					'tours_option_value_id' => $tours_option_value['product_option_value_id'],
					'option_value_id'         => $tours_option_value['option_value_id'],
					'quantity'                => $tours_option_value['quantity'],
					'subtract'                => $tours_option_value['subtract'],
					'child_price'             => $tours_option_value['child_price'],
                    'price'                   => $tours_option_value['price'],
					'price_prefix'            => $tours_option_value['price_prefix'],
					'points'                  => $tours_option_value['points'],
					'points_prefix'           => $tours_option_value['points_prefix'],
					'weight'                  => $tours_option_value['weight'],
					'weight_prefix'           => $tours_option_value['weight_prefix']
				);
			}

			$tours_option_data[] = array(
				'tours_option_id'    => $tours_option['product_option_id'],
				'tours_option_value' => $tours_option_value_data,
				'option_id'            => $tours_option['option_id'],
				'name'                 => $tours_option['name'],
				'type'                 => $tours_option['type'],
				'value'                => $tours_option['value'],
				'required'             => $tours_option['required']
			);
		}

		return $tours_option_data;
	}

	public function getProductOptionValue($tours_id, $tours_option_value_id) {
		$query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$tours_id . "' AND pov.product_option_value_id = '" . (int)$tours_option_value_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProductImages($tours_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$tours_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductDiscounts($tours_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$tours_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}

	public function getProductSpecials($tours_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$tours_id . "' ORDER BY priority, price");
       
		return $query->rows;
	}

	public function getProductRewards($tours_id) {
		$tours_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($query->rows as $result) {
			$tours_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $tours_reward_data;
	}

	public function getProductDownloads($tours_id) {
		$tours_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($query->rows as $result) {
			$tours_download_data[] = $result['download_id'];
		}

		return $tours_download_data;
	}

	public function getProductStores($tours_id) {
		$tours_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($query->rows as $result) {
			$tours_store_data[] = $result['store_id'];
		}

		return $tours_store_data;
	}

	public function getProductLayouts($tours_id) {
		$tours_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($query->rows as $result) {
			$tours_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $tours_layout_data;
	}

	public function getProductRelated($tours_id) {
		$tours_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$tours_id . "'");

		foreach ($query->rows as $result) {
			$tours_related_data[] = $result['related_id'];
		}

		return $tours_related_data;
	}

	public function getRecurrings($tours_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = '" . (int)$tours_id . "'");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
/* cutomize for filter addtionaly add by category
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";
*/
$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.product_tp ='TE'";
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
        
        if (isset($data['filter_family']) && !is_null($data['filter_family'])) {
			$sql .= " AND p.family = '" . (int)$data['filter_family'] . "'";
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
