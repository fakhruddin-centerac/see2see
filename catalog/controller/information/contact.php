<?php
class ControllerInformationContact extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/contact');

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) 
        {
			 /*$mail = new Mail();
			 $mail->protocol = $this->config->get('config_mail_protocol');
			 $mail->parameter = $this->config->get('config_mail_parameter');
			 $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			 $mail->smtp_username = $this->config->get('config_mail_smtp_username');
			 $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			 $mail->smtp_port = $this->config->get('config_mail_smtp_port');
			 $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');*/
             
             /* fatch all variable here */
             /*$name              = $this->request->post['name'];
             $email             = $this->request->post['email'];
             $phone             = $this->request->post['phone'];
             $optionstype       = $this->request->post['optionstype'];
             $queryrelated      = $this->request->post['queryrelated'];
             $subject           = $this->request->post['subject'];
             $enquiry           = $this->request->post['enquiry'];
             
             $messageobesend ="<table width='100%' cellpadding='0' cellspacing='0'>
                            <tr><td wdith='30%'>Name</td><td>:- ".$name."</td></tr>
                            <tr><td wdith='30%'>Email </td><td>:- ".$email."</td></tr>
                            <tr><td wdith='30%'>Phone</td><td>:- ".$phone."</td></tr>
                            <tr><td wdith='30%'>For What</td><td>:- ".$optionstype."</td></tr>
                            <tr><td wdith='30%'>Query Related To </td><td>:- ".$queryrelated."</td></tr>
                            <tr><td wdith='30%'>Subject</td><td>:- ".$subject."</td></tr>
                            <tr><td wdith='30%'>Enquiry</td><td>:- ".$enquiry."</td></tr>
                        </table>";
             
             $mail->setTo($this->config->get('config_email'));
			 $mail->setFrom($this->request->post['email']);
			 $mail->setCc( array("ali@ctctourism.ae", "kevin.dsouza@ctctourism.ae"));
			 $mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			 $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			 //$mail->setText($this->request->post['enquiry']);
			 $mail->setHtml(html_entity_decode($messageobesend, ENT_QUOTES, 'UTF-8'));
            
             $mail->send();*/

             // Multiple recipients
			$to = $this->config->get('config_email'); // note the comma
			//$to = 'backend@mindsmetricks.com'; // note the comma
			
			// Subject
			$subject = html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8');
			/* fatch all variable here */
             $name              = $this->request->post['name'];
             $email             = $this->request->post['email'];
             $code              = $this->request->post['code'];
             $phone             = $this->request->post['phone'];
             $optionstype       = $this->request->post['optionstype'];
             $queryrelated      = $this->request->post['queryrelated'];
             $subject           = $this->request->post['subject'];
             $enquiry           = $this->request->post['enquiry'];
			// Message
			 $messageobesend ="<table width='100%' cellpadding='0' cellspacing='0'>
                            <tr><td wdith='30%'>Name</td><td>:- ".$name."</td></tr>
                            <tr><td wdith='30%'>Email </td><td>:- ".$email."</td></tr>
                            <tr><td wdith='30%'>Phone</td><td>:- ".$code." ".$phone."</td></tr>
                            <tr><td wdith='30%'>For What</td><td>:- ".$optionstype."</td></tr>
                            <tr><td wdith='30%'>Query Related To </td><td>:- ".$queryrelated."</td></tr>
                            <tr><td wdith='30%'>Subject</td><td>:- ".$subject."</td></tr>
                            <tr><td wdith='30%'>Enquiry</td><td>:- ".$enquiry."</td></tr>
                        </table>";

			// To send HTML mail, the Content-type header must be set
			$headers[] = 'MIME-Version: 1.0\r\n';
			$headers[] = 'Content-type: text/html; charset=utf-8\r\n';

			// Additional headers
			//$headers[] = 'To: Ali <ali@ctctourism.ae>, Kevin <kevin.dsouza@ctctourism.ae>';
			//$headers[] = "From: $name <$email>";
			$headers[] = 'Cc: kevin.dsouza@ctctourism.ae';
			//$headers['Cc'] = 'ali@ctctourism.ae, kevin.dsouza@ctctourism.ae';
			

			// Mail it
			mail($to, $subject, $messageobesend, implode("\r\n", $headers));












			$this->response->redirect($this->url->link('information/contact/success'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/contact')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_location'] = $this->language->get('text_location');
		$data['text_store'] = $this->language->get('text_store');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_telephone'] = $this->language->get('text_telephone');
		$data['text_fax'] = $this->language->get('text_fax');
		$data['text_open'] = $this->language->get('text_open');
		$data['text_comment'] = $this->language->get('text_comment');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_enquiry'] = $this->language->get('entry_enquiry');

		$data['button_map'] = $this->language->get('button_map');

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['enquiry'])) {
			$data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$data['error_enquiry'] = '';
		}

		if (isset($this->error['optiontype'])) {
			$data['error_optiontype'] = $this->error['optiontype'];
		} else {
			$data['error_optiontype'] = '';
		}
		if (isset($this->error['related'])) {
			$data['error_related'] = $this->error['related'];
		} else {
			$data['error_related'] = '';
		}
        
        /*custom add*/
        if (isset($this->error['phone'])) {
			$data['error_phone'] = $this->error['phone'];
		} else {
			$data['error_phone'] = '';
		}
        if (isset($this->error['subject'])) {
			$data['error_subject'] = $this->error['subject'];
		} else {
			$data['error_subject'] = '';
		}
        
        /**/
        
		$data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('information/contact', '', true);

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

		$this->load->model('localisation/location');

		foreach((array)$this->config->get('config_location') as $location_id) {
			$location_info = $this->model_localisation_location->getLocation($location_id);

			if ($location_info) {
				if ($location_info['image']) {
					$image = $this->model_tool_image->resize($location_info['image'], $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
				} else {
					$image = false;
				}

				$data['locations'][] = array(
					'location_id' => $location_info['location_id'],
					'name'        => $location_info['name'],
					'address'     => nl2br($location_info['address']),
					'geocode'     => $location_info['geocode'],
					'telephone'   => $location_info['telephone'],
					'fax'         => $location_info['fax'],
					'image'       => $image,
					'open'        => nl2br($location_info['open']),
					'comment'     => $location_info['comment']
				);
			}
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} else {
			$data['name'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = $this->customer->getEmail();
		}

		if (isset($this->request->post['enquiry'])) {
			$data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$data['enquiry'] = '';
		}
        
        	/*custom code*/
         	if (isset($this->request->post['code'])) {
			$data['code'] = $this->request->post['code'];
		} else {
			$data['code'] = '';
		}
       		if (isset($this->request->post['phone'])) {
			$data['phone'] = $this->request->post['phone'];
		} else {
			$data['phone'] = '';
		}
        	if (isset($this->request->post['subject'])) {
			$data['subject'] = $this->request->post['subject'];
		} else {
			$data['subject'] = '';
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
		} else {
			$data['captcha'] = '';
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/contact', $data));
	}

	protected function validate() {

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		/*if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
			$this->error['enquiry'] = $this->language->get('error_enquiry');
		}*/
		if (!isset($this->request->post['optionstype']) ) {
			$this->error['optiontype'] = $this->language->get('error_optiontype');
		}
		if (!isset($this->request->post['queryrelated']) ) {
			$this->error['related'] = $this->language->get('error_queryrelated');
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		return !$this->error;
	}

	public function success() {
		$this->load->language('information/contact');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/contact')
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
	public function enquiry(){



		if (($this->request->server['REQUEST_METHOD'] == 'POST')){
			// Multiple recipients
			$to = $this->config->get('config_email'); // note the comma
			
			// Subject
			$subject = 'Quick enquiry from CTC Tourism';
			/* fatch all variable here */
			$name              = $this->request->post['name'];
         	$email             = $this->request->post['email'];
         	$phone             = $this->request->post['phone'];
         	$enquiry           = $this->request->post['enquiry'];
			// Message
			$message = "
			<html>
			<head>
			  <title>Quick enquiry from CTC Tourism</title>
			</head>
			<body>
			  <p>You have a quick enquiry from CTC Tourism website. Please find the details below.</p>
			  	<table width='100%' cellpadding='0' cellspacing='0'>
	                <tr><td wdith='30%'>Name</td><td>:- ".$name."</td></tr>
	                <tr><td wdith='30%'>Email </td><td>:- ".$email."</td></tr>
	                <tr><td wdith='30%'>Phone</td><td>:- ".$phone."</td></tr>
	                <tr><td wdith='30%'>Enquiry</td><td>:- ".$enquiry."</td></tr>
	            </table>
			</body>
			</html>
			";

			// To send HTML mail, the Content-type header must be set
			$headers[] = 'MIME-Version: 1.0';
			$headers[] = 'Content-type: text/html; charset=iso-8859-1';

			// Additional headers
			/*$headers[] = 'To: Mary <mary@example.com>, Kelly <kelly@example.com>';
			$headers[] = 'From: Birthday Reminder <birthday@example.com>';
			$headers[] = 'Cc: birthdayarchive@example.com';
			$headers[] = 'Bcc: birthdaycheck@example.com';*/

			// Mail it
			mail($to, $subject, $message, implode("\r\n", $headers));

			$json = array('success'=>true,'message'=>'Your enquiry submitted successfully');
			$this->response->setOutput(json_encode($json));
		}

	}
	public function whatsappRegister(){
		if (($this->request->server['REQUEST_METHOD'] == 'POST')){
			// Multiple recipients
			$to = $this->config->get('config_email'); // note the comma

			// Subject
			$subject = 'Whatsapp Registration request from CTC Tourism';
			/* fatch all variable here */
			$name              = $this->request->post['name'];
         	$email             = $this->request->post['email'];
         	$phone             = $this->request->post['phone'];
			// Message
			$message = "
			<html>
			<head>
			  <title>Whatsapp registration request from CTC Tourism</title>
			</head>
			<body>
			  <p>You have a whatsapp registration request from CTC Tourism website. Please find the details below.</p>
			  	<table width='100%' cellpadding='0' cellspacing='0'>
	                <tr><td wdith='30%'>Name</td><td>:- ".$name."</td></tr>
	                <tr><td wdith='30%'>Email </td><td>:- ".$email."</td></tr>
	                <tr><td wdith='30%'>Phone</td><td>:- ".$phone."</td></tr>
	            </table>
			</body>
			</html>
			";

			// To send HTML mail, the Content-type header must be set
			$headers[] = 'MIME-Version: 1.0';
			$headers[] = 'Content-type: text/html; charset=iso-8859-1';

			// Additional headers
			/*$headers[] = 'To: Mary <mary@example.com>, Kelly <kelly@example.com>';
			$headers[] = 'From: Birthday Reminder <birthday@example.com>';
			$headers[] = 'Cc: birthdayarchive@example.com';
			$headers[] = 'Bcc: birthdaycheck@example.com';*/

			// Mail it
			mail($to, $subject, $message, implode("\r\n", $headers));

			$json = array('success'=>true,'message'=>'Your enquiry submitted successfully');
			$this->response->setOutput(json_encode($json));
		}
	}
}
