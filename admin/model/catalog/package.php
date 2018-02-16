<?php
class ModelCatalogPackage extends Model {
	public function addProduct($data) {
	
    //$data['package_category'][0]
        if(isset($data['video']))
        {
            $videourl = $data['video'];
        }
        else
        {
            $videourl ='';
        }
        $this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', top_up='".(int)$data['top_up']."', family = '" . (int)$data['family'] . "', video_url = '" . $videourl . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW(), product_tp ='UHP'");
        $package_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$package_id . "'");
		}

		foreach ($data['package_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$package_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['package_store'])) {
			foreach ($data['package_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$package_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['package_attribute'])) {
			foreach ($data['package_attribute'] as $package_attribute) {
				if ($package_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$package_id . "' AND attribute_id = '" . (int)$package_attribute['attribute_id'] . "'");

					foreach ($package_attribute['package_attribute_description'] as $language_id => $package_attribute_description) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$package_id . "' AND attribute_id = '" . (int)$package_attribute['attribute_id'] . "' AND language_id = '" . (int)$language_id . "'");

						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$package_id . "', attribute_id = '" . (int)$package_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($package_attribute_description['text']) . "'");
					}
				}
			}
		}	

		if (isset($data['package_option'])) {
			foreach ($data['package_option'] as $package_option) {
				if ($package_option['type'] == 'select' || $package_option['type'] == 'radio' || $package_option['type'] == 'checkbox' || $package_option['type'] == 'image') {
					if (isset($package_option['product_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$package_id . "', option_id = '" . (int)$package_option['option_id'] . "', required = '" . (int)$package_option['required'] . "'");

						$product_option_id = $this->db->getLastId();

						foreach ($package_option['product_option_value'] as $product_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$product_option_id . "', product_id = '" . (int)$package_id . "', option_id = '" . (int)$package_option['option_id'] . "', option_value_id = '" . (int)$product_option_value['option_value_id'] . "', quantity = '" . (int)$product_option_value['quantity'] . "', subtract = '" . (int)$product_option_value['subtract'] . "', price = '" . (float)$product_option_value['price'] . "', price_prefix = '" . $this->db->escape($product_option_value['price_prefix']) . "', points = '" . (int)$product_option_value['points'] . "', points_prefix = '" . $this->db->escape($product_option_value['points_prefix']) . "', weight = '" . (float)$product_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($product_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$package_id . "', option_id = '" . (int)$package_option['option_id'] . "', value = '" . $this->db->escape($package_option['value']) . "', required = '" . (int)$package_option['required'] . "'");
				}
			}
		}
     if(isset($data['top_up']))   
      { 
           if($data['top_up']==1 && $data['package_category'][0]!='82' ) // normal package
            {$this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET top_up_child = '" . (float)$child_prce . "',top_up_adults = '" . (float)$adult_price . "' WHERE product_id = '" . (int)$package_id . "' and option_id='16' ");}
           else if($data['top_up']==1 && $data['package_category'][0]=='82' ) // water sports
           {
           
            //option_value_id 66 = 15 min
            //option_value_id 67 = 20 min
            //option_value_id 68 = 30 min
            //option_value_id 69 = 60 min
            
            foreach($adult_array_prce as $key => $value)   
              {
                if($key==66) // meaning all the 15 min enter for private will be updated
                  {
                    $option_value_idIn=array('74','75','76','77');
                  }
                 if($key==67) // meaning all the 20 min enter for private will be updated
                  {
                    $option_value_idIn=array('78','79','80','81');
                  }
                 if($key==68) // meaning all the 20 min enter for private will be updated
                  {
                    $option_value_idIn=array('82','83','84','85');
                  }
                  if($key==69) // meaning all the 20 min enter for private will be updated
                  {
                    $option_value_idIn=array('86','87','88','89');
                  }
                   
               foreach($option_value_idIn as $key1 => $vlaue)      
                {
                     $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET top_up_adults = '" . (float)$value . "' WHERE product_id = '" . (int)$package_id . "' and option_id='25' and option_value_id='".$vlaue."' ");
                }  
              } 
              
              
           }    
        } //update Private price if top up value is ther
		
        
        if (isset($data['package_discount'])) {
			foreach ($data['package_discount'] as $package_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$package_id . "', customer_group_id = '" . (int)$package_discount['customer_group_id'] . "', quantity = '" . (int)$package_discount['quantity'] . "', priority = '" . (int)$package_discount['priority'] . "', price = '" . (float)$package_discount['price'] . "', date_start = '" . $this->db->escape($package_discount['date_start']) . "', date_end = '" . $this->db->escape($package_discount['date_end']) . "'");
			}
		}

		if (isset($data['package_special'])) {
			foreach ($data['package_special'] as $package_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$package_id . "', customer_group_id = '" . (int)$package_special['customer_group_id'] . "', priority = '" . (int)$package_special['priority'] . "', price = '" . (float)$package_special['price'] . "', date_start = '" . $this->db->escape($package_special['date_start']) . "', date_end = '" . $this->db->escape($package_special['date_end']) . "'");
			}
		}

		if (isset($data['package_images'])) {
			foreach ($data['package_images'] as $package_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$package_id . "', image = '" . $this->db->escape($package_image['image']) . "', sort_order = '" . (int)$package_image['sort_order'] . "'");
			}
		}

		if (isset($data['package_download'])) {
			foreach ($data['package_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$package_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		if (isset($data['package_category'])) {
			foreach ($data['package_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$package_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['package_filter'])) {
			foreach ($data['package_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$package_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		if (isset($data['package_related'])) {
			foreach ($data['package_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$package_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$package_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$package_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$package_id . "'");
			}
		}

		if (isset($data['package_reward'])) {
			foreach ($data['package_reward'] as $customer_group_id => $package_reward) {
				if ((int)$package_reward['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$package_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$package_reward['points'] . "'");
				}
			}
		}

		if (isset($data['package_layout'])) {
			foreach ($data['package_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$package_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$package_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		if (isset($data['package_recurring'])) {
			foreach ($data['package_recurring'] as $recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$package_id . ", customer_group_id = " . (int)$recurring['customer_group_id'] . ", `recurring_id` = " . (int)$recurring['recurring_id']);
			}
		}

		$this->cache->delete('package');

		return $package_id;
	}

	public function editProduct($package_id, $data) {
		  //echo "<pre>";print_r($data);
          //echo "UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', family = '" . (int)$data['family'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE product_id = '" . (int)$package_id . "'";
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
        
        $this->db->query("UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', video_url = '" . $videourl . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', top_up = '" . (int)$data['top_up'] . "', family = '" . (int)$data['family'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$package_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$package_id . "'");

		foreach ($data['package_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$package_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_store'])) {
			foreach ($data['package_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$package_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$package_id . "'");

		if (!empty($data['package_attribute'])) {
			foreach ($data['package_attribute'] as $package_attribute) {
				if ($package_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$package_id . "' AND attribute_id = '" . (int)$package_attribute['attribute_id'] . "'");

					foreach ($package_attribute['package_attribute_description'] as $language_id => $package_attribute_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$package_id . "', attribute_id = '" . (int)$package_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($package_attribute_description['text']) . "'");
					}
				}
			}
		}
//oc_product_option_value
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$package_id . "'");
        
		if (isset($data['package_option'])) {
			foreach ($data['package_option'] as $package_option) {
				if ($package_option['type'] == 'select' || $package_option['type'] == 'radio' || $package_option['type'] == 'checkbox' || $package_option['type'] == 'image') {
					if (isset($package_option['product_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$package_id . "', option_id = '" . (int)$package_option['option_id'] . "', required = '" . (int)$package_option['required'] . "'");

						$product_option_id = $this->db->getLastId();

						foreach ($package_option['product_option_value'] as $product_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$product_option_id . "', product_id = '" . (int)$package_id . "', option_id = '" . (int)$package_option['option_id'] . "', option_value_id = '" . (int)$product_option_value['option_value_id'] . "', quantity = '" . (int)$product_option_value['quantity'] . "', subtract = '" . (int)$product_option_value['subtract'] . "', price = '" . (float)$product_option_value['price'] . "', price_prefix = '" . $this->db->escape($product_option_value['price_prefix']) . "', points = '" . (int)$product_option_value['points'] . "', points_prefix = '" . $this->db->escape($product_option_value['points_prefix']) . "', weight = '" . (float)$product_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($product_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$package_id . "', option_id = '" . (int)$package_option['option_id'] . "', value = '" . $this->db->escape($package_option['value']) . "', required = '" . (int)$package_option['required'] . "'");
				}
			}
		}
     if($data['top_up']==1 && $data['package_category'][0]!='82') //only tour    
      { $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET top_up_child = '" . (float)$child_prce . "',top_up_adults = '" . (float)$adult_price . "' WHERE product_id = '" . (int)$package_id . "' and option_id='16' "); } //update Private price if top up value is ther
	 else if($data['top_up']==1 && $data['package_category'][0]=='82' ) // water sports
           {
            //338*4+300
            //option_value_id 66 = 15 min
            //option_value_id 67 = 20 min
            //option_value_id 68 = 30 min
            //option_value_id 69 = 60 min
            
            foreach($adult_array_prce as $key => $value)   
              {
                if($key==66) // meaning all the 15 min enter for private will be updated
                  {
                    $option_value_idIn=array('74','75','76','77');
                  }
                 if($key==67) // meaning all the 20 min enter for private will be updated
                  {
                    $option_value_idIn=array('78','79','80','81');
                  }
                 if($key==68) // meaning all the 20 min enter for private will be updated
                  {
                    $option_value_idIn=array('82','83','84','85');
                  }
                  if($key==69) // meaning all the 20 min enter for private will be updated
                  {
                    $option_value_idIn=array('86','87','88','89');
                  }
                   
               foreach($option_value_idIn as $key1 => $vlaue)      
                {
                     $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET top_up_adults = '" . (float)$value . "' WHERE product_id = '" . (int)$package_id . "' and option_id='25' and option_value_id='".$vlaue."' ");
                }  
              } 
              
              
           }  	
        
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_discount'])) {
			foreach ($data['package_discount'] as $package_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$package_id . "', customer_group_id = '" . (int)$package_discount['customer_group_id'] . "', quantity = '" . (int)$package_discount['quantity'] . "', priority = '" . (int)$package_discount['priority'] . "', price = '" . (float)$package_discount['price'] . "', date_start = '" . $this->db->escape($package_discount['date_start']) . "', date_end = '" . $this->db->escape($package_discount['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_special'])) {
			foreach ($data['package_special'] as $package_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$package_id . "', customer_group_id = '" . (int)$package_special['customer_group_id'] . "', priority = '" . (int)$package_special['priority'] . "', price = '" . (float)$package_special['price'] . "', date_start = '" . $this->db->escape($package_special['date_start']) . "', date_end = '" . $this->db->escape($package_special['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_images'])) {
			foreach ($data['package_images'] as $package_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$package_id . "', image = '" . $this->db->escape($package_image['image']) . "', sort_order = '" . (int)$package_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_download'])) {
			foreach ($data['package_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$package_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_category'])) {
			foreach ($data['package_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$package_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_filter'])) {
			foreach ($data['package_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$package_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$package_id . "'");

		if (isset($data['package_related'])) {
			foreach ($data['package_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$package_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$package_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$package_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$package_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_reward'])) {
			foreach ($data['package_reward'] as $customer_group_id => $value) {
				if ((int)$value['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$package_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$package_id . "'");

		if (isset($data['package_layout'])) {
			foreach ($data['package_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$package_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$package_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$package_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = " . (int)$package_id);

		if (isset($data['package_recurring'])) {
			foreach ($data['package_recurring'] as $package_recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$package_id . ", customer_group_id = " . (int)$package_recurring['customer_group_id'] . ", `recurring_id` = " . (int)$package_recurring['recurring_id']);
			}
		}

		$this->cache->delete('package');
	}

	public function copyProduct($package_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$package_id . "'");

		if ($query->num_rows) {
			$data = $query->row;

			$data['sku'] = '';
			$data['upc'] = '';
			$data['viewed'] = '0';
			$data['keyword'] = '';
			$data['status'] = '0';
            $data['family'] = '0';

			$data['package_attribute'] = $this->getProductAttributes($package_id);
			$data['package_description'] = $this->getProductDescriptions($package_id);
			$data['package_discount'] = $this->getProductDiscounts($package_id);
			$data['package_filter'] = $this->getProductFilters($package_id);
			$data['package_image'] = $this->getProductImages($package_id);
			$data['package_option'] = $this->getProductOptions($package_id);
			$data['package_related'] = $this->getProductRelated($package_id);
			$data['package_reward'] = $this->getProductRewards($package_id);
			$data['package_special'] = $this->getProductSpecials($package_id);
			$data['package_category'] = $this->getProductCategories($package_id);
			$data['package_download'] = $this->getProductDownloads($package_id);
			$data['package_layout'] = $this->getProductLayouts($package_id);
			$data['package_store'] = $this->getProductStores($package_id);
			$data['package_recurrings'] = $this->getRecurrings($package_id);

			$this->addProduct($data);
		}
	}

	public function deleteProduct($package_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$package_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$package_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$package_id . "'");

		$this->cache->delete('package');
	}

	public function getProduct($package_id) {
		
        $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$package_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$package_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}
    /*
    public function getProductsByCat($data = array())
    {
            $sql= 
        
    }
    */
    public function getProducts($data = array()) {
		
      $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (!empty($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && $data['filter_quantity'] !== '') {
			$sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
		}

		if (isset($data['filter_status']) && $data['filter_status'] !== '') {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}
		if (isset($data['filter_type']) && $data['filter_type'] !== '') {
			$sql .= " AND p.product_tp = '" . $data['filter_type'] . "'";
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
		/*$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id) WHERE p.product_tp ='UHP' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";*/
        //echo "<pre>";print_r($data);exit;
        $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)  WHERE p.product_tp ='UHP' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        
        
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

		if (isset($data['filter_type']) && !is_null($data['filter_type'])) {
			$sql .= " AND p.product_tp = '" . (int)$data['filter_type'] . "'";
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

	public function getProductDescriptions($package_id) {
		$package_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$package_id . "'");

		foreach ($query->rows as $result) {
			$package_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			);
		}

		return $package_description_data;
	}

	public function getProductCategories($package_id) {
		$package_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$package_id . "'");

		foreach ($query->rows as $result) {
			$package_category_data[] = $result['category_id'];
		}

		return $package_category_data;
	}

	public function getProductFilters($package_id) {
		$package_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$package_id . "'");

		foreach ($query->rows as $result) {
			$package_filter_data[] = $result['filter_id'];
		}

		return $package_filter_data;
	}

	public function getProductAttributes($package_id) {
		$package_attribute_data = array();

		$package_attribute_query = $this->db->query("SELECT attribute_id FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$package_id . "' GROUP BY attribute_id");

		foreach ($package_attribute_query->rows as $package_attribute) {
			$package_attribute_description_data = array();

			$package_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$package_id . "' AND attribute_id = '" . (int)$package_attribute['attribute_id'] . "'");

			foreach ($package_attribute_description_query->rows as $package_attribute_description) {
				$package_attribute_description_data[$package_attribute_description['language_id']] = array('text' => $package_attribute_description['text']);
			}

			$package_attribute_data[] = array(
				'attribute_id'                  => $package_attribute['attribute_id'],
				'package_attribute_description' => $package_attribute_description_data
			);
		}

		return $package_attribute_data;
	}
public function getProductOptionsAdd() {
		$package_option_data = array();

//		$package_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $package_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='C2C' ");
		//echo "<pre>";print_r($package_option_query);exit;
        foreach ($package_option_query->rows as $package_option) {
			$package_option_value_data = array();

			//$package_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$package_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $package_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$package_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($package_option_value_query);exit;
			foreach ($package_option_value_query->rows as $package_option_value) {
				
                $package_option_value_data[] = array(
					/*'package_option_value_id' => $package_option_value['product_option_value_id'],*/
                    'package_option_value_id' => '',
					'option_value_id'         => $package_option_value['option_value_id'],
					/*'quantity'                => $package_option_value['quantity'],
					'subtract'                => $package_option_value['subtract'],
					'price'                   => $package_option_value['price'],
					'price_prefix'            => $package_option_value['price_prefix'],
					'points'                  => $package_option_value['points'],
					'points_prefix'           => $package_option_value['points_prefix'],
					'weight'                  => $package_option_value['weight'],
					'weight_prefix'           => $package_option_value['weight_prefix']*/
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

			$package_option_data[] = array(
				/*'package_option_id'    => $package_option['product_option_id'],
				'product_option_value' => $package_option_value_data,
				'option_id'            => $package_option['option_id'],
				'name'                 => $package_option['name'],
				'type'                 => $package_option['type'],
				'value'                => $package_option['value'],
				'required'             => $package_option['required']*/
                'package_option_id'    => '',
				'package_option_value' => $package_option_value_data,
				'option_id'            => $package_option['option_id'],
				'name'                 => $package_option['name'],
				'type'                 => $package_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $package_option_data;
	}

    /*TEWS*/
    public function getProductOptionsAddWSTE() {
		$package_option_data = array();

//		$package_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $package_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='TEWS' ");
		//echo "<pre>";print_r($package_option_query);exit;
        foreach ($package_option_query->rows as $package_option) {
			$package_option_value_data = array();

			//$package_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$package_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $package_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$package_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($package_option_value_query);exit;
			foreach ($package_option_value_query->rows as $package_option_value) {
				
                $package_option_value_data[] = array(
					/*'package_option_value_id' => $package_option_value['product_option_value_id'],*/
                    'package_option_value_id' => '',
					'option_value_id'         => $package_option_value['option_value_id'],
					/*'quantity'                => $package_option_value['quantity'],
					'subtract'                => $package_option_value['subtract'],
					'price'                   => $package_option_value['price'],
					'price_prefix'            => $package_option_value['price_prefix'],
					'points'                  => $package_option_value['points'],
					'points_prefix'           => $package_option_value['points_prefix'],
					'weight'                  => $package_option_value['weight'],
					'weight_prefix'           => $package_option_value['weight_prefix']*/
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

			$package_option_data[] = array(
				/*'package_option_id'    => $package_option['product_option_id'],
				'product_option_value' => $package_option_value_data,
				'option_id'            => $package_option['option_id'],
				'name'                 => $package_option['name'],
				'type'                 => $package_option['type'],
				'value'                => $package_option['value'],
				'required'             => $package_option['required']*/
                'package_option_id'    => '',
				'package_option_value' => $package_option_value_data,
				'option_id'            => $package_option['option_id'],
				'name'                 => $package_option['name'],
				'type'                 => $package_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $package_option_data;
	}
   /*desert package*/
    public function getProductOptionsAdddt() {
		$package_option_data = array();

//		$package_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $package_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='DT' ");
		//echo "<pre>";print_r($package_option_query);exit;
        foreach ($package_option_query->rows as $package_option) {
			$package_option_value_data = array();

			//$package_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$package_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $package_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$package_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($package_option_value_query);exit;
			foreach ($package_option_value_query->rows as $package_option_value) {
				
                $package_option_value_data[] = array(
					/*'package_option_value_id' => $package_option_value['product_option_value_id'],*/
                    'package_option_value_id' => '',
					'option_value_id'         => $package_option_value['option_value_id'],
					/*'quantity'                => $package_option_value['quantity'],
					'subtract'                => $package_option_value['subtract'],
					'price'                   => $package_option_value['price'],
					'price_prefix'            => $package_option_value['price_prefix'],
					'points'                  => $package_option_value['points'],
					'points_prefix'           => $package_option_value['points_prefix'],
					'weight'                  => $package_option_value['weight'],
					'weight_prefix'           => $package_option_value['weight_prefix']*/
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

			$package_option_data[] = array(
				/*'package_option_id'    => $package_option['product_option_id'],
				'product_option_value' => $package_option_value_data,
				'option_id'            => $package_option['option_id'],
				'name'                 => $package_option['name'],
				'type'                 => $package_option['type'],
				'value'                => $package_option['value'],
				'required'             => $package_option['required']*/
                'package_option_id'    => '',
				'package_option_value' => $package_option_value_data,
				'option_id'            => $package_option['option_id'],
				'name'                 => $package_option['name'],
				'type'                 => $package_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $package_option_data;
	}

	public function getProductOptions($package_id) {
		$package_option_data = array();

		$package_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$package_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($package_option_query->rows as $package_option) {
			$package_option_value_data = array();

			$package_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$package_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

			foreach ($package_option_value_query->rows as $package_option_value) {
				$package_option_value_data[] = array(
					'package_option_value_id' => $package_option_value['product_option_value_id'],
					'option_value_id'         => $package_option_value['option_value_id'],
					'quantity'                => $package_option_value['quantity'],
					'subtract'                => $package_option_value['subtract'],
					'child_price'             => $package_option_value['child_price'],
                    'price'                   => $package_option_value['price'],
					'price_prefix'            => $package_option_value['price_prefix'],
					'points'                  => $package_option_value['points'],
					'points_prefix'           => $package_option_value['points_prefix'],
					'weight'                  => $package_option_value['weight'],
					'weight_prefix'           => $package_option_value['weight_prefix']
				);
			}

			$package_option_data[] = array(
				'package_option_id'    => $package_option['product_option_id'],
				'package_option_value' => $package_option_value_data,
				'option_id'            => $package_option['option_id'],
				'name'                 => $package_option['name'],
				'type'                 => $package_option['type'],
				'value'                => $package_option['value'],
				'required'             => $package_option['required']
			);
		}

		return $package_option_data;
	}

	public function getProductOptionValue($package_id, $package_option_value_id) {
		$query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$package_id . "' AND pov.product_option_value_id = '" . (int)$package_option_value_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProductImages($package_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$package_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductDiscounts($package_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$package_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}

	public function getProductSpecials($package_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$package_id . "' ORDER BY priority, price");
       
		return $query->rows;
	}

	public function getProductRewards($package_id) {
		$package_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$package_id . "'");

		foreach ($query->rows as $result) {
			$package_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $package_reward_data;
	}

	public function getProductDownloads($package_id) {
		$package_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$package_id . "'");

		foreach ($query->rows as $result) {
			$package_download_data[] = $result['download_id'];
		}

		return $package_download_data;
	}

	public function getProductStores($package_id) {
		$package_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$package_id . "'");

		foreach ($query->rows as $result) {
			$package_store_data[] = $result['store_id'];
		}

		return $package_store_data;
	}

	public function getProductLayouts($package_id) {
		$package_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$package_id . "'");

		foreach ($query->rows as $result) {
			$package_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $package_layout_data;
	}

	public function getProductRelated($package_id) {
		$package_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$package_id . "'");

		foreach ($query->rows as $result) {
			$package_related_data[] = $result['related_id'];
		}

		return $package_related_data;
	}

	public function getRecurrings($package_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = '" . (int)$package_id . "'");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
/* cutomize for filter addtionaly add by category
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";
*/
$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";

		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && $data['filter_quantity'] !== '') {
			$sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
		}

		if (isset($data['filter_status']) && $data['filter_status'] !== '') {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}
		if (isset($data['filter_type']) && $data['filter_type'] !== '') {
			$sql .= " AND p.product_tp = '" . $data['filter_type'] . "'";
		}

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
