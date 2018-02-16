<?php
class ModelCatalogVisa extends Model {
	public function addProduct($data) {
		//echo "<pre>";print_r($data);exit;
        
        $this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW(), product_tp ='VS'");

		$visa_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$visa_id . "'");
		}

		foreach ($data['visa_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$visa_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['visa_store'])) {
			foreach ($data['visa_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$visa_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['visa_attribute'])) {
			foreach ($data['visa_attribute'] as $visa_attribute) {
				if ($visa_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$visa_id . "' AND attribute_id = '" . (int)$visa_attribute['attribute_id'] . "'");

					foreach ($visa_attribute['visa_attribute_description'] as $language_id => $visa_attribute_description) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$visa_id . "' AND attribute_id = '" . (int)$visa_attribute['attribute_id'] . "' AND language_id = '" . (int)$language_id . "'");

						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$visa_id . "', attribute_id = '" . (int)$visa_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($visa_attribute_description['text']) . "'");
					}
				}
			}
		}

		if (isset($data['visa_option'])) {
			foreach ($data['visa_option'] as $visa_option) {
				if ($visa_option['type'] == 'select' || $visa_option['type'] == 'radio' || $visa_option['type'] == 'checkbox' || $visa_option['type'] == 'image') {
					if (isset($visa_option['visa_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$visa_id . "', option_id = '" . (int)$visa_option['option_id'] . "', required = '" . (int)$visa_option['required'] . "'");

						$visa_option_id = $this->db->getLastId();

						foreach ($visa_option['visa_option_value'] as $visa_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$visa_option_id . "', product_id = '" . (int)$visa_id . "', option_id = '" . (int)$visa_option['option_id'] . "', option_value_id = '" . (int)$visa_option_value['option_value_id'] . "', quantity = '" . (int)$visa_option_value['quantity'] . "', subtract = '" . (int)$visa_option_value['subtract'] . "', price = '" . (float)$visa_option_value['price'] . "' , child_price = '" . (float)$visa_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($visa_option_value['price_prefix']) . "', points = '" . (int)$visa_option_value['points'] . "', points_prefix = '" . $this->db->escape($visa_option_value['points_prefix']) . "', weight = '" . (float)$visa_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($visa_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$visa_id . "', option_id = '" . (int)$visa_option['option_id'] . "', value = '" . $this->db->escape($visa_option['value']) . "', required = '" . (int)$visa_option['required'] . "'");
				}
			}
		}

		if (isset($data['visa_discount'])) {
			foreach ($data['visa_discount'] as $visa_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$visa_id . "', customer_group_id = '" . (int)$visa_discount['customer_group_id'] . "', quantity = '" . (int)$visa_discount['quantity'] . "', priority = '" . (int)$visa_discount['priority'] . "', price = '" . (float)$visa_discount['price'] . "', date_start = '" . $this->db->escape($visa_discount['date_start']) . "', date_end = '" . $this->db->escape($visa_discount['date_end']) . "'");
			}
		}

		if (isset($data['visa_special'])) {
			foreach ($data['visa_special'] as $visa_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$visa_id . "', customer_group_id = '" . (int)$visa_special['customer_group_id'] . "', priority = '" . (int)$visa_special['priority'] . "', price = '" . (float)$visa_special['price'] . "', date_start = '" . $this->db->escape($visa_special['date_start']) . "', date_end = '" . $this->db->escape($visa_special['date_end']) . "'");
			}
		}

		if (isset($data['visa_images'])) {
			foreach ($data['visa_images'] as $visa_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$visa_id . "', image = '" . $this->db->escape($visa_image['image']) . "', sort_order = '" . (int)$visa_image['sort_order'] . "'");
			}
		}

		if (isset($data['visa_download'])) {
			foreach ($data['visa_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$visa_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		if (isset($data['visa_category'])) {
			foreach ($data['visa_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$visa_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['visa_filter'])) {
			foreach ($data['visa_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$visa_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		if (isset($data['visa_related'])) {
			foreach ($data['visa_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$visa_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$visa_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$visa_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$visa_id . "'");
			}
		}

		if (isset($data['visa_reward'])) {
			foreach ($data['visa_reward'] as $customer_group_id => $visa_reward) {
				if ((int)$visa_reward['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$visa_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$visa_reward['points'] . "'");
				}
			}
		}

		if (isset($data['visa_layout'])) {
			foreach ($data['visa_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$visa_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$visa_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		if (isset($data['visa_recurring'])) {
			foreach ($data['visa_recurring'] as $recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$visa_id . ", customer_group_id = " . (int)$recurring['customer_group_id'] . ", `recurring_id` = " . (int)$recurring['recurring_id']);
			}
		}

		$this->cache->delete('visa');

		return $visa_id;
	}

	public function editProduct($visa_id, $data) {
		  //echo "<pre>";print_r($data);exit;
        $this->db->query("UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$visa_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($data['visa_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$visa_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_store'])) {
			foreach ($data['visa_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$visa_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$visa_id . "'");

		if (!empty($data['visa_attribute'])) {
			foreach ($data['visa_attribute'] as $visa_attribute) {
				if ($visa_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$visa_id . "' AND attribute_id = '" . (int)$visa_attribute['attribute_id'] . "'");

					foreach ($visa_attribute['visa_attribute_description'] as $language_id => $visa_attribute_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$visa_id . "', attribute_id = '" . (int)$visa_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($visa_attribute_description['text']) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_option'])) {
			foreach ($data['visa_option'] as $visa_option) {
				if ($visa_option['type'] == 'select' || $visa_option['type'] == 'radio' || $visa_option['type'] == 'checkbox' || $visa_option['type'] == 'image') {
					if (isset($visa_option['visa_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$visa_option['visa_option_id'] . "', product_id = '" . (int)$visa_id . "', option_id = '" . (int)$visa_option['option_id'] . "', required = '" . (int)$visa_option['required'] . "'");

						$visa_option_id = $this->db->getLastId();

						foreach ($visa_option['visa_option_value'] as $visa_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_value_id = '" . (int)$visa_option_value['visa_option_value_id'] . "', product_option_id = '" . (int)$visa_option_id . "', product_id = '" . (int)$visa_id . "', option_id = '" . (int)$visa_option['option_id'] . "', option_value_id = '" . (int)$visa_option_value['option_value_id'] . "', quantity = '" . (int)$visa_option_value['quantity'] . "', subtract = '" . (int)$visa_option_value['subtract'] . "', price = '" . (float)$visa_option_value['price'] . "',  child_price = '" . (float)$visa_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($visa_option_value['price_prefix']) . "', points = '" . (int)$visa_option_value['points'] . "', points_prefix = '" . $this->db->escape($visa_option_value['points_prefix']) . "', weight = '" . (float)$visa_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($visa_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$visa_option['visa_option_id'] . "', product_id = '" . (int)$visa_id . "', option_id = '" . (int)$visa_option['option_id'] . "', value = '" . $this->db->escape($visa_option['value']) . "', required = '" . (int)$visa_option['required'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_discount'])) {
			foreach ($data['visa_discount'] as $visa_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$visa_id . "', customer_group_id = '" . (int)$visa_discount['customer_group_id'] . "', quantity = '" . (int)$visa_discount['quantity'] . "', priority = '" . (int)$visa_discount['priority'] . "', price = '" . (float)$visa_discount['price'] . "', date_start = '" . $this->db->escape($visa_discount['date_start']) . "', date_end = '" . $this->db->escape($visa_discount['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_special'])) {
			foreach ($data['visa_special'] as $visa_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$visa_id . "', customer_group_id = '" . (int)$visa_special['customer_group_id'] . "', priority = '" . (int)$visa_special['priority'] . "', price = '" . (float)$visa_special['price'] . "', date_start = '" . $this->db->escape($visa_special['date_start']) . "', date_end = '" . $this->db->escape($visa_special['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_images'])) {
			foreach ($data['visa_images'] as $visa_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$visa_id . "', image = '" . $this->db->escape($visa_image['image']) . "', sort_order = '" . (int)$visa_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_download'])) {
			foreach ($data['visa_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$visa_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_category'])) {
			foreach ($data['visa_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$visa_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_filter'])) {
			foreach ($data['visa_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$visa_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_related'])) {
			foreach ($data['visa_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$visa_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$visa_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$visa_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$visa_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_reward'])) {
			foreach ($data['visa_reward'] as $customer_group_id => $value) {
				if ((int)$value['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$visa_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$visa_id . "'");

		if (isset($data['visa_layout'])) {
			foreach ($data['visa_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$visa_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$visa_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$visa_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = " . (int)$visa_id);

		if (isset($data['visa_recurring'])) {
			foreach ($data['visa_recurring'] as $visa_recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$visa_id . ", customer_group_id = " . (int)$visa_recurring['customer_group_id'] . ", `recurring_id` = " . (int)$visa_recurring['recurring_id']);
			}
		}

		$this->cache->delete('visa');
	}

	public function copyProduct($visa_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$visa_id . "'");

		if ($query->num_rows) {
			$data = $query->row;

			$data['sku'] = '';
			$data['upc'] = '';
			$data['viewed'] = '0';
			$data['keyword'] = '';
			$data['status'] = '0';

			$data['visa_attribute'] = $this->getProductAttributes($visa_id);
			$data['visa_description'] = $this->getProductDescriptions($visa_id);
			$data['visa_discount'] = $this->getProductDiscounts($visa_id);
			$data['visa_filter'] = $this->getProductFilters($visa_id);
			$data['visa_image'] = $this->getProductImages($visa_id);
			$data['visa_option'] = $this->getProductOptions($visa_id);
			$data['visa_related'] = $this->getProductRelated($visa_id);
			$data['visa_reward'] = $this->getProductRewards($visa_id);
			$data['visa_special'] = $this->getProductSpecials($visa_id);
			$data['visa_category'] = $this->getProductCategories($visa_id);
			$data['visa_download'] = $this->getProductDownloads($visa_id);
			$data['visa_layout'] = $this->getProductLayouts($visa_id);
			$data['visa_store'] = $this->getProductStores($visa_id);
			$data['visa_recurrings'] = $this->getRecurrings($visa_id);

			$this->addProduct($data);
		}
	}

	public function deleteProduct($visa_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$visa_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$visa_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$visa_id . "'");

		$this->cache->delete('visa');
	}

	public function getProduct($visa_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$visa_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$visa_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

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
         WHERE p.product_tp ='VS' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
        $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)  WHERE p.product_tp ='VS' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        
        
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

	public function getProductDescriptions($visa_id) {
		$visa_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($query->rows as $result) {
			$visa_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			);
		}

		return $visa_description_data;
	}

	public function getProductCategories($visa_id) {
		$visa_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($query->rows as $result) {
			$visa_category_data[] = $result['category_id'];
		}

		return $visa_category_data;
	}

	public function getProductFilters($visa_id) {
		$visa_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($query->rows as $result) {
			$visa_filter_data[] = $result['filter_id'];
		}

		return $visa_filter_data;
	}

	public function getProductAttributes($visa_id) {
		$visa_attribute_data = array();

		$visa_attribute_query = $this->db->query("SELECT attribute_id FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$visa_id . "' GROUP BY attribute_id");

		foreach ($visa_attribute_query->rows as $visa_attribute) {
			$visa_attribute_description_data = array();

			$visa_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$visa_id . "' AND attribute_id = '" . (int)$visa_attribute['attribute_id'] . "'");

			foreach ($visa_attribute_description_query->rows as $visa_attribute_description) {
				$visa_attribute_description_data[$visa_attribute_description['language_id']] = array('text' => $visa_attribute_description['text']);
			}

			$visa_attribute_data[] = array(
				'attribute_id'                  => $visa_attribute['attribute_id'],
				'visa_attribute_description' => $visa_attribute_description_data
			);
		}

		return $visa_attribute_data;
	}
public function getProductOptionsAdd() {
		$visa_option_data = array();

//		$visa_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $visa_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='VS' ");
		//echo "<pre>";print_r($visa_option_query);exit;
        foreach ($visa_option_query->rows as $visa_option) {
			$visa_option_value_data = array();

			//$visa_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$visa_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $visa_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$visa_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($visa_option_value_query);exit;
			foreach ($visa_option_value_query->rows as $visa_option_value) {
				
                $visa_option_value_data[] = array(
					/*'visa_option_value_id' => $visa_option_value['product_option_value_id'],*/
                    'visa_option_value_id' => '',
					'option_value_id'         => $visa_option_value['option_value_id'],
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

			$visa_option_data[] = array(
				/*'visa_option_id'    => $visa_option['product_option_id'],
				'product_option_value' => $visa_option_value_data,
				'option_id'            => $visa_option['option_id'],
				'name'                 => $visa_option['name'],
				'type'                 => $visa_option['type'],
				'value'                => $visa_option['value'],
				'required'             => $visa_option['required']*/
                'visa_option_id'    => '',
				'visa_option_value' => $visa_option_value_data,
				'option_id'            => $visa_option['option_id'],
				'name'                 => $visa_option['name'],
				'type'                 => $visa_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $visa_option_data;
	}




	public function getProductOptions($visa_id) {
		$visa_option_data = array();

		$visa_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$visa_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($visa_option_query->rows as $visa_option) {
			$visa_option_value_data = array();

			$visa_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$visa_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

			foreach ($visa_option_value_query->rows as $visa_option_value) {
				$visa_option_value_data[] = array(
					'visa_option_value_id' => $visa_option_value['product_option_value_id'],
					'option_value_id'         => $visa_option_value['option_value_id'],
					'quantity'                => $visa_option_value['quantity'],
					'subtract'                => $visa_option_value['subtract'],
					'child_price'             => $visa_option_value['child_price'],
                    'price'                   => $visa_option_value['price'],
					'price_prefix'            => $visa_option_value['price_prefix'],
					'points'                  => $visa_option_value['points'],
					'points_prefix'           => $visa_option_value['points_prefix'],
					'weight'                  => $visa_option_value['weight'],
					'weight_prefix'           => $visa_option_value['weight_prefix']
				);
			}

			$visa_option_data[] = array(
				'visa_option_id'    => $visa_option['product_option_id'],
				'visa_option_value' => $visa_option_value_data,
				'option_id'            => $visa_option['option_id'],
				'name'                 => $visa_option['name'],
				'type'                 => $visa_option['type'],
				'value'                => $visa_option['value'],
				'required'             => $visa_option['required']
			);
		}

		return $visa_option_data;
	}

	public function getProductOptionValue($visa_id, $visa_option_value_id) {
		$query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$visa_id . "' AND pov.product_option_value_id = '" . (int)$visa_option_value_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProductImages($visa_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$visa_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductDiscounts($visa_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$visa_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}

	public function getProductSpecials($visa_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$visa_id . "' ORDER BY priority, price");
       
		return $query->rows;
	}

	public function getProductRewards($visa_id) {
		$visa_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($query->rows as $result) {
			$visa_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $visa_reward_data;
	}

	public function getProductDownloads($visa_id) {
		$visa_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($query->rows as $result) {
			$visa_download_data[] = $result['download_id'];
		}

		return $visa_download_data;
	}

	public function getProductStores($visa_id) {
		$visa_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($query->rows as $result) {
			$visa_store_data[] = $result['store_id'];
		}

		return $visa_store_data;
	}

	public function getProductLayouts($visa_id) {
		$visa_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($query->rows as $result) {
			$visa_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $visa_layout_data;
	}

	public function getProductRelated($visa_id) {
		$visa_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$visa_id . "'");

		foreach ($query->rows as $result) {
			$visa_related_data[] = $result['related_id'];
		}

		return $visa_related_data;
	}

	public function getRecurrings($visa_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = '" . (int)$visa_id . "'");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
/* cutomize for filter addtionaly add by category
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";
*/
$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.product_tp ='VS'";
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
