<style>
.blackborder{border:1px solid #000 !important;}
</style>

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
            <div class="row">
                <div class="col-md-6 adr-img-content ">
                    <h2>UAE</h2>

                <div class="clearfix">
                    <img src="catalog/view/theme/theme_c2c/image/address-pin.svg"/>

                    <p> <?php echo $address; ?></p>
                </div>
                <div class="adr-img-content clearfix">
                    <img src="catalog/view/theme/theme_c2c/image/phone.svg"/>

                    <p>+ <?php echo $telephone; ?>  <?php //echo $telephone2; ?></p>
                </div>
                <div class="adr-img-content clearfix contact-mail">
                    <img src="catalog/view/theme/theme_c2c/image/mail.svg">

                    <p>reservations@ctctourism.ae</p>
                </div>

            </div>
            <div class="col-md-6 adr-img-content">
                 <h2>India</h2>
                <div class="clearfix">
                    <img src="catalog/view/theme/theme_c2c/image/address-pin.svg"/>

                    <p> Coast to Coast Holidays LLP <br /> Office 15, Gustad Chambers,<br /> Plot 108/110,<br /> Laxman Narayan Jadhav Road,<br /> Jail Road, Umerkhadi,<br /> Mumbai, Maharashtra 400009,<br /> India</p>
                </div>
                
                <div class="adr-img-content clearfix">
                    <img src="catalog/view/theme/theme_c2c/image/phone.svg"/>

                    <p>+ 91 22 2370 0441</p>
                </div>
                <div class="adr-img-content clearfix contact-mail">
                    <img src="catalog/view/theme/theme_c2c/image/mail.svg">

                    <p>reservations.india@ctctourism.ae</p>
                </div>
                

            </div>
            
            </div>
            

    </div>
    <div class="contact-form">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="form-3line clearfix">
                    <div class="form-input-section">
                        <input type="text" class="blackborder" name="name" placeholder="Your Name" value="<?php echo $name; ?>" id="input-name"  />
                          <?php if ($error_name) { ?>
                          <div class="text-danger"><?php echo $error_name; ?></div>
                          <?php } ?>
                    </div>
                    <div class="form-input-section">
                        <input placeholder="Email" class="blackborder" type="text" name="email" value="<?php echo $email; ?>" id="input-email" />
                          <?php if ($error_email) { ?>
                          <div class="text-danger"><?php echo $error_email; ?></div>
                          <?php } ?>
                    </div>
                    <div class="form-input-section">
                        <input placeholder="+971" class="blackborder countrycode" type="text" name="code" value="<?php echo $code; ?>" id="input-code"/>
                        <input placeholder="Phone" class="blackborder phoneno" type="text" name="phone" value="<?php echo $phone; ?>" id="input-email"/>
                    </div>
                </div>
                <div class="comoboboxsection row">
                    <div class="col-sm-6">
                        <select name="optionstype" class="cs-select cs-skin-border ">
                            <option value="" disabled selected>Select Option</option>
                            <option value="Quiery">Query</option>
                            <option value="Complaint">Complaint</option>
                            <option value="Suggestion">Suggestion</option>                            
                        </select>
                        <?php if ($error_optiontype) { ?>
                            <div class="text-danger"><?php echo $error_optiontype; ?></div>
                        <?php } ?>
                    </div>
                    <div class="col-sm-6">
                        <select name="queryrelated" class="cs-select cs-skin-border ">
                            <option value="" disabled selected>What does it relate to?</option>
                            <option value="UAE Visa">UAE Visa</option>
                            <option value="Hotel Bookins">Hotel Bookings</option>
                            <option value="Tours and Excurions">Tours and Excurions</option>
                            <option value="Packages">Packages</option>
                            <option value="Parks">Parks</option>
                            <option value="Limo Transfer">Limo Transfer</option>
                            <option value="Any other matter…">Any other matter</option>
                        </select>
                        <?php if ($error_related) { ?>
                            <div class="text-danger"><?php echo $error_related; ?></div>
                        <?php } ?>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="form-input-section">
                    <input placeholder="Subject" class="blackborder" type="text" name="subject" value="<?php echo $subject; ?>" id="input-email"/>
                </div>
                <div class="form-input-section form-textarea">
                    <textarea placeholder="Message" class="blackborder" name="enquiry" rows="10" id="input-enquiry"><?php echo $enquiry; ?></textarea>
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
