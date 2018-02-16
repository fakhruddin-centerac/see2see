<?php echo $header; 
//echo "<pre>";print_r($options);exit;
?>


<form method="post" class="" name="visamodleform" id="visamodleform" enctype="multipart/form-data" >
    <div class="section item-section visapage">
        <div class="container">
          <div class="section-list section-list-inner ">
            <div class="row">
              <div class="clear"></div>
              <div class="col-sm-12">
                <div class="msgpart"></div>
                <div class="page-title review-title">
                  <h1>
                    <!--<div class="page-pagination">
                        <span  role="presentation" class="active"><a href="#visa-1" aria-controls="visa-1" role="tab" data-toggle="tab">1</a></span>
                        <span  role="presentation" class="disabled" ><a href="#visa-2" aria-controls="visa-1" role="tab" data-toggle="tab">2</a></span>
                    </div>-->
                    <span><?php echo $heading_title;?></span>
                    <input type="hidden" name="country_flag" value="<?php echo $country_flag;?>" />
                    <input type="hidden" name="number_of_applicant" value="1" />    
                    </h1>
                    
                </div>
                <!-- tab content herre  -->
                <div class="tab-pannel-wrap">
            <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#visa-1" aria-controls="visa-1" role="tab" data-toggle="tab">1</a>
                        </li>
                        <li role="presentation" class="disabled">
                            <a href="#visa-2" aria-controls="visa-1" role="tab" data-toggle="tab">2</a>
                        </li>
                    </ul>
            <!-- Tab panes -->
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="visa-1">
                  <div class="tab-inner">
                    <div class="row">
                      <div class="review-block visa-main">
                        <div class="row visa-item">
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="visa-select-drop visa-select typeofresidentapplicant">
                                            <select name="residantypeapplicant" class="cs-select cs-skin-border">
                                              <option value="UAE RESIDENT" selected>UAE RESIDENT  </option>
                                              <option value="NON UAE RESIDENT (WITH UAE REFERENCE)">NON UAE RESIDENT (WITH UAE REFERENCE)</option>
                                              <option value="NON UAE RESIDENT (WITHOUT UAE REFERENCE)">NON UAE RESIDENT (WITHOUT UAE REFERENCE)</option>
                                           </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="select-drop numberofapplicant visa-select">
                                            <input type="hidden" name="numberofapplicant" value="" />
                                            <div class="cs-select cs-skin-border" tabindex="0">
                                                <span class="cs-placeholder">One</span>
                                                <div class="cs-options">
                                                    <ul>
                                                        <li class="cs-selected" data-type="One" onclick="funnumofappli(1)" data-option="" data-value="1" class=""><span>1</span></li>
                                                        <li data-type="More Than One"  onclick="funnumofappli(2)" data-option="" data-value="2" class=""><span>More Than One</span></li>
                                                    </ul>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                      <div class="applcatentblock">
                        <div class="review-block visa-main applicantno-0">
                            <div class="row visa-item">
                                <div class="col-sm-12">
                                  <div class="visa-title">
                                    <h3>Applicant no 1</h3>
                                  </div>
                                  <div class="row">
                                    <div class="col-sm-4">
                                        <div class="select-drop mandatory">
                                        <input type="text" placeholder="Name" name="applicantinfo[0][name]" class="review-input personnamevisa"/>
                                      </div>
                                    </div>
                                    <div class="col-sm-4">
                                      <div class="select-drop mandatory">
                                       <input  type="text" name="applicantinfo[0][residence]" placeholder="Country of Residence" class="review-input personresidevisa"/>
                                      </div>
                                    </div>
                                    <div class="col-sm-4">
                                      <div class="visa-select-drop visa-select countryy_select personcountryvisa mandatory">
                                         <select  name="applicantinfo[0][country]" class="cs-select cs-skin-border ">
                                             <?php foreach($countrieslist as $countrieslistss)
                                            {
                                             ?>   
                                            <option value="<?php echo $countrieslistss['country_id']; ?>" ><?php echo $countrieslistss['name']; ?></option>
                                            <?php } ?>
                                            
                                        </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                      <div class="select-drop date-birth-visa mandatory">
                                       <input name="applicantinfo[0][dob]" type="text" placeholder="Date of Birth" class="review-input persondobvisa"/>
                                      </div>
                                    </div>
                                    <div class="col-sm-4">
                                      <div class="visa-select-drop visa-select persongendervisa mandatory">
                                         <select name="applicantinfo[0][gender]" class="cs-select cs-skin-border ">
                                            <option value="" disabled selected>Gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                      <div class="visa-select-drop visa-select personrelationshipvisa mandatory">
                                         <select name="applicantinfo[0][relationship]" class="cs-select cs-skin-border ">
                                            <option value=""disabled selected>Relationship with primary applicant</option>
                                            <option value="father">Father</option>
                                            <option value="mother">Mother</option>
                                            <option value="spouse">Spouse</option>
                                            <option value="brother">Brother</option>
                                            <option value="sister">Sister</option>
                                            <option value="Children">Children</option>
                                            <option value="Other">Other</option>
                                        </select>
                                        </div>
                                    </div>
                                  </div>
                                  <div class="addmoreblock"><div class="addmore" onclick="addapplicanbut()">Add More Applicant</div></div>
                                </div>
                            </div>
                          </div>
                          
                      </div>
                
                <div class="col-sm-12">
                  <div class="review-action visa-action">
                    
                    <input class="next-step" value="NEXT"/>
                  </div>
                </div>
                    </div>
                  </div>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="visa-2">
                  <div class="tab-inner">
                    <div class="row">
                        <div class="applicantinfomation-0">
                              <div class="review-block visa-main">
                                    <div class="row visa-item">
                                        <div class="col-sm-12">
                                            <div class="visa-title">
                                                <h3>Primary Applicant</h3>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <div class="visa-applicant">
                                                        <span>Name</span>
                                                        <strong class="usernamefatch"></strong>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="visa-applicant">  
                                                        <span>Country of Residence</span>
                                                        <strong class="userresidencefatch"></strong>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="visa-applicant">
                                                        <span>Nationality</span>
                                                        <strong class="usercountryfatch"></strong>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="visa-applicant">
                                                        <span>Relationship with primary applicant</span>
                                                        <strong class="userrelationshipfatch"></strong>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="visa-applicant">
                                                        <span>Date of Birth</span>
                                                        <strong class="userdobfatch"></strong>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="visa-applicant">
                                                        <span>Gender</span>
                                                        <strong class="usergenderfatch"></strong>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dark-block review-block">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="file-wrap">
                                                <div class="c2c-file-upload mandatory">
                                                    <input name="applicantinfo[0][travellerspassport]" type="file" />
                                                    <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/>
                                                </div>
                                                <div class="file-text">Traveller's Passport Front Copy</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="file-wrap">
                                                <div class="c2c-file-upload mandatory">
                                                    <input name="applicantinfo[0][travellerspassportback]" type="file" />
                                                    <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/>
                                                </div>
                                                <div class="file-text">Traveller's Passport Back Copy</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="file-wrap">
                                                <div class="c2c-file-upload mandatory">
                                                    <input  name="applicantinfo[0][passportphoto]" type="file" />
                                                    <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/>
                                                </div>
                                                <div class="file-text">Traveller's Passport Size Photo</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="file-wrap">
                                                <div class="c2c-file-upload mandatory">
                                                    <input  name="applicantinfo[0][airticket]" type="file" />
                                                    <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/>
                                                </div>
                                                <div class="file-text">Confirmed Air Ticket</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="file-wrap">
                                                <div class="c2c-file-upload">
                                                    <input  name="applicantinfo[0][hotelreservation]" type="file" />
                                                    <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/>
                                                </div>
                                                <div class="file-text">Confirmed Hotel Reservation</div>
                                            </div>
                                        </div>
                                        <!--<div class="col-sm-4">
                                            <input  name="applicantinfo[0][qualification]" type="text" placeholder="Qualification" class="review-input"/>
                                        </div>-->
                                        <div class="col-sm-4 mandatory qualificationofapplicant">
                                            <div class="visa-select-drop visa-select applcantinfoqualification">
                                                <select  name="applicantinfo[0][qualification]" class="cs-select cs-skin-border">
                                                  <option value="Diploma" selected>Diploma</option>
                                                  <option value="High School">High School</option>
                                                  <option value="Bachelors">Bachelors</option>
                                                  <option value="Masters">Masters</option>
                                                  <option value="Phd">Phd</option>
                                                  <option value="Does not apply">Does not apply</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!--
                                        <div class="col-sm-4 qualificationcertificatecls">
                                            <div class="file-wrap">
                                                <div class="c2c-file-upload mandatory">
                                                    <input  name="applicantinfo[0][qualificationcertificate]" type="file" />
                                                    <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/>
                                                </div>
                                                <div class="file-text">Qualification Certificate</div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 exitstampcls">
                                            <div class="file-wrap">
                                                <div class="c2c-file-upload mandatory">
                                                    <input name="applicantinfo[0][exitstamp]" type="file" />
                                                    <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/>
                                                </div>
                                                <div class="file-text">Proof of Exit Stamp from the UAE</div>
                                            </div>
                                        </div>
                                        -->
                                        <div class="col-sm-4 mandatory">
                                            <input name="applicantinfo[0][travelleremail]" type="text" placeholder="Traveller's Email ID" class="review-input">
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="file-wrap">
                                                <div class="c2c-file-upload">
                                                    <input name="applicantinfo[0][marriage]" type="file" />
                                                    <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/>
                                                </div>
                                                <div class="file-text">Proof of Marriage Certificate(Nikkah Nama)</div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="travl-mob">
                                                <div class="apli-sub">Traveller's Mobile No.*</div>
                                                <input name="applicantinfo[0][code]" type="text" placeholder="Code" class="review-input"/>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 mandatory">
                                            <input name="applicantinfo[0][travellmobilenumber]" type="text" placeholder="Mob NO" class="review-input mob-visa"/>
                                        </div>
                                    </div>        
                                </div>
                            </div>
                            <div class="allapendadapplcant">
                            </div>
                <div class="col-sm-12 buttontostorevisa-s-2">
                  <div class="review-action visa-action">
                    <input id="buttontostorevisa" value="SUBMIT" />
                    <input type="submit" class="prev-step" value="BACK" />
                  </div>
                </div>
                
              </div>
            </div>
          </div>
        </div>
     </div>
                
                <!-- close tab content herer   -->
                
              </div>

              <div class="clear"></div>
              
            </div>
          </div>
        </div>
      </div>
<!-- hideen data  -->
<input type="hidden" value="1" name="childhidprice" class="childhidprice"/>
<input type="hidden" value="1" name="parenthidprice" class="parenthidprice"/>
<input type="hidden" value="<?php echo date("d-m-Y"); ?>" name="tourdate" class="tourdatevisa"/>
<input type="hidden" value="" name="pickuplocation" class="pickuplocationvisa"/>

<div class="otpinhidvaluehere"></div>
</form>



<div class="container hide">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
            <?php if ($attribute_groups) { ?>
            <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
            <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <thead>
                  <tr>
                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
                <?php } ?>
              </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
            </div>
            <?php } ?>
          </div>
        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="btn-group">
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
          </div>
          <h1><?php echo $heading_title; ?></h1>
          <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <?php echo $model; ?></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
          </ul>
          <?php if ($price) { ?>
          <ul class="list-unstyled">
            <?php if (!$special) { ?>
            <li>
              <h2><?php echo $price; ?></h2>
            </li>
            <?php } else { ?>
            <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
            <li>
              <h2><?php echo $special; ?></h2>
            </li>
            <?php } ?>
            <?php if ($tax) { ?>
            <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
            <?php } ?>
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
         
         
          <div id="product">
            <?php if ($options) {
                
                ?>
            <hr>
            <h3><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>                    
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
           
            <?php  } ?>
            
            
            
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring; ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="form-group">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <br />
              <!--<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>-->
            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
          <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
          </div>
          <?php } ?>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-xs-8 col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-xs-6 col-md-4'; ?>
        <?php } else { ?>
        <?php $class = 'col-xs-6 col-sm-3'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($j = 1; $j <= 5; $j++) { ?>
                <?php if ($product['rating'] < $j) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif (($i+1) % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>





<script type="text/javascript"><!--
        
        /*defalut call function mycalculationscombo(14) for without transfer */
        
        

function chkvaldation(val)
{
    
    var n_adultnumbers = $( "input[name='adultnumbers']" ).length;
    /*var n_adultnumbers = $( "input[name='childumbers']" ).length;*/
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker").val();
    var pickuplocations_chk     = $("#pickuplocations").val();
    
    /*  if parent child concept is there or not   */
    if(n_adultnumbers>0)
    {
        var chk_adultnumbers = $( "input[name='adultnumbers']" ).val();
        var chk_childumbers = $( "input[name='childumbers']" ).val();
        
        if(chk_adultnumbers!=0 || chk_childumbers!=0 )
        {
            if(datepicker_chk!='' && pickuplocations_chk!='' )
            {
                $('#button-cart').prop('disabled', false);
            }
            else
            {
                $('#button-cart').prop('disabled', true);
            }    
        }
        else
        {
            $('#button-cart').prop('disabled', true);
        }
            
    }
    else
    {
        /*it means private */
        var chk_private = $('.cusproductoptionvalueid').length;
        if(chk_private!=0)
        {
             
             var chk_adultnumbers = $( "input[name='adultnumbers']" ).val();
             var chk_childumbers = $( "input[name='childumbers']" ).val();
             if(datepicker_chk!='' && pickuplocations_chk!='' )
             {
                $('#button-cart').prop('disabled', false);
             }
             else
             {
                $('#button-cart').prop('disabled', true);
             } 
        }
        else
        {
            $('#button-cart').prop('disabled', true);
        }
    }
    
}


$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.cs-select').click(function(){
   $(this).toggleClass('cs-active'); 
});
function funnumofappli(val)
{
    var type = $('.numberofapplicant .cs-options ul li[data-value='+val+']').attr('data-type');
    $('.numberofapplicant .cs-options ul li').removeClass('cs-selected');
    $('.numberofapplicant .cs-options ul li[data-value='+val+']').addClass('cs-selected');
    $('.numberofapplicant input[name="numberofapplicant"]').val(val);
    $('.numberofapplicant .cs-placeholder').text(type);
    if(val==1)
    {
        $('.addmoreblock').hide('normal');
        $('.applicantno-0 .personrelationshipvisa').show('normal');
        $('.applicantno-0 .personrelationshipvisa').addClass('mandatory');
        //$('.visa-main applicantno-2').remove();
        $('.applicantno-0').nextAll().remove();
        $('#visa-1 .applicantno-0 .visa-title h3').text('Applicant No 1');
        
    }
    else
    {
        $('.addmoreblock').show('normal');
        $('.applicantno-0 .personrelationshipvisa').hide('normal');
        $('.applicantno-0 .personrelationshipvisa').removeClass('mandatory');
        /*if more than more one than applicant one is primary*/
        $('#visa-1 .applicantno-0 .visa-title h3').text('Primary Applicant');
    }
}


var applcannumber = 1;
function addapplicanbut()
{
    /*countrieslist*/
    applcannumberplusone =applcannumber+1;
    html  ='<div class="review-block visa-main applicantno-'+applcannumber+'"><div class="row visa-item"><div class="col-sm-12"><div class="visa-title"><h3>Applicant no '+ applcannumber +'</h3></div><div class="row"><div class="col-sm-4"><div class="select-drop mandatory">';
    html +='<input type="text" placeholder="Name" name="applicantinfo['+applcannumber+'][name]" class="review-input applicantinfo-'+applcannumber+'-name"/>';
    html +='</div></div><div class="col-sm-4"><div class="select-drop mandatory">';
    html +='<input type="text" name="applicantinfo['+applcannumber+'][residence]" placeholder="Country of Residence" class="review-input applicantinfo-'+applcannumber+'-residence"/>';
    html +='</div></div><div class="col-sm-4"><div class="visa-select-drop visa-select countryy_select mandatory">';
    $newElement ='<select name="applicantinfo['+applcannumber+'][country]" class="cs-select cs-skin-border applicantinfo-'+applcannumber+'-country">'; 
    <?php foreach($countrieslist as $countrieslistss)
        {
    ?>   
            $newElement +='<option value="<?php echo $countrieslistss['country_id']; ?>" ><?php echo addslashes($countrieslistss['name']); ?></option>';
    <?php 
        } 
    ?>
    $newElement +='</select>';
    //new SelectFx($newElement[0]);
    html +=$newElement;
    html +='</select></div></div><div class="col-sm-4"><div class="select-drop date-birth-visa mandatory">';
    html +='<input name="applicantinfo['+applcannumber+'][dob]" type="text" placeholder="Date of Birth" class="review-input persondobvisa applicantinfo-'+applcannumber+'-dob"/>';
    html +='</div></div><div class="col-sm-4"><div class="visa-select-drop visa-select mandatory">';
    html +='<select name="applicantinfo['+applcannumber+'][gender]" class="cs-select cs-skin-border applicantinfo-'+applcannumber+'-gender"><option value="" disabled selected>Gender</option><option value="email">Male</option><option value="twitter">Female</option></select>';
    html +='</div></div>'; 
    html +='<div class="col-sm-4"><div class="visa-select-drop visa-select personrelationshipvisa mandatory">';
    html +='<select name="applicantinfo['+applcannumber+'][relationship]" class="cs-select cs-skin-border applicantinfo-'+applcannumber+'-relationship"><option value=""disabled selected>Relationship with primary applicant</option><option value="father">Father</option><option value="mother">Mother</option><option value="spouse">Spouse</option><option value="brother">Brother</option><option value="sister">Sister</option><option value="Children">Children</option><option value="Other">Other</option></select></div></div>';
    html +='</div><div class="addmoreblock "><div class="removeele addmore" onclick="$(\'.applicantno-' + applcannumber  + '\').remove();">Remove Applicant</div></div></div></div></div></div>';
    $('.applcatentblock').append(html);
    (function() {
            [].slice.call( document.querySelectorAll( '.applicantno-'+applcannumber+' select.cs-select' ) ).forEach( function(el) {  
              new SelectFx(el);
            } );
          })();
          $('#visa-1 .persondobvisa').datepicker({ 
                dateFormat: 'dd-mm-yy' , 
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2013', 
                onSelect: function(dateText, inst) {
                    $('.'+inst.id).attr('value',dateText);
                }
        });          
    applcannumber++;
    $('input[name="number_of_applicant"]').val(applcannumber);
    $('input[name="childhidprice"]').val(applcannumber);
    $('input[name="quantity"]').val(applcannumber);
        
}
function removeapplcant(val)
{
    var classremo = '.applicantno-'+val;
}
/*
$('#button-cart').on('click', function() {
    $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueid,#datepicker,#pickuplocations'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
			    
                
                if(json['error']['duplcateproduct'])
                {
                    $('.item-book-now h2').after("<div class='msgg'>"+json['error']['duplcateproduct']+"</div>");
                }
                if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                $('#cart > .customaddprice').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                $('html, body').animate({ scrollTop: 0 }, 'slow');
                $('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
*/

//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

var counterapplicant=0;
$(document).ready(function() {
   //$('#buttontostorevisa').prop('disabled',true);
   $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);
    
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });
    $('.addmoreblock').hide('normal');
    /*add datepicker*/
    $('.persondobvisa').datepicker({ 
            dateFormat: 'dd-mm-yy' ,
            changeMonth: true,
            changeYear: true,
            yearRange: '1950:2013',  
            onSelect: function(dateText, inst) {
                $('.'+inst.id).attr('value',dateText);
            }
    });
    
    $(".mandatory ").on('change', 'input', function() {
      var valuu = $(this).val();
      if(valuu!='')
      {
        $(this).removeClass('haserror');
      }  
    });
    $(".mandatory .cs-options ul ").on('click', 'li', function() {
      var valuu = $('.mandatory select').val();
      
      if(valuu!=null && valuu!='')
      {
        
        $(".mandatory select").siblings('.cs-placeholder').removeClass('haserror');
      } 
    });
    
    $(".next-step").on('click',function (e) 
    {
        msg = '';
        $('.section-list-inner .msgpart').html(msg);
      
        /*first check restrict country then heck prodcu type limited or all if limited(14 and 30 days) than check limited countryies 18 156..... */
        
        counterapplicant = 0;
        $('.countryy_select select').each(function(){
           country_select       = $(this).val();
           checkcunrtybound(country_select); 
        });
        /*restrict country ids  these ids from database
        18,156,144,162 for 14 and 30 days
        Any condiotion 1,205,214,102,2,9,24,192,121,247,235
        */
    });
    $('.element').each(function() {

        $sibling = // find a sibling to $this.
        $mainElement = $(this); // memorize $(this)
        $sibling.change(function($mainElement) {
            return function() {
                // use $mainElement
            }
        }($mainElement))
    });
    /*$('#visa-2 .mandatory ').on('change', 'input', function() {
    }*/
    $("#buttontostorevisa").click(function(){
        msg = '';
        $('.section-list-inner .msgpart').html(msg);
        isvalidate=0;
        $('#visa-2 .mandatory input').each(function(){
           
           if($(this).val()=='')
           {
              $(this).parent().parent('.file-wrap').addClass('haserror');
              $(this).addClass('haserror');
              isvalidate =1;
           } 
        });
         
         if(isvalidate==1)
        {
            var msg = "<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert'>&times;</a><strong>Sorry</strong> some Fileds are missing.</div>";
            $('.section-list-inner .msgpart').html(msg);
            $('html, body').animate({ scrollTop: 300 }, 'slow');
            return false;
        }
        else
        {
            /*add to cart  */
            $(this).parent().parent('.file-wrap').removeClass('haserror');
            $(this).removeClass('haserror');
             $.ajax({
            		url: 'index.php?route=checkout/cart/add',
            		type: 'post',
            		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueid,.pickuplocationvisa,.tourdatevisa'),
            		dataType: 'json',
            		beforeSend: function() {
            			$('#buttontostorevisa').button('loading');
            		},
            		complete: function() {
            			$('#buttontostorevisa').button('reset');
            		},
            		success: function(json) {
            			$('.alert, .text-danger').remove();
            			$('.form-group').removeClass('has-error');
            
            			if (json['error']) {
            			    
                            /*custom add*/
                            if(json['error']['duplcateproduct'])
                            {
                                $('.item-book-now h2').after("<div class='msgg'>"+json['error']['duplcateproduct']+"</div>");
                            }
                            if (json['error']['option']) {
            					for (i in json['error']['option']) {
            						var element = $('#input-option' + i.replace('_', '-'));
            
            						if (element.parent().hasClass('input-group')) {
            							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            						} else {
            							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            						}
            					}
            				}
                            if (json['error']['recurring']) {
            					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
            				}
            
            				// Highlight any found errors
            				$('.text-danger').parent().addClass('has-error');
            			}
            
            			if (json['success']) {
            			 
                         /*here we need to add visa data on separet table */
                           formvisasubmit();
                         
            				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            
            				/*$('#cart > ul').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');*/
                            $('#cart > .customaddprice').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
            
            				$('html, body').animate({ scrollTop: 0 }, 'slow');
            
            				$('#cart > ul').load('index.php?route=common/cart/info ul li');
            			}
            		},
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
            	});
        }
        
    });
    $(".prev-step").click(function (e) {
        var $active = $('.visapage .tab-pannel-wrap .nav-tabs li.active');
        prevTab($active);
    });
    
    function formvisasubmit()
    {
         
        $.ajax({
		url: 'index.php?route=product/product/visasub',
		type: 'post',
		dataType: 'json',
		/*data: $("#visamodleform").serialize(),*/
        data: new FormData($('#visamodleform')[0]),
        processData: false,
        contentType: false,
		beforeSend: function() {
			//$('#button-review').button('loading');
		},
		complete: function() {
			//$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				//$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
            if (json['success']) {
				
                /*$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
                */
			}
		}
	   });
    }
    
function checkcartbtn()
{
    isvalidatecartbut =0
        $('#visa-2 .mandatory input').each(function(){
           if($(this).val()=='')
           {
              $(this).addClass('haserror');
              isvalidatecartbut =1;
           } 
        });
        if(isvalidatecartbut==1)
        {
            $('#buttontostorevisa').prop('disabled',true);
        }
        else
        {
            $('#buttontostorevisa').prop('disabled',false);
        }
}
function checkcunrtybound(country_selectsing)
{
        /*first need to checl validation */
        isvalidate=0;
        $('#visa-1 .mandatory input').each(function(){
           if($(this).val()=='')
           {
              $(this).addClass('haserror');
              isvalidate =1;
           } 
        });
        $('#visa-1 .mandatory select').each(function(){
           
           if($(this).val()=='' ||$(this).val()==null)
           {
              $(this).addClass('haserror');
              $(this).siblings('.cs-placeholder').addClass('haserror');
              isvalidate =1;
           } 
        });
        if(isvalidate==1)
        {
            var msg = "<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert'>&times;</a><strong>Sorry</strong> some Fileds are missing.</div>";
            $('.section-list-inner .msgpart').html(msg);
            $('html, body').animate({ scrollTop: 300 }, 'slow');
            return false;
        }
        else
        {    
            counterapplicant++;
            //alert(applcannumber+"counter is:-"+counterapplicant);
            var restrict_country    = ["1","205","214","102","2","9","24","192","121","247","235"];
            var checkHas            = restrict_country.indexOf(country_selectsing);
            if(checkHas==-1)
            {
                /*Now you can check is it limited or not this green condiotion for above*/
                var country_flag = $('input[name="country_flag"]').val();    
                if(country_flag=='LIMITED')
                {
                    /*if Limited then check restricted country undeter Limited for bangladash,pakishtan,nigeria....*/  
                     var restrict_country_limited = ["18","156","144","162"];
                     var checklimitedHas = restrict_country_limited.indexOf(country_selectsing);
                     if(checklimitedHas==-1)
                     {
                          /*now you are pass beauce limited with no bangaldesh pakistank ...*/
                          if(applcannumber==counterapplicant)
                          {
                              var $active = $('.visapage .tab-pannel-wrap .nav-tabs li.active');
                              nextTab($active);
                          }
                     }
                     else
                     {
                        /*Fail In limited counery */
                        var msg = "<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert'>&times;</a><strong>Sorry</strong> we will be unable to process your application - for further details or information please contact our offices2</div>";
                        $('.section-list-inner .msgpart').html(msg);
                        $('html, body').animate({ scrollTop: 300 }, 'slow');
                     }
                }
                else
                {
                    /*there is no limitation on selected option ALL so  need to check bangaldes or not if bangaldash then you need to check for male or female  */
                    var $active = $('.visapage .tab-pannel-wrap .nav-tabs li.active');
                    nextTab($active);
                }
            }
            else
            {
                var msg = "<div class='alert alert-danger fade in'><a href='#' class='close' data-dismiss='alert'>&times;</a><strong>Sorry</strong> we will be unable to process your application - for further details or information please contact our offices</div>";
                $('.section-list-inner .msgpart').html(msg);
                $('html, body').animate({ scrollTop: 300 }, 'slow');
            }
            return true;
        }
}
 function nextTab(elem) 
 {
    
    /* before go to next tab we need to add nuber of block for nuber of applicant on #visa-2*/
    var  loopcontroller = $('input[name="number_of_applicant"]').val();
    /*loop always start from 1 because fist applcant alway fatch automatcally loop work for number of applicant-1 */
    applhtml ='';
    //alert("hj:-"+loopcontroller);
    
    /*marrage certificate filed for only bangladash only */
     /*firstapplcantcountry         = $('.applicantno-0 select[name="applicantinfo[0][\'country\']"]').val();
     var restrict_country_limited = ["18","156","144","162"];
     var checklimitedHas          = restrict_country_limited.indexOf(firstapplcantcountry);
     alert(firstapplcantcountry);
     if(checklimitedHas==-1)
     {
        
          if(applcannumber==counterapplicant)
          {
              marrigecertificate = ''
              $('.applicantinfomation-0 .dark-block.review-block input[name="applicantinfo[0][travelleremail]"]').parent('.col-sm-4').after(marrigecertificate);
          }
     }*/
    /*if UAE RESIDENT  or NON UAE RESIDENT (WITH UAE REFERENCE) then this block appear*/
      var typeofregident = $('.typeofresidentapplicant select').val();
      //alert("gjhkjf:- "+typeofregident);
      htmltype ='';
      if(typeofregident=='UAE RESIDENT' || typeofregident=='NON UAE RESIDENT (WITH UAE REFERENCE)')
      { 
            if(loopcontroller==1)
            {
            htmltype ='<div class="visaholderblock"><div class="dark-block review-block"><div class="row visa-item"><div class="col-sm-12"><div class="visa-title"><h3>Provide the following documents and information of the UAE Residence VISA holder</h3></div><div class="row"><div class="col-sm-6"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
            htmltype +='<input name="uaeresidencevisaholder[passportfrent]" type="file"/>';
            htmltype +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Passport Copy (First Page)*</div></div></div><div class="col-sm-6"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
            htmltype +='<input name="uaeresidencevisaholder[passportback]" type="file">';
            htmltype +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Passport Copy (Last Page)*</div></div></div><div class="col-sm-6"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
            htmltype +='<input name="uaeresidencevisaholder[validuaevisa]" type="file">';
            htmltype +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Valid UAE VISA Copy on the Passport*</div></div></div><div class="col-sm-6 mandatory">';
            htmltype +='<input name="uaeresidencevisaholder[email]" placeholder="Email ID*" class="review-input" type="text"/>';
            htmltype +='</div><div class="col-sm-4"><div class="travl-mob"><div class="apli-sub">Traveller’s Mobile No.*</div>';
            htmltype +='<input name="uaeresidencevisaholder[code]" placeholder="Code" class="review-input" type="text"/>';
            htmltype +='</div></div><div class="col-sm-4 mandatory">';
            htmltype +='<input name="uaeresidencevisaholder[mobilenumber]" placeholder="Mob NO" class="review-input mob-visa" type="text"/>';
            htmltype +='</div><div class="col-sm-12"><div class="review-info">NOTE: All attachments must be clear and legible to read &ndash; if they are not then there is a risk that your application may be rejected</div></div></div></div></div></div></div>';
            
          }  
      }
      $('#visa-2 .buttontostorevisa-s-2').before(htmltype);
    /**/
    
    var hotelreservationmandatorycls ='';
    var qualitycertificationmandatorycls ='';
    /* here we need to genrae 4 condition like document */
    hotelreservationmandatorycls ='';
        qualitycertificationmandatorycls ='';
        var typeofregident = $('.typeofresidentapplicant select').val();
        if(typeofregident=='UAE RESIDENT' || typeofregident=='NON UAE RESIDENT (WITH UAE REFERENCE)')
        {
            
        }
        else
        {
            /*now yopu are in 3rd option*/
              /*now check  for # condion with **double start  */
              var country_flag = $('input[name="country_flag"]').val();    
              if(country_flag=='LIMITED')
              {
                  /*this is for 14, 30 days pakage*/
              }
              else
              {
                    /*this is for 90 days pakage*/
                    //$('.applicantno-0 input [name="applicantinfo[0][qualificationcertificate]"]').addClass('mandatory');
              }    
        }
    
    var country_flag      = $('input[name="country_flag"]').val();
    relationshipsing      = $('.applicantno-0 select[name="applicantinfo[0][relationship]"]').val();
        var restrict_country_limited = ["18","156","144","162"];
        countryassociated = $('.applicantno-0 select[name="applicantinfo[0][country]"]').val();
        
        var checklimitedHassing = restrict_country_limited.indexOf(countryassociated);
        if(checklimitedHassing==-1)
        {
            conditionalcountry_flagsinng = 0;     
        }
        else
        {
            conditionalcountry_flagsinng = 1;/*banglades,...exits*/
        }    
        //alert(relationshipsing+'fgdgd-'+conditionalcountry_flagsinng);
    if(relationshipsing=='Other' || conditionalcountry_flagsinng==1)
    {
       
         htmlcertifiate  ='';
         htmlcertifiate +='<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory '+qualitycertificationmandatorycls+' ">';
         htmlcertifiate +='<input name="applicantinfo[0][qualificationcertificate]" type="file" />';
         htmlcertifiate +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Qualification Certificate</div></div></div>';
         htmlcertifiate +='<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
         htmlcertifiate +='<input name="applicantinfo[0][exitstamp]" type="file" />';
         htmlcertifiate +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
         $('.applicantinfomation-0 .qualificationofapplicant').after(htmlcertifiate);   
    }
    $('#visa-2 .allapendadapplcant').html('');
     var typeofregident = $('.typeofresidentapplicant select').val();
    /*hotel register validation*/
        if(typeofregident=='UAE RESIDENT' || typeofregident=='NON UAE RESIDENT (WITH UAE REFERENCE)')
        {
            /*now check under coditional country (bangladash,paki...etc) or non condional country )*/
            countryassociated = $('.applicantno-0 select[name="applicantinfo[0][\'country\']"]').val();
            relationship      = $('.applicantno-0 select[name="applicantinfo[0][relationship]"]').val();
            //alert(relationship+"adsdc-"+country_flag);
            if(relationship=='Other' && country_flag=='LIMITED')
            {
                $('.applicantinfomation-0 input[name="applicantinfo[0][hotelreservation]"').parents('.c2c-file-upload').addClass('mandatory');
            }
        }
        else
        {
            /*now yopu are in 3rd option*/
            var restrict_country_limited = ["18","156","144","162"];
            countryassociated = $('.applicantno-0 select[name="applicantinfo[0][\'country\']"]').val();
            var checklimitedHas = restrict_country_limited.indexOf(countryassociated);
            if(checklimitedHas==-1)
            {
                  /*this is under no condional country*/
                  /*now check  for # condion with **double start  */
                  if(country_flag=='LIMITED')
                  {
                        $('.applicantinfomation-0 input[name="applicantinfo[0][hotelreservation]"').parents('.c2c-file-upload').addClass('mandatory');
                  }
            }
            else
            {
                 /*this is unerder condional country like bangladash or paki..*/
                 
                   
            }
        }
    
    for(ilopp=1; ilopp<loopcontroller;ilopp++)
    {
        //var sssss =$('input [name="applicantinfo['+ilopp+'][name]]"').length;
        //alert('input [name=\'applicantinfo['+ilopp+'][name]'\] '+sssss);
        
        /* here we need to genrae 4 condition like document */
        var restrict_country_limited = ["18","156","144","162"];
        countryassociated = $('.applicantno-'+ilopp+' select[name="applicantinfo['+ilopp+'][country]"]').val();
        var checklimitedHas = restrict_country_limited.indexOf(countryassociated);
        if(checklimitedHas==-1)
        {
            conditionalcountry_flag = 0;     
        }
        else
        {
            conditionalcountry_flag = 1;/*banglades,...exits*/
        }   
        
       
        if(typeofregident=='UAE RESIDENT' || typeofregident=='NON UAE RESIDENT (WITH UAE REFERENCE)')
        {
            /*now check under coditional country (bangladash,paki...etc) or non condional country )*/
            countryassociated = $('.applicantno-'+ilopp+' select[name="applicantinfo['+ilopp+'][\'country\']"]').val();
            relationship      = $('.applicantno-'+ilopp+' select[name="applicantinfo['+ilopp+'][\'relationship\']"]').val();
            if(relationship=='Other' && country_flag=='LIMITED')
            {
                hotelreservationmandatorycls ='mandatory';
            }
        }
        else
        {
            /*now yopu are in 3rd option*/
            var restrict_country_limited = ["18","156","144","162"];
            countryassociated = $('.applicantno-'+ilopp+' select[name="applicantinfo['+ilopp+'][\'country\']"]').val();
            var checklimitedHas = restrict_country_limited.indexOf(countryassociated);
            if(checklimitedHas==-1)
            {
                  /*this is under no condional country*/
                  /*now check  for # condion with **double start  */
                  if(country_flag=='LIMITED')
                  {
                        hotelreservationmandatorycls ='mandatory';
                  }
            }
            else
            {
                 /*this is unerder condional country like bangladash or paki..*/
                 hotelreservationmandatorycls ='';
                   
            }
        }
        /*qualificationcertificatecls-exitstampcls*/    
                
        //$('#visa-2 .allapendadapplcant').html('');
        applcantname            = $('.applicantinfo-'+ilopp+'-name').val();
        applcantresidence       = $('.applicantinfo-'+ilopp+'-residence').val();
        applcantgender          = $('.applicantinfo-'+ilopp+'-gender').siblings('.cs-placeholder').text();
        applcantrelationship    = $('.applicantinfo-'+ilopp+'-relationship').siblings('.cs-placeholder').text();
        applcantdob             = $('.applicantinfo-'+ilopp+'-dob').val();
        applcantcountryval      = $('.applicantinfo-'+ilopp+'-country').val();
        applcantcountrytext     = $('.applicantinfo-'+ilopp+'-country').siblings('.cs-placeholder').text();
        
        
        
        applhtml ='<div class="applicantinfomation-'+ilopp+'">';
        applhtml +='<div class="review-block visa-main"><div class="row visa-item"><div class="col-sm-12"><div class="visa-title">';
        applhtml +='<h3>Applicant No. '+ilopp+'</h3>';
        applhtml +='</div><div class="row"><div class="col-sm-4"><div class="visa-applicant"><span>Name</span>';
        applhtml +='<strong class="usernamefatchinfo">'+applcantname+'</strong>';
        applhtml +='</div></div><div class="col-sm-4"><div class="visa-applicant"><span>Country of Residence</span>';
        applhtml +='<strong class="userresidencefatchv">'+applcantresidence+'</strong>';
        applhtml +='</div></div><div class="col-sm-4"><div class="visa-applicant"><span>Nationality</span>';
        applhtml +='<strong class="usercountryfatchinfo">'+applcantcountrytext+'</strong>';
        applhtml +='</div></div><div class="col-sm-4"><div class="visa-applicant"><span>Relationship with primary applicant</span><strong>'+applcantrelationship+'</strong></div></div><div class="col-sm-4"><div class="visa-applicant"><span>Date of Birth</span>';
        applhtml +='<strong class="userdobfatchinfo">'+applcantdob+'</strong>';
        applhtml +='</div></div><div class="col-sm-4"><div class="visa-applicant"><span>Gender</span>';
        applhtml +='<strong class="usergenderfatchinfo">'+applcantgender+'</strong>';
        applhtml +='</div></div></div></div></div></div>';
        
        applhtml +='<div class="dark-block review-block"><div class="row"><div class="col-sm-4"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
        applhtml +='<input name="applicantinfo['+ilopp+'][travellerspassport]"type="file" />';
        applhtml  +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Travellers Passport Front Copy</div></div></div><div class="col-sm-4"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
        applhtml +='<input name="applicantinfo['+ilopp+'][travellerspassportback]" type="file" />';
        applhtml +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div>\<div class="file-text">Travellers Passport Back Copy</div></div></div><div class="col-sm-4"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
        applhtml +='<input name="applicantinfo['+ilopp+'][passportphoto]" type="file" />';
        applhtml +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Travellers Passport Size Photo</div></div></div><div class="col-sm-4"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
        applhtml +='<input name="applicantinfo['+ilopp+'][airticket]" type="file" />';
        applhtml +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Confirmed Air Ticket</div></div></div><div class="col-sm-4"><div class="file-wrap"><div class="c2c-file-upload '+hotelreservationmandatorycls+'">';
        applhtml +='<input name="applicantinfo['+ilopp+'][hotelreservation]" type="file" />';
        applhtml +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Confirmed Hotel Reservation</div></div></div><div class="col-sm-4">';
        /*applhtml +='<input type="text" name="applicantinfo['+ilopp+'][qualification]" placeholder="Qualification" class="review-input"/>';*/
        applhtml +='<div class=" mandatory"><div class="visa-select-drop visa-select applcantinfoqualification applicantinfo-qualification-'+ilopp+'">';
        applhtml +='<select  name="applicantinfo['+ilopp+'][qualification]" class="cs-select cs-skin-border">';
        applhtml +='<option value="Diploma" selected>Diploma</option><option value="High School">High School</option>';
        applhtml +='<option value="Bachelors">Bachelors</option><option value="Masters">Masters</option><option value="Phd">Phd</option><option value="Does not apply">Does not apply</option>';
        applhtml +='</select>';
        applhtml +='</div></div></div>';
        
        relationship      = $('.applicantno-'+ilopp+' select[name="applicantinfo['+ilopp+'][relationship]"]').val();
        //alert('.applicantno-'+ilopp+' select[name="applicantinfo['+ilopp+'][relationship]"]');
        if(relationship=='Other' || conditionalcountry_flag==1)
        {
            
            applhtml +='<div class="col-sm-4 qualificationcertificatecls"><div class="file-wrap"><div class="c2c-file-upload mandatory '+qualitycertificationmandatorycls+' ">';
            applhtml +='<input name="applicantinfo['+ilopp+'][qualificationcertificate]" type="file" />';
            applhtml +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Qualification Certificate</div></div></div>';
            applhtml +='<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory">';
            applhtml +='<input name="applicantinfo['+ilopp+'][exitstamp]" type="file" />';
            applhtml +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
        }
        
        
        applhtml +='<div class="col-sm-4 mandatory">';
        applhtml +='<input type="text" name="applicantinfo['+ilopp+'][travelleremail]" placeholder="Travellers Email ID" class="review-input"/>';
        applhtml +='</div>';
        /*
        <div class="col-sm-4"><div class="file-wrap"><div class="c2c-file-upload">
        <input name="applicantinfo[0][marriage]" type="file" />
        <img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Proof of Marriage Certificate(Nikkah Nama)</div></div></div>
        */
        applhtml +='<div class="col-sm-4"><div class="file-wrap"><div class="c2c-file-upload">';
        applhtml +='<input name="applicantinfo['+ilopp+'][marriage]" type="file" />';
        applhtml +='<img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"/></div><div class="file-text">Proof of Marriage Certificate(Nikkah Nama)</div></div></div>';
        applhtml +='<div class="col-sm-4"><div class="travl-mob"><div class="apli-sub">Travellers Mobile No.</div>';
        applhtml +='<input name="applicantinfo['+ilopp+'][code]" type="text" placeholder="Code" class="review-input"/>';
        applhtml +='</div></div><div class="col-sm-4 mandatory">';
        applhtml +='<input name="applicantinfo['+ilopp+'][travellmobilenumber]" type="text" placeholder="Mob NO" class="review-input mob-visa"/>';
        applhtml +='</div></div></div>';
        applhtml +='</div>';
        $('#visa-2 .allapendadapplcant').append(applhtml);
        (function() {
            [].slice.call( document.querySelectorAll( '.applicantinfo-qualification-'+ilopp+' select.cs-select' ) ).forEach( function(el) {  
              new SelectFx(el);
            } );
          })();    
        
    }
    
    
    $(elem).next().removeClass('disabled');
    $(elem).next().find('a[data-toggle="tab"]').click();
    
    
    
    /*now you need to paste old information on next tab part
    get all dfata filled by old tab
    */
    username            = $('input.personnamevisa').val();
    userresidence       = $('input.personresidevisa').val();
    usercountryval      = $('personcountryvisa select').val();
    usercountry         = $('.personcountryvisa .cs-placeholder').text();
    userdob             = $('input.persondobvisa').val();
    usergender          = $('.persongendervisa select').val();
    userrelationship    = $('.personrelationshipvisa select').val();
    /*fatch data  $('select[name=\'recurring_id\'], input[name="quantity"]') */
    
    
    var nummm= $('input [name="applicantinfo[0][\'name\']" ').length;
    $('.usernamefatch').html(username);
    $('.userresidencefatch').text(userresidence);
    $('.usercountryfatch').text(usercountry);
    $('.userdobfatch').text(userdob);
    $('.usergenderfatch').text(usergender);
    $('.userrelationshipfatch').text(userrelationship);
    //alert("Name is:-"+username);
    
    /*add event on input type file*/
     $('#visa-2 input[type=file]').change(function(ev) {
        var fileselect = $(this).val();
        var filename = fileselect.replace(/^.*[\\\/]/, '')
        $(this).parents(".c2c-file-upload").siblings('.file-text').text(filename);
        $(this).parents(".c2c-file-upload").parents('.file-wrap').removeClass('haserror');
    });    
}
    function prevTab(elem) {$(elem).prev().find('a[data-toggle="tab"]').click();}   
});
//--></script>
<?php echo $footer; ?>
