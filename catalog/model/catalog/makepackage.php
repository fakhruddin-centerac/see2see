<?php
class ModelCatalogMakePackage extends Model {
	public function updateViewed($product_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = (viewed + 1) WHERE product_id = '" . (int)$product_id . "'");
	}

    /*custom getProductTpByPID */
    public function getDescriptionByProductId($proids)
    {
        //description
       $query  = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id= '".$proids."' ");
       return $query->row;
        
    }
    public function getalldataBycategorywise($tp)
    {
        $query     = $this->db->query("SELECT c.category_id,cd.name FROM " . DB_PREFIX . "category c  LEFT JOIN ". DB_PREFIX ."category_description cd ON(c.category_id=cd.category_id) WHERE c.category_tp='".$tp."'  ");
        $catresult = $query->rows;
        $parkallData = array();
        $firtcounter = 0;
        foreach($catresult as $Result)
        {
            $parkallData[$firtcounter]['name'][]=$Result['name'];
            $parkallData[$firtcounter]['category_id'][]=$Result['category_id'];
            /*$porductquery     = $this->db->query("SELECT pd.description, pd.product_id,pd.name,ptc.category_id  FROM " . DB_PREFIX . "product_to_category ptc  LEFT JOIN ". DB_PREFIX ."product_description pd ON(ptc.product_id=pd.product_id) WHERE ptc.category_id='".$Result['category_id']."'  ");*/
            
            $porductquery     = $this->db->query("SELECT p.image,pd.description,pd.product_id,pd.name,ptc.category_id,p.tax_class_id,p.family,p.top_up  FROM " . DB_PREFIX . "product_to_category ptc  LEFT JOIN ". DB_PREFIX ."product_description pd ON(ptc.product_id=pd.product_id) LEFT JOIN ". DB_PREFIX ."product p ON (p.product_id=pd.product_id) WHERE ptc.category_id='".$Result['category_id']."'  ");
            $ProductResult = $porductquery->rows;
            foreach($ProductResult as $ProductResults)
            {
                $parkallData[$firtcounter]['ProResult'][] =$ProductResults;      
            }
            $firtcounter++;        
        }
        //echo "<pre>";print_r($parkallData);exit;
        return $parkallData;
    }
     public function getProductoptionPrivatebytimetype($type,$productidop)
     {
        
        $query = $this->db->query("SELECT * 
                    FROM " . DB_PREFIX . "product_option_value 
                    WHERE time_val LIKE '%".$type."(%' AND  price_type = 'private' AND price !='0' AND product_id ='".$productidop."' ORDER BY `product_option_value_id` ASC");
        return $query->rows;        
     }
    public function getProductoptionbypricetype($type,$productidop)
    {
       
        
        $query = $this->db->query("SELECT * 
                    FROM " . DB_PREFIX . "product_option_value 
                    WHERE price_type = '" . $type . "' AND price !='0' AND product_id ='".$productidop."' order by time_val ");
        return $query->rows;        
    }

    public function getProductByTPandID($catid,$product_tp) 
    {
        
        $query = $this->db->query("SELECT p.product_id,p.product_tp,pd.name,ptc.category_id 
                    FROM " . DB_PREFIX . "product p LEFT JOIN ". DB_PREFIX . "product_description pd ON(p.product_id = pd.product_id) 
                    LEFT JOIN  " . DB_PREFIX . "product_to_category ptc ON (p.product_id=ptc.product_id) 
                    WHERE p.product_tp = '" . $product_tp . "' AND ptc.category_id = '" .$catid. "' ORDER BY p.sort_order ASC ");
        return $query->rows;
	}
    public function getProductByTPwithCategory($product_tp) {
        
        
		$query = $this->db->query("SELECT p.product_id,p.product_tp,p.price,pd.name,pd.description,ptc.category_id,cd.name as catename 
                    FROM " . DB_PREFIX . "product p LEFT JOIN ". DB_PREFIX . "product_description pd ON(p.product_id = pd.product_id) 
                    LEFT JOIN  " . DB_PREFIX . "product_to_category ptc ON (p.product_id=ptc.product_id) 
                    LEFT JOIN  " . DB_PREFIX . "category_description cd ON(ptc.category_id=cd.category_id)
                    WHERE p.product_tp = '" . $product_tp . "' ORDER BY p.sort_order ASC ");

		return $query->rows;
	}
    public function getVisaMax()
    {
        $query = $this->db->query("SELECT max(collection_id) as id from " . DB_PREFIX . "visa_data_collection ");
        return $query->rows;
    }
    public function getTicketMax()
    {
        $query = $this->db->query("SELECT max(ticket_id) as id from " . DB_PREFIX . "flight_tickets");
        return $query->rows;
    }
   
    public function getfrontcountryonlyres()
    {
        //echo "SELECT name,country_id FROM " . DB_PREFIX . "country WHERE  status = '1'";
        $query = $this->db->query("SELECT name,country_id FROM " . DB_PREFIX . "country WHERE `country_id` NOT IN(1,205,214,102,2,9,24,192,121,247,235) AND  status = '1'");
        return $query->rows;
    }
    public function getfrontcountry()
    {
        //1,205,214,102,2,9,24,192,121,247,235
        //echo "SELECT name,country_id FROM " . DB_PREFIX . "country WHERE  status = '1'";
        $query = $this->db->query("SELECT name,country_id FROM " . DB_PREFIX . "country WHERE `country_id` NOT IN(18,156,144,162) AND  status = '1'");
        return $query->rows;
    }
    
     public function getProductTpByPID($product_id) {
        
		$query = $this->db->query("SELECT p.product_tp FROM " . DB_PREFIX . "product p  WHERE p.product_id = '" . $product_id . "'");

		return $query->rows;
	}
    
    public function getProductByTP($product_tp) {
        
		$query = $this->db->query("SELECT p.product_id,p.product_tp,p.price,pd.name,pd.description,ptc.category_id FROM " . DB_PREFIX . "product p LEFT JOIN ". DB_PREFIX . "product_description pd ON(p.product_id = pd.product_id) LEFT JOIN  " . DB_PREFIX . "product_to_category ptc ON (p.product_id=ptc.product_id) WHERE p.product_tp = '" . $product_tp . "' ORDER BY p.sort_order ASC ");

		return $query->rows;
	}

	public function getProduct($product_id) {		
       
        $query = $this->db->query("SELECT p.*, pd.name AS name, p.image, p.price, p.quantity,p.location,p.quantity,p.shipping,pd.description,pd.meta_title,pd.meta_description,pd.meta_keyword,pd.tag,(SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews FROM  " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id='". $product_id ."' ");
       
		if ($query->num_rows) {
			return array(
				'product_id'       => $query->row['product_id'],
				'name'             => $query->row['name'],               
				'description'      => $query->row['description'],
				'meta_title'       => $query->row['meta_title'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'model'            => $query->row['model'],
				'sku'              => $query->row['sku'],
				'upc'              => $query->row['upc'],
				'ean'              => $query->row['ean'],
				'jan'              => $query->row['jan'],
				'isbn'             => $query->row['isbn'],
				'mpn'              => $query->row['mpn'],
                'location'         => $query->row['location'],
				'map'              => $query->row['tag'],
				'quantity'         => $query->row['quantity'],
				'image'            => $query->row['image'],
				'price'            => $query->row['price'],
				'points'           => $query->row['points'],
				'tax_class_id'     => $query->row['tax_class_id'],
				'date_available'   => $query->row['date_available'],
				'weight'           => $query->row['weight'],
				'weight_class_id'  => $query->row['weight_class_id'],
				'length'           => $query->row['length'],
				'width'            => $query->row['width'],
				'height'           => $query->row['height'],
				'length_class_id'  => $query->row['length_class_id'],
				'subtract'         => $query->row['subtract'],
				'rating'           => round($query->row['rating']),
				'reviews'          => $query->row['reviews'] ? $query->row['reviews'] : 0,
				'minimum'          => $query->row['minimum'],
				'sort_order'       => $query->row['sort_order'],
				'status'           => $query->row['status'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed']
			);
		} else {
			return false;
		}
	}

	public function getProducts($data = array()) {    
       
      
        $where='';
        $sql = "SELECT DISTINCT(p.product_id), p.image, pd.name, p.location, p.price FROM oc_product p LEFT JOIN oc_product_description pd ON pd.product_id=p.product_id 
        LEFT JOIN oc_product_room_option rp ON rp.product_id  = p.product_id WHERE p.status= '1' AND ";

        if(!empty($data['filter_checkin']) && !empty($data['filter_checkout'])){           
            $sql .=" (rp.stay_period_start <= '".date('Y-m-d',strtotime($data['filter_checkin']))."' AND rp.stay_period_end >= '".date('Y-m-d',strtotime($data['filter_checkout']))."') AND ";
        }
        if(!empty($data['filter_quantity'])){
            $quality = "'" . implode( "','", $data['filter_quantity'] ) . "'";           
            $sql .=" (p.quantity IN(".$quality.")) AND ";
        }   
        if( !empty($data['filter_sku']) || !empty($data['filter_adult']) || !empty($data['filter_child']) ){
             $sql .=" (";
        }      
        
        if(!empty($data['filter_sku'])){
            $where .="(p.sku LIKE '%".$data['filter_sku']."%')";
        }

        if(!empty($data['filter_quantity'])){
            $quantity = "'" . implode( "','", $data['filter_quantity'] ) . "'";
            if($where!=''){
                $where .=" OR ";
            }
            $where .="(p.quantity IN(".$quantity.")) ";
        }
        if(!empty($data['filter_checkin']) && !empty($data['filter_checkout'])){
            if($where!=''){
                $where .=" OR ";
            }
            $where .="(rp.stay_period_start BETWEEN '".date('Y-m-d',strtotime($data['filter_checkin']))."' AND '".date('Y-m-d',strtotime($data['filter_checkout']))."')";
        }
        if(!empty($data['filter_adult'])){
            if($where!=''){
                $where .=" OR ";
            }
            $where .="(rp.adult_occupancy='".$data['filter_adult']."')";
        }
        if(!empty($data['filter_child'])){
            if($where!=''){
                $where .=" OR ";
            }
            $where .="(rp.child_occupancy='".$data['filter_child']."')";
        }
        $sql .= $where;
        if( !empty($data['filter_sku']) ||  !empty($data['filter_adult']) || !empty($data['filter_child']) ){
             $sql .=" ) AND";
        }
       
        $sql .=" (p.product_tp='HB') ";
		

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'p.quantity',
			'p.price',
			'rating',
			'p.sort_order',
			'p.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} elseif ($data['sort'] == 'p.price') {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
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
        
		$product_data = array();
       // echo $sql; exit;
		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$product_data[$result['product_id']] = $this->getProduct($result['product_id']);
		}
		return $product_data;
	}

	public function getProductSpecials($data = array()) {
		$sql = "SELECT DISTINCT ps.product_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = ps.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'ps.price',
			'rating',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
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

		$product_data = array();

		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$product_data[$result['product_id']] = $this->getProduct($result['product_id']);
		}

		return $product_data;
	}

	public function getLatestProducts($limit) {
		$product_data = $this->cache->get('product.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit);

		if (!$product_data) {
			$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.date_added DESC LIMIT " . (int)$limit);

			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->getProduct($result['product_id']);
			}

			$this->cache->set('product.latest.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit, $product_data);
		}

		return $product_data;
	}

	public function getPopularProducts($limit) {
		$product_data = $this->cache->get('product.popular.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit);
	
		if (!$product_data) {
			$query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.viewed DESC, p.date_added DESC LIMIT " . (int)$limit);
	
			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->getProduct($result['product_id']);
			}
			
			$this->cache->set('product.popular.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit, $product_data);
		}
		
		return $product_data;
	}

	public function getBestSellerProducts($limit) {
		$product_data = $this->cache->get('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit);

		if (!$product_data) {
			$product_data = array();

			$query = $this->db->query("SELECT op.product_id, SUM(op.quantity) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.product_id ORDER BY total DESC LIMIT " . (int)$limit);

			foreach ($query->rows as $result) {
				$product_data[$result['product_id']] = $this->getProduct($result['product_id']);
			}

			$this->cache->set('product.bestseller.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$limit, $product_data);
		}

		return $product_data;
	}
   
	public function getProductAttributes($product_id) {
		$product_attribute_group_data = array();

		$product_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE pa.product_id = '" . (int)$product_id . "' AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");

		foreach ($product_attribute_group_query->rows as $product_attribute_group) {
			$product_attribute_data = array();

			$product_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name, pa.text FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.product_id = '" . (int)$product_id . "' AND a.attribute_group_id = '" . (int)$product_attribute_group['attribute_group_id'] . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY a.sort_order, ad.name");

			foreach ($product_attribute_query->rows as $product_attribute) {
				$product_attribute_data[] = array(
					'attribute_id' => $product_attribute['attribute_id'],
					'name'         => $product_attribute['name'],
					'text'         => $product_attribute['text']
				);
			}

			$product_attribute_group_data[] = array(
				'attribute_group_id' => $product_attribute_group['attribute_group_id'],
				'name'               => $product_attribute_group['name'],
				'attribute'          => $product_attribute_data
			);
		}

		return $product_attribute_group_data;
	}

	public function getProductOptions($product_id) {
		$product_option_data = array();

$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.required = '1' AND po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");

		foreach ($product_option_query->rows as $product_option) {
			$product_option_value_data = array();

			$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");

			foreach ($product_option_value_query->rows as $product_option_value) {
				$product_option_value_data[] = array(
					'product_option_value_id' => $product_option_value['product_option_value_id'],
					'option_value_id'         => $product_option_value['option_value_id'],
					'name'                    => $product_option_value['name'],
					'image'                   => $product_option_value['image'],
					'quantity'                => $product_option_value['quantity'],
					'subtract'                => $product_option_value['subtract'],
					'price'                   => $product_option_value['price'],
                    'time_val'                   => $product_option_value['time_val'],
                    'price_type'                   => $product_option_value['price_type'],
                    /*customadd child price*/
                    'child_price'                   => $product_option_value['child_price'],
                    'top_up_adults'                   => $product_option_value['top_up_adults'],
                    'top_up_child'                   => $product_option_value['top_up_child'],
					'price_prefix'            => $product_option_value['price_prefix'],
					'weight'                  => $product_option_value['weight'],
					'weight_prefix'           => $product_option_value['weight_prefix']
				);
			}

			$product_option_data[] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => $product_option['value'],
				'required'             => $product_option['required']
			);
		}

		return $product_option_data;
	}

	public function getProductDiscounts($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity ASC, priority ASC, price ASC");

		return $query->rows;
	}

	public function getProductImagesBannerName($product_id) {
		
        $query = $this->db->query("SELECT pi.image,pi.product_id,pd.name FROM " . DB_PREFIX . "product_image pi LEFT JOIN " . DB_PREFIX . "product_description pd ON(pi.product_id = pd.product_id) WHERE pi.product_id = '" . (int)$product_id . "' ORDER BY pi.sort_order ASC");

		return $query->rows;
	}
    
    
    public function getProductImages($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductRelated($product_id) {
		$product_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related pr LEFT JOIN " . DB_PREFIX . "product p ON (pr.related_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pr.product_id = '" . (int)$product_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		foreach ($query->rows as $result) {
			$product_data[$result['related_id']] = $this->getProduct($result['related_id']);
		}

		return $product_data;
	}

	public function getProductLayoutId($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getCategories($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {

        $where ='';
		$sql = "SELECT COUNT(DISTINCT(p.product_id)) AS total FROM oc_product p LEFT JOIN oc_product_description pd ON pd.product_id=p.product_id 
        LEFT JOIN oc_product_room_option rp ON rp.product_id  = p.product_id WHERE (p.status = '1' ) AND ";
        
        if(!empty($data['filter_checkin']) && !empty($data['filter_checkout'])){           
            $sql .=" (rp.stay_period_start <= '".date('Y-m-d',strtotime($data['filter_checkin']))."' AND rp.stay_period_end >= '".date('Y-m-d',strtotime($data['filter_checkout']))."') AND ";
        }
        if(!empty($data['filter_quantity'])){
            $quality = "'" . implode( "','", $data['filter_quantity'] ) . "'";           
            $sql .=" (p.quantity IN(".$quality.")) AND ";
        }        
        if( !empty($data['filter_sku']) ||  !empty($data['filter_adult']) || !empty($data['filter_child']) ){
             $sql .=" (";
        }
       
        if(!empty($data['filter_sku'])){
            $where .="(p.sku LIKE '%".$data['filter_sku']."%')";
        }         
        
        if(!empty($data['filter_adult'])){
            if($where !=''){
                $where .=" OR ";
            }
            $where .=" (rp.adult_occupancy >='".$data['filter_adult']."')";
        }
        if(!empty($data['filter_child'])){
             if($where !=''){
                $where .=" OR ";
            }
            $where .=" (rp.child_occupancy >='".$data['filter_child']."')";
        }
        $sql .= $where;
        if( !empty($data['filter_sku']) || !empty($data['filter_adult']) || !empty($data['filter_child']) ){
             $sql .=" ) AND ";
        }

        $sql .=" (p.product_tp='HB') ";	
         //echo $sql;exit;	
       
		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getProfile($product_id, $recurring_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "recurring r JOIN " . DB_PREFIX . "product_recurring pr ON (pr.recurring_id = r.recurring_id AND pr.product_id = '" . (int)$product_id . "') WHERE pr.recurring_id = '" . (int)$recurring_id . "' AND status = '1' AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "'");

		return $query->row;
	}

	public function getProfiles($product_id) {
		$query = $this->db->query("SELECT rd.* FROM " . DB_PREFIX . "product_recurring pr JOIN " . DB_PREFIX . "recurring_description rd ON (rd.language_id = " . (int)$this->config->get('config_language_id') . " AND rd.recurring_id = pr.recurring_id) JOIN " . DB_PREFIX . "recurring r ON r.recurring_id = rd.recurring_id WHERE pr.product_id = " . (int)$product_id . " AND status = '1' AND pr.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' ORDER BY sort_order ASC");

		return $query->rows;
	}
    
    public function get_park_products_large($type){
        
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product tb1 JOIN " . DB_PREFIX . "product_description tb2 ON (tb2.product_id = tb1.product_id) WHERE tb1.product_tp ='".$type."' AND tb1.status = '1' AND tb2.show_large = 'Y' ");
		return $query->rows;
    }
    
    public function get_park_products_small($type){
        
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product tb1 JOIN " . DB_PREFIX . "product_description tb2 ON (tb2.product_id = tb1.product_id) WHERE tb1.product_tp ='".$type."' AND tb1.status = '1' AND tb2.show_large = 'N' limit 4 ");
		return $query->rows;
    }

	public function getTotalProductSpecials() {
		$query = $this->db->query("SELECT COUNT(DISTINCT ps.product_id) AS total FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))");

		if (isset($query->row['total'])) {
			return $query->row['total'];
		} else {
			return 0;
		}
	}
    public function getHotelRoomOptions($hotel_id){
        $room_option_data = array();

        $room_custom_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_custom WHERE product_id='". $hotel_id ."' ");
         
        foreach( $room_custom_query->rows as $room_option){
               

                $room_option_query  = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_room_option WHERE room_category_id = '". $room_option['product_custom_id'] ."' ");
               
                $items = array();
                //$room_option_data[$room_option['product_custom_id']]['room_options'] = '';
                foreach($room_option_query->rows as $options){
                    $room_option_data[$options['product_room_option_id']]['product_custom_id']   = $room_option['product_custom_id'];
                    $room_option_data[$options['product_room_option_id']]['room_category']       = $room_option['room_category'];
                    $room_option_data[$options['product_room_option_id']]['product_room_option_id'] = $options['product_room_option_id'];
                    $room_option_data[$options['product_room_option_id']]['product_id'] = $options['product_id'];
                    $room_option_data[$options['product_room_option_id']]['room_category_id']   = $options['room_category_id'];
                    $room_option_data[$options['product_room_option_id']]['stay_period_start']  = $options['stay_period_start']; 
                    $room_option_data[$options['product_room_option_id']]['stay_period_end']    = $options['stay_period_end'];
                    $room_option_data[$options['product_room_option_id']]['stay_period_end']    = $options['stay_period_end'];
                    $room_option_data[$options['product_room_option_id']]['all_market_price']   = $options['all_market_price'];
                    $room_option_data[$options['product_room_option_id']]['ind_market_price']   = $options['ind_market_price'];
                    $room_option_data[$options['product_room_option_id']]['all_adult_BB_price'] = $options['all_adult_BB_price'];
                    $room_option_data[$options['product_room_option_id']]['all_child_BB_price'] = $options['all_child_BB_price']; 
                    $room_option_data[$options['product_room_option_id']]['all_adult_HB_price'] = $options['all_adult_HB_price'];
                    $room_option_data[$options['product_room_option_id']]['all_child_HB_price'] = $options['all_child_HB_price']; 
                    $room_option_data[$options['product_room_option_id']]['all_adult_FB_price'] = $options['all_adult_FB_price'];
                    $room_option_data[$options['product_room_option_id']]['all_child_FB_price'] = $options['all_child_FB_price'];
                    $room_option_data[$options['product_room_option_id']]['ind_adult_BB_price'] = $options['ind_adult_BB_price'];
                    $room_option_data[$options['product_room_option_id']]['ind_child_BB_price'] = $options['ind_child_BB_price'];
                    $room_option_data[$options['product_room_option_id']]['ind_adult_HB_price'] = $options['ind_adult_HB_price'];
                    $room_option_data[$options['product_room_option_id']]['ind_child_HB_price'] = $options['ind_child_HB_price'];
                    $room_option_data[$options['product_room_option_id']]['ind_adult_FB_price'] = $options['ind_adult_FB_price'];
                    $room_option_data[$options['product_room_option_id']]['ind_child_FB_price'] = $options['ind_child_FB_price'];
                    $room_option_data[$options['product_room_option_id']]['book_period_start']  = $options['book_period_start'];
                    $room_option_data[$options['product_room_option_id']]['book_period_end']    = $options['book_period_end'];
                    $room_option_data[$options['product_room_option_id']]['discount_percentage']= $options['discount_percentage'];
                    $room_option_data[$options['product_room_option_id']]['meal_options']       = $options['meal_options'];
                    $room_option_data[$options['product_room_option_id']]['adult_occupancy']    = $options['adult_occupancy'];
                    $room_option_data[$options['product_room_option_id']]['child_occupancy']    = $options['child_occupancy'];
                    //$room_option_data[$room_option['product_custom_id']]['room_options'][] = $items;
                }

       }
       return $room_option_data;
    }
    
    function storeTours($optiondata){        
        
        $this->db->query("INSERT INTO " . DB_PREFIX . "order_tours SET product_id = '".$optiondata['product_id']."',top_up='".$optiondata['top_up']."',family_type='".$optiondata['family_type']."',total_price_adult='".$optiondata['total_price_adult']."',
        total_price_child='".$optiondata['total_price_child']."',travel_type ='".$optiondata['travel_type']."',	tour_date='".date('Y-m-d',strtotime($optiondata['tour_date']))."',pickup_location='".$optiondata['pickup_location']."',private_package_price ='".$optiondata['private_package_price']."',parent_hide_price ='".$optiondata['parent_hide_price']."',child_hide_price='".$optiondata['child_hide_price']."' ");
        return $this->db->getLastId();
    }

    function storeParks($optiondata){        
        
        $this->db->query("INSERT INTO " . DB_PREFIX . "order_parks SET product_id = '".$optiondata['product_id']."',top_up='".$optiondata['top_up']."',family_type='".$optiondata['family_type']."',total_price_adult='".$optiondata['total_price_adult']."',
        total_price_child='".$optiondata['total_price_child']."',travel_type ='".$optiondata['travel_type']."',	tour_date='".date('Y-m-d',strtotime($optiondata['tour_date']))."',pickup_location='".$optiondata['pickup_location']."',private_package_price ='".$optiondata['private_package_price']."',parent_hide_price ='".$optiondata['parent_hide_price']."',child_hide_price='".$optiondata['child_hide_price']."' ");
        return $this->db->getLastId();
    }
    function storeTransport($optiondata){
    	$this->db->query("INSERT INTO " . DB_PREFIX . "order_transport SET vehicle_id = '".$optiondata['vehicle_id']."',direction_type='".$optiondata['direction_type']."',trip_date='".date('Y-m-d',strtotime($optiondata['trip_date']))."',pickup_location='".$optiondata['pickup_location']."',drop_location='".$optiondata['drop_location']."',pickup_time ='".$optiondata['pickup_time']."',transfer_option ='".$optiondata['transfer_option']."' ");
    	return $this->db->getLastId();
    }
    function storeFlightTicket($optiondata){
    	$this->db->query("INSERT INTO " . DB_PREFIX . "flight_tickets SET passenger_name = '".$optiondata['passenger_name']."',flight_ticket='".$optiondata['flight_ticket']."' ");
    	return $this->db->getLastId();
    }
    function addvisainformation($podata){
       
        $this->db->query("INSERT INTO " . DB_PREFIX . "visa_data_collection SET name = '".$podata['applicant_name']."', visa_type='".$podata['visa_option']."',price='".$podata['visa_price']."',passport_front='".$podata['travellerspassportfront']."',passport_back='".$podata['travellerspassportback']."',pasengerimage='".$podata['travellersimage']."',ref_id='' ");
        return $this->db->getLastId();
    }
    function storeRoomOptions($optiondata){
        
        if(isset($optiondata['discount'])){
            $discount = $optiondata['discount'];
            $discount_price = ( $optiondata['discount'] / 100 ) * $optiondata['market_price'];            
            $room_total_price = round( $optiondata['market_price'] - $discount_price ); 
        }else{
            $discount = 0;
            $room_total_price = $optiondata['market_price'];
        }
        
        $this->db->query("INSERT INTO " . DB_PREFIX . "hotel_booking SET product_id = '".$optiondata['product_id']."',room_option_id='".$optiondata['room_option_id']."',room_type='".$optiondata['room_type']."',meals_option='".$optiondata['meals_option']."',discount_percentage='".$discount."',room_price ='".$optiondata['market_price']."',rooms_selected='".$optiondata['room_selected']."',total_amount='".$room_total_price."' ");

        return $this->db->getLastId();
    }
    /* update order id with custom tabled*/
    function updateRoomOption($order_id,$roomIds){
    	foreach($roomIds as $room_id){
    		$this->db->query("UPDATE " . DB_PREFIX . "hotel_booking SET order_id = '" . (int)$order_id . "' WHERE booking_id = '" . (int)$room_id . "'");
    	}    	
    }
    function updateVisaInformation($order_id,$visaIds){
    	foreach($visaIds as $visa_id){
    		$this->db->query("UPDATE " . DB_PREFIX . "visa_data_collection SET ref_id = '" . (int)$order_id . "' WHERE collection_id = '" . (int)$visa_id . "'");
    	}    	
    }
    function updateTransportInformation($order_id,$transportId){
    	//foreach($visaIds as $visa_id){
    		$this->db->query("UPDATE " . DB_PREFIX . "order_transport SET order_id = '" . (int)$order_id . "' WHERE order_transport_id = '" . (int)$transportId . "'");
    	//}    	
    }	
    function updateParkInformation($order_id,$parksIds){
    	foreach($parksIds as $park_id){
    		$this->db->query("UPDATE " . DB_PREFIX . "order_parks SET order_id = '" . (int)$order_id . "' WHERE order_park_id = '" . (int)$park_id . "'");
    	}    	
    }
    function updateTourInformation($order_id,$toursIds){
    	foreach($toursIds as $tour_id){
    		$this->db->query("UPDATE " . DB_PREFIX . "order_tours SET order_id = '" . (int)$order_id . "' WHERE order_tour_id = '" . (int)$tour_id . "'");
    	}    	
    }
    function updateTicketInformation($order_id,$ticketId){
    	$this->db->query("UPDATE " . DB_PREFIX . "flight_tickets SET order_id = '" . (int)$order_id . "' WHERE ticket_id = '" . (int)$ticketId . "'");    	
    }	


}
