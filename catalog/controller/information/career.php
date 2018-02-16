<?php
class ControllerInformationCareer extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/career');

		$this->document->setTitle($this->language->get('heading_title'));


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {           


            // Multiple recipients



			
			/*echo "<pre/>";
			print_r($this->request->post);
			echo "<pre/>";
			print_r($this->request->files);exit;*/
			//$to = $this->config->get('config_email'); // note the comma
			//$to = 'backend@mindsmetricks.com'; // note the comma
			
			// Subject
			$subject = html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8');
			/* fatch all variable here */
             $name              = $this->request->post['name'];
             $dob             = $this->request->post['dob'];
             $nationality             = $this->request->post['nationality'];
             $country_residence       = $this->request->post['country_residence'];
             $apply_position      	= $this->request->post['apply_position'];
             $current_company       = $this->request->post['current_company'];
             $current_designation   = $this->request->post['current_designation'];
             $current_industry           = $this->request->post['current_industry'];
             $prior_companies           = $this->request->post['prior_companies'];
             $prior_designation           = $this->request->post['prior_designation'];
             $current_salary           = $this->request->post['prior_industry'];
             $prior_industry           = $this->request->post['current_salary'];
             $expected_salary           = $this->request->post['expected_salary'];
			// Message
			 $messageobesend ="<table width='100%' cellpadding='0' cellspacing='0'>
                            <tr><td wdith='30%'>Name</td><td>:- ".$name."</td></tr>
                            <tr><td wdith='30%'>Nationality</td><td>:- ".$nationality."</td></tr>
                            <tr><td wdith='30%'>Country of residence</td><td>:- ".$country_residence."</td></tr>
                            <tr><td wdith='30%'>Applying for</td><td>:- ".$apply_position."</td></tr>
                            <tr><td wdith='30%'>Current company</td><td>:- ".$current_company."</td></tr>
                            <tr><td wdith='30%'>Current designation</td><td>:- ".$current_designation."</td></tr>
                            <tr><td wdith='30%'>Current industry</td><td>:- ".$current_industry."</td></tr>
                            <tr><td wdith='30%'>Prior companies</td><td>:- ".$prior_companies."</td></tr>
                            <tr><td wdith='30%'>Prior designation</td><td>:- ".$prior_designation."</td></tr>
                            <tr><td wdith='30%'>Current salary</td><td>:- ".$current_salary."</td></tr>
                            <tr><td wdith='30%'>Prior industry</td><td>:- ".$prior_industry."</td></tr>
                            <tr><td wdith='30%'>Expected salary</td><td>:- ".$expected_salary."</td></tr>                          
                        </table>";
            ///uploading 
            $to = $this->config->get('config_email'); // note the comma
			//$to = 'backend@mindsmetricks.com'; // note the comma



			// boundary 
		    /*$semi_rand = md5(time()); 
		    $mime_boundary = "==Multipart_Boundary_x{$semi_rand}x"; 

		    // headers for attachment 
		    $headers = '\nMIME-Version: 1.0\n' . 'Content-Type: multipart/mixed;\n' . ' boundary=\'{$mime_boundary}\''; 

		    // multipart boundary 
		    $message = "--{$mime_boundary}\n" . "Content-Type: text/html; charset=\"UTF-8\"\n" .
		    "Content-Transfer-Encoding: 7bit\n\n" . $messageobesend . "\n\n";         
            if($this->request->files['resume']){
            	$imageFileResume = pathinfo($this->request->files['resume']['name'],PATHINFO_EXTENSION);
            	
	            $filenameresume      ='resume-'.$this->request->files['resume']['name'].'.'.$imageFileResume;
	            $target_fileresume  = DIR_IMAGE_CAREER . $filenameresume;
	            move_uploaded_file($this->request->files['resume']['tmp_name'], $target_fileresume);

	            $file = fopen($target_fileresume,"rb");
				$data = fread($file,filesize($target_fileresume));
				fclose($file);
				$data = chunk_split(base64_encode($data));
				$message .= "Content-Type: {\"application/octet-stream\"};\n" . " name=\"$filenameresume\"\n" . 
				"Content-Disposition: attachment;\n" . " filename=\"$target_fileresume\"\n" . 
				"Content-Transfer-Encoding: base64\n\n" . $data . "\n\n";
				$message .= "--{$mime_boundary}\n";
            }
            if($this->request->files['cover_letter']){
            	$imageFileCoverLetter = pathinfo($this->request->files['cover_letter']['name'],PATHINFO_EXTENSION);
	            $filenamecoverletter      ='cover_letter-'.$this->request->files['cover_letter']['name'].'.'.$imageFileCoverLetter;
	            $target_filefilenamecoverletter  = DIR_IMAGE_CAREER . $filenamecoverletter;
	            move_uploaded_file($this->request->files['cover_letter']['tmp_name'], $target_filefilenamecoverletter);

	            $file = fopen($target_filefilenamecoverletter,"rb");
				$data = fread($file,filesize($target_filefilenamecoverletter));
				fclose($file);
				$data = chunk_split(base64_encode($data));
				$message .= "Content-Type: {\"application/octet-stream\"};\n" . " name=\"$filenamecoverletter\"\n" . 
				"Content-Disposition: attachment;\n" . " filename=\"$target_filefilenamecoverletter\"\n" . 
				"Content-Transfer-Encoding: base64\n\n" . $data . "\n\n";
				$message .= "--{$mime_boundary}\n";
            }
            if($this->request->files['documents']){
            	$imageFileDocuments = pathinfo($this->request->files['documents']['name'],PATHINFO_EXTENSION);
	            $filenamedocument      ='documents-'.$this->request->files['documents']['name'].'.'.$imageFileDocuments;
	            $target_filefilenamedocuments  = DIR_IMAGE_CAREER . $filenamedocument;
	            move_uploaded_file($this->request->files['documents']['tmp_name'], $target_filefilenamedocuments);

	            $file = fopen($target_filefilenamedocuments,"rb");
				$data = fread($file,filesize($target_filefilenamedocuments));
				fclose($file);
				$data = chunk_split(base64_encode($data));
				$message .= "Content-Type: {\"application/octet-stream\"};\n" . " name=\"$filenamedocument\"\n" . 
				"Content-Disposition: attachment;\n" . " filename=\"$target_filefilenamedocuments\"\n" . 
				"Content-Transfer-Encoding: base64\n\n" . $data . "\n\n";
				$message .= "--{$mime_boundary}\n";
            }            */

            $headers[] = 'MIME-Version: 1.0\r\n';
			$headers[] = 'Content-type: text/html; charset=utf-8\r\n';
			$headers [] = 'Cc: kevin.dsouza@ctctourism.ae';
			// Additional headers
			/*$headers[] = 'To: Mary <mary@example.com>, Kelly <kelly@example.com>';
			$headers[] = 'From: Birthday Reminder <birthday@example.com>';
			$headers[] = 'Cc: birthdayarchive@example.com';
			$headers[] = 'Bcc: birthdaycheck@example.com';*/

			// Mail it
			mail($to, $subject, $messageobesend,  implode("\r\n", $headers));




			$this->response->redirect($this->url->link('information/career/success'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/careers')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_name'] = $this->language->get('text_name');
		

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['dob'])) {
			$data['error_dob'] = $this->error['dob'];
		} else {
			$data['error_dob'] = '';
		}		
        
        /*custom add*/
        if (isset($this->error['country_residence'])) {
			$data['error_country_residence'] = $this->error['country_residence'];
		} else {
			$data['error_country_residence'] = '';
		}
        if (isset($this->error['apply_position'])) {
			$data['error_apply_position'] = $this->error['apply_position'];
		} else {
			$data['error_apply_position'] = '';
		}
        
        /**/
        
		$data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('information/career', '', true);

		$this->load->model('tool/image');

		if ($this->config->get('config_image')) {
			$data['image'] = $this->model_tool_image->resize($this->config->get('config_image'), $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
		} else {
			$data['image'] = false;
		}

		$data['store'] = $this->config->get('config_name');
		$data['address'] = nl2br($this->config->get('config_address'));
		$data['geocode'] = $this->config->get('config_geocode');
		$data['geocode_hl'] = $this->config->get('config_language');
		$data['telephone'] = $this->config->get('config_telephone');
        /**/
        $data['telephone2'] = $this->config->get('config_telephone2');
        /**/
		$data['fax'] = $this->config->get('config_fax');
		$data['open'] = nl2br($this->config->get('config_open'));
		$data['comment'] = $this->config->get('config_comment');

		$data['locations'] = array();		

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} else {
			$data['name'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['dob'])) {
			$data['dob'] = $this->request->post['dob'];
		} else {
			$data['dob'] = '';
		}

		if (isset($this->request->post['nationality'])) {
			$data['nationality'] = $this->request->post['nationality'];
		} else {
			$data['nationality'] = '';
		}

		if (isset($this->request->post['country_residence'])) {
			$data['country_residence'] = $this->request->post['country_residence'];
		} else {
			$data['country_residence'] = '';
		}
		if (isset($this->request->post['apply_position'])) {
			$data['apply_position'] = $this->request->post['apply_position'];
		} else {
			$data['apply_position'] = '';
		}
		if (isset($this->request->post['current_company'])) {
			$data['current_company'] = $this->request->post['current_company'];
		} else {
			$data['current_company'] = '';
		}
		if (isset($this->request->post['current_designation'])) {
			$data['current_designation'] = $this->request->post['current_designation'];
		} else {
			$data['current_designation'] = '';
		}
		if (isset($this->request->post['current_industry'])) {
			$data['current_industry'] = $this->request->post['current_industry'];
		} else {
			$data['current_industry'] = '';
		}

		if (isset($this->request->post['prior_companies'])) {
			$data['prior_companies'] = $this->request->post['prior_companies'];
		} else {
			$data['prior_companies'] = '';
		}
		if (isset($this->request->post['prior_designation'])) {
			$data['prior_designation'] = $this->request->post['prior_designation'];
		} else {
			$data['prior_designation'] = '';
		}
		if (isset($this->request->post['prior_industry'])) {
			$data['prior_industry'] = $this->request->post['prior_industry'];
		} else {
			$data['prior_industry'] = '';
		}
		if (isset($this->request->post['current_salary'])) {
			$data['current_salary'] = $this->request->post['current_salary'];
		} else {
			$data['current_salary'] = '';
		}
		if (isset($this->request->post['prior_designation'])) {
			$data['prior_designation'] = $this->request->post['prior_designation'];
		} else {
			$data['prior_designation'] = '';
		}
		if (isset($this->request->post['prior_industry'])) {
			$data['prior_industry'] = $this->request->post['prior_industry'];
		} else {
			$data['prior_industry'] = '';
		}
		if (isset($this->request->post['current_salary'])) {
			$data['current_salary'] = $this->request->post['current_salary'];
		} else {
			$data['current_salary'] = '';
		}
		if (isset($this->request->post['expected_salary'])) {
			$data['expected_salary'] = $this->request->post['expected_salary'];
		} else {
			$data['expected_salary'] = '';
		}


		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/career', $data));
	}

	protected function validate() {
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 50)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		if ($this->request->post['dob'] == "") {
			$this->error['dob'] = $this->language->get('error_dob');
		}

		if ($this->request->post['nationality'] == "") {
			$this->error['nationality'] = $this->language->get('error_nationality');
		}
		if ($this->request->post['country_residence'] == "") {
			$this->error['country_residence'] = $this->language->get('error_country_residence');
		}
		if ($this->request->post['apply_position'] == "") {
			$this->error['apply_position'] = $this->language->get('error_apply_position');
		}
		return !$this->error;
	}

	public function success() {
		$this->load->language('information/career');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/career')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = $this->language->get('text_success');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/success', $data));
	}
	
	
}
