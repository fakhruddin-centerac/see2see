<?php
class ControllerCatalogLimoservice extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/limoservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/limoservice');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/limoservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/limoservice');
//echo"<pre>";print_r($this->request->get);exit;
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_limoservice->addProduct($this->request->post);

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

			$this->response->redirect($this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		
        $this->load->language('catalog/limoservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/limoservice');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
		  
          
			$this->model_catalog_limoservice->editProduct($this->request->get['limoservice_id'], $this->request->post);

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
            
   

			$this->response->redirect($this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/limoservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/limoservice');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $limoservice_id) {
				$this->model_catalog_limoservice->deleteProduct($limoservice_id);
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

			$this->response->redirect($this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	public function copy() {
		$this->load->language('catalog/limoservice');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/limoservice');

		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $limoservice_id) {
				$this->model_catalog_limoservice->copyProduct($limoservice_id);
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

			$this->response->redirect($this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . $url, true));
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
			'href' => $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/limoservice/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['copy'] = $this->url->link('catalog/limoservice/copy', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/limoservice/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['limoservice'] = array();

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
//fakhruddin
		$this->load->model('tool/image');
	//echo $filter_category . "|";	
//echo $filter_category_id;
		 $limoservice_total = $this->model_catalog_limoservice->getTotalProducts($filter_data);

		$results = $this->model_catalog_limoservice->getProducts($filter_data);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 40, 40);
			}

			$special = false;

			$limoservice_specials = $this->model_catalog_limoservice->getProductSpecials($result['product_id']);

			foreach ($limoservice_specials  as $limoservice_special) {
				if (($limoservice_special['date_start'] == '0000-00-00' || strtotime($limoservice_special['date_start']) < time()) && ($limoservice_special['date_end'] == '0000-00-00' || strtotime($limoservice_special['date_end']) > time())) {
					$special = $limoservice_special['price'];

					break;
				}
			}

			$data['limoservice'][] = array(
				'limoservice_id' => $result['product_id'],
				'image'      => $image,
				'name'       => $result['name'],
				'model'      => $result['model'],
				'price'      => $result['price'],
				'special'    => $special,
				'quantity'   => $result['quantity'],
				'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'edit'       => $this->url->link('catalog/limoservice/edit', 'token=' . $this->session->data['token'] . '&limoservice_id=' . $result['product_id'] . $url, true)
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

		$data['sort_name'] = $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, true);
		$data['sort_model'] = $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . '&sort=p.model' . $url, true);
		$data['sort_price'] = $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . '&sort=p.price' . $url, true);
		$data['sort_quantity'] = $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . '&sort=p.quantity' . $url, true);
		$data['sort_status'] = $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, true);
		$data['sort_order'] = $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, true);

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
		
	//fakhruddin added filter category option
      if (isset($this->request->get['filter_category_id'])) {
				$url .= '&filter_category_id=' . $this->request->get['filter_category_id'];
			}

		$pagination = new Pagination();
		$pagination->total = $limoservice_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($limoservice_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($limoservice_total - $this->config->get('config_limit_admin'))) ? $limoservice_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $limoservice_total, ceil($limoservice_total / $this->config->get('config_limit_admin')));

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

		$this->response->setOutput($this->load->view('catalog/limoservice_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['limoservice_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
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
		$data['entry_option_value'] = $this->language->get('entry_option_value');
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
			'href' => $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['limoservice_id'])) { 
			/*$data['action'] = $this->url->link('catalog/limoservice/add', 'token=' . $this->session->data['token'] . $url, true);*/
            /*custom add for url set in add case */
            $data['action'] = $this->url->link('catalog/limoservice/add', 'token=' . $this->session->data['token'] . '&filter_category_id=' . $this->request->get['filter_category_id'] . $url, true);
		} else {
		  /* $data['action'] = $this->url->link('catalog/limoservice/edit', 'token=' . $this->session->data['token'] . '&limoservice_id=' . $this->request->get['limoservice_id'] . $url, true);*/
          /*custom add for url set in edit case*/
           $data['action'] = $this->url->link('catalog/limoservice/edit', 'token=' . $this->session->data['token'] . '&limoservice_id=' . $this->request->get['limoservice_id']. '&filter_category_id=' . $this->request->get['filter_category_id'] . $url, true);
            
		}

		$data['cancel'] = $this->url->link('catalog/limoservice', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['limoservice_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$limoservice_info = $this->model_catalog_limoservice->getProduct($this->request->get['limoservice_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['limoservice_description'])) {
			$data['limoservice_description'] = $this->request->post['limoservice_description'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$data['limoservice_description'] = $this->model_catalog_limoservice->getProductDescriptions($this->request->get['limoservice_id']);
		} else {
			$data['limoservice_description'] = array();
		}

		if (isset($this->request->post['model'])) {
			$data['model'] = $this->request->post['model'];
		} elseif (!empty($limoservice_info)) {
			$data['model'] = $limoservice_info['model'];
		} else {
			$data['model'] = '';
		}

		if (isset($this->request->post['sku'])) {
			$data['sku'] = $this->request->post['sku'];
		} elseif (!empty($limoservice_info)) {
			$data['sku'] = $limoservice_info['sku'];
		} else {
			$data['sku'] = '';
		}

		if (isset($this->request->post['upc'])) {
			$data['upc'] = $this->request->post['upc'];
		} elseif (!empty($limoservice_info)) {
			$data['upc'] = $limoservice_info['upc'];
		} else {
			$data['upc'] = '';
		}

		if (isset($this->request->post['ean'])) {
			$data['ean'] = $this->request->post['ean'];
		} elseif (!empty($limoservice_info)) {
			$data['ean'] = $limoservice_info['ean'];
		} else {
			$data['ean'] = '';
		}

		if (isset($this->request->post['jan'])) {
			$data['jan'] = $this->request->post['jan'];
		} elseif (!empty($limoservice_info)) {
			$data['jan'] = $limoservice_info['jan'];
		} else {
			$data['jan'] = '';
		}

		if (isset($this->request->post['isbn'])) {
			$data['isbn'] = $this->request->post['isbn'];
		} elseif (!empty($limoservice_info)) {
			$data['isbn'] = $limoservice_info['isbn'];
		} else {
			$data['isbn'] = '';
		}

		if (isset($this->request->post['mpn'])) {
			$data['mpn'] = $this->request->post['mpn'];
		} elseif (!empty($limoservice_info)) {
			$data['mpn'] = $limoservice_info['mpn'];
		} else {
			$data['mpn'] = '';
		}

		if (isset($this->request->post['location'])) {
			$data['location'] = $this->request->post['location'];
		} elseif (!empty($limoservice_info)) {
			$data['location'] = $limoservice_info['location'];
		} else {
			$data['location'] = '';
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['limoservice_store'])) {
			$data['limoservice_store'] = $this->request->post['limoservice_store'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$data['limoservice_store'] = $this->model_catalog_limoservice->getProductStores($this->request->get['limoservice_id']);
		} else {
			$data['limoservice_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($limoservice_info)) {
			$data['keyword'] = $limoservice_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['shipping'])) {
			$data['shipping'] = $this->request->post['shipping'];
		} elseif (!empty($limoservice_info)) {
			$data['shipping'] = $limoservice_info['shipping'];
		} else {
			$data['shipping'] = 1;
		}

		if (isset($this->request->post['price'])) {
			$data['price'] = $this->request->post['price'];
		} elseif (!empty($limoservice_info)) {
			$data['price'] = $limoservice_info['price'];
		} else {
			$data['price'] = '';
		}

		$this->load->model('catalog/recurring');

		$data['recurrings'] = $this->model_catalog_recurring->getRecurrings();
//echo "<pre>";print_r($limoservice_info);exit;
		if (isset($this->request->post['limoservice_recurrings'])) {
			$data['limoservice_recurrings'] = $this->request->post['limoservice_recurrings'];
		} elseif (!empty($limoservice_info)) {
			$data['limoservice_recurrings'] = $this->model_catalog_limoservice->getRecurrings($limoservice_info['product_id']);
		} else {
			$data['limoservice_recurrings'] = array();
		}

		$this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		if (isset($this->request->post['tax_class_id'])) {
			$data['tax_class_id'] = $this->request->post['tax_class_id'];
		} elseif (!empty($limoservice_info)) {
			$data['tax_class_id'] = $limoservice_info['tax_class_id'];
		} else {
			$data['tax_class_id'] = 0;
		}

		if (isset($this->request->post['date_available'])) {
			$data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($limoservice_info)) {
			$data['date_available'] = ($limoservice_info['date_available'] != '0000-00-00') ? $limoservice_info['date_available'] : '';
		} else {
			$data['date_available'] = date('Y-m-d');
		}

		if (isset($this->request->post['quantity'])) {
			$data['quantity'] = $this->request->post['quantity'];
		} elseif (!empty($limoservice_info)) {
			$data['quantity'] = $limoservice_info['quantity'];
		} else {
			$data['quantity'] = 1;
		}

		if (isset($this->request->post['minimum'])) {
			$data['minimum'] = $this->request->post['minimum'];
		} elseif (!empty($limoservice_info)) {
			$data['minimum'] = $limoservice_info['minimum'];
		} else {
			$data['minimum'] = 1;
		}

		if (isset($this->request->post['subtract'])) {
			$data['subtract'] = $this->request->post['subtract'];
		} elseif (!empty($limoservice_info)) {
			$data['subtract'] = $limoservice_info['subtract'];
		} else {
			$data['subtract'] = 1;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($limoservice_info)) {
			$data['sort_order'] = $limoservice_info['sort_order'];
		} else {
			$data['sort_order'] = 1;
		}

		$this->load->model('localisation/stock_status');

		$data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		if (isset($this->request->post['stock_status_id'])) {
			$data['stock_status_id'] = $this->request->post['stock_status_id'];
		} elseif (!empty($limoservice_info)) {
			$data['stock_status_id'] = $limoservice_info['stock_status_id'];
		} else {
			$data['stock_status_id'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($limoservice_info)) {
			$data['status'] = $limoservice_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['weight'])) {
			$data['weight'] = $this->request->post['weight'];
		} elseif (!empty($limoservice_info)) {
			$data['weight'] = $limoservice_info['weight'];
		} else {
			$data['weight'] = '';
		}

		$this->load->model('localisation/weight_class');

		$data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		if (isset($this->request->post['weight_class_id'])) {
			$data['weight_class_id'] = $this->request->post['weight_class_id'];
		} elseif (!empty($limoservice_info)) {
			$data['weight_class_id'] = $limoservice_info['weight_class_id'];
		} else {
			$data['weight_class_id'] = $this->config->get('config_weight_class_id');
		}

		if (isset($this->request->post['length'])) {
			$data['length'] = $this->request->post['length'];
		} elseif (!empty($limoservice_info)) {
			$data['length'] = $limoservice_info['length'];
		} else {
			$data['length'] = '';
		}

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($limoservice_info)) {
			$data['width'] = $limoservice_info['width'];
		} else {
			$data['width'] = '';
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($limoservice_info)) {
			$data['height'] = $limoservice_info['height'];
		} else {
			$data['height'] = '';
		}

		$this->load->model('localisation/length_class');

		$data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

		if (isset($this->request->post['length_class_id'])) {
			$data['length_class_id'] = $this->request->post['length_class_id'];
		} elseif (!empty($limoservice_info)) {
			$data['length_class_id'] = $limoservice_info['length_class_id'];
		} else {
			$data['length_class_id'] = $this->config->get('config_length_class_id');
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->post['manufacturer_id'])) {
			$data['manufacturer_id'] = $this->request->post['manufacturer_id'];
		} elseif (!empty($limoservice_info)) {
			$data['manufacturer_id'] = $limoservice_info['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = 0;
		}

		if (isset($this->request->post['manufacturer'])) {
			$data['manufacturer'] = $this->request->post['manufacturer'];
		} elseif (!empty($limoservice_info)) {
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($limoservice_info['manufacturer_id']);

			if ($manufacturer_info) {
				$data['manufacturer'] = $manufacturer_info['name'];
			} else {
				$data['manufacturer'] = '';
			}
		} else {
			$data['manufacturer'] = '';
		}

		// Categories
		$this->load->model('catalog/limoservice_category');

		if (isset($this->request->post['limoservice_category'])) { 
			$categories = $this->request->post['limoservice_category'];
		} elseif (isset($this->request->get['limoservice_id'])) {
		    $categories = $this->model_catalog_limoservice->getProductCategories($this->request->get['limoservice_id']);
		} else {
			$categories = array();
		}
        
/*create new cvariable for category link to the product 69 -> LIMOUSINE SERVICES  AND  70 -> AIRPORT TRANSFER*/
        /* custom variable intilize */
        $data['link_catedgory_id'] = '';
        /*Acording to url setting this parameter alway get and this functionalty is set in xml fixed url paramerter*/
        if(isset($this->request->get['filter_category_id']))
        {
            $data['link_catedgory_id']  = $this->request->get['filter_category_id'];
            /*so link_catedgory_id */ 
        }
        
		$data['limoservice_categories'] = array();
//echo "<pre>";print_r($categories);
		foreach ($categories as $category_id) {
			$category_info = $this->model_catalog_limoservice_category->getCategory($category_id);

			if ($category_info) {
				$data['limoservice_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
				);
			}
		}
//echo "<pre>";print_r($data['limoservice_categories']);exit;
		// Filters
		$this->load->model('catalog/filter');

		if (isset($this->request->post['limoservice_filter'])) {
			$filters = $this->request->post['limoservice_filter'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$filters = $this->model_catalog_limoservice->getProductFilters($this->request->get['limoservice_id']);
		} else {
			$filters = array();
		}

		$data['limoservice_filters'] = array();

		foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);

			if ($filter_info) {
				$data['limoservice_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}

		// Attributes
		$this->load->model('catalog/attribute');

		if (isset($this->request->post['limoservice_attribute'])) {
			$limoservice_attributes = $this->request->post['limoservice_attribute'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$limoservice_attributes = $this->model_catalog_limoservice->getProductAttributes($this->request->get['limoservice_id']);
		} else {
			$limoservice_attributes = array();
		}

		$data['limoservice_attributes'] = array();

		foreach ($limoservice_attributes as $limoservice_attribute) {
			$attribute_info = $this->model_catalog_attribute->getAttribute($limoservice_attribute['attribute_id']);

			if ($attribute_info) {
				$data['limoservice_attributes'][] = array(
					'attribute_id'                  => $limoservice_attribute['attribute_id'],
					'name'                          => $attribute_info['name'],
					'limoservice_attribute_description' => $limoservice_attribute['limoservice_attribute_description']
				);
			}
		}

		// Options
		$this->load->model('catalog/option');

		if (isset($this->request->post['limoservice_option'])) {
		  
			$limoservice_options = $this->request->post['limoservice_option'];
            //echo "<pre>";print_r($limoservice_options);exit;
		} elseif (isset($this->request->get['limoservice_id'])) {
			
            $limoservice_options = $this->model_catalog_limoservice->getProductOptions($this->request->get['limoservice_id']);
		} else {
		   $limoservice_options = $this->model_catalog_limoservice->getProductOptionsAdd(); //customcreate for particular
           //echo"<pre>";print_r($limoservice_options);exit;
           /*
           foreach ($limoservice_options as $limoservice_option12) 
           {    
               foreach ($limoservice_option12['product_option_value'] as $limoservice_option_value12) 
               {
                    $limoservice_option_value123['limoservice_option_value_id']    = '';
                    $limoservice_option123['limoservice_option_id']                = '';
               }
		   }*/
        	//$limoservice_options = array();
		}

	
    
    	$data['limoservice_options'] = array();
//echo "<pre>";print_r($limoservice_options);exit;
		foreach ($limoservice_options as $limoservice_option) {
			$limoservice_option_value_data = array();

                /*Add condition for hourly based or remaining other  
                Hourly based -> limo service and id is 69 other wise -> 70= airporttransfer
                */
                if(isset($this->request->get['filter_category_id']))
                {
                    if($this->request->get['filter_category_id'] ==69)
                    {
                        if($limoservice_option['name']=='Hourly Based' || $limoservice_option['name']=='Min Hours')
                        {
                            if (isset($limoservice_option['limoservice_option_value'])) {
                				//echo "<pre>dffdd";print_r($limoservice_option['limoservice_option_value']);exit;
                                
                                foreach ($limoservice_option['limoservice_option_value'] as $limoservice_option_value) {
                				    
                					$limoservice_option_value_data[] = array(
                						'limoservice_option_value_id' => $limoservice_option_value['limoservice_option_value_id'],
                						'option_value_id'         => $limoservice_option_value['option_value_id'],
                						'quantity'                => $limoservice_option_value['quantity'],
                						'subtract'                => $limoservice_option_value['subtract'],
                						'price'                   => $limoservice_option_value['price'],
                                        'child_price'             => $limoservice_option_value['child_price'],
                						'price_prefix'            => $limoservice_option_value['price_prefix'],
                						'points'                  => $limoservice_option_value['points'],
                						'points_prefix'           => $limoservice_option_value['points_prefix'],
                						'weight'                  => $limoservice_option_value['weight'],
                						'weight_prefix'           => $limoservice_option_value['weight_prefix']
                					);
                				}
                			}
                
                			$data['limoservice_options'][] = array(
                				'limoservice_option_id'    => $limoservice_option['limoservice_option_id'],
                				'limoservice_option_value' => $limoservice_option_value_data,
                				'option_id'            => $limoservice_option['option_id'],
                				'name'                 => $limoservice_option['name'],
                				'type'                 => $limoservice_option['type'],
                				'value'                => isset($limoservice_option['value']) ? $limoservice_option['value'] : '',
                				'required'             => $limoservice_option['required']
                			);   
                        }
                        
                    }
                    elseif($this->request->get['filter_category_id'] ==70)
                    {
                        if($limoservice_option['name']=='ABUDHABI' || $limoservice_option['name']=='SHARJAH' || $limoservice_option['name']=='JABEL ALI' || $limoservice_option['name']=='DUBAI AIRPORTS')
                        {
                            if (isset($limoservice_option['limoservice_option_value'])) {
                				//echo "<pre>dffdd";print_r($limoservice_option['limoservice_option_value']);exit;
                                
                                foreach ($limoservice_option['limoservice_option_value'] as $limoservice_option_value) {
                				    
                					$limoservice_option_value_data[] = array(
                						'limoservice_option_value_id' => $limoservice_option_value['limoservice_option_value_id'],
                						'option_value_id'         => $limoservice_option_value['option_value_id'],
                						'quantity'                => $limoservice_option_value['quantity'],
                						'subtract'                => $limoservice_option_value['subtract'],
                						'price'                   => $limoservice_option_value['price'],
                                        'child_price'             => $limoservice_option_value['child_price'],
                						'price_prefix'            => $limoservice_option_value['price_prefix'],
                						'points'                  => $limoservice_option_value['points'],
                						'points_prefix'           => $limoservice_option_value['points_prefix'],
                						'weight'                  => $limoservice_option_value['weight'],
                						'weight_prefix'           => $limoservice_option_value['weight_prefix']
                					);
                				}
                			}
                
                			$data['limoservice_options'][] = array(
                				'limoservice_option_id'    => $limoservice_option['limoservice_option_id'],
                				'limoservice_option_value' => $limoservice_option_value_data,
                				'option_id'            => $limoservice_option['option_id'],
                				'name'                 => $limoservice_option['name'],
                				'type'                 => $limoservice_option['type'],
                				'value'                => isset($limoservice_option['value']) ? $limoservice_option['value'] : '',
                				'required'             => $limoservice_option['required']
                			);  
                        }
                    }    
                    
                }
        			/*if (isset($limoservice_option['limoservice_option_value'])) {
        				//echo "<pre>dffdd";print_r($limoservice_option['limoservice_option_value']);exit;
                        
                        foreach ($limoservice_option['limoservice_option_value'] as $limoservice_option_value) {
        				    
        					$limoservice_option_value_data[] = array(
        						'limoservice_option_value_id' => $limoservice_option_value['limoservice_option_value_id'],
        						'option_value_id'         => $limoservice_option_value['option_value_id'],
        						'quantity'                => $limoservice_option_value['quantity'],
        						'subtract'                => $limoservice_option_value['subtract'],
        						'price'                   => $limoservice_option_value['price'],
                                'child_price'             => $limoservice_option_value['child_price'],
        						'price_prefix'            => $limoservice_option_value['price_prefix'],
        						'points'                  => $limoservice_option_value['points'],
        						'points_prefix'           => $limoservice_option_value['points_prefix'],
        						'weight'                  => $limoservice_option_value['weight'],
        						'weight_prefix'           => $limoservice_option_value['weight_prefix']
        					);
        				}
        			}
        
        			$data['limoservice_options'][] = array(
        				'limoservice_option_id'    => $limoservice_option['limoservice_option_id'],
        				'limoservice_option_value' => $limoservice_option_value_data,
        				'option_id'            => $limoservice_option['option_id'],
        				'name'                 => $limoservice_option['name'],
        				'type'                 => $limoservice_option['type'],
        				'value'                => isset($limoservice_option['value']) ? $limoservice_option['value'] : '',
        				'required'             => $limoservice_option['required']
        			);*/
		}
//echo "<pre/>";print_r($data['limoservice_options']);exit;
		$data['option_values'] = array();

		foreach ($data['limoservice_options'] as $limoservice_option) {
			if ($limoservice_option['type'] == 'select' || $limoservice_option['type'] == 'radio' || $limoservice_option['type'] == 'checkbox' || $limoservice_option['type'] == 'image') {
				if (!isset($data['option_values'][$limoservice_option['option_id']])) {
					$data['option_values'][$limoservice_option['option_id']] = $this->model_catalog_option->getOptionValues($limoservice_option['option_id']);
				}
			}
		}

		$this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

		if (isset($this->request->post['limoservice_discount'])) {
			$limoservice_discounts = $this->request->post['limoservice_discount'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$limoservice_discounts = $this->model_catalog_limoservice->getProductDiscounts($this->request->get['limoservice_id']);
		} else {
			$limoservice_discounts = array();
		}

		$data['limoservice_discounts'] = array();

		foreach ($limoservice_discounts as $limoservice_discount) {
			$data['limoservice_discounts'][] = array(
				'customer_group_id' => $limoservice_discount['customer_group_id'],
				'quantity'          => $limoservice_discount['quantity'],
				'priority'          => $limoservice_discount['priority'],
				'price'             => $limoservice_discount['price'],
				'date_start'        => ($limoservice_discount['date_start'] != '0000-00-00') ? $limoservice_discount['date_start'] : '',
				'date_end'          => ($limoservice_discount['date_end'] != '0000-00-00') ? $limoservice_discount['date_end'] : ''
			);
		}

		if (isset($this->request->post['limoservice_special'])) {
			$limoservice_specials = $this->request->post['limoservice_special'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$limoservice_specials = $this->model_catalog_limoservice->getProductSpecials($this->request->get['limoservice_id']);
		} else {
			$limoservice_specials = array();
		}

		$data['limoservice_specials'] = array();

		foreach ($limoservice_specials as $limoservice_special) {
			$data['limoservice_specials'][] = array(
				'customer_group_id' => $limoservice_special['customer_group_id'],
				'priority'          => $limoservice_special['priority'],
				'price'             => $limoservice_special['price'],
				'date_start'        => ($limoservice_special['date_start'] != '0000-00-00') ? $limoservice_special['date_start'] : '',
				'date_end'          => ($limoservice_special['date_end'] != '0000-00-00') ? $limoservice_special['date_end'] :  ''
			);
		}
		
		// Image
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($limoservice_info)) {
			$data['image'] = $limoservice_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($limoservice_info) && is_file(DIR_IMAGE . $limoservice_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($limoservice_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		// Images
		if (isset($this->request->post['limoservice_image'])) {
			$limoservice_images = $this->request->post['limoservice_image'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$limoservice_images = $this->model_catalog_limoservice->getProductImages($this->request->get['limoservice_id']);
		} else {
			$limoservice_images = array();
		}

		$data['limoservice_images'] = array();

		foreach ($limoservice_images as $limoservice_image) {
			if (is_file(DIR_IMAGE . $limoservice_image['image'])) {
				$image = $limoservice_image['image'];
				$thumb = $limoservice_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['limoservice_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
				'sort_order' => $limoservice_image['sort_order']
			);
		}

		// Downloads
		$this->load->model('catalog/download');

		if (isset($this->request->post['limoservice_download'])) {
			$limoservice_downloads = $this->request->post['limoservice_download'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$limoservice_downloads = $this->model_catalog_limoservice->getProductDownloads($this->request->get['limoservice_id']);
		} else {
			$limoservice_downloads = array();
		}

		$data['limoservice_downloads'] = array();

		foreach ($limoservice_downloads as $download_id) {
			$download_info = $this->model_catalog_download->getDownload($download_id);

			if ($download_info) {
				$data['limoservice_downloads'][] = array(
					'download_id' => $download_info['download_id'],
					'name'        => $download_info['name']
				);
			}
		}

		if (isset($this->request->post['limoservice_related'])) {
			$limoservice = $this->request->post['limoservice_related'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$limoservice = $this->model_catalog_limoservice->getProductRelated($this->request->get['limoservice_id']);
		} else {
			$limoservice = array();
		}

		$data['limoservice_relateds'] = array();

		foreach ($limoservice as $limoservice_id) {
			$related_info = $this->model_catalog_limoservice->getProduct($limoservice_id);

			if ($related_info) {
				$data['limoservice_relateds'][] = array(
					'limoservice_id' => $related_info['product_id'],
					'name'       => $related_info['name']
				);
			}
		}

		if (isset($this->request->post['points'])) {
			$data['points'] = $this->request->post['points'];
		} elseif (!empty($limoservice_info)) {
			$data['points'] = $limoservice_info['points'];
		} else {
			$data['points'] = '';
		}

		if (isset($this->request->post['limoservice_reward'])) {
			$data['limoservice_reward'] = $this->request->post['limoservice_reward'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$data['limoservice_reward'] = $this->model_catalog_limoservice->getProductRewards($this->request->get['limoservice_id']);
		} else {
			$data['limoservice_reward'] = array();
		}

		if (isset($this->request->post['limoservice_layout'])) {
			$data['limoservice_layout'] = $this->request->post['limoservice_layout'];
		} elseif (isset($this->request->get['limoservice_id'])) {
			$data['limoservice_layout'] = $this->model_catalog_limoservice->getProductLayouts($this->request->get['limoservice_id']);
		} else {
			$data['limoservice_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
//echo "<pre>";print_r(	$data);exit;
		$this->response->setOutput($this->load->view('catalog/limoservice_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/limoservice')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['limoservice_description'] as $language_id => $value) {
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

			if ($url_alias_info && isset($this->request->get['limoservice_id']) && $url_alias_info['query'] != 'product_id=' . $this->request->get['limoservice_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['limoservice_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/limoservice')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateCopy() {
		if (!$this->user->hasPermission('modify', 'catalog/limoservice')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}



	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) 
        {
			$this->load->model('catalog/limoservice');
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

			$results = $this->model_catalog_limoservice->getProducts($filter_data);
//echo "<pre>";print_r($results);exit;
			foreach ($results as $result) {
				$option_data = array();

				$limoservice_options = $this->model_catalog_limoservice->getProductOptions($result['product_id']);

				foreach ($limoservice_options as $limoservice_option) {
					$option_info = $this->model_catalog_option->getOption($limoservice_option['option_id']);

					if ($option_info) {
						$limoservice_option_value_data = array();

						foreach ($limoservice_option['limoservice_option_value'] as $limoservice_option_value) {
							$option_value_info = $this->model_catalog_option->getOptionValue($limoservice_option_value['option_value_id']);

							if ($option_value_info) {
								$limoservice_option_value_data[] = array(
									'product_option_value_id' => $limoservice_option_value['limoservice_option_value_id'],
									'option_value_id'         => $limoservice_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$limoservice_option_value['price'] ? $this->currency->format($limoservice_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $limoservice_option_value['price_prefix']
								);
							}
						}

						$option_data[] = array(
							'limoservice_option_id'    => $limoservice_option['limoservice_option_id'],
							'limoservice_option_value' => $limoservice_option_value_data,
							'option_id'            => $limoservice_option['option_id'],
							'name'                 => $option_info['name'],
							'type'                 => $option_info['type'],
							'value'                => $limoservice_option['value'],
							'required'             => $limoservice_option['required']
						);
					}
				}

				$json[] = array(
					'limoservice_id' => $result['product_id'],
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
