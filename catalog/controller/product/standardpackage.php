<?php
class ControllerProductStandardPackage extends Controller {
	private $error = array();

	public function index() {

		$this->load->language('product/package'); 
		$this->load->language('common/header');
        
		$this->load->model('catalog/category');
        $cate_tp_cuschk ='';
		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);
            //echo $category_id;exit;
			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);
            //echo "<pre>";print_r($category_info);exit;
            
            $cate_tp_cuschk = $category_info['category_tp'];
			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}
        else
        {
            /*custom add else condiotion because some where we could not get $category_id and after this code on line 525 near 
                if($category_id==82) appply so this variable need either its from db or null by custom code like below
            */
            $category_id='';
        }

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
			
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}		

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);
	//echo "<pre>";print_r($product_info);exit;
		if ($product_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);
			$data['breadcrumbs'][] = array(
				'text' => $product_info['name'],
				'href' => $this->url->link('product/product', $url . '&product_id=' . $this->request->get['product_id'])
			);

			$this->document->setTitle($product_info['meta_title']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/standardpackage', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
			$this->document->addStyle('catalog/view/theme/theme_c2c/css/formValidation.min.css');
			$this->document->addScript('catalog/view/theme/theme_c2c/js/formValidation.min.js');

			$data['heading_title'] 	= $product_info['name'];
            /*custom add */
            $data['country_flag'] 	= $product_info['country_flag'];
            $data['category_id'] 	= $category_id;
            
            $data['top_up'] 		= $product_info['top_up'];
            $data['filter_star']	= "";
            if (isset($this->request->get['filter_star'])) {
				$data['filter_star']= $this->request->get['filter_star'];
			}
            /**/
            
			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_review'] = sprintf($this->language->get('tab_review'), $product_info['reviews']);

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];
            
            $textasas = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $product_info['description']);
            
            $data['familytype'] = $product_info['family'];
            
			$descripotionhtmlsrt = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
            $data['description'] = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $descripotionhtmlsrt);
            $data['description'] = preg_replace('/(<[^>]*) class=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $data['description']);
            //$data['description'] = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $descripotionhtmlsrt);

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
			} else {
				$data['popup'] = '';
			}

			if ($product_info['image']) {
                $data['thumb'] = $this->model_tool_image->getoriganal($product_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
				);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}

			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}

			$data['options'] = array();
//echo "<pre>";print_r($this->session);exit;

			foreach ($this->model_catalog_product->getProductOptions($this->request->get['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
/*							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),*/
                            'image'                   => $this->model_tool_image->getoriganal($option_value['image'], 50, 50),
							'price'                   => $price,
                            'price_type'              => $option_value['price_type'],
                            'time_val'                => $option_value['time_val'],
                            'child_price'             => round($option_value['child_price']),
                            'top_up_child'             => round($option_value['top_up_child']),
                            'top_up_adults'             => round($option_value['top_up_adults']),
                            /*cutom add*/
                            'orignalprice'            =>  round($option_value['price']),
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$data['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}			
			foreach ($results as $result) {
				if ($result['image']) {
					/*$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));*/
                    $image = $this->model_tool_image->getoriganal($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					/*$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));*/
                    $image = $this->model_tool_image->getoriganal('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}				
			}

			$data['tags'] = array();

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$data['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$data['recurrings'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);

			$this->model_catalog_product->updateViewed($this->request->get['product_id']);
			//get the country listing for hotels search engine
	        $this->load->model('localisation/country');
	        $countryresult = $this->model_localisation_country->getCountries();
	        foreach($countryresult as $country){
	            $data['countries'][] = array(
	                'country_id'        => $country['country_id'],
	                'name'              => $country['name'],
	            );
	        }
			/*echo "<pre/>";
			print_r($data);exit;*/
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
            

			$this->response->setOutput($this->load->view('product/standardpackagelanding', $data));
          
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/product', $url . '&product_id=' . $product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
	public function hotels(){
		/*echo "<pre/>";
		print_r($this->request->post);exit;*/
		$this->load->language('product/hotels');
        $this->load->language('common/header');
        $this->load->language('product/package');
        $this->load->model('catalog/standardpackage');
        if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->post['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_model'])) {
			$filter_model = $this->request->get['filter_model'];
		} else {
			$filter_model = null;
		}

		if (isset($this->request->get['filter_price'])) {
			$filter_price = $this->request->get['filter_price'];
		} else {
			$filter_price = null;
		}

		if (isset($this->request->post['filter_quantity'])) {
			$filter_quantity = $this->request->post['filter_quantity'];
		} else {
			$filter_quantity = null;
		}        
        
        /*cusvip  add custom */
        if (isset($this->request->get['filter_category'])) {
			$filter_category = $this->request->get['filter_category'];
		} else {
			$filter_category = null;
		}
        if (isset($this->request->get['filter_category_id'])) {
			$filter_category_id = $this->request->get['filter_category_id'];
		} else {
			$filter_category_id = null;
		}

		if (isset($this->request->post['filter_sku'])) {
			$filter_sku = $this->request->post['filter_sku'];
		}else{
			$filter_sku = null;
		}

		if (isset($this->request->post['filter_checkin'])) {
			$filter_checkin = $this->request->post['filter_checkin'];
		}else{
			$filter_checkin = null;
		}

		if (isset($this->request->post['filter_checkout'])) {
			$filter_checkout = $this->request->post['filter_checkout'];
		}else{
			$filter_checkout = null;
		}

		if (isset($this->request->post['filter_emirate'])) {
			$filter_emirate = $this->request->post['filter_emirate'];
		}else{
			$filter_emirate = null;
		}

		if (isset($this->request->post['filter_rooms'])) {
			$filter_rooms = $this->request->post['filter_rooms'];
		}else{
			$filter_rooms = null;
		}

		if (isset($this->request->post['filter_adult'])) {
			$filter_adult = $this->request->post['filter_adult'];
		}else{
			$filter_adult = null;
		}
		if (isset($this->request->post['filter_child'])) {
			$filter_child = $this->request->post['filter_child'];
		}else{
			$filter_child = null;
		}
		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}
		if (isset($this->request->get['filter_image'])) {
			$filter_image = $this->request->get['filter_image'];
		} else {
			$filter_image = null;
		}
		if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];			
		} else {
			$sort = 'pd.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->post['filter_rooms'])) {
			$filter_rooms = $this->request->post['filter_rooms'];
		}else{
			$filter_rooms = null;
		}
		if(isset($this->request->post['hotel_sort'])){
            $sort_arr = explode('&',$this->request->post['hotel_sort']);
           
            $sort_option = explode('=',$sort_arr[0]);
            $order_option = explode('=',$sort_arr[1]);
            $sort  = $sort_option[1];
            $order = $order_option[1];
        }
        ///fetch related hotels for the standard package
        $relatedresults = $this->model_catalog_standardpackage->getProductRelated($this->request->post['package_id']);
        $product_list = array();
		foreach ($relatedresults as $result) {			
			array_push($product_list,$result['product_id'] );			
		}	
	/*	echo "<pre/>";
		print_r($product_list);	*/

        $filter_data = array(
			'filter_name'	  => $filter_name,
			'filter_model'	  => $filter_model,
			'filter_price'	  => $filter_price,
			'filter_quantity' => $filter_quantity,
            
            /*cusvip  add custom */
            'filter_category'   => $filter_category,
			'filter_category_id'=> $filter_category_id,
			'filter_sku'		=> $filter_sku,
			'filter_checkin'	=> $filter_checkin,
			'filter_checkout'	=> $filter_checkout,
			'filter_rooms'		=> $filter_rooms,
			'filter_adult'		=> $filter_adult,
			'filter_child'		=> $filter_child,
			'filter_list'		=> $product_list,
            
            'filter_status'   => $filter_status,
			'filter_image'    => $filter_image,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin')
		);
		
		$this->load->model('tool/image');
		$hotels_total = $this->model_catalog_standardpackage->getTotalProducts($filter_data);
		$hotel_results = $this->model_catalog_standardpackage->getProducts($filter_data);
		$locations =array();
		$data['hotels'] = array();		
		foreach ($hotel_results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 280, 280);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 280, 280);
			}

			$special = false;
			
			$data['hotels'][] = array(
				'hotel_id' 	 => $result['product_id'],
				'image'      => $image,
				'name'       => $result['name'],
				'model'      => $result['model'],
				'price'      => $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
				'special'    => $special,
				'quantity'   => $result['quantity'],
				'location'   => $result['location'],
				'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')
			);
            array_push($locations, $result['sku']);

		}
		
		$data['locations'] = array_unique($locations);		
		
		$data['package_id'] = 3; 
        if(isset( $this->request->post['package_id'])){
           $data['package_id'] = $this->request->post['package_id'];
        } 
		$data['filter_star'] = 3; 
        if(isset( $this->request->post['filter_quantity'])){
           $data['filter_star'] = $this->request->post['filter_quantity'][0];
        } 
		$data['nationality_flag'] = 0; 
        if(isset($this->request->post['filter_nationality'])){
            if($this->request->post['filter_nationality']==99){
                $data['nationality_flag']   = true;
            }
        }  
        $data['filter_visa'] = 0;
        if (isset($this->request->post['filter_visa'])) {
            if($this->request->post['filter_visa']=="yes"){
                $data['filter_visa'] =  1;
            }
        }
        ///total people calculation
        $total_people = $filter_adult + $filter_child;
        $data['total_people'] = $total_people;
        $data['filter_rooms'] = $filter_rooms;

        $data['filter_transfer'] = 0;        
        if (isset($this->request->post['filter_transfer'])) {
            if($this->request->post['filter_transfer']=="two"){
                $data['filter_transfer'] =  1;                
            }
        }
        if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		$pagination = new Pagination();
		$pagination->total = $hotels_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/hotels', '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($hotels_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($hotels_total - $this->config->get('config_limit_admin'))) ? $hotels_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $hotels_total, ceil($hotels_total / $this->config->get('config_limit_admin')));

		$data['filter_nationality'] = "";
        if(isset($this->request->post['filter_nationality'])){
            $data['filter_nationality'] = $this->request->post['filter_nationality'];
        }
        $data['filter_sku'] = "";
        if(isset($this->request->post['filter_sku'])){
            $data['filter_sku'] = $this->request->post['filter_sku'];
        }
        $data['filter_checkin'] = "";
        if(isset($this->request->post['filter_checkin'])){
            $data['filter_checkin'] = $this->request->post['filter_checkin'];
        }
        $data['filter_checkout'] = "";
        if(isset($this->request->post['filter_checkout'])){
            $data['filter_checkout'] = $this->request->post['filter_checkout'];
        }
        $data['filter_rooms'] = "";
        if(isset($this->request->post['filter_rooms'])){
            $data['filter_rooms'] = $this->request->post['filter_rooms'];
        }
        $data['filter_adult'] = "";
        if(isset($this->request->post['filter_adult'])){
            $data['filter_adult'] = $this->request->post['filter_adult'];
        }
        $data['filter_child'] = "";
        if(isset($this->request->post['filter_child'])){
            $data['filter_child'] = $this->request->post['filter_child'];
        }
         $data['filter_child_age'] = "";
        if(isset($this->request->post['filter_child_age'])){
            $data['filter_child_age'] = $this->request->post['filter_child_age'];
        }
        //get the country listing for hotels search engine
        $this->load->model('localisation/country');
        $countryresult = $this->model_localisation_country->getCountries();
        foreach($countryresult as $country){
            $data['countries'][] = array(
                'country_id'        => $country['country_id'],
                'name'              => $country['name'],
            );
        }
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('standard_package'),
            'href' => $this->url->link('product/standardpackage')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_title'),
            'href' => $this->url->link('product/standardpackage/hotels')
        );
        /*echo "<pre/>";
        print_r($data);exit;*/
        $this->document->setTitle($this->language->get('text_list'));
        $this->document->setDescription($this->language->get('text_list'));
        $this->document->setKeywords($this->language->get('text_list'));

		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('product/standardpackagehotels', $data));

	}

	public function review() {
		$this->load->language('product/product');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write() {
		$this->load->language('product/product');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}
        $this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription() {
		$this->load->language('product/product');
		$this->load->model('catalog/product');
    
		if (isset($this->request->post['product_id'])) 
        {
			$product_id = $this->request->post['product_id'];
		} 
        else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_product->getProduct($product_id);
		$recurring_info = $this->model_catalog_product->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
    public function getoptionlistmember()
    {
        $timetype = $this->request->post['timetype'];
        $product_id =$this->request->post['productid'];
        $this->load->model('catalog/product');
        $productoptionvalues = $this->model_catalog_product->getProductoptionPrivatebytimetype($timetype,$product_id);
        //echo "<pre>";print_r($productoptionvalues);exit;
        
         $json['htmladd'] = "<select class='cs-select cs-skin-border'><option value='' disabled='' selected=''>Transfer Rates</option>";
            foreach($productoptionvalues as $optionbyprice)
            {
                $typevalue  = $optionbyprice['time_val'];
                $exp1        = explode(')',$typevalue);
                $exp2        = explode('(',$exp1[0]);
                $name        = $exp2[1];
                $value = $optionbyprice['product_option_value_id'];
                //$name  = $optionbyprice['time_val'].'Minutes';
                $price = round($optionbyprice['price']);
                $dataprductopnvalid = $optionbyprice['product_option_value_id'];
                $dataprductopnid    = $optionbyprice['product_option_id'];
                $type               = $optionbyprice['price_type'];
                $per_member_price   = $optionbyprice['top_up_adults']; 
                $json['htmladd']   .= '<option data-price-type="'.$type.'" data-per-person="'.$per_member_price.'" data-price="'.$price.'" data-product-option-id="'.$dataprductopnid.'" data-product-option-value-id="'.$dataprductopnvalid.'" value="'.$value.'">'.$name.'</option>';
            }
            $json['htmladd'] .="</select>";
            $this->response->addHeader('Content-Type: application/json');
		    $this->response->setOutput(json_encode($json));
        
    }
    public function getoptionlist()
    {
        $pricetype = $this->request->post['pricetype'];
        $product_id =$this->request->post['productid'];
        $this->load->model('catalog/product');
        $json['pricetype'] =$pricetype;
        if($pricetype=='private')
        {
            //now neede to call group by model
            $productoptionvalues = $this->model_catalog_product->getProductoptionbypricetype($pricetype,$product_id);
          
            /*here we need decide what option available for this like 15,20,30,60... so that we make options comobobox*/
            $json['htmladd'] = "<select class='cs-select cs-skin-border'><option value='' disabled='' selected=''>Select Duration</option>";
                $privateoption = array();
                $top_up_adults = array();
                foreach($productoptionvalues as $optionbyprice)
                {
                    $typevalue  = $optionbyprice['time_val'];
                    $exp        = explode('(',$typevalue);
                    array_push($privateoption,$exp[0]);
                    $uniueoptin =  array_unique($privateoption);
                    $top_up_adults[$exp[0]]  = $optionbyprice['top_up_adults']; 
                    /*$value = $optionbyprice['product_option_value_id'];
                    $name  = $optionbyprice['time_val'].'Minutes';
                    $price = round($optionbyprice['price']);
                    $dataprductopnvalid = $optionbyprice['product_option_value_id'];
                    $dataprductopnid    = $optionbyprice['product_option_id'];
                    $type               = $optionbyprice['price_type'];
                    $json['htmladd']   .= '<option data-price-type="'.$type.'" data-price="'.$price.'" data-product-option-id="'.$dataprductopnid.'" data-product-option-value-id="'.$dataprductopnvalid.'" value="'.$value.'">'.$name.'</option>';
                    */
                }
              
                foreach($uniueoptin as $optionset)
                {
                  
                    $json['htmladd']   .= '<option data-data-price-charge="'.$top_up_adults[$optionset].'" data-typetime="'.$optionset.'" >'.$optionset.' Minutes</option>';
                }
                /*print_r($privateoption);
                print_r(array_unique($privateoption));*/
                $json['htmladd'] .="</select>";
                
        }
        else
        {
            $productoptionvalues = $this->model_catalog_product->getProductoptionbypricetype($pricetype,$product_id);
            $json['htmladd'] = "<select class='cs-select cs-skin-border'><option value='' disabled='' selected=''>Select Duration</option>";
            foreach($productoptionvalues as $optionbyprice)
            {
                $value = $optionbyprice['product_option_value_id'];
                $name  = $optionbyprice['time_val'].' Minutes';
                $price = round($optionbyprice['price']);
                $dataprductopnvalid = $optionbyprice['product_option_value_id'];
                $dataprductopnid    = $optionbyprice['product_option_id'];
                $type               = $optionbyprice['price_type'];
                $json['htmladd']   .= '<option data-price-type="'.$type.'" data-price="'.$price.'" data-product-option-id="'.$dataprductopnid.'" data-product-option-value-id="'.$dataprductopnvalid.'" value="'.$value.'">'.$name.'</option>';
            }
            $json['htmladd'] .="</select>";
        }
        //echo "<pre>";print_r($productoptionvalues);exit;
        
        $this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
        
    }
    public function visasub()
    {
        
        $this->load->model('catalog/product');
        $applicantarr = $this->request->post['applicantinfo'];
        /*get all data  */
        $visamaxid = $this->model_catalog_product->getVisaMax();
        if($visamaxid[0]['id']=='' || $visamaxid[0]['id']=='Null')
        {
            $maxvisaid=1;
        }
        else
        {
            $maxvisaid =$visamaxid[0]['id']+1;//Null    
        }
        foreach($applicantarr as $resultasas)
        {
            	//echo"<pre>";print_r($resultasas);
                $data['information'][] = array(
				'name'                    => $resultasas['name'],
				'residence'               => $resultasas['residence'],
				'country'                 => $resultasas['country'],
				'dob'                     => $resultasas['dob'],
				'gender'                  => $resultasas['gender'],
				'relationship'            => $resultasas['relationship'],
				'qualification'           => $resultasas['qualification'],
                'travelleremail'          => $resultasas['travelleremail'],
				'code'                    => $resultasas['code'],
				'travellmobilenumber'     => $resultasas['travellmobilenumber']
                );
        }
                
                $imageFileTypevisapropassportfrent = pathinfo($this->request->files['uaeresidencevisaholder']['name']['passportfrent'],PATHINFO_EXTENSION);
                $filenamevisapropassportfrent      = 'visaproviderpassportfrent-'.$maxvisaid.'.'.$imageFileTypevisapropassportfrent;
                $target_filevisapropassportfrent   = DIR_IMAGE_VISA . $filenamevisapropassportfrent;
                move_uploaded_file($this->request->files['uaeresidencevisaholder']['tmp_name']['passportfrent'], $target_filevisapropassportfrent);
                
                $imageFileTypevisapropassportback = pathinfo($this->request->files['uaeresidencevisaholder']['name']['passportback'],PATHINFO_EXTENSION);
                $filenamevisapropassportback       = 'visaproviderpassportback-'.$maxvisaid.'.'.$imageFileTypevisapropassportback;
                $target_filevisapropassportback    = DIR_IMAGE_VISA . $filenamevisapropassportback;
                move_uploaded_file($this->request->files['uaeresidencevisaholder']['tmp_name']['passportback'], $target_filevisapropassportback);
                
                $imageFileTypevisaprovaliduaevisa  = pathinfo($this->request->files['uaeresidencevisaholder']['name']['validuaevisa'],PATHINFO_EXTENSION);
                $filenamevisaprovaliduaevisa       = 'visaprovidervaliduaevisa-'.$maxvisaid.'.'.$imageFileTypevisapropassportback;
                $target_filevisaprovaliduaevisa    = DIR_IMAGE_VISA . $filenamevisaprovaliduaevisa;
                move_uploaded_file($this->request->files['uaeresidencevisaholder']['tmp_name']['validuaevisa'], $target_filevisaprovaliduaevisa);
                
                /*visaprovider*/
                $data['residantypeapplicant'] = $this->request->post['residantypeapplicant'];
                $data['uaeresidencevisaholder'] = array(
				'visaholderemail'         => $this->request->post['uaeresidencevisaholder']['email'],
				'visaholdercode'          => $this->request->post['uaeresidencevisaholder']['code'],
				'visaholdermobilenumber'  => $this->request->post['uaeresidencevisaholder']['mobilenumber'],
                'visaholderpassportfrent' => $filenamevisapropassportfrent,
                'visaholderpassportback'  => $filenamevisapropassportback,
                'visaholder'              => $filenamevisaprovaliduaevisa
				);
                
                /*passportfren*/
                
        
        $imgcounter=0;
        
        
        foreach($this->request->files['applicantinfo']['tmp_name'] as $image)
        {
            //echo "<pre>";print_r($image);
            /**/
            $imageFileTypetravellerspassport = pathinfo($this->request->files['applicantinfo']['name'][$imgcounter]['travellerspassport'],PATHINFO_EXTENSION);
            $filenametravellerspassport      ='travellerspassport-'.$maxvisaid.'.'.$imageFileTypetravellerspassport;
            $target_filetravellerspassport = DIR_IMAGE_VISA . $filenametravellerspassport;
            move_uploaded_file($image['travellerspassport'], $target_filetravellerspassport);
            
            $imageFileTypetravellerspassportback = pathinfo($this->request->files['applicantinfo']['name'][$imgcounter]['travellerspassportback'],PATHINFO_EXTENSION);
            $filenametravellerspassportback      ='travellerspassportback-'.$maxvisaid.'.'.$imageFileTypetravellerspassportback;
            $target_filetravellerspassportback = DIR_IMAGE_VISA . $filenametravellerspassportback;
            move_uploaded_file($image['travellerspassportback'], $target_filetravellerspassportback);
            
            $imageFileTypepassportphoto = pathinfo($this->request->files['applicantinfo']['name'][$imgcounter]['passportphoto'],PATHINFO_EXTENSION);
            $filenamepassportphoto      = 'passportphoto-'.$maxvisaid.'.'.$imageFileTypepassportphoto;
            $target_filepassportphoto   = DIR_IMAGE_VISA . $filenamepassportphoto;
            move_uploaded_file($image['passportphoto'], $target_filepassportphoto);
            
            $imageFileTypeairticket = pathinfo($this->request->files['applicantinfo']['name'][$imgcounter]['airticket'],PATHINFO_EXTENSION);
            $filenameairticket      = 'airticket-'.$maxvisaid.'.'.$imageFileTypeairticket;
            $target_filepassportphoto   = DIR_IMAGE_VISA . $filenameairticket;
            move_uploaded_file($image['airticket'], $target_filepassportphoto);
            
            $imageFileTypehotelreservation        = pathinfo($this->request->files['applicantinfo']['name'][$imgcounter]['hotelreservation'],PATHINFO_EXTENSION);
            $filenamehotelreservation             = 'hotelreservation-'.$maxvisaid.'.'.$imageFileTypehotelreservation;
            $target_filehotelreservation          = DIR_IMAGE_VISA . $filenamehotelreservation;
            move_uploaded_file($image['hotelreservation'], $target_filehotelreservation);
            $filenamequalificationcertificate = '';
            if(isset($this->request->files['applicantinfo']['name'][$imgcounter]['qualificationcertificate']))
            {
                $imageFileTypequalificationcertificate  = pathinfo($this->request->files['applicantinfo']['name'][$imgcounter]['qualificationcertificate'],PATHINFO_EXTENSION);
                $filenamequalificationcertificate              = 'qualificationcertificate-'.$maxvisaid.'.'.$imageFileTypequalificationcertificate;
                $target_filequalificationcertificate       = DIR_IMAGE_VISA . $filenamequalificationcertificate;
                move_uploaded_file($image['qualificationcertificate'], $target_filequalificationcertificate);
            }
            $filenameexitstamp ='';
            if(isset($this->request->files['applicantinfo']['name'][$imgcounter]['exitstamp']))
            {
                $imageFileTypeexitstamp  = pathinfo($this->request->files['applicantinfo']['name'][$imgcounter]['exitstamp'],PATHINFO_EXTENSION);
                $filenameexitstamp              = 'exitstamp-'.$maxvisaid.'.'.$imageFileTypeexitstamp;
                $target_fileexitstamp       = DIR_IMAGE_VISA . $filenameexitstamp;
                move_uploaded_file($image['exitstamp'], $target_fileexitstamp);
            }
            $imageFileTypemarriage      = pathinfo($this->request->files['applicantinfo']['name'][$imgcounter]['marriage'],PATHINFO_EXTENSION);
            $filenamemarriage           = 'marriage-'.$maxvisaid.'.'.$imageFileTypemarriage;
            $target_filemarriage        = DIR_IMAGE_VISA . $filenamemarriage;
            move_uploaded_file($image['marriage'], $target_filemarriage);
            
            
            
            $data['applicantinfomation'][]  = array(
				'travellerspassportfront'               => $filenametravellerspassport,
                'travellerspassportback'                => $filenametravellerspassportback,
                'travellersimage'                       => $filenamepassportphoto,
                'travellersairticket'                   => $filenameairticket,
                'travellershotelreservation'            => $filenamehotelreservation,
                'travellersqualificationcertificate'    => $filenamequalificationcertificate,
                'travellersexitstamp'                   => $filenameexitstamp,
                'travellersmarriage'                    => $filenamemarriage
                
             );
            
            $imgcounter++;
            
            /*
            $filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['applicantinfo']['name'], ENT_QUOTES, 'UTF-8')));
            // Validate the filename length
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {$json['error'] = $this->language->get('error_filename');}
            // Allowed file extension types
			$allowed = array();
            $extension_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_ext_allowed'));
            $filetypes = explode("\n", $extension_allowed);
            foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
            if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}
            // Allowed file mime types
			$allowed = array();
            $mime_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_mime_allowed'));
            $filetypes = explode("\n", $mime_allowed);
            foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
            if (!in_array($this->request->files['applicantinfo']['type'], $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}
            // Check to see if any PHP files are trying to be uploaded
			$content = file_get_contents($this->request->files['file']['tmp_name']);
            if (preg_match('/\<\?php/i', $content)) {
				$json['error'] = $this->language->get('error_filetype');
			}
            // Return any upload error
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		  if (!$json) {
			$file = $filename . '.' . token(32);
            move_uploaded_file($this->request->files['file']['tmp_name'], DIR_UPLOAD .'visa/'. $file);
         }    
            
            */
        }
        /*now insert data   */
       // echo "<pre>";print_r($information);exit;
       //echo "ghggh-".$this->request->post['residantypeapplicant']."<br/>".$data['residantypeapplicant'];
        $visamaxid = $this->model_catalog_product->addvisainformation($data);
    }
    public function packageDetails(){
    	/*echo "<pre/>";
    	print_r($this->request->get);
    	exit;*/
    	$this->load->model('catalog/product');
    	$this->load->model('tool/image');
    	$this->load->language('checkout/cart');
    	$this->load->language('product/package');
    	if (isset($this->request->get['hotel_id'])) {
            $hotel_id = $this->request->get['hotel_id'];
        } else {
            $hotel_id = null;
        } 
        $this->load->model('catalog/hotels');
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('standard_package'),
            'href' => $this->url->link('product/standardpackage')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_list'),
            'href' => $this->url->link('product/standardpackage/hotels')
        );
        
        $hotel_info = $this->model_catalog_hotels->getProduct($hotel_id); 
        if ($hotel_info) {
        	
        	if(isset($this->request->post['filter_nationality'])){
                $data['filter_nationality'] = $this->request->post['filter_nationality'];
            }
            $data['filter_sku'] = "";
            if(isset($this->request->post['filter_sku'])){
                $data['filter_sku'] = $this->request->post['filter_sku'];
            }
            $data['filter_checkin'] = "";
            if(isset($this->request->post['filter_checkin'])){
                $data['filter_checkin'] = $this->request->post['filter_checkin'];
            }
            $data['filter_checkout'] = "";
            if(isset($this->request->post['filter_checkout'])){
                $data['filter_checkout'] = $this->request->post['filter_checkout'];
            }
            $data['filter_rooms'] = "";
            if(isset($this->request->post['filter_rooms'])){
                $data['filter_rooms'] = $this->request->post['filter_rooms'];
            }
            $data['filter_adult'] = "";
            if(isset($this->request->get['filter_adult'])){
                $data['filter_adult'] = $this->request->get['filter_adult'];
            }
            $data['filter_child'] = "";
            if(isset($this->request->get['filter_child'])){
                $data['filter_child'] = $this->request->get['filter_child'];
            }
            if(isset($this->request->get['package_id'])){
                 $data['package_id'] = $this->request->get['package_id'];
            }
            if(isset($this->request->get['star_rating'])){
                 $data['star_rating'] = $this->request->get['star_rating'];
            }
             if (isset($this->request->get['total_people'])) {
	            $data['total_people'] = $this->request->get['total_people'];
	        } else {
	            $data['total_people'] = 0;
	        }  
            if(isset($this->request->get['filter_room']) && $this->request->get['filter_room']!=0){
                 $data['filter_rooms'] = $this->request->get['filter_room'];
            }else{
            	$data['filter_rooms'] = 5;
            }
            if (isset($this->request->get['filter'])) {
	            $filter_id = $this->request->get['filter'];
	        } else {
	            $filter_id = 0;
	        }  
	        if (isset($this->request->get['visa_option'])) {
	            $visa_option = $this->request->get['visa_option'];
	        } else {
	            $visa_option = 0;
	        }  
	        if (isset($this->request->get['transfer_option'])) {
	            $transfer_option = $this->request->get['transfer_option'];
	        } else {
	            $transfer_option = 0;
	        } 
	        if (isset($this->request->get['checkin'])) {
	            $checkin = $this->request->get['checkin'];
	        } else {
	            $checkin = '';
	        }
	        if (isset($this->request->get['checkout'])) {
	            $checkout = $this->request->get['checkout'];
	        } else {
	            $checkout = '';
	        }   
 			/* total person calculation*/
 			if(isset($this->request->get['total_people'])){
 				$star_rating  = $this->request->get['star_rating'];
 				$total_people = $this->request->get['total_people'];
 				if($star_rating==3){
 					$total_tour_price = (200 * $total_people);
					$data['total_tour_price'] = $this->currency->format($this->tax->calculate($total_tour_price, 0, $this->config->get('config_tax')), $this->session->data['currency']);
 				}
 				if($star_rating==4){
 					$total_tour_price = (300 * $total_people);
					$data['total_tour_price'] = $this->currency->format($this->tax->calculate($total_tour_price, 0, $this->config->get('config_tax')), $this->session->data['currency']);
 				}
 				if($star_rating==5){
 					$total_tour_price = (350 * $total_people);
					$data['total_tour_price'] = $this->currency->format($this->tax->calculate($total_tour_price, 0, $this->config->get('config_tax')), $this->session->data['currency']);
 				} 				

 			}
 			$data['star_rating'] = $this->request->get['star_rating'];
            $this->document->setTitle($hotel_info['meta_title']);
            $this->document->setDescription($hotel_info['meta_description']);
            $this->document->setKeywords($hotel_info['meta_keyword']);
            $this->document->addLink($this->url->link('product/hotels', 'hotel_id=' . $this->request->get['hotel_id']), 'canonical');
            $data['heading_title'] = $hotel_info['name'];

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['button_upload'] = $this->language->get('button_upload');
            $data['button_continue'] = $this->language->get('button_continue');

            $data['name']         = $hotel_info['name'];
            $data['location']     = $hotel_info['location'];
            $dmaphtmlsrt = html_entity_decode($hotel_info['map'], ENT_QUOTES, 'UTF-8');
            $data['map'] = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $dmaphtmlsrt);
            $data['map'] = preg_replace('/(<[^>]*) class=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $data['map']);
            $data['rating']       = $hotel_info['rating'];
            $data['reviews']      = $hotel_info['reviews'];
            $data['filter_id']    = $filter_id;
            $data['visa_option']  = $visa_option;
            $data['transfer_option']= $transfer_option;
            $data['product_id']     = '238';
            $data['model']          = $hotel_info['model'];
            $data['points']         = $hotel_info['points'];
            $data['star_rating']    = $hotel_info['quantity'];

            $textasas = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $hotel_info['description']);
            
            $descripotionhtmlsrt = html_entity_decode($hotel_info['description'], ENT_QUOTES, 'UTF-8');
            $data['description'] = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $descripotionhtmlsrt);
            $data['description'] = preg_replace('/(<[^>]*) class=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $data['description']);

            $data['stock']       = $hotel_info['quantity'];

            $data['breadcrumbs'][] = array(
	            'text' => $hotel_info['name'],
	            'href' => '#'
	        );

            $this->load->model('tool/image');

            if ($hotel_info['image']) {
                $data['popup'] = $this->model_tool_image->resize($hotel_info['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));
            } else {
                $data['popup'] = '';
            }

            if ($hotel_info['image']) {
                $data['thumb'] = $this->model_tool_image->getoriganal($hotel_info['image'], $this->config->get($this->config->get('config_theme') . '_image_thumb_width'), $this->config->get($this->config->get('config_theme') . '_image_thumb_height'));
            } else {
                $data['thumb'] = '';
            }

            $data['images'] = array();
            $results = $this->model_catalog_hotels->getProductImages($this->request->get['hotel_id']);

            foreach ($results as $result) {
                $data['images'][] = array(
                    'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                    'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'))
                );
            }
            /*facility*/
            $facilities = $this->model_catalog_hotels->getCategories($this->request->get['hotel_id']);
            
            $data['facility']=array();
            $this->load->model('catalog/category');
            foreach($facilities as $facility){
                $category_info = $this->model_catalog_category->getCategory($facility['category_id']);
                
                if ($category_info['image']) {
                    $facility_image = $this->model_tool_image->resize($category_info['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
                } else {
                    $facility_image = '';
                }

                $data['facilities'][] = array(
                    'facility_name'   => $category_info['name'],
                    'facility_image'  => $facility_image                                     
                );
               
            }
            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $data['price'] = $this->currency->format($this->tax->calculate($hotel_info['price'], $hotel_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $data['price'] = false;
            }
            $data['room_options'] = array();
            

            $roomOptions = $this->model_catalog_hotels->getHotelRoomOptions($this->request->get['hotel_id'],$checkin,$checkout);
            if(!empty($roomOptions)){
                $data['room_options'] = $roomOptions;
            }else{
                $data['room_options'] = null;
            }
        }

		/*
		217 - Desert Safari
		112 - Dubai City Tour

		104 - Dhow Cruise - dubai creek
		107 - Marina Cruise
		109 - Dhow Cruise in dubai canal
		*/

		$tourList = array('217','112');
		if($this->request->get['star_rating'] ==3){
            array_push($tourList, 104);
        }
        if($this->request->get['star_rating'] ==4){
            array_push($tourList, 107);
        }
        if($this->request->get['star_rating'] ==5){
            array_push($tourList, 109);
        }
		$data['tourlist'] =array();
		$data['tourids'] = $tourList;
		foreach($tourList as $tour){
			$product_info = $this->model_catalog_product->getProduct($tour);
			if($product_info){
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$product_info['rating'];
				} else {
					$rating = false;
				}				

	            $textasas = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $product_info['description']);
            
	            $tourdescrhtmlsrt = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');
	            $product_info['description'] = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $tourdescrhtmlsrt);
	            $tourdescription = preg_replace('/(<[^>]*) class=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $product_info['description']);

				$data['tourlist'][] =array(
					'product_id'  => $product_info['product_id'],
					'name'		  => $product_info['name'],
					'description' => $tourdescription,
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $product_info['minimum'] > 0 ? $product_info['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])

				);
			}
		}
		
		/* visa options*/
		$product_options = $this->model_catalog_product->getProductOptions(238);

		foreach($product_options as $options){
			$data['visaoptions'][] = array(
				'option_id' => $options['option_id'],
				'option_name'=>$options['name'],
				'option_value'=>$this->currency->format($this->tax->calculate($options['value'], 0, $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency'])
			);
		}		
       	/*Airport Transfer*/
       	$category_info = $this->model_catalog_category->getCategory(70);
        if ($category_info) {
        	$data['products'] = array();
            $filter_data = array(
				'filter_category_id' => 70,
				'filter_filter'      => '',
				'sort'               => 'p.sort_order',
				'order'              => 'ASC',
				'start'              => 0,
				'limit'              => 25
			);
			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
			$transport_results = $this->model_catalog_product->getProducts($filter_data);

			foreach ($transport_results as $result) {
				/*cus add*/
                $cusoption = array();
               	//getting product options
                $cusoption  = $this->model_catalog_product->getProductOptions($result['product_id']);
                $data['transfer_products'][] = array( 
                	'product_id'  => $result['product_id'],
                	'name'        => $result['name'],
                	'options'     =>$cusoption,
                );   
              

			}
        }   

    /*    echo "<pre/>";
        print_r($data);exit;*/
        ///set currency symbol
        $data['currencysymbol'] = $this->currency->getSymbolLeft($this->session->data['currency']);
        ///find the number of days between checkin and checkout date

        $date1 = new DateTime("$checkin");
        $date2 = new DateTime("$checkout");

        $diff = $date2->diff($date1)->format("%a");
        if($diff==0){
            $data['no_of_days'] = 1;
        }else{
            $data['no_of_days'] = $diff;
        }

       	$this->document->setTitle($this->language->get('text_list'));
        $this->document->setDescription($this->language->get('text_list'));
        $this->document->setKeywords($this->language->get('text_list'));

		$data['header'] = $this->load->controller('common/header');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('product/standarddetails', $data));
        
		
    }
    function addRoomOptions(){
       	/*echo "<pre/>";
       	print_r($this->request->post);
       	echo "<pre/>";
       	print_r($this->request->files);       	
       	exit;*/

        $this->load->model('catalog/hotels');       
        $this->load->model('catalog/standardpackage');       

        //rooms section
        $roomids = array();
        $this->session->data['standard_room_options'] = '';
        if($this->request->post['room_options']){
            foreach($this->request->post['room_options'] as $room_options){
               
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

        
        
        ///store tour options
        $this->session->data['standard_tour_id'] = '';
        if(isset($this->request->post['transfer'])){
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
        	$this->session->data['standard_flight_tickets'] = $ticketids;
        }
             
    }
}
