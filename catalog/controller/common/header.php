<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
        
        /*custom add*/
        $data['text_contact'] = $this->language->get('text_contact');
        $data['contact']      = $this->url->link('information/contact');
        /**/
		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
//echo "<pre>dfd";print_r($data['categories']);exit;
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

    /*custom add cusvip*/
       /*For Social Links*/
        $this->load->model('setting/setting');
        $code = "config";
        $slinks = $this->model_setting_setting->getSetting($code);
        //echo "<pre>";print_r($slinks);exit;
        $data['facebook'] = $slinks['config_social_facebook'];
        $data['twitter'] = $slinks['config_social_twitter'];
        $data['youtube'] = $slinks['config_social_youtube'];
        $data['linkedin'] = $slinks['config_social_linkedin'];
        $data['instagram'] = $slinks['config_social_instagram'];
       
       /*For Tours category Menues  */
       $categoriesTours = $this->model_catalog_category->getCategoriesBYcatTP(0,'TE');
     
		foreach ($categoriesTours as $categoryTours) 
        {
		  $data['tourscategories'][] = array(
					'name'     => $categoryTours['name'],
					'column'   => $categoryTours['column'] ? $categoryTours['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $categoryTours['category_id'])
				);
		}
      
      /*For Parks category Menues  */
       $categoriesParks = $this->model_catalog_category->getCategoriesBYcatTP(0,'PK');
     
		foreach ($categoriesParks as $categoryParks) 
        {
		  $data['parkscategories'][] = array(
					'name'     => $categoryParks['name'],
					'column'   => $categoryParks['column'] ? $categoryParks['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $categoryParks['category_id'])
				);
		}
          /*For Limo service category Menues  */
       $categoriesLimos = $this->model_catalog_category->getCategoriesBYcatTP(0,'LS');
       foreach ($categoriesLimos as $categoryLimos) 
        {
		  $data['limoservicecategories'][] = array(
					'name'     => $categoryLimos['name'],
					'column'   => $categoryLimos['column'] ? $categoryLimos['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $categoryLimos['category_id'])
				);
		}
       
       /*For Tours category Menues  */
        $Visaproduct = $this->model_catalog_product->getProductByTP('VS');
        //echo "<pre>";print_r($Visaproduct);exit;
        $url = '';
        foreach($Visaproduct as $productss)
        {
            
            $data['visaproductmenu'][] = array(
				'name'              => $productss['name'],
				'href'              => $this->url->link('product/product', 'path=' . $productss['category_id'] . '&product_id=' . $productss['product_id'] . $url),
            );
        }
        

        
/*close*/

		// For page specific css
		if (isset($this->request->get['route'])) {
            
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}


			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}
        //echo "<pre>";print_r($data['class']);exit;
        $mainclass  =  explode('-',trim($data['class']));
        //echo "<pre>";print_r($mainclass);exit;
        
        $slug2 = $mainclass[1]; 
        
         /*  header top cusvip
            identityfication mated for $class is 
            home page  --common-home 
            category p[age-  product-category-66]
            productpage-  product-category-66
        */
        $this->load->model('design/banner');
    	$this->load->model('tool/image');
        if($data['class']=='common-home')
        {
            /*Header banner for home page */
            $data['pagetypectrl'] ='home';
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
            //echo "<pre>";print_r($data['homeBannerheder']);exit;
        }
        else if($slug2=='cart')
        {
            $data['pagetypectrl'] ='home';
            $viewcarts = $this->model_design_banner->getBanner(11);
            foreach($viewcarts as $viewcartsbanner)
                {    
                    if (is_file(DIR_IMAGE . $viewcartsbanner['image'])) 
                    {
        				$data['ProductCategoryBanners'][] = array(
        					'image' => $this->model_tool_image->getoriganal($viewcartsbanner['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'categoryname' =>$viewcartsbanner['name']
        				);
        			}
                }
        }
        else if($slug2=='checkout')
        {
            $data['pagetypectrl'] ='home';
            $checkoutbanner = $this->model_design_banner->getBanner(12);
             foreach($checkoutbanner as $checkoutbannerss)
                {    
                    if (is_file(DIR_IMAGE . $checkoutbannerss['image'])) 
                    {
        				$data['ProductCategoryBanners'][] = array(
        					'image' => $this->model_tool_image->getoriganal($checkoutbannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'categoryname' =>$checkoutbannerss['name']
        				);
        			}
                } 
        }
        else if($slug2=='category')
        {
            $data['pagetypectrl'] ='category';
            /*Inner page for category or product page*/
                $CategoryBanner = $this->model_catalog_category->getCategoryBannerImages($mainclass[2]);
                //echo "<pre>";print_r($CategoryBanner);
                $data['ProductCategoryBanners']  ='';
                foreach($CategoryBanner as $CategoryBannerss)
                {    
                	$data['ProductCategoryBanners'] = [];
                    if (is_file(DIR_IMAGE . $CategoryBannerss['image'])) 
                    {
        				$data['ProductCategoryBanners'][] = array(
        					'image' => $this->model_tool_image->getoriganal($CategoryBannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'categoryname' =>$CategoryBannerss['name']
        				);
        			}
                } 
                //echo "<pre>";print_r($data['ProductCategoryBanners']);exit;   
        }
        else if($slug2=='product')
        {
            $data['pagetypectrl'] ='product';
            /*first find the product type product_tp */
            $productcu_tp  = $this->model_catalog_product->getProductTpByPID($mainclass[2]);
            if($productcu_tp[0]['product_tp']=='VS')
            {
               /* $homebanners = $this->model_design_banner->getBanner(10);
                foreach ($homebanners as $homebanner) 
                {
        			if (is_file(DIR_IMAGE . $homebanner['image'])) {
        				$data['ProductCategoryBanners'][] = array(
        					'categoryname'  => $homebanner['name'],
        					'image' => $this->model_tool_image->getoriganal($homebanner['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height'))
        				);
        			}
        		}
                */
                 $data['pagetypectrl'] ='innerpage';
                /*Inner page for category or product page*/ 
                $data['images'] = array();
                //$data['ProductCategoryBanners'] = array();
                $data['ProductCategoryBanners']  ='';
    			//$ProductBanner = $this->model_catalog_product->getProductImages($mainclass[2]);
                $ProductBanner = $this->model_catalog_product->getProductImagesBannerName($mainclass[2]);
                //echo "<pre>";print_r($ProductBanner);exit;
                foreach ($ProductBanner as $ProductBannerss) 
                {
    				if (is_file(DIR_IMAGE . $ProductBannerss['image'])) 
                        {
            				$data['ProductCategoryBanners'][] = array(
            					'image' => $this->model_tool_image->getoriganal($ProductBannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                                'categoryname' =>'Visa Type'//$ProductBannerss['name']
            				);
            			}
                    
    			}    
            }
            else
            {    
                $data['pagetypectrl'] ='innerpage';
                /*Inner page for category or product page*/ 
                $data['images'] = array();
                //$data['ProductCategoryBanners'] = array();
                $data['ProductCategoryBanners']  ='';
    			//$ProductBanner = $this->model_catalog_product->getProductImages($mainclass[2]);
                $ProductBanner = $this->model_catalog_product->getProductImagesBannerName($mainclass[2]);
                //echo "<pre>";print_r($ProductBanner);exit;
                foreach ($ProductBanner as $ProductBannerss) 
                {
                	$data['ProductCategoryBanners'] = [];
    				if (is_file(DIR_IMAGE . $ProductBannerss['image'])) 
                        {
            				$data['ProductCategoryBanners'][] = array(
            					'image' => $this->model_tool_image->getoriganal($ProductBannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                                'categoryname' =>$ProductBannerss['name']
            				);
            			}
                    
    			}
             }  
        }
        else if($slug2=='hotels'){
            $data['pagetypectrl'] ='innerpage';
            /*Inner page for category or product page*/ 
            $data['images'] = array();
            $data['ProductCategoryBanners']  ='';
            $ProductBanner = $this->model_design_banner->getBanner(13);            
            foreach ($ProductBanner as $ProductBannerss){
                if (is_file(DIR_IMAGE . $ProductBannerss['image'])) 
                    {
                        $data['ProductCategoryBanners'][] = array(
                            'image' => $this->model_tool_image->getoriganal($ProductBannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'categoryname' =>$ProductBannerss['name']
                        );
                    }
                    
            }           
           
        }else if($slug2=='standardpackage'){
            $data['pagetypectrl'] ='innerpage';
            /*Inner page for category or product page*/ 
            $data['images'] = array();
            $data['ProductCategoryBanners']  ='';
            $ProductBanner = $this->model_design_banner->getBanner(14);            
            foreach ($ProductBanner as $ProductBannerss){
                if (is_file(DIR_IMAGE . $ProductBannerss['image'])) 
                    {
                        $data['ProductCategoryBanners'][] = array(
                            'image' => $this->model_tool_image->getoriganal($ProductBannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'categoryname' =>$ProductBannerss['name']
                        );
                    }
                    
            }  
        }else if($slug2=='makepackage'){
            $data['pagetypectrl'] ='innerpage';
            /*Inner page for category or product page*/ 
            $data['images'] = array();
            $data['ProductCategoryBanners']  ='';
            $ProductBanner = $this->model_design_banner->getBanner(15);            
            foreach ($ProductBanner as $ProductBannerss){
                if (is_file(DIR_IMAGE . $ProductBannerss['image'])) 
                    {
                        $data['ProductCategoryBanners'][] = array(
                            'image' => $this->model_tool_image->getoriganal($ProductBannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'categoryname' =>$ProductBannerss['name']
                        );
                    }
                    
            }  
        }else if($slug2=='search'){
            $data['pagetypectrl'] ='innerpage';
            /*Inner page for category or product page*/ 
            $data['images'] = array();
            $data['ProductCategoryBanners']  ='';
            $ProductBanner = $this->model_design_banner->getBanner(16);            
            foreach ($ProductBanner as $ProductBannerss){
                if (is_file(DIR_IMAGE . $ProductBannerss['image'])) 
                    {
                        $data['ProductCategoryBanners'][] = array(
                            'image' => $this->model_tool_image->getoriganal($ProductBannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'categoryname' =>$ProductBannerss['name']
                        );
                    }
                    
            }  
        }
        else if($slug2=='information' ||$slug2=='contact' ||$slug2=='career' )
        {
            $data['pagetypectrl'] ='information';
        }else if($slug2=='about')
        {
            $data['pagetypectrl'] ='about';

            $data['images'] = array();
            $data['ProductCategoryBanners']  ='';
            $ProductBanner = $this->model_design_banner->getBanner(17);            
            foreach ($ProductBanner as $ProductBannerss){
            	$data['ProductCategoryBanners'] = [];
                if (is_file(DIR_IMAGE . $ProductBannerss['image'])) 
                    {
                        $data['ProductCategoryBanners'][] = array(
                            'image' => $this->model_tool_image->getoriganal($ProductBannerss['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
                            'categoryname' =>$ProductBannerss['name']
                        );
                    }
                    
            }  

        }
        else
        {
            /* for any page like information or checkout cart anything */
            $data['ProductCategoryBanners']  = '';
            $data['pagetypectrl']            = '';
        }
        $data['currencysymbol'] = $this->currency->getSymbolLeft($this->session->data['currency']);
        //echo "<pre>";print_r($data['ProductCategoryBanners']);exit;
        return $this->load->view('common/header', $data);
	}
}
