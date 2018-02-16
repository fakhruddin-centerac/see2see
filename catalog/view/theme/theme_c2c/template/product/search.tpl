<div class="main-loader">
    <div id="preloader">
        <span></span>
        <span></span>
    </div>
</div> 
<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
<section class="panel-section active">
  <div class="container clearfix">
    <div class="side-panel">
          <div class="side-panel-box">
              <div class="hotel-form-main">                 
                      <h2>MODIFY SEARCH</h2>  
                      <div class="hotel-form-section">                            
                          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
                      </div>                    
                      <div class="hotel-form-section">
                        <?php if ($description) { ?>
                        <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                        <?php } else { ?>
                        <input type="checkbox" name="description" value="1" id="description" />
                        <?php } ?>
                        <?php echo $entry_description; ?></label>
                      </div>
                      <div class="hotel-form-section hotel-form-gap">
                          <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
                      </div>
              </div>
          </div>
          <div class="side-panel-box">
                <div class="filter-box">
                    <h2>Filter your search</h2>
                        
                        <div class="filter-box-section">
                            <select id="input-sort" onchange="location = this.value;">
                              <?php foreach ($sorts as $sorts) { ?>
                              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                              <?php } ?>
                              <?php } ?>
                            </select>
                        </div>
                        <div class="filter-box-section">
                          <select id="input-limit" onchange="location = this.value;">
                            <option disabled>Limit</option>
                            <?php foreach ($limits as $limits) { ?>
                            <?php if ($limits['value'] == $limit) { ?>
                            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                        </div>            

                </div>
            </div>
      </div>
      <div class="content-panel">
        <div class="hotel-result-main search-result-main">
          <?php if ($products) { ?>
          <?php foreach ($products as $product) { ?>
              <div class="hotel-result-container">
                  <div class="hotel-search-box">
                      <div class="hotel-image-thumb">
                          <img src="<?php echo $product['thumb']; ?>"/>
                      </div>
                      <div class="hotel-info">
                          <?php if($product['product_tp']=='HB'){
                                $href= 'index.php?route=product/hotels/landing';
                              }else if($product['product_tp']=='UHP'){
                                if($product['product_id']=='238'){
                                  $href= 'index.php?route=product/standardpackage&amp;product_id=238';
                                }else if($product['product_id']=='241'){
                                  $href= 'index.php?route=product/makepackage&amp;product_id=241';
                                }
                              }else{
                                $href= $product['href'];
                              }                             

                          ?>
                          <h2><a href="<?php echo $href; ?>"><?php echo $product['name']; ?></a></h2>
                          <p><?php echo $product['description']; ?></p>
                          <!-- <div class="stars stars-example-bootstrap">
                              <select class="hotel-rating-star" name="rating" autocomplete="off">
                              <?php for($i=1;$i<=5;$i++){?>
                                  <option value="<?php echo $i; ?>" <?php if($i==$hotel['quantity']){ echo 'selected'; } ?> ><?php echo $i; ?></option>
                              <?php } ?>
                              </select>
                          </div>
                          <!-- <div class="hotel-location">
                              <div class="hotel-loaction-img">
                                  <img src="catalog/view/theme/theme_c2c/images/hotel-location.png"/>
                              </div>
                              <div class="hotel-location-info">
                                  <p><?php echo $hotel['location']; ?></p>
                              </div>
                          </div> -->
                      </div>
                  </div>
                  <!-- <div class="hotel-main-rate">
                    <?php if (!$product['special']) { ?>
                    <?php echo 'AED'. $product['price']; ?>
                    <?php } else { ?>
                    <span class="price-new">AED <?php echo $product['special']; ?></span> <span class="price-old">AED <?php echo $product['price']; ?></span>
                    <?php } ?>
                    <?php if ($product['tax']) { ?>
                    <span class="price-tax">AED <?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                    <?php } ?>
                  </div> -->
              </div>

          <?php } ?>
          <div class="row">
            <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
            <!-- <div class="col-sm-6 text-right"><?php echo $results; ?></div> -->
          </div>
          <?php } else { ?>
          <p><?php echo $text_empty; ?></p>
          <?php } ?>
        </div>
      </div>

  </div>

</section> 
</div>
 
<!-- END-->

<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>