<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>

<div class="top-banner">
    <div id="map"></div>
</div>
<div class="container">
  
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    
    <div class="contact-addr-card clearfix">
            <div class="addr-left adr-img-content ">
                <div class="clearfix">
                    <img src="catalog/view/theme/theme_c2c/image/address-pin.svg"/>

                    <p> <?php echo $address; ?></p>
                </div>

            </div>
            <div class="addr-right">
                <div class="adr-img-content clearfix">
                    <img src="catalog/view/theme/theme_c2c/image/phone.svg"/>

                    <p><?php echo $telephone; ?> </br> <?php echo $telephone2; ?></p>
                </div>
                <div class="adr-img-content clearfix contact-mail">
                    <img src="catalog/view/theme/theme_c2c/image/mail.svg">

                    <p>reservations@ctctourism.ae</p>
                </div>

            </div>

    </div>
    <div class="contact-form">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="form-3line clearfix">
                    <div class="form-input-section">
                        <input type="text" name="name" placeholder="Your Name" value="<?php echo $name; ?>" id="input-name"  />
                          <?php if ($error_name) { ?>
                          <div class="text-danger"><?php echo $error_name; ?></div>
                          <?php } ?>
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Email" type="text" name="email" value="<?php echo $email; ?>" id="input-email" />
                          <?php if ($error_email) { ?>
                          <div class="text-danger"><?php echo $error_email; ?></div>
                          <?php } ?>
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Phone" type="text" name="phone" value="<?php echo $phone; ?>" id="input-email"/>
                    </div>
                </div>
                <div class="comoboboxsection row">
                    <div class="col-sm-6">
                        <select name="optionstype" class="cs-select cs-skin-border ">
                            <option value="" disabled selected>Select Option</option>
                            <option value="Quiery">Quiery</option>
                            <option value="Complaint">Complaint</option>
                            <option value="Suggestion">Suggestion</option>
                            
                        </select>
                    </div>
                    <div class="col-sm-6">
                        <select name="queryrelated" class="cs-select cs-skin-border ">
                            <option value="" disabled selected>What does your quiery relate to?</option>
                            <option value="UAE Visa">UAE Visa</option>
                            <option value="Hotel Bookins">Hotel Bookins</option>
                            <option value="Tours and Excurions">Tours and Excurions</option>
                            <option value="Any other matter…">Any other matter...</option>
                        </select>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="form-input-section">
                    <input placeholder="Subject" type="text" name="subject" value="<?php echo $subject; ?>" id="input-email"/>
                </div>
                <div class="form-input-section form-textarea">
                    <textarea placeholder="Message" name="enquiry" rows="10" id="input-enquiry"><?php echo $enquiry; ?></textarea>
                      <?php if ($error_enquiry) { ?>
                      <div class="text-danger"><?php echo $error_enquiry; ?></div>
                      <?php } ?>
                </div>
                <div class="form-action">
                    <input type="button" value="Clear"/>
                    <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
                </div>
            </form>
        </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
