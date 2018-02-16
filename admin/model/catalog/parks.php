<?php
class ModelCatalogParks extends Model {
	public function addProduct($data) {
		//echo "<pre>";print_r($data);exit;
        
        $this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', top_up='".(int)$data['top_up']."', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW(), product_tp ='PK'");

		$parks_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$parks_id . "'");
		}

		foreach ($data['parks_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$parks_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['parks_store'])) {
			foreach ($data['parks_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$parks_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['parks_attribute'])) {
			foreach ($data['parks_attribute'] as $parks_attribute) {
				if ($parks_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$parks_id . "' AND attribute_id = '" . (int)$parks_attribute['attribute_id'] . "'");

					foreach ($parks_attribute['parks_attribute_description'] as $language_id => $parks_attribute_description) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$parks_id . "' AND attribute_id = '" . (int)$parks_attribute['attribute_id'] . "' AND language_id = '" . (int)$language_id . "'");

						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$parks_id . "', attribute_id = '" . (int)$parks_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($parks_attribute_description['text']) . "'");
					}
				}
			}
		}
$child_prce=0;
$adult_price=0;
		if (isset($data['parks_option'])) {
			foreach ($data['parks_option'] as $parks_option) {
				if ($parks_option['type'] == 'select' || $parks_option['type'] == 'radio' || $parks_option['type'] == 'checkbox' || $parks_option['type'] == 'image') {
					if (isset($parks_option['parks_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$parks_id . "', option_id = '" . (int)$parks_option['option_id'] . "', required = '" . (int)$parks_option['required'] . "'");

						$parks_option_id = $this->db->getLastId();

						foreach ($parks_option['parks_option_value'] as $parks_option_value) {
						  if(isset($parks_option_value['price_type']))
                            {
                                $pricetype = $parks_option_value['price_type'];
                            }
                            else
                            {
                                $pricetype = '';
                            }
                           
                            
                            if($data['top_up']==1 && $parks_option['option_id']==14) // Private==16 and top tour 
                             {
                               $adult_price=$parks_option_value['price'];
                               $child_prce=$parks_option_value['child_price']; 
                             }
                          
                          
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$parks_option_id . "', product_id = '" . (int)$parks_id . "', option_id = '" . (int)$parks_option['option_id'] . "', option_value_id = '" . (int)$parks_option_value['option_value_id'] . "', quantity = '" . (int)$parks_option_value['quantity'] . "', subtract = '" . (int)$parks_option_value['subtract'] . "', price = '" . (float)$parks_option_value['price'] . "' , child_price = '" . (float)$parks_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($parks_option_value['price_prefix']) . "', points = '" . (int)$parks_option_value['points'] . "', points_prefix = '" . $this->db->escape($parks_option_value['points_prefix']) . "', weight = '" . (float)$parks_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($parks_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$parks_id . "', option_id = '" . (int)$parks_option['option_id'] . "', value = '" . $this->db->escape($parks_option['value']) . "', required = '" . (int)$parks_option['required'] . "'");
				}
			}
		}
if($data['top_up']==1 ) //only tour    
      { $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET top_up_child = '" . (float)$child_prce . "',top_up_adults = '" . (float)$adult_price . "' WHERE product_id = '" . (int)$parks_id . "' and option_id='16' "); } //update Private price if top up value is ther
	
    	if (isset($data['parks_discount'])) {
			foreach ($data['parks_discount'] as $parks_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$parks_id . "', customer_group_id = '" . (int)$parks_discount['customer_group_id'] . "', quantity = '" . (int)$parks_discount['quantity'] . "', priority = '" . (int)$parks_discount['priority'] . "', price = '" . (float)$parks_discount['price'] . "', date_start = '" . $this->db->escape($parks_discount['date_start']) . "', date_end = '" . $this->db->escape($parks_discount['date_end']) . "'");
			}
		}

		if (isset($data['parks_special'])) {
			foreach ($data['parks_special'] as $parks_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$parks_id . "', customer_group_id = '" . (int)$parks_special['customer_group_id'] . "', priority = '" . (int)$parks_special['priority'] . "', price = '" . (float)$parks_special['price'] . "', date_start = '" . $this->db->escape($parks_special['date_start']) . "', date_end = '" . $this->db->escape($parks_special['date_end']) . "'");
			}
		}

		if (isset($data['parks_images'])) {
			foreach ($data['parks_images'] as $parks_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$parks_id . "', image = '" . $this->db->escape($parks_image['image']) . "', sort_order = '" . (int)$parks_image['sort_order'] . "'");
			}
		}

		if (isset($data['parks_download'])) {
			foreach ($data['parks_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$parks_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		if (isset($data['parks_category'])) {
			foreach ($data['parks_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$parks_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['parks_filter'])) {
			foreach ($data['parks_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$parks_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		if (isset($data['parks_related'])) {
			foreach ($data['parks_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$parks_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$parks_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$parks_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$parks_id . "'");
			}
		}

		if (isset($data['parks_reward'])) {
			foreach ($data['parks_reward'] as $customer_group_id => $parks_reward) {
				if ((int)$parks_reward['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$parks_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$parks_reward['points'] . "'");
				}
			}
		}

		if (isset($data['parks_layout'])) {
			foreach ($data['parks_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$parks_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$parks_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		if (isset($data['parks_recurring'])) {
			foreach ($data['parks_recurring'] as $recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$parks_id . ", customer_group_id = " . (int)$recurring['customer_group_id'] . ", `recurring_id` = " . (int)$recurring['recurring_id']);
			}
		}

		$this->cache->delete('parks');

		return $parks_id;
	}

	public function editProduct($parks_id, $data) {
		  //echo "<pre>";print_r($data);exit;
        $this->db->query("UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', top_up = '" . (int)$data['top_up'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$parks_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($data['parks_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$parks_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_store'])) {
			foreach ($data['parks_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$parks_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$parks_id . "'");

		if (!empty($data['parks_attribute'])) {
			foreach ($data['parks_attribute'] as $parks_attribute) {
				if ($parks_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$parks_id . "' AND attribute_id = '" . (int)$parks_attribute['attribute_id'] . "'");

					foreach ($parks_attribute['parks_attribute_description'] as $language_id => $parks_attribute_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$parks_id . "', attribute_id = '" . (int)$parks_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($parks_attribute_description['text']) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$parks_id . "'");
 $child_prce=0;
        $adult_price=0;
		if (isset($data['parks_option'])) {
			foreach ($data['parks_option'] as $parks_option) {
				if ($parks_option['type'] == 'select' || $parks_option['type'] == 'radio' || $parks_option['type'] == 'checkbox' || $parks_option['type'] == 'image') {
					if (isset($parks_option['parks_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$parks_option['parks_option_id'] . "', product_id = '" . (int)$parks_id . "', option_id = '" . (int)$parks_option['option_id'] . "', required = '" . (int)$parks_option['required'] . "'");

						$parks_option_id = $this->db->getLastId();

						foreach ($parks_option['parks_option_value'] as $parks_option_value) {
						   if($data['top_up']==1 && $parks_option['option_id']==14) // Private==16 and top tour 
                             {
                               $adult_price=$parks_option_value['price'];
                               $child_prce=$parks_option_value['child_price']; 
                             }
                          
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_value_id = '" . (int)$parks_option_value['parks_option_value_id'] . "', product_option_id = '" . (int)$parks_option_id . "', product_id = '" . (int)$parks_id . "', option_id = '" . (int)$parks_option['option_id'] . "', option_value_id = '" . (int)$parks_option_value['option_value_id'] . "', quantity = '" . (int)$parks_option_value['quantity'] . "', subtract = '" . (int)$parks_option_value['subtract'] . "', price = '" . (float)$parks_option_value['price'] . "',  child_price = '" . (float)$parks_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($parks_option_value['price_prefix']) . "', points = '" . (int)$parks_option_value['points'] . "', points_prefix = '" . $this->db->escape($parks_option_value['points_prefix']) . "', weight = '" . (float)$parks_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($parks_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$parks_option['parks_option_id'] . "', product_id = '" . (int)$parks_id . "', option_id = '" . (int)$parks_option['option_id'] . "', value = '" . $this->db->escape($parks_option['value']) . "', required = '" . (int)$parks_option['required'] . "'");
				}
			}
		}
     if($data['top_up']==1 ) //only tour    
      { $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET top_up_child = '" . (float)$child_prce . "',top_up_adults = '" . (float)$adult_price . "' WHERE product_id = '" . (int)$parks_id . "' and option_id='16' "); } //update Private price if top up value is ther

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_discount'])) {
			foreach ($data['parks_discount'] as $parks_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$parks_id . "', customer_group_id = '" . (int)$parks_discount['customer_group_id'] . "', quantity = '" . (int)$parks_discount['quantity'] . "', priority = '" . (int)$parks_discount['priority'] . "', price = '" . (float)$parks_discount['price'] . "', date_start = '" . $this->db->escape($parks_discount['date_start']) . "', date_end = '" . $this->db->escape($parks_discount['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_special'])) {
			foreach ($data['parks_special'] as $parks_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$parks_id . "', customer_group_id = '" . (int)$parks_special['customer_group_id'] . "', priority = '" . (int)$parks_special['priority'] . "', price = '" . (float)$parks_special['price'] . "', date_start = '" . $this->db->escape($parks_special['date_start']) . "', date_end = '" . $this->db->escape($parks_special['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_images'])) {
			foreach ($data['parks_images'] as $parks_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$parks_id . "', image = '" . $this->db->escape($parks_image['image']) . "', sort_order = '" . (int)$parks_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_download'])) {
			foreach ($data['parks_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$parks_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_category'])) {
			foreach ($data['parks_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$parks_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_filter'])) {
			foreach ($data['parks_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$parks_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_related'])) {
			foreach ($data['parks_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$parks_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$parks_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$parks_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$parks_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_reward'])) {
			foreach ($data['parks_reward'] as $customer_group_id => $value) {
				if ((int)$value['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$parks_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$parks_id . "'");

		if (isset($data['parks_layout'])) {
			foreach ($data['parks_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$parks_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$parks_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$parks_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = " . (int)$parks_id);

		if (isset($data['parks_recurring'])) {
			foreach ($data['parks_recurring'] as $parks_recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$parks_id . ", customer_group_id = " . (int)$parks_recurring['customer_group_id'] . ", `recurring_id` = " . (int)$parks_recurring['recurring_id']);
			}
		}

		$this->cache->delete('parks');
	}

	public function copyProduct($parks_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$parks_id . "'");

		if ($query->num_rows) {
			$data = $query->row;

			$data['sku'] = '';
			$data['upc'] = '';
			$data['viewed'] = '0';
			$data['keyword'] = '';
			$data['status'] = '0';

			$data['parks_attribute'] = $this->getProductAttributes($parks_id);
			$data['parks_description'] = $this->getProductDescriptions($parks_id);
			$data['parks_discount'] = $this->getProductDiscounts($parks_id);
			$data['parks_filter'] = $this->getProductFilters($parks_id);
			$data['parks_image'] = $this->getProductImages($parks_id);
			$data['parks_option'] = $this->getProductOptions($parks_id);
			$data['parks_related'] = $this->getProductRelated($parks_id);
			$data['parks_reward'] = $this->getProductRewards($parks_id);
			$data['parks_special'] = $this->getProductSpecials($parks_id);
			$data['parks_category'] = $this->getProductCategories($parks_id);
			$data['parks_download'] = $this->getProductDownloads($parks_id);
			$data['parks_layout'] = $this->getProductLayouts($parks_id);
			$data['parks_store'] = $this->getProductStores($parks_id);
			$data['parks_recurrings'] = $this->getRecurrings($parks_id);

			$this->addProduct($data);
		}
	}

	public function deleteProduct($parks_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$parks_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$parks_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$parks_id . "'");

		$this->cache->delete('parks');
	}

	public function getProduct($parks_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$parks_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$parks_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

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
         WHERE p.product_tp ='PK' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
		/*$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id) WHERE p.product_tp ='PK' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";*/
        //echo "<pre>";print_r($data);exit;
        $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)  WHERE p.product_tp ='PK' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        
        
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

	public function getProductDescriptions($parks_id) {
		$parks_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($query->rows as $result) {
			$parks_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			);
		}

		return $parks_description_data;
	}

	public function getProductCategories($parks_id) {
		$parks_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($query->rows as $result) {
			$parks_category_data[] = $result['category_id'];
		}

		return $parks_category_data;
	}

	public function getProductFilters($parks_id) {
		$parks_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($query->rows as $result) {
			$parks_filter_data[] = $result['filter_id'];
		}

		return $parks_filter_data;
	}

	public function getProductAttributes($parks_id) {
		$parks_attribute_data = array();

		$parks_attribute_query = $this->db->query("SELECT attribute_id FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$parks_id . "' GROUP BY attribute_id");

		foreach ($parks_attribute_query->rows as $parks_attribute) {
			$parks_attribute_description_data = array();

			$parks_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$parks_id . "' AND attribute_id = '" . (int)$parks_attribute['attribute_id'] . "'");

			foreach ($parks_attribute_description_query->rows as $parks_attribute_description) {
				$parks_attribute_description_data[$parks_attribute_description['language_id']] = array('text' => $parks_attribute_description['text']);
			}

			$parks_attribute_data[] = array(
				'attribute_id'                  => $parks_attribute['attribute_id'],
				'parks_attribute_description' => $parks_attribute_description_data
			);
		}

		return $parks_attribute_data;
	}
public function getProductOptionsAdd() {
		$parks_option_data = array();

//		$parks_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $parks_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='C2C' ");
		//echo "<pre>";print_r($parks_option_query);exit;
        foreach ($parks_option_query->rows as $parks_option) {
			$parks_option_value_data = array();

			//$parks_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$parks_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $parks_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$parks_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($parks_option_value_query);exit;
			foreach ($parks_option_value_query->rows as $parks_option_value) {
				
                $parks_option_value_data[] = array(
					/*'parks_option_value_id' => $parks_option_value['product_option_value_id'],*/
                    'parks_option_value_id' => '',
					'option_value_id'         => $parks_option_value['option_value_id'],
					/*'quantity'                => $parks_option_value['quantity'],
					'subtract'                => $parks_option_value['subtract'],
					'price'                   => $parks_option_value['price'],
					'price_prefix'            => $parks_option_value['price_prefix'],
					'points'                  => $parks_option_value['points'],
					'points_prefix'           => $parks_option_value['points_prefix'],
					'weight'                  => $parks_option_value['weight'],
					'weight_prefix'           => $parks_option_value['weight_prefix']*/
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

			$parks_option_data[] = array(
				/*'parks_option_id'    => $parks_option['product_option_id'],
				'product_option_value' => $parks_option_value_data,
				'option_id'            => $parks_option['option_id'],
				'name'                 => $parks_option['name'],
				'type'                 => $parks_option['type'],
				'value'                => $parks_option['value'],
				'required'             => $parks_option['required']*/
                'parks_option_id'    => '',
				'parks_option_value' => $parks_option_value_data,
				'option_id'            => $parks_option['option_id'],
				'name'                 => $parks_option['name'],
				'type'                 => $parks_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $parks_option_data;
	}




	public function getProductOptions($parks_id) {
		$parks_option_data = array();

		$parks_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$parks_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($parks_option_query->rows as $parks_option) {
			$parks_option_value_data = array();

			$parks_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$parks_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

			foreach ($parks_option_value_query->rows as $parks_option_value) {
				$parks_option_value_data[] = array(
					'parks_option_value_id' => $parks_option_value['product_option_value_id'],
					'option_value_id'         => $parks_option_value['option_value_id'],
					'quantity'                => $parks_option_value['quantity'],
					'subtract'                => $parks_option_value['subtract'],
					'child_price'             => $parks_option_value['child_price'],
                    'price'                   => $parks_option_value['price'],
					'price_prefix'            => $parks_option_value['price_prefix'],
					'points'                  => $parks_option_value['points'],
					'points_prefix'           => $parks_option_value['points_prefix'],
					'weight'                  => $parks_option_value['weight'],
					'weight_prefix'           => $parks_option_value['weight_prefix']
				);
			}

			$parks_option_data[] = array(
				'parks_option_id'    => $parks_option['product_option_id'],
				'parks_option_value' => $parks_option_value_data,
				'option_id'            => $parks_option['option_id'],
				'name'                 => $parks_option['name'],
				'type'                 => $parks_option['type'],
				'value'                => $parks_option['value'],
				'required'             => $parks_option['required']
			);
		}

		return $parks_option_data;
	}

	public function getProductOptionValue($parks_id, $parks_option_value_id) {
		$query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$parks_id . "' AND pov.product_option_value_id = '" . (int)$parks_option_value_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProductImages($parks_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$parks_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductDiscounts($parks_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$parks_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}

	public function getProductSpecials($parks_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$parks_id . "' ORDER BY priority, price");
       
		return $query->rows;
	}

	public function getProductRewards($parks_id) {
		$parks_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($query->rows as $result) {
			$parks_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $parks_reward_data;
	}

	public function getProductDownloads($parks_id) {
		$parks_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($query->rows as $result) {
			$parks_download_data[] = $result['download_id'];
		}

		return $parks_download_data;
	}

	public function getProductStores($parks_id) {
		$parks_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($query->rows as $result) {
			$parks_store_data[] = $result['store_id'];
		}

		return $parks_store_data;
	}

	public function getProductLayouts($parks_id) {
		$parks_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($query->rows as $result) {
			$parks_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $parks_layout_data;
	}

	public function getProductRelated($parks_id) {
		$parks_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$parks_id . "'");

		foreach ($query->rows as $result) {
			$parks_related_data[] = $result['related_id'];
		}

		return $parks_related_data;
	}

	public function getRecurrings($parks_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = '" . (int)$parks_id . "'");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
/* cutomize for filter addtionaly add by category
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";
*/
$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.product_tp ='PK'";
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
    public function update_home_display($data){
        $this->db->query("UPDATE " . DB_PREFIX . "product_description SET home_display = '" . $data['value'] . "'  WHERE product_id = '" . $data['id'] . "'");
        //print_r($this->db->last_query());exit;
    }
    
    public function update_show_large($data){
        $this->db->query("UPDATE " . DB_PREFIX . "product_description SET show_large = 'N'");
        $this->db->query("UPDATE " . DB_PREFIX . "product_description SET show_large = '" . $data['value'] . "'  WHERE product_id = '" . $data['id'] . "'");
    }   
}
