<?php
class ModelCatalogLimoservice extends Model {
	public function addProduct($data) {
		//echo "<pre>";print_r($data);exit;
        
        $this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW(), product_tp ='LS'");

		$limoservice_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$limoservice_id . "'");
		}

		foreach ($data['limoservice_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$limoservice_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['limoservice_store'])) {
			foreach ($data['limoservice_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$limoservice_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['limoservice_attribute'])) {
			foreach ($data['limoservice_attribute'] as $limoservice_attribute) {
				if ($limoservice_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$limoservice_id . "' AND attribute_id = '" . (int)$limoservice_attribute['attribute_id'] . "'");

					foreach ($limoservice_attribute['limoservice_attribute_description'] as $language_id => $limoservice_attribute_description) {
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$limoservice_id . "' AND attribute_id = '" . (int)$limoservice_attribute['attribute_id'] . "' AND language_id = '" . (int)$language_id . "'");

						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$limoservice_id . "', attribute_id = '" . (int)$limoservice_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($limoservice_attribute_description['text']) . "'");
					}
				}
			}
		}

		if (isset($data['limoservice_option'])) {
			foreach ($data['limoservice_option'] as $limoservice_option) {
				if ($limoservice_option['type'] == 'select' || $limoservice_option['type'] == 'radio' || $limoservice_option['type'] == 'checkbox' || $limoservice_option['type'] == 'image') {
					if (isset($limoservice_option['limoservice_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$limoservice_id . "', option_id = '" . (int)$limoservice_option['option_id'] . "', required = '" . (int)$limoservice_option['required'] . "'");

						$limoservice_option_id = $this->db->getLastId();

						foreach ($limoservice_option['limoservice_option_value'] as $limoservice_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_id = '" . (int)$limoservice_option_id . "', product_id = '" . (int)$limoservice_id . "', option_id = '" . (int)$limoservice_option['option_id'] . "', option_value_id = '" . (int)$limoservice_option_value['option_value_id'] . "', quantity = '" . (int)$limoservice_option_value['quantity'] . "', subtract = '" . (int)$limoservice_option_value['subtract'] . "', price = '" . (float)$limoservice_option_value['price'] . "' , child_price = '" . (float)$limoservice_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($limoservice_option_value['price_prefix']) . "', points = '" . (int)$limoservice_option_value['points'] . "', points_prefix = '" . $this->db->escape($limoservice_option_value['points_prefix']) . "', weight = '" . (float)$limoservice_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($limoservice_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_id = '" . (int)$limoservice_id . "', option_id = '" . (int)$limoservice_option['option_id'] . "', value = '" . $this->db->escape($limoservice_option['value']) . "', required = '" . (int)$limoservice_option['required'] . "'");
				}
			}
		}

		if (isset($data['limoservice_discount'])) {
			foreach ($data['limoservice_discount'] as $limoservice_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$limoservice_id . "', customer_group_id = '" . (int)$limoservice_discount['customer_group_id'] . "', quantity = '" . (int)$limoservice_discount['quantity'] . "', priority = '" . (int)$limoservice_discount['priority'] . "', price = '" . (float)$limoservice_discount['price'] . "', date_start = '" . $this->db->escape($limoservice_discount['date_start']) . "', date_end = '" . $this->db->escape($limoservice_discount['date_end']) . "'");
			}
		}

		if (isset($data['limoservice_special'])) {
			foreach ($data['limoservice_special'] as $limoservice_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$limoservice_id . "', customer_group_id = '" . (int)$limoservice_special['customer_group_id'] . "', priority = '" . (int)$limoservice_special['priority'] . "', price = '" . (float)$limoservice_special['price'] . "', date_start = '" . $this->db->escape($limoservice_special['date_start']) . "', date_end = '" . $this->db->escape($limoservice_special['date_end']) . "'");
			}
		}

		if (isset($data['limoservice_images'])) {
			foreach ($data['limoservice_images'] as $limoservice_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$limoservice_id . "', image = '" . $this->db->escape($limoservice_image['image']) . "', sort_order = '" . (int)$limoservice_image['sort_order'] . "'");
			}
		}

		if (isset($data['limoservice_download'])) {
			foreach ($data['limoservice_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$limoservice_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		if (isset($data['limoservice_category'])) {
			foreach ($data['limoservice_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$limoservice_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['limoservice_filter'])) {
			foreach ($data['limoservice_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$limoservice_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		if (isset($data['limoservice_related'])) {
			foreach ($data['limoservice_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$limoservice_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$limoservice_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$limoservice_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$limoservice_id . "'");
			}
		}

		if (isset($data['limoservice_reward'])) {
			foreach ($data['limoservice_reward'] as $customer_group_id => $limoservice_reward) {
				if ((int)$limoservice_reward['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$limoservice_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$limoservice_reward['points'] . "'");
				}
			}
		}

		if (isset($data['limoservice_layout'])) {
			foreach ($data['limoservice_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$limoservice_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$limoservice_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		if (isset($data['limoservice_recurring'])) {
			foreach ($data['limoservice_recurring'] as $recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$limoservice_id . ", customer_group_id = " . (int)$recurring['customer_group_id'] . ", `recurring_id` = " . (int)$recurring['recurring_id']);
			}
		}

		$this->cache->delete('limoservice');

		return $limoservice_id;
	}

	public function editProduct($limoservice_id, $data) {
		  //echo "<pre>";print_r($data);exit;
        $this->db->query("UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', ean = '" . $this->db->escape($data['ean']) . "', jan = '" . $this->db->escape($data['jan']) . "', isbn = '" . $this->db->escape($data['isbn']) . "', mpn = '" . $this->db->escape($data['mpn']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', manufacturer_id = '" . (int)$data['manufacturer_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['image']) . "' WHERE product_id = '" . (int)$limoservice_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($data['limoservice_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$limoservice_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_store'])) {
			foreach ($data['limoservice_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$limoservice_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$limoservice_id . "'");

		if (!empty($data['limoservice_attribute'])) {
			foreach ($data['limoservice_attribute'] as $limoservice_attribute) {
				if ($limoservice_attribute['attribute_id']) {
					// Removes duplicates
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$limoservice_id . "' AND attribute_id = '" . (int)$limoservice_attribute['attribute_id'] . "'");

					foreach ($limoservice_attribute['limoservice_attribute_description'] as $language_id => $limoservice_attribute_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$limoservice_id . "', attribute_id = '" . (int)$limoservice_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($limoservice_attribute_description['text']) . "'");
					}
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_option'])) {
			foreach ($data['limoservice_option'] as $limoservice_option) {
				if ($limoservice_option['type'] == 'select' || $limoservice_option['type'] == 'radio' || $limoservice_option['type'] == 'checkbox' || $limoservice_option['type'] == 'image') {
					if (isset($limoservice_option['limoservice_option_value'])) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$limoservice_option['limoservice_option_id'] . "', product_id = '" . (int)$limoservice_id . "', option_id = '" . (int)$limoservice_option['option_id'] . "', required = '" . (int)$limoservice_option['required'] . "'");

						$limoservice_option_id = $this->db->getLastId();

						foreach ($limoservice_option['limoservice_option_value'] as $limoservice_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_option_value SET product_option_value_id = '" . (int)$limoservice_option_value['limoservice_option_value_id'] . "', product_option_id = '" . (int)$limoservice_option_id . "', product_id = '" . (int)$limoservice_id . "', option_id = '" . (int)$limoservice_option['option_id'] . "', option_value_id = '" . (int)$limoservice_option_value['option_value_id'] . "', quantity = '" . (int)$limoservice_option_value['quantity'] . "', subtract = '" . (int)$limoservice_option_value['subtract'] . "', price = '" . (float)$limoservice_option_value['price'] . "',  child_price = '" . (float)$limoservice_option_value['child_price'] . "', price_prefix = '" . $this->db->escape($limoservice_option_value['price_prefix']) . "', points = '" . (int)$limoservice_option_value['points'] . "', points_prefix = '" . $this->db->escape($limoservice_option_value['points_prefix']) . "', weight = '" . (float)$limoservice_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($limoservice_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_option SET product_option_id = '" . (int)$limoservice_option['limoservice_option_id'] . "', product_id = '" . (int)$limoservice_id . "', option_id = '" . (int)$limoservice_option['option_id'] . "', value = '" . $this->db->escape($limoservice_option['value']) . "', required = '" . (int)$limoservice_option['required'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_discount'])) {
			foreach ($data['limoservice_discount'] as $limoservice_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$limoservice_id . "', customer_group_id = '" . (int)$limoservice_discount['customer_group_id'] . "', quantity = '" . (int)$limoservice_discount['quantity'] . "', priority = '" . (int)$limoservice_discount['priority'] . "', price = '" . (float)$limoservice_discount['price'] . "', date_start = '" . $this->db->escape($limoservice_discount['date_start']) . "', date_end = '" . $this->db->escape($limoservice_discount['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_special'])) {
			foreach ($data['limoservice_special'] as $limoservice_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$limoservice_id . "', customer_group_id = '" . (int)$limoservice_special['customer_group_id'] . "', priority = '" . (int)$limoservice_special['priority'] . "', price = '" . (float)$limoservice_special['price'] . "', date_start = '" . $this->db->escape($limoservice_special['date_start']) . "', date_end = '" . $this->db->escape($limoservice_special['date_end']) . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_images'])) {
			foreach ($data['limoservice_images'] as $limoservice_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$limoservice_id . "', image = '" . $this->db->escape($limoservice_image['image']) . "', sort_order = '" . (int)$limoservice_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_download'])) {
			foreach ($data['limoservice_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$limoservice_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_category'])) {
			foreach ($data['limoservice_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$limoservice_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_filter'])) {
			foreach ($data['limoservice_filter'] as $filter_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$limoservice_id . "', filter_id = '" . (int)$filter_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_related'])) {
			foreach ($data['limoservice_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$limoservice_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$limoservice_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$related_id . "' AND related_id = '" . (int)$limoservice_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = '" . (int)$related_id . "', related_id = '" . (int)$limoservice_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_reward'])) {
			foreach ($data['limoservice_reward'] as $customer_group_id => $value) {
				if ((int)$value['points'] > 0) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$limoservice_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$limoservice_id . "'");

		if (isset($data['limoservice_layout'])) {
			foreach ($data['limoservice_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$limoservice_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$limoservice_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$limoservice_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->db->query("DELETE FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = " . (int)$limoservice_id);

		if (isset($data['limoservice_recurring'])) {
			foreach ($data['limoservice_recurring'] as $limoservice_recurring) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "product_recurring` SET `product_id` = " . (int)$limoservice_id . ", customer_group_id = " . (int)$limoservice_recurring['customer_group_id'] . ", `recurring_id` = " . (int)$limoservice_recurring['recurring_id']);
			}
		}

		$this->cache->delete('limoservice');
	}

	public function copyProduct($limoservice_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$limoservice_id . "'");

		if ($query->num_rows) {
			$data = $query->row;

			$data['sku'] = '';
			$data['upc'] = '';
			$data['viewed'] = '0';
			$data['keyword'] = '';
			$data['status'] = '0';

			$data['limoservice_attribute'] = $this->getProductAttributes($limoservice_id);
			$data['limoservice_description'] = $this->getProductDescriptions($limoservice_id);
			$data['limoservice_discount'] = $this->getProductDiscounts($limoservice_id);
			$data['limoservice_filter'] = $this->getProductFilters($limoservice_id);
			$data['limoservice_image'] = $this->getProductImages($limoservice_id);
			$data['limoservice_option'] = $this->getProductOptions($limoservice_id);
			$data['limoservice_related'] = $this->getProductRelated($limoservice_id);
			$data['limoservice_reward'] = $this->getProductRewards($limoservice_id);
			$data['limoservice_special'] = $this->getProductSpecials($limoservice_id);
			$data['limoservice_category'] = $this->getProductCategories($limoservice_id);
			$data['limoservice_download'] = $this->getProductDownloads($limoservice_id);
			$data['limoservice_layout'] = $this->getProductLayouts($limoservice_id);
			$data['limoservice_store'] = $this->getProductStores($limoservice_id);
			$data['limoservice_recurrings'] = $this->getRecurrings($limoservice_id);

			$this->addProduct($data);
		}
	}

	public function deleteProduct($limoservice_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$limoservice_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$limoservice_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$limoservice_id . "'");

		$this->cache->delete('limoservice');
	}

	public function getProduct($limoservice_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$limoservice_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$limoservice_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

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
         WHERE p.product_tp ='LS' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

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
		/*$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id) WHERE p.product_tp ='LS' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";*/
        //echo "<pre>";print_r($data);exit;
        $sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)  LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)  WHERE p.product_tp ='LS' AND  pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        
        
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

	public function getProductDescriptions($limoservice_id) {
		$limoservice_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($query->rows as $result) {
			$limoservice_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			);
		}

		return $limoservice_description_data;
	}

	public function getProductCategories($limoservice_id) {
		$limoservice_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($query->rows as $result) {
			$limoservice_category_data[] = $result['category_id'];
		}

		return $limoservice_category_data;
	}

	public function getProductFilters($limoservice_id) {
		$limoservice_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($query->rows as $result) {
			$limoservice_filter_data[] = $result['filter_id'];
		}

		return $limoservice_filter_data;
	}

	public function getProductAttributes($limoservice_id) {
		$limoservice_attribute_data = array();

		$limoservice_attribute_query = $this->db->query("SELECT attribute_id FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$limoservice_id . "' GROUP BY attribute_id");

		foreach ($limoservice_attribute_query->rows as $limoservice_attribute) {
			$limoservice_attribute_description_data = array();

			$limoservice_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$limoservice_id . "' AND attribute_id = '" . (int)$limoservice_attribute['attribute_id'] . "'");

			foreach ($limoservice_attribute_description_query->rows as $limoservice_attribute_description) {
				$limoservice_attribute_description_data[$limoservice_attribute_description['language_id']] = array('text' => $limoservice_attribute_description['text']);
			}

			$limoservice_attribute_data[] = array(
				'attribute_id'                  => $limoservice_attribute['attribute_id'],
				'limoservice_attribute_description' => $limoservice_attribute_description_data
			);
		}

		return $limoservice_attribute_data;
	}
public function getProductOptionsAdd() {
		$limoservice_option_data = array();

//		$limoservice_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
   /// Oc_option table inner join oc_option_description
   $limoservice_option_query = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "option` o  LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE  od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND o.option_tp='LS' ");
		//echo "<pre>";print_r($limoservice_option_query);exit;
        foreach ($limoservice_option_query->rows as $limoservice_option) {
			$limoservice_option_value_data = array();

			//$limoservice_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$limoservice_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");
           
           $limoservice_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON(ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$limoservice_option['option_id'] . "' ORDER BY ov.sort_order ASC");
           // oc_option_value inner  oc_option_value_description where id option_id 
           //echo "<pre>";print_r($limoservice_option_value_query);exit;
			foreach ($limoservice_option_value_query->rows as $limoservice_option_value) {
				
                $limoservice_option_value_data[] = array(
					/*'limoservice_option_value_id' => $limoservice_option_value['product_option_value_id'],*/
                    'limoservice_option_value_id' => '',
					'option_value_id'         => $limoservice_option_value['option_value_id'],
					/*'quantity'                => $limoservice_option_value['quantity'],
					'subtract'                => $limoservice_option_value['subtract'],
					'price'                   => $limoservice_option_value['price'],
					'price_prefix'            => $limoservice_option_value['price_prefix'],
					'points'                  => $limoservice_option_value['points'],
					'points_prefix'           => $limoservice_option_value['points_prefix'],
					'weight'                  => $limoservice_option_value['weight'],
					'weight_prefix'           => $limoservice_option_value['weight_prefix']*/
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

			$limoservice_option_data[] = array(
				/*'limoservice_option_id'    => $limoservice_option['product_option_id'],
				'product_option_value' => $limoservice_option_value_data,
				'option_id'            => $limoservice_option['option_id'],
				'name'                 => $limoservice_option['name'],
				'type'                 => $limoservice_option['type'],
				'value'                => $limoservice_option['value'],
				'required'             => $limoservice_option['required']*/
                'limoservice_option_id'    => '',
				'limoservice_option_value' => $limoservice_option_value_data,
				'option_id'            => $limoservice_option['option_id'],
				'name'                 => $limoservice_option['name'],
				'type'                 => $limoservice_option['type'],
				'value'                => '',
				'required'             => ''
			);
		}

		return $limoservice_option_data;
	}




	public function getProductOptions($limoservice_id) {
		$limoservice_option_data = array();

		$limoservice_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$limoservice_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($limoservice_option_query->rows as $limoservice_option) {
			$limoservice_option_value_data = array();

			$limoservice_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$limoservice_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

			foreach ($limoservice_option_value_query->rows as $limoservice_option_value) {
				$limoservice_option_value_data[] = array(
					'limoservice_option_value_id' => $limoservice_option_value['product_option_value_id'],
					'option_value_id'         => $limoservice_option_value['option_value_id'],
					'quantity'                => $limoservice_option_value['quantity'],
					'subtract'                => $limoservice_option_value['subtract'],
					'child_price'             => $limoservice_option_value['child_price'],
                    'price'                   => $limoservice_option_value['price'],
					'price_prefix'            => $limoservice_option_value['price_prefix'],
					'points'                  => $limoservice_option_value['points'],
					'points_prefix'           => $limoservice_option_value['points_prefix'],
					'weight'                  => $limoservice_option_value['weight'],
					'weight_prefix'           => $limoservice_option_value['weight_prefix']
				);
			}

			$limoservice_option_data[] = array(
				'limoservice_option_id'    => $limoservice_option['product_option_id'],
				'limoservice_option_value' => $limoservice_option_value_data,
				'option_id'            => $limoservice_option['option_id'],
				'name'                 => $limoservice_option['name'],
				'type'                 => $limoservice_option['type'],
				'value'                => $limoservice_option['value'],
				'required'             => $limoservice_option['required']
			);
		}

		return $limoservice_option_data;
	}

	public function getProductOptionValue($limoservice_id, $limoservice_option_value_id) {
		$query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$limoservice_id . "' AND pov.product_option_value_id = '" . (int)$limoservice_option_value_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProductImages($limoservice_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$limoservice_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductDiscounts($limoservice_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$limoservice_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}

	public function getProductSpecials($limoservice_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$limoservice_id . "' ORDER BY priority, price");
       
		return $query->rows;
	}

	public function getProductRewards($limoservice_id) {
		$limoservice_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($query->rows as $result) {
			$limoservice_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $limoservice_reward_data;
	}

	public function getProductDownloads($limoservice_id) {
		$limoservice_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($query->rows as $result) {
			$limoservice_download_data[] = $result['download_id'];
		}

		return $limoservice_download_data;
	}

	public function getProductStores($limoservice_id) {
		$limoservice_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($query->rows as $result) {
			$limoservice_store_data[] = $result['store_id'];
		}

		return $limoservice_store_data;
	}

	public function getProductLayouts($limoservice_id) {
		$limoservice_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($query->rows as $result) {
			$limoservice_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $limoservice_layout_data;
	}

	public function getProductRelated($limoservice_id) {
		$limoservice_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$limoservice_id . "'");

		foreach ($query->rows as $result) {
			$limoservice_related_data[] = $result['related_id'];
		}

		return $limoservice_related_data;
	}

	public function getRecurrings($limoservice_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = '" . (int)$limoservice_id . "'");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
/* cutomize for filter addtionaly add by category
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)";
*/
$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON ( p.product_id = ptc.product_id)";
		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.product_tp ='LS'";
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
        
        
        
            /*Custom add     @fakhruddin added filter_categpry_id */         
        /*if (isset($data['filter_category']) && !is_null($data['filter_category'])) {
			$sql .= " AND ptc.category_id = '" . (int)$data['filter_category'] . "'";
		}*/
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
