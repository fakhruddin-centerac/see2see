<?php
class ControllerCatalogparksCategory extends Controller {
	private $error = array();

	public function index() {
		
        $this->load->language('catalog/parks_category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/parks_category');

		$this->getList();
	}

	public function add() {
		/* 
        //check point 1
        if(isset($_POST['status']))
        {
            echo "<pre>";print_r($_POST);    exit;
        }
        */
        $this->load->language('catalog/parks_category');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('catalog/parks_category');
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			/* check point 2 
            echo "<pre>";print_r($this->request->post);
            */
            $this->model_catalog_parks_category->addCategory($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/parks_category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/parks_category');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
		      /*
            //check point 1
            if(isset($_POST['status']))
            {
                echo "<pre>";print_r($_POST);   
            }
            */
            $this->model_catalog_parks_category->editCategory($this->request->get['parks_category_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/parks_category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/parks_category');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $parks_category_id) {
				$this->model_catalog_parks_category->deleteCategory($parks_category_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	public function repair() {
		$this->load->language('catalog/parks_category');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/parks_category');

		if ($this->validateRepair()) {
			$this->model_catalog_parks_category->repairCategories();

			$this->session->data['success'] = $this->language->get('text_success');

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

			$this->response->redirect($this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
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

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
        
        /* newly added  */
        
        
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/parks_category/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/parks_category/delete', 'token=' . $this->session->data['token'] . $url, true);
		$data['repair'] = $this->url->link('catalog/parks_category/repair', 'token=' . $this->session->data['token'] . $url, true);

		$data['categories'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$parks_category_total = $this->model_catalog_parks_category->getTotalCategories();

		$results = $this->model_catalog_parks_category->getCategories($filter_data);

		foreach ($results as $result) {
			$data['categories'][] = array(
				'parks_category_id' => $result['category_id'],
				'name'        => $result['name'],
				'sort_order'  => $result['sort_order'],
				'edit'        => $this->url->link('catalog/parks_category/edit', 'token=' . $this->session->data['token'] . '&parks_category_id=' . $result['category_id'] . $url, true),
				'delete'      => $this->url->link('catalog/parks_category/delete', 'token=' . $this->session->data['token'] . '&parks_category_id=' . $result['category_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');

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

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $parks_category_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($parks_category_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($parks_category_total - $this->config->get('config_limit_admin'))) ? $parks_category_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $parks_category_total, ceil($parks_category_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
            
            //echo "<pre>";print_r($data['categories']);exit;
		$this->response->setOutput($this->load->view('catalog/parks_category_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['parks_category_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
        
        /*for images*/
		$data['entry_image'] = $this->language->get('entry_image');
        $data['entry_additional_image'] = $this->language->get('entry_additional_image');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_image_add'] = $this->language->get('button_image_add');
        /*cusvip close images*/
        
        
        $data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_parent'] = $this->language->get('entry_parent');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_top'] = $this->language->get('entry_top');
		$data['entry_column'] = $this->language->get('entry_column');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');

		$data['help_filter'] = $this->language->get('help_filter');
		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_top'] = $this->language->get('help_top');
		$data['help_column'] = $this->language->get('help_column');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');
        $data['tab_image'] = $this->language->get('tab_image');

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

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		if (isset($this->error['parent'])) {
			$data['error_parent'] = $this->error['parent'];
		} else {
			$data['error_parent'] = '';
		}
		
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

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['parks_category_id'])) {
			$data['action'] = $this->url->link('catalog/parks_category/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/parks_category/edit', 'token=' . $this->session->data['token'] . '&parks_category_id=' . $this->request->get['parks_category_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/parks_category', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['parks_category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$parks_category_info = $this->model_catalog_parks_category->getCategory($this->request->get['parks_category_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['parks_category_description'])) {
			$data['parks_category_description'] = $this->request->post['parks_category_description'];
		} elseif (isset($this->request->get['parks_category_id'])) {
			$data['parks_category_description'] = $this->model_catalog_parks_category->getCategoryDescriptions($this->request->get['parks_category_id']);
		} else {
			$data['parks_category_description'] = array();
		}

		if (isset($this->request->post['path'])) {
			$data['path'] = $this->request->post['path'];
		} elseif (!empty($parks_category_info)) {
			$data['path'] = $parks_category_info['path'];
		} else {
			$data['path'] = '';
		}

		if (isset($this->request->post['parent_id'])) {
			$data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($parks_category_info)) {
			$data['parent_id'] = $parks_category_info['parent_id'];
		} else {
			$data['parent_id'] = 0;
		}

		$this->load->model('catalog/filter');

		if (isset($this->request->post['parks_category_filter'])) {
			$filters = $this->request->post['parks_category_filter'];
		} elseif (isset($this->request->get['parks_category_id'])) {
			$filters = $this->model_catalog_parks_category->getCategoryFilters($this->request->get['parks_category_id']);
		} else {
			$filters = array();
		}

		$data['parks_category_filters'] = array();

		foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);

			if ($filter_info) {
				$data['parks_category_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['parks_category_store'])) {
			$data['parks_category_store'] = $this->request->post['parks_category_store'];
		} elseif (isset($this->request->get['parks_category_id'])) {
			$data['parks_category_store'] = $this->model_catalog_parks_category->getCategoryStores($this->request->get['parks_category_id']);
		} else {
			$data['parks_category_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($parks_category_info)) {
			$data['keyword'] = $parks_category_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		} elseif (!empty($parks_category_info)) {
			$data['image'] = $parks_category_info['image'];
		} else {
			$data['image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($parks_category_info) && is_file(DIR_IMAGE . $parks_category_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($parks_category_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['top'])) {
			$data['top'] = $this->request->post['top'];
		} elseif (!empty($parks_category_info)) {
			$data['top'] = $parks_category_info['top'];
		} else {
			$data['top'] = 0;
		}

		if (isset($this->request->post['column'])) {
			$data['column'] = $this->request->post['column'];
		} elseif (!empty($parks_category_info)) {
			$data['column'] = $parks_category_info['column'];
		} else {
			$data['column'] = 1;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($parks_category_info)) {
			$data['sort_order'] = $parks_category_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($parks_category_info)) {
			$data['status'] = $parks_category_info['status'];
		} else {
			$data['status'] = true;
		}
        
        
        // Images
		if (isset($this->request->post['parks_category_images'])) {
			$parks_category_images = $this->request->post['parks_category_images'];
		} elseif (isset($this->request->get['parks_category_id'])) {
			$parks_category_images = $this->model_catalog_parks_category->getProductImages($this->request->get['parks_category_id']);
		} else {
			$parks_category_images = array();
		}

		$data['parks_category_images'] = array();
        foreach ($parks_category_images as $parks_category_image) {
			if (is_file(DIR_IMAGE . $parks_category_image['image'])) {
				$image = $parks_category_image['image'];
				$thumb = $parks_category_image['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['parks_category_images'][] = array(
				'image'      => $image,
				'thumb'      => $this->model_tool_image->resize($thumb, 100, 100),
				'sort_order' => $parks_category_image['sort_order']
			);
		}

        /*close images*/
    
        
        
		if (isset($this->request->post['parks_category_layout'])) {
			$data['parks_category_layout'] = $this->request->post['parks_category_layout'];
		} elseif (isset($this->request->get['parks_category_id'])) {
			$data['parks_category_layout'] = $this->model_catalog_parks_category->getCategoryLayouts($this->request->get['parks_category_id']);
		} else {
			$data['parks_category_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/parks_category_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/parks_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['parks_category_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

		if (isset($this->request->get['parks_category_id']) && $this->request->post['parent_id']) {
			$results = $this->model_catalog_parks_category->getCategoryPath($this->request->post['parent_id']);
			
			foreach ($results as $result) {
				if ($result['path_id'] == $this->request->get['parks_category_id']) {
					$this->error['parent'] = $this->language->get('error_parent');
					
					break;
				}
			}
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['parks_category_id']) && $url_alias_info['query'] != 'parks_category_id=' . $this->request->get['parks_category_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['parks_category_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/parks_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateRepair() {
		if (!$this->user->hasPermission('modify', 'catalog/parks_category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/parks_category');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_parks_category->getCategories($filter_data);
//echo "<pre>";print_r($results);exit;
			foreach ($results as $result) {
				$json[] = array(
					'parks_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
