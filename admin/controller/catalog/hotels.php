<?php
class ControllerCatalogHotels extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/hotels');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/hotels');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/hotels');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/hotels');
//echo"<pre>";print_r($this->request->get);exit;
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			/*echo "<pre/>";
			print_r($this->request->post);exit;*/
			$this->model_catalog_hotels->addProduct($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
            
            /*cusvip  add custom */
            if (isset($this->request->get['filter_category'])) {
				$url .= '&filter_category=' . $this->request->get['filter_category'];
			}
            if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}
            
            
            
            
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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

			$this->response->redirect($this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		
        $this->load->language('catalog/hotels');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/hotels');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
		  
          /*	echo "<pre/>";
          	print_r($this->request->post);exit;*/
			$this->model_catalog_hotels->editProduct($this->request->get['hotel_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
            
            /*cusvip  add custom */
            if (isset($this->request->get['filter_category'])) {
				$url .= '&filter_category=' . $this->request->get['filter_category'];
			}
            if (isset($this->request->get['filter_category_id'])) {
				
                $url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}
            
            

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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
            
   

			$this->response->redirect($this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/hotels');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/hotels');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $hotel_id) {
				$this->model_catalog_hotels->deleteProduct($hotel_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
            
            
            /*cusvip  add custom */
            if (isset($this->request->get['filter_category'])) {
				$url .= '&filter_category=' . $this->request->get['filter_category'];
			}
            if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}
            
            

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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

			$this->response->redirect($this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	public function copy() {
		$this->load->language('catalog/hotels');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/hotels');

		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $hotel_id) {
				$this->model_catalog_hotels->copyProduct($hotel_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
            
            
            /*cusvip  add custom */
            if (isset($this->request->get['filter_category'])) {
				$url .= '&filter_category=' . $this->request->get['filter_category'];
			}
            if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}
            
            

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
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

			$this->response->redirect($this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
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

		if (isset($this->request->get['filter_quantity'])) {
			$filter_quantity = $this->request->get['filter_quantity'];
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

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}
        
        /*cusvip  add custom */
        if (isset($this->request->get['filter_category'])) {
			$url .= '&filter_category=' . $this->request->get['filter_category'];
		}
        if (isset($this->request->get['filter_category_id'])) {
			$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
		}
        
		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_image'])) {
			$url .= '&filter_image=' . $this->request->get['filter_image'];
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/hotels/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['copy'] = $this->url->link('catalog/hotels/copy', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/hotels/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['hotels'] = array();

		$filter_data = array(
			'filter_name'	  => $filter_name,
			'filter_model'	  => $filter_model,
			'filter_price'	  => $filter_price,
			'filter_quantity' => $filter_quantity,
            
            /*cusvip  add custom */
            'filter_category' => $filter_category,
			'filter_category_id' => $filter_category_id,
            
            'filter_status'   => $filter_status,
			'filter_image'    => $filter_image,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin')
		);

		$this->load->model('tool/image');

		$hotel_total = $this->model_catalog_hotels->getTotalProducts($filter_data);
		
		$results = $this->model_catalog_hotels->getProducts($filter_data);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 40, 40);
			}

			$special = false;

			$hotel_specials = $this->model_catalog_hotels->getProductSpecials($result['product_id']);

			foreach ($hotel_specials  as $hotel_special) {
				if (($hotel_special['date_start'] == '0000-00-00' || strtotime($hotel_special['date_start']) < time()) && ($hotel_special['date_end'] == '0000-00-00' || strtotime($hotel_special['date_end']) > time())) {
					$special = $hotel_special['price'];

					break;
				}
			}

			$data['hotels'][] = array(
				'hotel_id' => $result['product_id'],
				'image'      => $image,
				'name'       => $result['name'],
				'model'      => $result['model'],
				'price'      => $result['price'],
				'special'    => $special,
				'quantity'   => $result['quantity'],
				'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'edit'       => $this->url->link('catalog/hotels/edit', 'token=' . $this->session->data['token'] . '&hotel_id=' . $result['product_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_price'] = $this->language->get('column_price');
		$data['column_quantity'] = $this->language->get('column_quantity');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_model'] = $this->language->get('entry_model');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_quantity'] = $this->language->get('entry_quantity');
        
        
        /*custom add*/
        $data['entry_category'] = $this->language->get('entry_category');
        
        
        
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_image'] = $this->language->get('entry_image');

		$data['button_copy'] = $this->language->get('button_copy');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_image'])) {
			$url .= '&filter_image=' . $this->request->get['filter_image'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, true);
		$data['sort_model'] = $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . '&sort=p.model' . $url, true);
		$data['sort_price'] = $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . '&sort=p.price' . $url, true);
		$data['sort_quantity'] = $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . '&sort=p.quantity' . $url, true);
		$data['sort_status'] = $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, true);
		$data['sort_order'] = $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_image'])) {
			$url .= '&filter_image=' . $this->request->get['filter_image'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $hotel_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($hotel_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($hotel_total - $this->config->get('config_limit_admin'))) ? $hotel_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $hotel_total, ceil($hotel_total / $this->config->get('config_limit_admin')));

		$data['filter_name'] = $filter_name;
		$data['filter_model'] = $filter_model;
		$data['filter_price'] = $filter_price;
		$data['filter_quantity'] = $filter_quantity;
        
        
        /*custom cus vip add*/
        $data['filter_category'] = $filter_category;
        $data['filter_category_id'] = $filter_category_id;
        
        
        
		$data['filter_status'] = $filter_status;
		$data['filter_image'] = $filter_image;

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/hotel_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['hotel_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_plus'] = $this->language->get('text_plus');
		$data['text_minus'] = $this->language->get('text_minus');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_option'] = $this->language->get('text_option');
		$data['text_option_value'] = $this->language->get('text_option_value');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_model'] = $this->language->get('entry_model');
		$data['entry_sku'] = $this->language->get('entry_sku');
		$data['entry_upc'] = $this->language->get('entry_upc');
		$data['entry_ean'] = $this->language->get('entry_ean');
		$data['entry_jan'] = $this->language->get('entry_jan');
		$data['entry_isbn'] = $this->language->get('entry_isbn');
		$data['entry_mpn'] = $this->language->get('entry_mpn');
		$data['entry_location'] = $this->language->get('entry_location');
		$data['entry_minimum'] = $this->language->get('entry_minimum');
		$data['entry_shipping'] = $this->language->get('entry_shipping');
		$data['entry_date_available'] = $this->language->get('entry_date_available');
		$data['entry_quantity'] = $this->language->get('entry_quantity');
        
        
        /*custom add*/
        $data['entry_category'] = $this->language->get('entry_category');        
        $data['market_label'] 	= $this->language->get('market_label');
        $data['tab_facility'] 	= $this->language->get('tab_facility');
        $data['tab_address'] 	= $this->language->get('tab_address');
        $data['tab_category'] 	= $this->language->get('tab_category');
        $data['tab_booking_period'] = $this->language->get('tab_booking_period');
        $data['tab_meal_plan'] 	= $this->language->get('tab_meal_plan');        
        $data['entry_black_out_dates'] 	= $this->language->get('entry_black_out_dates');
        $data['entry_room_name'] 	= $this->language->get('entry_room_name');
        $data['entry_room_type'] 	= $this->language->get('entry_room_type');
        $data['entry_stay_period'] 	= $this->language->get('entry_stay_period');
        $data['entry_booking_period'] 	= $this->language->get('entry_booking_period');
        $data['entry_info_ebd'] 	= $this->language->get('entry_info_ebd');
        $data['entry_room_rate'] 	= $this->language->get('entry_room_rate');
        $data['entry_discount'] 	= $this->language->get('entry_discount');
        $data['entry_adult'] 		= $this->language->get('entry_adult');
        $data['entry_child'] 		= $this->language->get('entry_child');
        $data['entry_meals_option'] 	= $this->language->get('entry_meals_option');
        $data['entry_meals_type'] 	= $this->language->get('entry_meals_type');
        $data['entry_half_board'] 	= $this->language->get('entry_half_board');
        $data['entry_full_board'] 	= $this->language->get('entry_full_board');
        $data['entry_meals_not_available'] 	= $this->language->get('entry_meals_not_available');
        $data['entry_HB'] 			= $this->language->get('entry_HB');
        $data['entry_FB'] 			= $this->language->get('entry_FB');
        $data['btn_add_roomtype'] 	= $this->language->get('btn_add_roomtype');
        $data['help_discount'] 		= $this->language->get('help_discount');
        $data['help_rate'] 			= $this->language->get('help_rate');
        $data['entry_facility_options'] = $this->language->get('entry_facility_options');
        $data['btn_add_meals'] = $this->language->get('btn_add_meals');
        $data['entry_star_rating']  = $this->language->get('entry_star_rating');
        $data['entry_emirate']     	= $this->language->get('entry_emirate');
        $data['entry_map']     		= $this->language->get('entry_map');
        $data['entry_address']     	= $this->language->get('entry_address');
        $data['entry_instant_confirmation'] = $this->language->get('entry_instant_confirmation');
        
        
		$data['entry_stock_status'] = $this->language->get('entry_stock_status');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_points'] = $this->language->get('entry_points');
		$data['entry_option_points'] = $this->language->get('entry_option_points');
		$data['entry_subtract'] = $this->language->get('entry_subtract');
		$data['entry_weight_class'] = $this->language->get('entry_weight_class');
		$data['entry_weight'] = $this->language->get('entry_weight');
		$data['entry_dimension'] = $this->language->get('entry_dimension');
		$data['entry_length_class'] = $this->language->get('entry_length_class');
		$data['entry_length'] = $this->language->get('entry_length');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_additional_image'] = $this->language->get('entry_additional_image');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$data['entry_download'] = $this->language->get('entry_download');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_related'] = $this->language->get('entry_related');
		$data['entry_attribute'] = $this->language->get('entry_attribute');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_option'] = $this->language->get('entry_option');
		
		
        if (isset($this->request->get['filter_category_id'])) 
        {
            if($this->request->get['filter_category_id'])
            {
                $data['entry_option_value'] = "Hours";
            }    
        }
		$data['entry_required'] = $this->language->get('entry_required');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_priority'] = $this->language->get('entry_priority');
		$data['entry_tag'] = $this->language->get('entry_tag');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_reward'] = $this->language->get('entry_reward');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_recurring'] = $this->language->get('entry_recurring');

		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_sku'] = $this->language->get('help_sku');
		$data['help_upc'] = $this->language->get('help_upc');
		$data['help_ean'] = $this->language->get('help_ean');
		$data['help_jan'] = $this->language->get('help_jan');
		$data['help_isbn'] = $this->language->get('help_isbn');
		$data['help_mpn'] = $this->language->get('help_mpn');
		$data['help_minimum'] = $this->language->get('help_minimum');
		$data['help_manufacturer'] = $this->language->get('help_manufacturer');
		$data['help_stock_status'] = $this->language->get('help_stock_status');
		$data['help_points'] = $this->language->get('help_points');
		$data['help_category'] = $this->language->get('help_category');
		$data['help_filter'] = $this->language->get('help_filter');
		$data['help_download'] = $this->language->get('help_download');
		$data['help_related'] = $this->language->get('help_related');
		$data['help_tag'] = $this->language->get('help_tag');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_attribute_add'] = $this->language->get('button_attribute_add');
		$data['button_option_add'] = $this->language->get('button_option_add');
		$data['button_option_value_add'] = $this->language->get('button_option_value_add');
		$data['button_discount_add'] = $this->language->get('button_discount_add');
		$data['button_special_add'] = $this->language->get('button_special_add');
		$data['button_image_add'] = $this->language->get('button_image_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_recurring_add'] = $this->language->get('button_recurring_add');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_attribute'] = $this->language->get('tab_attribute');
		$data['tab_option'] = $this->language->get('tab_option');
		$data['tab_recurring'] = $this->language->get('tab_recurring');
		$data['tab_discount'] = $this->language->get('tab_discount');
		$data['tab_special'] = $this->language->get('tab_special');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['tab_links'] = $this->language->get('tab_links');
		$data['tab_reward'] = $this->language->get('tab_reward');
		$data['tab_design'] = $this->language->get('tab_design');
		$data['tab_openbay'] = $this->language->get('tab_openbay');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['model'])) {
			$data['error_model'] = $this->error['model'];
		} else {
			$data['error_model'] = '';
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['hotel_id'])) {  
			$data['action'] = $this->url->link('catalog/hotels/add', 'token=' . $this->session->data['token'] . $url, true);
            /*custom add for url set in add case */
            /*$data['action'] = $this->url->link('catalog/hotels/add', 'token=' . $this->session->data['token'] . '&filter_category_id=' . $this->request->get['filter_category_id'] . $url, true);*/
		} else {
		  /* $data['action'] = $this->url->link('catalog/visa/edit', 'token=' . $this->session->data['token'] . '&visa_id=' . $this->request->get['visa_id'] . $url, true);*/
          /*custom add for url set in edit case*/
          /* $data['action'] = $this->url->link('catalog/hotels/edit', 'token=' . $this->session->data['token'] . '&hotel_id=' . $this->request->get['hotel_id']. '&filter_category_id=' . $this->request->get['filter_category_id'] . $url, true);*/
           $data['action'] = $this->url->link('catalog/hotels/edit', 'token=' . $this->session->data['token'] . '&hotel_id=' . $this->request->get['hotel_id']. $url, true);
            
		}

		$data['cancel'] = $this->url->link('catalog/hotels', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['hotel_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$hotel_info = $this->model_catalog_hotels->getProduct($this->request->get['hotel_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['hotel_description'])) {
			$data['hotel_description'] = $this->request->post['hotel_description'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$data['hotel_description'] = $this->model_catalog_hotels->getProductDescriptions($this->request->get['hotel_id']);
		} else {
			$data['hotel_description'] = array();
		}

		if (isset($this->request->post['model'])) {
			$data['model'] = $this->request->post['model'];
		} elseif (!empty($hotel_info)) {
			$data['model'] = $hotel_info['model'];
		} else {
			$data['model'] = '';
		}

		if (isset($this->request->post['sku'])) {
			$data['sku'] = $this->request->post['sku'];
		} elseif (!empty($hotel_info)) {
			$data['sku'] = $hotel_info['sku'];
		} else {
			$data['sku'] = '';
		}

		if (isset($this->request->post['upc'])) {
			$data['upc'] = $this->request->post['upc'];
		} elseif (!empty($hotel_info)) {
			$data['upc'] = $hotel_info['upc'];
		} else {
			$data['upc'] = '';
		}

		if (isset($this->request->post['ean'])) {
			$data['ean'] = $this->request->post['ean'];
		} elseif (!empty($hotel_info)) {
			$data['ean'] = $hotel_info['ean'];
		} else {
			$data['ean'] = '';
		}

		if (isset($this->request->post['jan'])) {
			$data['jan'] = $this->request->post['jan'];
		} elseif (!empty($hotel_info)) {
			$data['jan'] = $hotel_info['jan'];
		} else {
			$data['jan'] = '';
		}

		if (isset($this->request->post['isbn'])) {
			$data['isbn'] = $this->request->post['isbn'];
		} elseif (!empty($hotel_info)) {
			$data['isbn'] = $hotel_info['isbn'];
		} else {
			$data['isbn'] = '';
		}

		if (isset($this->request->post['mpn'])) {
			$data['mpn'] = $this->request->post['mpn'];
		} elseif (!empty($hotel_info)) {
			$data['mpn'] = $hotel_info['mpn'];
		} else {
			$data['mpn'] = '';
		}

		if (isset($this->request->post['location'])) {
			$data['location'] = $this->request->post['location'];
		} elseif (!empty($hotel_info)) {
			$data['location'] = $hotel_info['location'];
		} else {
			$data['location'] = '';
		}

		/*if (isset($this->request->post['emirate'])) {
			$data['emirate'] = $this->request->post['emirate'];
		} elseif (!empty($hotel_info)) {
			$data['emirate'] = $hotel_info['emirate'];
		} else {
			$data['emirate'] = '';
		}

		if (isset($this->request->post['map'])) {
			$data['map'] = $this->request->post['map'];
		} elseif (!empty($hotel_info)) {
			$data['map'] = $hotel_info['map'];
		} else {
			$data['map'] = '';
		}*/

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['hotel_store'])) {
			$data['hotel_store'] = $this->request->post['hotel_store'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$data['hotel_store'] = $this->model_catalog_hotels->getProductStores($this->request->get['hotel_id']);
		} else {
			$data['hotel_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($hotel_info)) {
			$data['keyword'] = $hotel_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['shipping'])) {
			$data['shipping'] = $this->request->post['shipping'];
		} elseif (!empty($hotel_info)) {
			$data['shipping'] = $hotel_info['shipping'];
		} else {
			$data['shipping'] = 1;
		}

		if (isset($this->request->post['price'])) {
			$data['price'] = $this->request->post['price'];
		} elseif (!empty($hotel_info)) {
			$data['price'] = $hotel_info['price'];
		} else {
			$data['price'] = '';
		}

		$this->load->model('catalog/recurring');

		$data['recurrings'] = $this->model_catalog_recurring->getRecurrings();
//echo "<pre>";print_r($visa_info);exit;
		if (isset($this->request->post['hotel_recurrings'])) {
			$data['hotel_recurrings'] = $this->request->post['hotel_recurrings'];
		} elseif (!empty($hotel_info)) {
			$data['hotel_recurrings'] = $this->model_catalog_hotels->getRecurrings($hotel_info['product_id']);
		} else {
			$data['hotel_recurrings'] = array();
		}

		$this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		if (isset($this->request->post['tax_class_id'])) {
			$data['tax_class_id'] = $this->request->post['tax_class_id'];
		} elseif (!empty($hotel_info)) {
			$data['tax_class_id'] = $hotel_info['tax_class_id'];
		} else {
			$data['tax_class_id'] = 0;
		}

		if (isset($this->request->post['date_available'])) {
			$data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($hotel_info)) {
			$data['date_available'] = ($hotel_info['date_available'] != '0000-00-00') ? $hotel_info['date_available'] : '';
		} else {
			$data['date_available'] = date('Y-m-d');
		}

		if (isset($this->request->post['quantity'])) {
			$data['quantity'] = $this->request->post['quantity'];
		} elseif (!empty($hotel_info)) {
			$data['quantity'] = $hotel_info['quantity'];
		} else {
			$data['quantity'] = 1;
		}

		if (isset($this->request->post['minimum'])) {
			$data['minimum'] = $this->request->post['minimum'];
		} elseif (!empty($hotel_info)) {
			$data['minimum'] = $hotel_info['minimum'];
		} else {
			$data['minimum'] = 1;
		}

		if (isset($this->request->post['subtract'])) {
			$data['subtract'] = $this->request->post['subtract'];
		} elseif (!empty($hotel_info)) {
			$data['subtract'] = $hotel_info['subtract'];
		} else {
			$data['subtract'] = 1;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($hotel_info)) {
			$data['sort_order'] = $hotel_info['sort_order'];
		} else {
			$data['sort_order'] = 1;
		}

		$this->load->model('localisation/stock_status');

		$data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		if (isset($this->request->post['stock_status_id'])) {
			$data['stock_status_id'] = $this->request->post['stock_status_id'];
		} elseif (!empty($hotel_info)) {
			$data['stock_status_id'] = $hotel_info['stock_status_id'];
		} else {
			$data['stock_status_id'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($hotel_info)) {
			$data['status'] = $hotel_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['weight'])) {
			$data['weight'] = $this->request->post['weight'];
		} elseif (!empty($hotel_info)) {
			$data['weight'] = $hotel_info['weight'];
		} else {
			$data['weight'] = '';
		}

		$this->load->model('localisation/weight_class');

		$data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		if (isset($this->request->post['weight_class_id'])) {
			$data['weight_class_id'] = $this->request->post['weight_class_id'];
		} elseif (!empty($hotel_info)) {
			$data['weight_class_id'] = $hotel_info['weight_class_id'];
		} else {
			$data['weight_class_id'] = $this->config->get('config_weight_class_id');
		}

		if (isset($this->request->post['length'])) {
			$data['length'] = $this->request->post['length'];
		} elseif (!empty($hotel_info)) {
			$data['length'] = $hotel_info['length'];
		} else {
			$data['length'] = '';
		}

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($hotel_info)) {
			$data['width'] = $hotel_info['width'];
		} else {
			$data['width'] = '';
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($hotel_info)) {
			$data['height'] = $hotel_info['height'];
		} else {
			$data['height'] = '';
		}

		$this->load->model('localisation/length_class');

		$data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

		if (isset($this->request->post['length_class_id'])) {
			$data['length_class_id'] = $this->request->post['length_class_id'];
		} elseif (!empty($hotel_info)) {
			$data['length_class_id'] = $hotel_info['length_class_id'];
		} else {
			$data['length_class_id'] = $this->config->get('config_length_class_id');
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->post['manufacturer_id'])) {
			$data['manufacturer_id'] = $this->request->post['manufacturer_id'];
		} elseif (!empty($hotel_info)) {
			$data['manufacturer_id'] = $hotel_info['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = 0;
		}

		if (isset($this->request->post['manufacturer'])) {
			$data['manufacturer'] = $this->request->post['manufacturer'];
		} elseif (!empty($hotel_info)) {
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($hotel_info['manufacturer_id']);

			if ($manufacturer_info) {
				$data['manufacturer'] = $manufacturer_info['name'];
			} else {
				$data['manufacturer'] = '';
			}
		} else {
			$data['manufacturer'] = '';
		}

		// Categories
		$this->load->model('catalog/hotel_category');

		if (isset($this->request->post['hotel_category'])) { 
			$categories = $this->request->post['hotel_category'];
		} elseif (isset($this->request->get['hotel_id'])) {
		    $categories = $this->model_catalog_hotels->getProductCategories($this->request->get['hotel_id']);
		} else {
			$categories = array();
		}
        
		/*create new variable for category link to the product 69 -> LIMOUSINE SERVICES  AND  70 -> AIRPORT TRANSFER*/
        /* custom variable intilize */
        $data['link_catedgory_id'] = '';
        /*Acording to url setting this parameter always get and this functionalty is set in xml fixed url paramerter*/
        if(isset($this->request->get['filter_category_id']))
        {
            $data['link_catedgory_id']  = $this->request->get['filter_category_id'];
            /*so link_catedgory_id */ 
        }
        
		$data['product_categories'] = array();
//echo "<pre>";print_r($categories);
		foreach ($categories as $category_id) {
			$category_info = $this->model_catalog_hotel_category->getCategory($category_id);

			if ($category_info) {
				$data['product_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
				);
			}
		}
		
		$data['room_categories'] = array();	
		
		if (isset($this->request->post['hotel_roomtype'])) {
			$data['room_categories'] = $this->request->post['hotel_roomtype'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$data['room_categories'] = $this->model_catalog_hotels->getHotelRoomOptions($this->request->get['hotel_id']);
		} else {
			$data['room_categories'] = array();
		}
		
		/* main hotel facility listing */
		//$data['facility_selected'] = array();

		/*$this->load->model('catalog/hotel_facility');
		$facility_data = $this->model_catalog_hotel_facility->getCategories();
		if($facility_data){
			foreach ($facility_data as $facility) {
				$data['facility_selected'][] = array(
						'facility_id' => $facility['category_id'],
						'facility_name'=> $facility['name']
				);
			}
		}*/
//echo "<pre>";print_r($data['facility_main']);exit;
		// Filters
		$this->load->model('catalog/filter');

		if (isset($this->request->post['hotel_filter'])) {
			$filters = $this->request->post['hotel_filter'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$filters = $this->model_catalog_hotels->getProductFilters($this->request->get['hotel_id']);
		} else {
			$filters = array();
		}

		$data['hotel_filters'] = array();

		foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);

			if ($filter_info) {
				$data['hotel_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}

		// Attributes
		$this->load->model('catalog/attribute');

		if (isset($this->request->post['hotel_attribute'])) {
			$hotel_attributes = $this->request->post['hotel_attribute'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$hotel_attributes = $this->model_catalog_hotels->getProductAttributes($this->request->get['hotel_id']);
		} else {
			$hotel_attributes = array();
		}

		$data['hotel_attributes'] = array();

		foreach ($hotel_attributes as $hotel_attribute) {
			$attribute_info = $this->model_catalog_attribute->getAttribute($hotel_attribute['attribute_id']);

			if ($attribute_info) {
				$data['hotel_attributes'][] = array(
					'attribute_id'                  => $hotel_attribute['attribute_id'],
					'name'                          => $attribute_info['name'],
					'hotel_attribute_description' => $hotel_attribute['hotel_attribute_description']
				);
			}
		}

		// Options
		$this->load->model('catalog/option');

		if (isset($this->request->post['hotel_option'])) {
		  
			$hotel_options = $this->request->post['hotel_option'];
            //echo "<pre>";print_r($visa_options);exit;
		} elseif (isset($this->request->get['hotel_id'])) {
			
            $hotel_options = $this->model_catalog_hotels->getProductOptions($this->request->get['hotel_id']);
		} else {
		   $hotel_options = $this->model_catalog_hotels->getProductOptionsAdd(); //customcreate for particular
           //echo"<pre>";print_r($visa_options);exit;
           /*
           foreach ($visa_options as $visa_option12) 
           {    
               foreach ($visa_option12['product_option_value'] as $visa_option_value12) 
               {
                    $visa_option_value123['visa_option_value_id']    = '';
                    $visa_option123['visa_option_id']                = '';
               }
		   }*/
        	//$visa_options = array();
		}

	
    
    	$data['hotel_options'] = array();
//echo "<pre>";print_r($visa_options);exit;
		foreach ($hotel_options as $hotel_option) {
			$hotel_option_value_data = array();

                /*Add condition for hourly based or remaining other  
                Hourly based -> limo service and id is 69 other wise -> 70= airporttransfer
                */
                if(isset($this->request->get['filter_category_id']))
                {
                    if($this->request->get['filter_category_id'] ==69)
                    {
                        if($hotel_option['name']=='Hourly Based')
                        {
                            if (isset($hotel_option['hotel_option_value'])) {
                				//echo "<pre>dffdd";print_r($visa_option['visa_option_value']);exit;
                                
                                foreach ($hotel_option['hotel_option_value'] as $hotel_option_value) {
                				    
                					$hotel_option_value[] = array(
                						'hotel_option_value_id' => $hotel_option_value['hotel_option_value_id'],
                						'option_value_id'         => $hotel_option_value['option_value_id'],
                						'quantity'                => $hotel_option_value['quantity'],
                						'subtract'                => $hotel_option_value['subtract'],
                						'price'                   => $hotel_option_value['price'],
                                        'child_price'             => $hotel_option_value['child_price'],
                						'price_prefix'            => $hotel_option_value['price_prefix'],
                						'points'                  => $hotel_option_value['points'],
                						'points_prefix'           => $hotel_option_value['points_prefix'],
                						'weight'                  => $hotel_option_value['weight'],
                						'weight_prefix'           => $hotel_option_value['weight_prefix']
                					);
                				}
                			}
                
                			$data['hotel_options'][] = array(
                				'hotel_option_id'    => $hotel_option['hotel_option_id'],
                				'hotel_option_value' => $hotel_option_value_data,
                				'option_id'            => $hotel_option['option_id'],
                				'name'                 => $hotel_option['name'],
                				'type'                 => $hotel_option['type'],
                				'value'                => isset($hotel_option['value']) ? $hotel_option['value'] : '',
                				'required'             => $hotel_option['required']
                			);   
                        }
                        
                    }
                    elseif($this->request->get['filter_category_id'] ==70)
                    {
                        if($hotel_option['name']=='ABUDHABI' || $hotel_option['name']=='SHARJAH' || $hotel_option['name']=='JABEL ALI' || $hotel_option['name']=='DUBAI AIRPORTS')
                        {
                            if (isset($hotel_option['hotel_option_value'])) {
                				//echo "<pre>dffdd";print_r($visa_option['visa_option_value']);exit;
                                
                                foreach ($hotel_option['hotel_option_value'] as $hotel_option_value) {
                				    
                					$hotel_option_value_data[] = array(
                						'hotel_option_value_id' => $hotel_option_value['hotel_option_value_id'],
                						'option_value_id'         => $hotel_option_value['option_value_id'],
                						'quantity'                => $hotel_option_value['quantity'],
                						'subtract'                => $hotel_option_value['subtract'],
                						'price'                   => $hotel_option_value['price'],
                                        'child_price'             => $hotel_option_value['child_price'],
                						'price_prefix'            => $hotel_option_value['price_prefix'],
                						'points'                  => $hotel_option_value['points'],
                						'points_prefix'           => $hotel_option_value['points_prefix'],
                						'weight'                  => $hotel_option_value['weight'],
                						'weight_prefix'           => $hotel_option_value['weight_prefix']
                					);
                				}
                			}
                
                			$data['hotel_options'][] = array(
                				'hotel_option_id'    => $hotel_option['hotel_option_id'],
                				'hotel_option_value' => $hotel_option_value_data,
                				'option_id'            => $hotel_option['option_id'],
                				'name'                 => $hotel_option['name'],
                				'type'                 => $hotel_option['type'],
                				'value'                => isset($hotel_option['value']) ? $hotel_option['value'] : '',
                				'required'             => $hotel_option['required']
                			);  
                        }
                    }    
                    
                }
        			/*if (isset($visa_option['visa_option_value'])) {
        				//echo "<pre>dffdd";print_r($visa_option['visa_option_value']);exit;
                        
                        foreach ($visa_option['visa_option_value'] as $visa_option_value) {
        				    
        					$visa_option_value_data[] = array(
        						'visa_option_value_id' => $visa_option_value['visa_option_value_id'],
        						'option_value_id'         => $visa_option_value['option_value_id'],
        						'quantity'                => $visa_option_value['quantity'],
        						'subtract'                => $visa_option_value['subtract'],
        						'price'                   => $visa_option_value['price'],
                                'child_price'             => $visa_option_value['child_price'],
        						'price_prefix'            => $visa_option_value['price_prefix'],
        						'points'                  => $visa_option_value['points'],
        						'points_prefix'           => $visa_option_value['points_prefix'],
        						'weight'                  => $visa_option_value['weight'],
        						'weight_prefix'           => $visa_option_value['weight_prefix']
        					);
        				}
        			}
        
        			$data['visa_options'][] = array(
        				'visa_option_id'    => $visa_option['visa_option_id'],
        				'visa_option_value' => $visa_option_value_data,
        				'option_id'            => $visa_option['option_id'],
        				'name'                 => $visa_option['name'],
        				'type'                 => $visa_option['type'],
        				'value'                => isset($visa_option['value']) ? $visa_option['value'] : '',
        				'required'             => $visa_option['required']
        			);*/
		}

		$data['option_values'] = array();

		foreach ($data['hotel_options'] as $hotel_option) {
			if ($hotel_option['type'] == 'select' || $hotel_option['type'] == 'radio' || $hotel_option['type'] == 'checkbox' || $hotel_option['type'] == 'image') {
				if (!isset($data['option_values'][$hotel_option['option_id']])) {
					$data['option_values'][$hotel_option['option_id']] = $this->model_catalog_option->getOptionValues($hotel_option['option_id']);
				}
			}
		}

		$this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

		if (isset($this->request->post['hotel_discount'])) {
			$hotel_discounts = $this->request->post['hotel_discount'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$hotel_discounts = $this->model_catalog_hotels->getProductDiscounts($this->request->get['hotel_id']);
		} else {
			$hotel_discounts = array();
		}

		$data['hotel_discounts'] = array();

		foreach ($hotel_discounts as $hotel_discount) {
			$data['hotel_discounts'][] = array(
				'customer_group_id' => $hotel_discount['customer_group_id'],
				'quantity'          => $hotel_discount['quantity'],
				'priority'          => $hotel_discount['priority'],
				'price'             => $hotel_discount['price'],
				'date_start'        => ($hotel_discount['date_start'] != '0000-00-00') ? $hotel_discount['date_start'] : '',
				'date_end'          => ($hotel_discount['date_end'] != '0000-00-00') ? $hotel_discount['date_end'] : ''
			);
		}

		if (isset($this->request->post['hotel_special'])) {
			$hotel_specials = $this->request->post['hotel_special'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$hotel_specials = $this->model_catalog_hotels->getProductSpecials($this->request->get['hotel_id']);
		} else {
			$hotel_specials = array();
		}

		$data['hotel_specials'] = array();

		foreach ($hotel_specials as $hotel_special) {
			$data['hotel_specials'][] = array(
				'customer_group_id' => $hotel_special['customer_group_id'],
				'priority'          => $hotel_special['priority'],
				'price'             => $hotel_special['price'],
				'date_start'        => ($hotel_special['date_start'] != '0000-00-00') ? $hotel_special['date_start'] : '',
				'date_end'          => ($hotel_special['date_end'] != '0000-00-00') ? $hotel_special['date_end'] :  ''
			);
		}
		
		// Image
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($hotel_info)) {
			$data['image'] = $hotel_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($hotel_info) && is_file(DIR_IMAGE . $hotel_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($hotel_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		// Images
		if (isset($this->request->post['hotel_image'])) {
			$hotel_images = $this->request->post['hotel_image'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$hotel_images = $this->model_catalog_hotels->getProductImages($this->request->get['hotel_id']);
		} else {
			$hotel_images = array();
		}

		$data['hotel_images'] = array();

		foreach ($hotel_images as $hotel_image) {
			if (is_file(DIR_IMAGE . $hotel_image['image'])) {
				$image = $hotel_image['image'];
				$thumb = $hotel_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['hotel_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
				'sort_order' => $hotel_image['sort_order']
			);
		}

		// Downloads
		$this->load->model('catalog/download');

		if (isset($this->request->post['hotel_download'])) {
			$hotel_downloads = $this->request->post['hotel_download'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$hotel_downloads = $this->model_catalog_hotels->getProductDownloads($this->request->get['hotel_id']);
		} else {
			$hotel_downloads = array();
		}

		$data['hotel_downloads'] = array();

		foreach ($hotel_downloads as $download_id) {
			$download_info = $this->model_catalog_download->getDownload($download_id);

			if ($download_info) {
				$data['hotel_downloads'][] = array(
					'download_id' => $download_info['download_id'],
					'name'        => $download_info['name']
				);
			}
		}

		if (isset($this->request->post['hotel_related'])) {
			$hotel = $this->request->post['hotel_related'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$hotel = $this->model_catalog_hotels->getProductRelated($this->request->get['hotel_id']);
		} else {
			$hotel = array();
		}

		$data['hotel_relateds'] = array();

		foreach ($hotel as $hotel_id) {
			$related_info = $this->model_catalog_hotels->getProduct($hotel_id);

			if ($related_info) {
				$data['hotel_relateds'][] = array(
					'hotel_id' => $related_info['product_id'],
					'name'       => $related_info['name']
				);
			}
		}

		if (isset($this->request->post['points'])) {
			$data['points'] = $this->request->post['points'];
		} elseif (!empty($hotel_info)) {
			$data['points'] = $hotel_info['points'];
		} else {
			$data['points'] = '';
		}

		if (isset($this->request->post['hotel_reward'])) {
			$data['hotel_reward'] = $this->request->post['hotel_reward'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$data['hotel_reward'] = $this->model_catalog_hotels->getProductRewards($this->request->get['hotel_id']);
		} else {
			$data['hotel_reward'] = array();
		}

		if (isset($this->request->post['hotel_layout'])) {
			$data['hotel_layout'] = $this->request->post['hotel_layout'];
		} elseif (isset($this->request->get['hotel_id'])) {
			$data['hotel_layout'] = $this->model_catalog_hotels->getProductLayouts($this->request->get['hotel_id']);
		} else {
			$data['hotel_layout'] = array();
		}
		
//echo "<pre>";print_r($data);exit;
		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/hotel_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/hotels')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['hotel_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

		if ((utf8_strlen($this->request->post['model']) < 1) || (utf8_strlen($this->request->post['model']) > 64)) {
			$this->error['model'] = $this->language->get('error_model');
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['hotel_id']) && $url_alias_info['query'] != 'product_id=' . $this->request->get['hotel_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['hotel_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/hotels')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateCopy() {
		if (!$this->user->hasPermission('modify', 'catalog/hotels')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}



	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) 
        {
			$this->load->model('catalog/hotels');
			$this->load->model('catalog/option');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}
            
            if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
			} else {
				$filter_model = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 5;
			}

			$filter_data = array(
				'filter_name'  => $filter_name,
                'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_catalog_hotels->getProducts($filter_data);
//echo "<pre>";print_r($results);exit;
			foreach ($results as $result) {
				$option_data = array();

				$hotel_options = $this->model_catalog_hotel->getProductOptions($result['product_id']);

				foreach ($hotel_options as $hotel_option) {
					$option_info = $this->model_catalog_option->getOption($hotel_option['option_id']);

					if ($option_info) {
						$hotel_option_value_data = array();

						foreach ($hotel_option['hotel_option_value'] as $hotel_option_value) {
							$option_value_info = $this->model_catalog_option->getOptionValue($hotel_option_value['option_value_id']);

							if ($option_value_info) {
								$hotel_option_value_data[] = array(
									'product_option_value_id' => $hotel_option_value['hotel_option_value_id'],
									'option_value_id'         => $hotel_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$hotel_option_value['price'] ? $this->currency->format($hotel_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $hotel_option_value['price_prefix']
								);
							}
						}

						$option_data[] = array(
							'hotel_option_id'    => $hotel_option['hotel_option_id'],
							'hotel_option_value' => $hotel_option_value_data,
							'option_id'            => $hotel_option['option_id'],
							'name'                 => $option_info['name'],
							'type'                 => $option_info['type'],
							'value'                => $hotel_option['value'],
							'required'             => $hotel_option['required']
						);
					}
				}

				$json[] = array(
					'hotel_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
