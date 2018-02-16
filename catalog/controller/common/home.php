<?php
class ControllerCommonHome extends Controller {
	public function index() {
         /*echo "<pre/>";
        print_r($this->session->data);*/
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

        /*Get All Categories By Type*/
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        /*For Tours category Menues  */
        $this->load->model('tool/image');
       
       /*  For tour on home  */
        $categoriesToursHome = $this->model_catalog_category->getCategoriesBYcatTP(0,'TE');
        //echo "<pre>";print_r($categoriesToursHome);exit;
        foreach ($categoriesToursHome as $categoryToursHome) 
        {
            /* 350X 233 for image  */
            if($categoryToursHome['image']!='')
            {
                /* sytandard formate
                $image = $this->model_tool_image->resize($categoryToursHome['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));*/
                 $image = $this->model_tool_image->getoriganal($categoryToursHome['image'], 350, 233);   
            }
            else
            {
                $image = $this->model_tool_image->getoriganal('placeholder.png', 350, 233);
            }
            $data['tourscategoriesHome'][] = array(
					'name'     => $categoryToursHome['name'],
					'column'   => $categoryToursHome['column'] ? $categoryToursHome['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $categoryToursHome['category_id']),
                    'image'    => $image/*$categoryToursHome['image']*/,
                    //'description'    => utf8_substr(strip_tags(html_entity_decode($categoryToursHome['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..'
                    'description'    => utf8_substr(strip_tags(html_entity_decode($categoryToursHome['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length'))
				);
		}
       /* echo "<pre/>";
        print_r($data['tourscategoriesHome']);exit;*/
        /*For  Park on home page  */
        $categoriesParksHome = $this->model_catalog_category->getCategoriesBYcatTP(0,'PK');
        foreach ($categoriesParksHome as $categoryParksHome) 
        {
            /* 350X 233 for image  */
            if($categoryParksHome['image']!='')
            {
                /* sytandard formate
                $image = $this->model_tool_image->resize($categoryToursHome['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));*/
                 $image = $this->model_tool_image->resize($categoryParksHome['image'], 350, 233);   
            }
            else
            {
                $image = $this->model_tool_image->resize('placeholder.png', 350, 233);
            }
            $data['parkscategoriesHome'][] = array(
					'name'     => $categoryParksHome['name'],
					'column'   => $categoryParksHome['column'] ? $categoryParksHome['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $categoryParksHome['category_id']),
                    'image'    => $image/*$categoryToursHome['image']*/,
                    //'description'    => utf8_substr(strip_tags(html_entity_decode($categoryToursHome['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..'
                    'description'    => utf8_substr(strip_tags(html_entity_decode($categoryToursHome['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length'))
				);
		}
        /*  For limoservices */
        $categoriesLimosHome = $this->model_catalog_category->getCategoriesBYcatTP(0,'LS');
        foreach ($categoriesLimosHome as $categoryLimosHome) 
        {
            /* 350X 233 for image  */
            if($categoryLimosHome['image']!='')
            {
                /* sytandard formate
                  $image = $this->model_tool_image->resize($categoryToursHome['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'));*/
                  $image = $this->model_tool_image->getoriganal($categoryLimosHome['image'], 350, 233);   
            }
            else
            {
                 $image = $this->model_tool_image->getoriganal('placeholder.png', 350, 233);
            }
            $data['limoservicecategoriesHome'][] = array(
					'name'     => $categoryLimosHome['name'],
					'column'   => $categoryLimosHome['column'] ? $categoryLimosHome['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $categoryLimosHome['category_id']),
                    'image'    => $image/*$categoryToursHome['image']*/,
                    //'description'    => utf8_substr(strip_tags(html_entity_decode($categoryLimosHome['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..'
                    'description'    => utf8_substr(strip_tags(html_entity_decode($categoryLimosHome['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length'))
				);
		}
         /*Header banner  */
        $this->load->model('design/banner');
		$this->load->model('tool/image');
        $homebanners = $this->model_design_banner->getBanner(9);
        foreach ($homebanners as $homebanner) 
        {
			if (is_file(DIR_IMAGE . $homebanner['image'])) {
				$data['homeBannerheder'][] = array(
					'title' => $homebanner['title'],
					'link'  => $homebanner['link'],
					'image' => $this->model_tool_image->getoriganal($homebanner['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'))
				);
			}
		}
        /*cusvip get all visa product*/
        $url = '';
        $visaproductall = $this->model_catalog_product->getProductByTP('VS');

        foreach($visaproductall as $productss)
        {
            $descripotionhtmlsrt = html_entity_decode($productss['description'], ENT_QUOTES, 'UTF-8');
            $datadescription = preg_replace('/(<[^>]*) style=("[^"]+"|\'[^\']+\')([^>]*>)/i', '$1$3', $descripotionhtmlsrt);
            $data['visaproduct'][] = array(
				'product_id'        => $productss['product_id'],
				'product_tp'        => $productss['product_tp'],
                //'price'             => 'AED '.round($productss['price']),
				'price'             => $price = $this->currency->format($this->tax->calculate($productss['price'], $productss['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']),
				'name'              => $productss['name'],
				/*'description'       => utf8_substr(strip_tags(html_entity_decode($productss['description']  , ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')),*/
                //'description'       => html_entity_decode($productss['description']  , ENT_QUOTES, 'UTF-8'),
                'description'       => $datadescription,
                'href'              => $this->url->link('product/product', 'path=' . $productss['category_id'] . '&product_id=' . $productss['product_id'] . $url),
                'href1'              => $this->url->link('product/visa', 'path=' . $productss['category_id'] . '&product_id=' . $productss['product_id'] . $url)
                /*
                'href'              => $this->url->link('product/category', 'path=' . $productss['product_id'])
                'value'                => $productss['value'],
				'required'             => $productss['required']
                */
			);
        }
        //echo "<pre>";print_r($data['visaproduct']);exit;
        $data['park_product_large'] = $this->model_catalog_product->get_park_products_large('PK');
        $data['park_product_small'] = $this->model_catalog_product->get_park_products_small('PK');
        
        //echo '<pre>';print_r($data['park_product_small']);exit;
        //get the country listing for hotels search engine
        $this->load->model('localisation/country');
        $countryresult = $this->model_localisation_country->getCountries();
        foreach($countryresult as $country){
            $data['countries'][] = array(
                'country_id'        => $country['country_id'],
                'name'              => $country['name'],
            );
        }
        //hotels
        $this->load->model('catalog/hotels');
        $data['hotel_result'] = array();
        $hotel_filter = array();
        $hotelresult = $this->model_catalog_hotels->getProducts($hotel_filter);
        foreach ($hotelresult as $result) {
            if (is_file(DIR_IMAGE . $result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 280, 280);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }

            $special = false;

            
            $data['hotel_result'][] = array(
                'hotel_id'   => $result['product_id'],
                'image'      => $image,
                'name'       => $result['name'],
                'model'      => $result['model'],
                'price'      => $result['price'],
                'special'    => $special,
                'quantity'   => $result['quantity'],
                'location'   => $result['location'],
                'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')
            );
        }
        
		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
