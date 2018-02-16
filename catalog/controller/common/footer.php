<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
        $this->load->model('catalog/information');
        $data['informations'] = array();
        foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}
        $data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}
        
        /*visa menu*/
        // Menu
		$this->load->model('catalog/category');
        $this->load->model('catalog/product');
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
        
        //$tourmenu = $this->model_catalog_product->getProductByTPwithCategory('TE');
        $desrttour      = $this->model_catalog_product->getProductByTPandID(71,'TE');//71 
        $dhow           = $this->model_catalog_product->getProductByTPandID(72,'TE');//72 
        $sight          = $this->model_catalog_product->getProductByTPandID(73,'TE');//73 
        $comobo         = $this->model_catalog_product->getProductByTPandID(78,'TE');//78  
        $aerial         = $this->model_catalog_product->getProductByTPandID(77,'TE');//77 
        $watersport     = $this->model_catalog_product->getProductByTPandID(82,'TE');//82 
        
        $waterpark         = $this->model_catalog_product->getProductByTPandID(75,'PK');//77 ,76
        $themepark         = $this->model_catalog_product->getProductByTPandID(76,'PK');//82 
        
        $limoservice       = $this->model_catalog_product->getProductByTPandID(69,'LS');//77 ,76
        $airporttransfer   = $this->model_catalog_product->getProductByTPandID(70,'LS');//82 , 
        
        foreach($limoservice as $detour)
        {
            $data['limoservice'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        foreach($airporttransfer as $detour)
        {
            $data['airporttransfer'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        
        foreach($waterpark as $detour)
        {
            $data['waterpark'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        foreach($themepark as $detour)
        {
            $data['themepark'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        foreach($desrttour as $detour)
        {
            $data['desrttour'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        foreach($dhow as $detour)
        {
            $data['dhow'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        foreach($sight as $detour)
        {
            $data['sight'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        foreach($comobo as $detour)
        {
            $data['comobo'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        foreach($aerial as $detour)
        {
            $data['aerial'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        foreach($watersport as $detour)
        {
            $data['watersport'][] = array(
				'name'              => $detour['name'],
				'href'              => $this->url->link('product/product', 'path=' . $detour['category_id'] . '&product_id=' . $detour['product_id'] . $url),
            );
        }
        $data['telephone'] = $this->config->get('config_telephone');
        
         /*  For tour on footer  */
        $categoriesToursHome = $this->model_catalog_category->getCategoriesBYcatTP(0,'TE');
        
        foreach ($categoriesToursHome as $categoryToursHome) 
        {
            $data['tourscategoriesHome'][] = array(
					'name'     => $categoryToursHome['name'],
					'href'     => $this->url->link('product/category', 'path=' . $categoryToursHome['category_id']),
                );
		}
        $categoriesParkHome = $this->model_catalog_category->getCategoriesBYcatTP(0,'PK');
        foreach ($categoriesParkHome as $categoryParkHome) 
        {
            $data['parkscategoriesHome'][] = array(
					'name'     => $categoryParkHome['name'],
					'href'     => $this->url->link('product/category', 'path=' . $categoryParkHome['category_id']),
                );
		}
        $categoriesLSHome = $this->model_catalog_category->getCategoriesBYcatTP(0,'LS');
        foreach ($categoriesLSHome as $categoryLSHome) 
        {
            $data['lscategoriesHome'][] = array(
					'name'     => $categoryLSHome['name'],
					'href'     => $this->url->link('product/category', 'path=' . $categoryLSHome['category_id']),
                );
		}
        
        $this->load->model('setting/setting');
        $code = "config";
        $slinks = $this->model_setting_setting->getSetting($code);
        //echo "<pre>";print_r($slinks);exit;
        $data['facebook'] = $slinks['config_social_facebook'];
        $data['twitter'] = $slinks['config_social_twitter'];
        $data['youtube'] = $slinks['config_social_youtube'];
        $data['linkedin'] = $slinks['config_social_linkedin'];
        $data['instagram'] = $slinks['config_social_instagram'];
        /*
        echo "<pre>";print_r($touremenu);exit;
        foreach($tourmenu as $tmenu1)
        {
            $cateanmes[] = $tmenu1['catename'];
        }
        
        //print_r($cateid);
        print_r(array_unique($cateanmes));
        foreach($cateanmes as $cname)
        {
            foreach($tourmenu as $filter)
            {
                echo $cname;
                if($cname==$filter['catename'])
                {
                    $data['touremenu'][$cname][] =array(
                    "catename" =>$filter['catename'],
                    "category_id" =>$filter['category_id'],
                    "product_id" =>$filter['product_id'],
                    "name" => $filter['name'],
                    );
                }    
            }
        }
        //print_r($data['touremenu']);
        exit; */
		return $this->load->view('common/footer', $data);
	}
}
