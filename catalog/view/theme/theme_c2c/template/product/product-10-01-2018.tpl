<?php echo $header; 
//echo "<pre>";print_r($options);exit;
?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>
<?php

//echo "top_up ".$top_up;

?>
<div class="section item-section">
        <div class="container">
            <div class="section-list section-list-inner ">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="inner-wrap">
                            <h2><?php echo $heading_title; ?></h2>
                            <div><?php echo $description; ?></div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="item-book-now">
                            <h2>BOOK NOW</h2>
                            <div class="item-book-drop">
                                <!--<select class="selectpicker">
                                  <option>Mustard</option>
                                  <option>Ketchup</option>
                                  <option>Relish</option>
                                </select>
                                li class= "cs-selected"
                                -->
                                
                                    <!-- custo add ionput hidden filed for child total and adult total -->
                                    <input type="hidden" name="top_up" class="top_up" value="<?php echo $top_up; ?>" />
                                    <input type="hidden" name="familytype" value="<?php echo $familytype; ?>" />
                                    <input type="hidden" name="totalpriceadult" value="0" class="totalpriceadult" />
                                    <input type="hidden" name="totalpricechild" value="0" class="totalpricechild" />
                                    <input type="hidden" name="travel_type" value="0" class="travel_type" />
                                    <div class="myfirstsectlcus cs-select cs-skin-border" tabindex="0">
                                        <?php 
                                        $bigbusids = array(154,155,157,161,156,158,159,160,166,167);
                                        if(in_array($product_id, $bigbusids)) 
                                        {
                                            echo '<span class="cs-placeholder">Tickets Only</span>';    
                                        }
                                        else{
                                        ?>
                                            <?php if($category_id==73 || $category_id==71) {?>
                                            <span class="cs-placeholder">Tour Type</span>
                                            <?php } else { ?>
                                            <span class="cs-placeholder">Transfer Method</span>
                                            <?php } 
                                            }    
                                        ?>
                                        <div class="cs-options">
                                            <ul>
                                            <?php 
                                            if($options)
                                            {
                                                $price='';
                                                foreach($options as $optionmy)
                                                {
                                                    if($optionmy['required']==1)
                                                    {
                                                       
                                                      
                                                        
                                                        
                                                       if($optionmy['name']=='SIC' ||$optionmy['name']=='Without Transfer')
                                                       {
                                                            //'.$optionmy['product_option_value'][0]['price'].'  '.$optionmy['name'].',
                                                            
                                                            $attr = 'data-product-option-value-id="'.$optionmy['product_option_value'][0]['product_option_value_id'].'"  data-product-option-id="'.$optionmy['product_option_id'].'" data-childprice="'.$optionmy['product_option_value'][0]['child_price'].'" data-option-id="'.$optionmy['option_id'].'" data-price="'.$optionmy['product_option_value'][0]['orignalprice'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationscombo('.$optionmy['option_id'].')" ';
                                                       }
                                                       else
                                                       {
                                                        
                                                        
                                                            /*$attr = 'data-product-option-id="'.$optionmy['product_option_id'].'" data-option-id="'.$optionmy['option_id'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationsprivate('.$optionmy['option_id'].')" ';*/
                                                            $attr = 'data-childprice="'.$optionmy['product_option_value'][0]['top_up_child'].'" data-price="'.$optionmy['product_option_value'][0]['top_up_adults'].'"  data-product-option-id="'.$optionmy['product_option_id'].'" data-option-id="'.$optionmy['option_id'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationsprivateparent('.$optionmy['option_id'].')" '.$price;
                                                       }   
                                                    }    
                                             ?>
                                                    <li <?php echo $attr; ?> ><span><?php echo $optionmy['name']; ?></span></li>
                                            <?php
                                                    
                                                }
                                            }   
                                            ?>
                                            </ul>
                                        </div>
                                    </div>
                                
                            </div>
                            <div class="clear"></div>
                            <div class="myboxescalculations">
                                <div class="book-rate">
                                    <span>Adult: </span>
                                    <span>AED 0</span>
                                    <span>Children:</span>
                                    <span>AED 0</span>
                                </div>
                                <div class="book-pick">
                                    <span>No of Adults</span>
                                    <span><input type="text" placeholder="00" disabled /></span>
                                    <!--<input onblur="priceadult(this.value,price)" name="adultnumbers" type="text" placeholder="00">-->
                                    <span>No of Childrens</span>
                                    <span><input type="text" placeholder="00" disabled/></span>
                                </div>
                            </div>
                            <div class="myboxforprivate hide">
                                <div class="cs-select cs-skin-border" tabindex="0">
                                  <?php
                                 
                                  if($top_up==1)
                                   {?><span class="cs-placeholder">Transfer Rates</span> <?php }
                                   else
                                    {?><span class="cs-placeholder">No of Passengers</span><?php }
                                    ?>
                                    <div class="cs-options">
                                        <ul>
                                            <?php 
                                            if($options)
                                            {
                                                foreach($options as $optionmy)
                                                {
                                                    if($optionmy['name']=='Private' && $optionmy['required']==1)
                                                    {    
                                                        foreach($optionmy['product_option_value'] as $optionprivate)
                                                        {
                                                            $attr = 'data-product-option-value-id="'.$optionprivate['product_option_value_id'].'"   data-product-option-id="'.$optionmy['product_option_id'].'" data-price="'.$optionprivate['orignalprice'].'" data-option-value-id="'.$optionprivate['option_value_id'].'" onclick="mycalculationprivate('.$optionprivate['option_value_id'].')"  ';
                                                        
                                                  ?>
                                                  <?php ?><li <?php echo $attr; ?> ><span><?php echo $optionprivate['name']; ?> Passengers</span></li>
                                                  <?php          
                                                        }
                                                    }
                                                }
                                            }
                                            ?>    
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="book-location">
                                <span>
                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                    <input type="text" onblur="chkvaldation(this.val)" name="tourdate" id="datepicker" class="choose-location-book" placeholder="Date"></span>
                                <span class="pickup">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                    <input type="text" onblur="chkvaldation(this.val)"  name="pickuplocation" id="pickuplocations" class="pick-up-location" placeholder="Pickup Location">
                                </span>
                            </div>
                            <div class="setcalprice hide">
                                <div class="book-rate">
                                    <span>Adult : </span>
                                    <span class="adultpricetotal">AED  0</span>
                                    <span>Children:</span>
                                    <span class="childpricetotal">AED  0</span>
                                </div>
                            </div>
                            <div class="transfer_rate hide">
                                <div class="book-rate">
                                    <span>Transfer Charges : </span>
                                    <span class="transferprice"> AED 000</span>
                                   
                                </div>
                            </div>
                            <div class="book-total book-rate"> <span >Total: </span> <span>AED 0 </span></div>
                            
                            <div class="book-add-cart">
                                <!--<a id="button-cart" href="">Add to cart</a>-->
                                <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
              
              <?php if ($review_status) { ?>
              <div class="col-sm-12">
                
                <div class="page-title review-title">
                  <h1><span><?php echo $text_write; ?></span></h1>
                </div>
                <?php if ($review_guest) { ?>
                <form class="form-horizontal" id="form-review">
                    <div class="review-block">
                      <div id="review"></div>
                      <div class="row">
                        <div class="col-sm-4">
                          <select name="package">
                            <option value="Package">Package</option>
                            <option value="Package2">Package2</option>
                          </select>
                        </div>
                        <div class="col-sm-8">
                          <div class="review-rating">
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
                            &nbsp;<?php echo $entry_good; ?>
                          </div>
                        </div>
                        <div class="col-sm-4">
                          <input value="<?php echo $summary; ?>" name="summary" type="text" placeholder="Summary" class="review-input"/>
                        </div>
                        <div class="col-sm-4">
                          <input  class="review-input" type="text" placeholder="Name" name="name" value="<?php echo $customer_name; ?>" id="input-name"  />
                        </div>
                        <div class="col-sm-4">
                          <input type="email" placeholder="Email" class="review-input" value="<?php echo $email; ?>" name="email"/>
                          
                        </div>
                        <div class="col-sm-12">
                          <textarea placeholder="Comments" name="text" rows="5" id="input-review" ></textarea>
                        </div>
                        <div class="col-sm-12">
                          <div class="review-check">
                            <input type="checkbox">Sign Me Up for regular emails about the latest Deals.
                          </div>
                        </div>
                        <div class="col-sm-12">
                          <div class="review-action">
                            <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">SUBMIT<?php //echo $button_continue; ?></button>
                          </div>
                        </div>
                        <div class="col-sm-12">
                          <div class="review-info">
                            <!--After you click <small><<</small>Submit<small>>></small> your review will be entered into our database for final approval before it is posted live to the public. We will edit only to address inappropriate or offensive content.-->
                            After you click &laquo;Submit&raquo; your review will be   entered into our database for final approval before it is posted live to   the public. We will edit only to address inappropriate or offensive   content. 
                          </div>
                        </div>
                      </div>
                    </div>
                </form>
                <?php } ?>
                
              </div>
              <?php } ?>
              
              <div class="clear"></div>
              <div class="col-sm-12">
              <div class="page-title review-title">
                  <h1><span>Related Products</span></h1>
                </div>
                <div class="owl-carousel owl-theme related-items">
                  <?php if ($products) { ?>
                        <?php foreach ($products as $product) { ?>
                                                
                            <div class="item">
                                <div class="sec-list-wrap">
                                    <div class="list-item-img"><img src="<?php echo $product['thumb']; ?>"  alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></div>
                                    <div class="list-item-dsc">
                                        <h3><?php echo $product['name']; ?></h3>
                                        <p><?php echo $product['description']; ?></p>
                                        <div class="list-item-action">
                                          <!--<span class="lsit-item-price">AED 350</span>-->
                                          <span class="lsit-item-more"><a href="<?php echo $product['href']; ?>">KNOW MORE</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>             
                        <?php  } ?>    
                  <?php  } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
<!-- hideen data  -->
<input type="hidden" name="childhidprice" class="childhidprice"/>
<input type="hidden" name="parenthidprice" class="parenthidprice"/>

<div class="otpinhidvaluehere"></div>




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
            <?php if ($review_status) { 
                /*
                ?>
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
            <?php
            */
             } 
             ?>
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
                /*
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
           
            <?php */ } ?>
            
            
            
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
function mycalculationsprivateparent(optionid) //771
{
    $('.setcalprice').removeClass('hide');
    $('.setcalprice').html('');
    totalsumtext        = "Total: AED 0";
    $('.book-total').text(totalsumtext);
     
    top_up =   $('.top_up').val();  
    $('.myboxescalculations').html(''); 
    /*inputhideengen = '<input type="hidden" name="privatetypepackage" />';*/
    if(top_up==1)
      {
       
        adult_price =  $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-price');
        child_price =  $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-childprice');
         
         html = '<div class="book-rate"><span>Adult: </span><span class="adultpricetotal">AED  0</span><span>Children:</span><span class="childpricetotal">AED 0</span></div>';
         $('.setcalprice').removeClass('hide');
         $('.setcalprice').html(html);
         $(".myboxescalculations").html('<div class="book-pick"><span>No of Adults</span><span><input value="" class="adultssss" onblur="priceadult(this.value,'+adult_price+')"  name="adultnumbers" type="text" placeholder="00"></span><span>No of Childrens</span><span><input value="" class="childssss" onblur="pricechild(this.value,'+child_price+')" name="childumbers"  type="text" placeholder="00"></span></div>');
      }
    else
    {
         $(".childhidprice").val(0)
         $(".parenthidprice").val(1)
        
    }  
       
    type = $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-type');
    $('.myfirstsectlcus .cs-selected').removeClass('cs-selected');  
    $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('class','cs-selected');
    $('.myfirstsectlcus .cs-placeholder').text(type);
    $('.myboxforprivate').removeClass('hide');
    $(".transfer_rate").addClass('hide');
         $(".transferprice").html(' ');
    //html ='<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">Select Transfer</span><div class="cs-options"><ul></ul></div></div>';
    /*option element null html remove input*/
     optioninput  ='';
    
     $('.otpinhidvaluehere').html(optioninput);
    
}
function mycalculationprivate(optionidprivate)
{
    
    var top_up = $('.top_up').val();
    
    
    //type                = $('.myboxforprivate .cs-options ul li[data-option-id='+optionidprivate+']').attr('data-type');
    privateprice        = $('.myboxforprivate .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-price');
    totalsumtext        = "AED "+privateprice;
    
    productoptionid         = $('.myboxforprivate .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-product-option-id');
    productoptionvalueid    = $('.myboxforprivate .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-product-option-value-id');
    textvalset              = $('.myboxforprivate .cs-options ul li[data-option-value-id='+optionidprivate+']').children('span').text();
    
    if(top_up==1)
    {
        
        adult_price =  $('.myfirstsectlcus .cs-options ul li[data-product-option-id='+productoptionid+']').attr('data-price');
        
        child_price =  $('.myfirstsectlcus .cs-options ul li[data-product-option-id='+productoptionid+']').attr('data-childprice');
        child =  $('.childssss').val();
        adults =  $('.adultssss').val();
        $('.book-total').text('');
        child_values =    child*child_price;
        adults_values =   adults* adult_price;
        
        $(".transfer_rate").removeClass('hide');
         $(".transferprice").html('AED '+parseInt(privateprice));
        
        privateprice=  parseInt(child_values) + parseInt(adults_values) + parseInt(privateprice);
        totalsumtext        = "Total: AED "+privateprice;
                            
                                   
                                    
                                   
                                
        $('.book-total').text(totalsumtext);
        
      
        
    }
    else
    {
          $('.book-total').text(totalsumtext);
    }
     $('.myboxforprivate .cs-selected').removeClass('cs-selected');  
     $('.myboxforprivate .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('class','cs-selected');
     $('.myboxforprivate .cs-placeholder').text(textvalset);
    
     $('.book-total').text(totalsumtext);
     $('.booktotal input [name="privatepricepakage"]').html('');
     $('.book-total').append("<input type='hidden' name='privatepricepakage' value='"+privateprice+"'/>");
    //html                = '<div class="book-rate"><span>Package </span><span class="privatepricepricetotal">AED : '+ privateprice +'</span></div><input type="hidden" name="privatepricepakage" />';
    //$('.myboxescalculations').html(html);
    /*hiden option value here*/
     $('.privatetotal').val(privateprice);
     optioninput  ='<input type="hidden" class="cusproductoptionvalueid" name="option['+productoptionid+']" value="'+productoptionvalueid+'" />';
     $('.otpinhidvaluehere').html(optioninput);
     
     /* Common Variable For date and locaion input val  */
     var datepicker_chk          = $("#datepicker").val();
     var pickuplocations_chk     = $("#pickuplocations").val();
     
     
     if(datepicker_chk!='' && pickuplocations_chk!='')
     {
        $('#button-cart').prop('disabled', false);
     }
     else
     {
        $('#button-cart').prop('disabled', true);
     }
     
    
}
function mycalculationscombo(optionid)
{
   
   /*this function is for only SIC ANd Without transfer*/
     /*number of child andd adult  set by deafault 0 */
     familytype = $('input[name="familytype"]').val();
     top_up     = $('.top_up').val();
     
        $(".childhidprice").val(0)
        $(".parenthidprice").val(0)   
     
        
   
     var html = '';
     $('.myboxforprivate').addClass('hide');
     
     type                    = $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-type');
     price                   = $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-price');
     childprice              = $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-childprice');
     productoptionid         = $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-id');
     productoptionvalueid    = $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-value-id');
     if(type=='Without Transfer'){       
       type_latest='without_transfer';
       $('.pickup').addClass('hide');
    }else{
        type_latest=type;
        $('.pickup').removeClass('hide');

    }
     $(".travel_type").val(type_latest);
     //alert('productoptionvalueid:-'+productoptionvalueid +' productoptionid:-'+productoptionid);
     
     $('.myfirstsectlcus .cs-selected').removeClass('cs-selected');  
     $('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('class','cs-selected');
     $('.myfirstsectlcus .cs-placeholder').text(type);
     totalsumtext        = "AED 0";
     $('.book-total').text(totalsumtext); 
     
     /*first flush old value*/
     optioninput  ='';
     $('.otpinhidvaluehere').html(optioninput);
     optioninput  ='<input type="hidden" class="cusproductoptionvalueid" name="option['+productoptionid+']" value="'+productoptionvalueid+'" />';
     $('.otpinhidvaluehere').html(optioninput);
     $(".transfer_rate").addClass('hide');
     $(".transferprice").html(' ');  
     if(familytype==1)
     {
         $(".parenthidprice").val(1)
         
         //$(".myboxescalculations").html('<div class="book-pick"><span>No of Adults</span><span>2</span><span>No of Childrens</span><span>2</span></div>');
         inputhtmlfixed = '<div class="hide"><input value="1" name="adultnumbers" type="hidden" ><input value="" name="childumbers"  type="hidden"></div>';
         $(".myboxescalculations").html('<div class="book-pick"><span>(1 Day) - (Family) - 2Adult & 2 Child</span>'+inputhtmlfixed+'</div>');
         //var $inputs = $('#form').find('input');
         priceadult(1,price);
     }
     else
     {
     //alert(price);
         html    = '<div class="book-rate"><span>Adult: </span><span class="adultpricetotal">AED 0</span><span>Children:</span><span class="childpricetotal">AED 0</span></div>';
         $('.setcalprice').removeClass('hide');
         $('.setcalprice').html(html);
         $(".myboxescalculations").html('<div class="book-pick"><span>No of Adults</span><span><input value="" onblur="priceadult(this.value,price)"  name="adultnumbers" type="text" placeholder="00"></span><span>No of Childrens</span><span><input value="" onblur="pricechild(this.value,childprice)" name="childumbers"  type="text" placeholder="00"></span></div>');      
    }    
}
function priceadult(val,priceadult)
{
    
    var adultprice      = val*priceadult;
    texttotaladult      = 'AED : '+adultprice;
    $('.adultpricetotal').text(texttotaladult);
    $('input[name="totalpriceadult"]').val(adultprice);
    childpriceget       = $('input[name="totalpricechild"]').val();
    totalpricesum       = parseInt(adultprice)+parseInt(childpriceget);
    totalsumtext        = " Total: AED "+totalpricesum;
    $('.book-total').text(totalsumtext);
    /*parenthidprice-childhidprice*/
    $('input[name="parenthidprice"]').val(val)
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker").val();
    var pickuplocations_chk     = $("#pickuplocations").val();
   
    if(val!=0 && datepicker_chk!='' && pickuplocations_chk!='')
    {
        $('#button-cart').prop('disabled', false);
    }
    else
    {
        $('#button-cart').prop('disabled', true);
    }
    
}
function pricechild(val,pricechild)
{
    //alert("value=:-"+val+"Aduklt price per"+priceadult);
    var childpriceval    = val*pricechild;
    texttotalchild= 'AED : '+childpriceval;
    $('.childpricetotal').text(texttotalchild);
    /*totalpricechild*/
    $('input[name="totalpricechild"]').val(childpriceval);
    adultpriceget       = $('input[name="totalpriceadult"]').val();
    //if(childpriceget=='' || childpriceget==' '){alert("hdjkjdkhjdhjj");}
    totalpricesum       = parseInt(adultpriceget)+parseInt(childpriceval);
    totalsumtext = " Total: AED "+totalpricesum;
    $('.book-total').text(totalsumtext);
    /*parenthidprice-childhidprice*/
    $('input[name="childhidprice"]').val(val)
    
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker").val();
    var pickuplocations_chk     = $("#pickuplocations").val();
    if(val!=0 || datepicker_chk!='' || pickuplocations_chk!='')
    {
        $('#button-cart').prop('disabled', false);
    }
    else
    {
        $('#button-cart').prop('disabled', true);
    }
}
 



$('#button-cart').on('click', function() {
    $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueid,#datepicker,#pickuplocations,.top_up,.travel_type'),
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
});
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

$(document).ready(function() {
    /*Add cusom validation on cart button data-product-option-id*/
   /* optioid14 = $('.myfirstsectlcus .cs-options ul li[data-option-id=14]').length;
   if(optioid14==0)
   {
    mycalculationscombo(15);
   }
   else
   {
    mycalculationscombo(14);
   }
   */
   
    /*$('.myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('class','cs-selected');*/
    $('#button-cart').prop('disabled', true);
    
    
    $('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
