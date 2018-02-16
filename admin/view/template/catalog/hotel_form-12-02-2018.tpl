<?php  /*echo "<pre>";print_r($visa_categories);exit;*/ echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
            <li class=""><a href="#tab-category" data-toggle="tab"><?php echo $tab_category; ?></a></li>
            <li class=""><a href="#tab-facility" data-toggle="tab"><?php echo $tab_facility; ?></a></li>
            <li class=""><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>

            <li class="hide"><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>
            <li class="hide"><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
            <li class="hide"><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
            <li class="hide"><a href="#tab-recurring" data-toggle="tab"><?php echo $tab_recurring; ?></a></li>
            <li class="hide"><a href="#tab-discount" data-toggle="tab"><?php echo $tab_discount; ?></a></li>
            <li class="hide"><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>            
            <li class="hide"><a href="#tab-reward" data-toggle="tab"><?php echo $tab_reward; ?></a></li>
            <li class="hide"><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>            
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">                  
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="hotel_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($hotel_description[$language['language_id']]) ? $hotel_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="hotel_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($hotel_description[$language['language_id']]) ? $hotel_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="hotel_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($hotel_description[$language['language_id']]) ? $hotel_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="hotel_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($hotel_description[$language['language_id']]) ? $hotel_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="hotel_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($hotel_description[$language['language_id']]) ? $hotel_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                  
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-data">
              <div class="form-group input-required">
                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-10">
<!--                  <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />-->
                        <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                  <?php if ($error_model) { ?>
                  <div class="text-danger"><?php echo $error_model; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group input-required">
                <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_star_rating; ?></label>
                <div class="col-sm-10">
                  <select class="form-control" name="quantity" id="input-quantity">
                    <?php for($i=1;$i<=5;$i++){?>
                      <?php if ($i == $quantity) { ?>
                      <option value="<?php echo $i; ?>" selected="selected"><?php echo $i; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                      <?php } ?>
                    <?php } ?>                    
                  </select>
                </div>
              </div>              
              
              <div class="hide">                  
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-upc"><span data-toggle="tooltip" title="<?php echo $help_upc; ?>"><?php echo $entry_upc; ?></span></label>
                    <div class="col-sm-10">
                      <input type="text" name="upc" value="<?php echo $upc; ?>" placeholder="<?php echo $entry_upc; ?>" id="input-upc" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-ean"><span data-toggle="tooltip" title="<?php echo $help_ean; ?>"><?php echo $entry_ean; ?></span></label>
                    <div class="col-sm-10">
                      <input type="text" name="ean" value="<?php echo $ean; ?>" placeholder="<?php echo $entry_ean; ?>" id="input-ean" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-jan"><span data-toggle="tooltip" title="<?php echo $help_jan; ?>"><?php echo $entry_jan; ?></span></label>
                    <div class="col-sm-10">
                      <input type="text" name="jan" value="<?php echo $jan; ?>" placeholder="<?php echo $entry_jan; ?>" id="input-jan" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip" title="<?php echo $help_isbn; ?>"><?php echo $entry_isbn; ?></span></label>
                    <div class="col-sm-10">
                      <input type="text" name="isbn" value="<?php echo $isbn; ?>" placeholder="<?php echo $entry_isbn; ?>" id="input-isbn" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-mpn"><span data-toggle="tooltip" title="<?php echo $help_mpn; ?>"><?php echo $entry_mpn; ?></span></label>
                    <div class="col-sm-10">
                      <input type="text" name="mpn" value="<?php echo $mpn; ?>" placeholder="<?php echo $entry_mpn; ?>" id="input-mpn" class="form-control" />
                    </div>
                  </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
                </div>
              </div>
              
             
              <!-- 
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-emirate"><?php echo $entry_emirate; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="emirate" value="<?php echo $emirate; ?>" placeholder="<?php echo $entry_emirate; ?>" id="input-emirate" class="form-control" />
                </div>
              </div> -->
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip" title="<?php echo $entry_emirate; ?>"><?php echo $entry_emirate; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="sku" value="<?php echo $sku; ?>" placeholder="<?php echo $entry_emirate; ?>" id="input-sku" class="form-control" />
                </div>
              </div>

              <!-- <div class="form-group">
                <label class="col-sm-2 control-label" for="input-map"><?php echo $entry_map; ?></label>
                <div class="col-sm-10">
                  <textarea name="map" id="input-map" class="form-control"></textarea>
                </div>
              </div> -->              

               <div class="form-group">
                <label class="col-sm-2 control-label" for="input-location"><?php echo $entry_location; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="location" value="<?php echo $location; ?>" placeholder="<?php echo $entry_location; ?>" id="input-location" class="form-control" />
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_map; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="hotel_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($hotel_description[$language['language_id']]) ? $hotel_description[$language['language_id']]['tag'] : ''; ?>" placeholder="<?php echo $entry_map; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>
               
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
                <div class="col-sm-10">
                  <select name="tax_class_id" id="input-tax-class" class="form-control">
                    <option value="0"><?php echo $text_none; ?></option>
                    <?php foreach ($tax_classes as $tax_class) { ?>
                    <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              
              
              
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="minimum" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-minimum" class="form-control" />
                </div>
              </div>
              
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
                <div class="col-sm-10">
                  <select name="subtract" id="input-subtract" class="form-control">
                    <?php if ($subtract) { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
                <div class="col-sm-10">
                  <input type="hidden" name="stock_status_id" value="7" />
                  <!--
                  <select name="stock_status_id" id="input-stock-status" class="form-control">
                    <?php foreach ($stock_statuses as $stock_status) { ?>
                    <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                  
                  -->
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_instant_confirmation; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($shipping) { ?>
                    <input type="radio" name="shipping" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="shipping" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$shipping) { ?>
                    <input type="radio" name="shipping" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="shipping" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                  <?php if ($error_keyword) { ?>
                  <div class="text-danger"><?php echo $error_keyword; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_date_available; ?></label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="hidden" name="date_available" value="<?php echo $date_available; ?>" />
                    <!--<input type="text" name="date_available" value="<?php echo $date_available; ?>" placeholder="<?php echo $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span>-->
                    </div>
                </div>
              </div>
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-length"><?php echo $entry_dimension; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-4">
                      <input type="text" name="length" value="<?php echo $length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-weight"><?php echo $entry_weight; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="weight" value="<?php echo $weight; ?>" placeholder="<?php echo $entry_weight; ?>" id="input-weight" class="form-control" />
                </div>
              </div>
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-links">
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="<?php echo $help_manufacturer; ?>"><?php echo $entry_manufacturer; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer" value="<?php echo $manufacturer; ?>" placeholder="<?php echo $entry_manufacturer; ?>" id="input-manufacturer" class="form-control" />
                  <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
                </div>
              </div>
              
              
              <input type="hidden" name="hotel_category[]" value="<?php echo $link_catedgory_id; ?>" />
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($categories_main as $hotel_category) { ?>
                    <div id="product-category<?php echo $hotel_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $hotel_category['name']; ?>
<!--                      <input type="hidden" name="visa_category[]" value="<?php echo $product_category['category_id']; ?>" />-->
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
                  <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($hotel_filters as $product_filter) { ?>
                    <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_filter['name']; ?>
                      <input type="hidden" name="hotel_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group hide">
                <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                        <?php if (in_array(0, $hotel_store)) { ?>
                        <input type="checkbox" name="hotel_store[]" value="0" checked="checked" />
                        <?php echo $text_default; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="hotel_store[]" value="0" />
                        <?php echo $text_default; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($store['store_id'], $hotel_store)) { ?>
                        <input type="checkbox" name="hotel_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="hotel_store[]" value="<?php echo $store['store_id']; ?>" />
                        <?php echo $store['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="<?php echo $help_download; ?>"><?php echo $entry_download; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="download" value="" placeholder="<?php echo $entry_download; ?>" id="input-download" class="form-control" />
                  <div id="product-download" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($hotel_downloads as $product_download) { ?>
                    <div id="product-download<?php echo $product_download['download_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_download['name']; ?>
                      <input type="hidden" name="hotel_download[]" value="<?php echo $product_download['download_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_related; ?>"><?php echo $entry_related; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="related" value="" placeholder="<?php echo $entry_related; ?>" id="input-related" class="form-control" />
                  <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($hotel_relateds as $product_related) { ?>
                    <div id="product-related<?php echo $product_related['hotel_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                      <input type="hidden" name="hotel_related[]" value="<?php echo $product_related['hotel_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
           
            <div class="tab-pane hide" id="tab-attribute">
              <div class="table-responsive">
                <table id="attribute" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_attribute; ?></td>
                      <td class="text-left"><?php echo $entry_text; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $attribute_row = 0; ?>
                    <?php foreach ($hotel_attributes as $product_attribute) { ?>
                    <tr id="attribute-row<?php echo $attribute_row; ?>">
                      <td class="text-left" style="width: 40%;"><input type="text" name="hotel_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" placeholder="<?php echo $entry_attribute; ?>" class="form-control" />
                        <input type="hidden" name="hotel_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
                      <td class="text-left"><?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                          <textarea name="hotel_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
                        </div>
                        <?php } ?></td>
                      <td class="text-left"><button type="button" onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $attribute_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="<?php echo $button_attribute_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            
            
            <div class="tab-pane hide" id="tab-option">
              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="option">
                    <?php $option_row = 0; ?>
                    <?php foreach ($hotel_options as $product_option) { ?>
                    <li><a href="#tab-option<?php echo $option_row; ?>" data-toggle="tab"><?php echo $product_option['name']; ?></a></li>
                    <?php $option_row++; ?>
                    <?php } ?>
                    <!--
                    <li>
                      <input type="text" name="option" value="" placeholder="<?php echo $entry_option; ?>" id="input-option" class="form-control" />
                    </li>
                    -->
                  </ul>
                </div>
                <div class="col-sm-10">
                  <div class="tab-content">
                    <?php $option_row = 0; ?>
                    <?php $option_value_row = 0; ?>
                    <?php foreach ($hotel_options as $product_option) { ?>
                    <div class="tab-pane" id="tab-option<?php echo $option_row; ?>">
                      <input type="hidden" name="hotel_option[<?php echo $option_row; ?>][hotel_option_id]" value="<?php echo $product_option['hotel_option_id']; ?>" />
                      <input type="hidden" name="hotel_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
                      <input type="hidden" name="hotel_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
                      <input type="hidden" name="hotel_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-required<?php echo $option_row; ?>"><?php echo $entry_required; ?></label>
                        <div class="col-sm-10">
                          <select name="hotel_option[<?php echo $option_row; ?>][required]" id="input-required<?php echo $option_row; ?>" class="form-control" >
                            <?php if ($product_option['required']) { ?>
                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                            <option value="0"><?php echo $text_no; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_yes; ?></option>
                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <?php if ($product_option['type'] == 'text') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="hotel_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'textarea') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <textarea name="hotel_option[<?php echo $option_row; ?>][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control"><?php echo $product_option['value']; ?></textarea>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'file') { ?>
                      <div class="form-group" style="display: none;">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="hotel_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'date') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-3">
                          <div class="input-group date">
                            <input type="text" name="hotel_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'time') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group time">
                            <input type="text" name="hotel_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'datetime') { ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group datetime">
                            <input type="text" name="hotel_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
                      <div class="table-responsive">
                        <table id="option-value<?php echo $option_row; ?>" class="table table-striped table-bordered table-hover">
                          <thead>
                            <tr>
                              <td class="text-left"><?php echo $entry_option_value; ?></td>
                              <!--<td class="text-right"><?php echo $entry_quantity; ?></td>
                              <td class="text-left"><?php echo $entry_subtract; ?></td>-->
                              <td class="text-right"><?php echo $entry_price; ?></td>
                              <td class="text-right hide">Child Price</td>
                              <!--<td class="text-right"><?php echo $entry_option_points; ?></td>
                              <td class="text-right"><?php echo $entry_weight; ?></td>
                              <td></td>-->
                            </tr>
                          </thead>
                          <tbody class="chuu">
                            <?php foreach ($product_option['hotel_option_value'] as $product_option_value) { ?>
                            <tr id="option-value-row<?php echo $option_value_row; ?>">
                              <td class="text-left">
                              <?php if (isset($option_values[$product_option['option_id']])) { ?>
                                  <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                  <?php 
                                    if ($option_value['option_value_id'] == $product_option_value['option_value_id'])
                                    { 
                                      echo $option_value['name'];
                                  ?>
                                  
                                  <?php
                                    }
                                  }
                               }   
                                  ?>
                              <select name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][option_value_id]" class="form-control hide">
                                  <?php if (isset($option_values[$product_option['option_id']])) { ?>
                                  <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                  <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                                  <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                                  <?php } else { ?>
                                  <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                  <?php } ?>
                                  <?php } ?>
                                  <?php } ?>
                                </select>
                                <input type="hidden" name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][hotel_option_value_id]" value="<?php echo $product_option_value['hotel_option_value_id']; ?>" />
                                </td>
                              <input type="hidden" name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][quantity]" value="1" placeholder="" />
                              <input type="hidden" name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][subtract]" value="0" placeholder="" />
                              <!--<td class="text-right"><input type="text" name="visa_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                              <td class="text-left">
                                <select name="visa_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" class="form-control">
                                  <?php if ($product_option_value['subtract']) { ?>
                                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                  <option value="0"><?php echo $text_no; ?></option>
                                  <?php } else { ?>
                                  <option value="1"><?php echo $text_yes; ?></option>
                                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                  <?php } ?>
                                </select>
                                </td>
                              -->  
                              <td class="text-right">
                              <input type="hidden" name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][price_prefix]" value="+"/>
                              <!--
                                <select name="visa_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" class="form-control">
                                  <?php if ($product_option_value['price_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>
                                  <?php if ($product_option_value['price_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                -->
                                <input type="text" name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" />
                                </td>
                                <!-- custom child price  -->
                               <td class="text-right hide">
                                  <!--<input type="hidden" name="visa_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" value="+"/>-->
                                  <input type="text" name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][child_price]" value="<?php echo $product_option_value['child_price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" />
                               </td>
                               
                               <!-- close child   -->
                              
                              <td class="text-right hide">
                                <select name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][points_prefix]" class="form-control">
                                  <?php if ($product_option_value['points_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>
                                  <?php if ($product_option_value['points_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                <input type="text" name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" placeholder="<?php echo $entry_points; ?>" class="form-control" />
                                </td>
                                
                              <td class="text-right hide">
                                <select name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][weight_prefix]" class="form-control">
                                  <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                                  <option value="+" selected="selected">+</option>
                                  <?php } else { ?>
                                  <option value="+">+</option>
                                  <?php } ?>
                                  <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                                  <option value="-" selected="selected">-</option>
                                  <?php } else { ?>
                                  <option value="-">-</option>
                                  <?php } ?>
                                </select>
                                <input type="text" name="hotel_option[<?php echo $option_row; ?>][hotel_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" placeholder="<?php echo $entry_weight; ?>" class="form-control" />
                                </td>
                              <td class="text-left hide"><button type="button" onclick="$(this).tooltip('destroy');$('#option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                              
                            </tr>
                            <?php $option_value_row++; ?>
                            <?php } ?>
                          </tbody>
                          <tfoot>
                            <tr>
                              <td colspan="7"></td>
                              <!--<td class="text-left"><button type="button" onclick="addOptionValue('<?php echo $option_row; ?>');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>-->
                            </tr>
                          </tfoot>
                        </table>
                      </div>
                      <select id="option-values<?php echo $option_row; ?>" style="display: none;">
                        <?php if (isset($option_values[$product_option['option_id']])) { ?>
                        <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                      <?php } ?>
                    </div>
                    <?php $option_row++; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="tab-pane  hide" id="tab-recurring">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_recurring; ?></td>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-left"></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $recurring_row = 0; ?>
                    <?php foreach ($hotel_recurrings as $product_recurring) { ?>

                    <tr id="recurring-row<?php echo $recurring_row; ?>">
                      <td class="text-left"><select name="hotel_recurring[<?php echo $recurring_row; ?>][recurring_id]" class="form-control">
                          <?php foreach ($recurrings as $recurring) { ?>
                          <?php if ($recurring['recurring_id'] == $product_recurring['recurring_id']) { ?>
                          <option value="<?php echo $recurring['recurring_id']; ?>" selected="selected"><?php echo $recurring['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-left"><select name="hotel_recurring[<?php echo $recurring_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_recurring['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-left"><button type="button" onclick="$('#recurring-row<?php echo $recurring_row; ?>').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $recurring_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addRecurring()" data-toggle="tooltip" title="<?php echo $button_recurring_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>

            
           
            <div class="tab-pane hide" id="tab-discount">
              <div class="table-responsive">
                <table id="discount" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_quantity; ?></td>
                      <td class="text-right"><?php echo $entry_priority; ?></td>
                      <td class="text-right"><?php echo $entry_price; ?></td>
                      <td class="text-left"><?php echo $entry_date_start; ?></td>
                      <td class="text-left"><?php echo $entry_date_end; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $discount_row = 0; ?>
                    <?php foreach ($hotel_discounts as $product_discount) { ?>
                    <tr id="discount-row<?php echo $discount_row; ?>">
                      <td class="text-left"><select name="hotel_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">
                          <?php foreach ($customer_groups as $customer_group) { ?>
                          <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                      <td class="text-right"><input type="text" name="hotel_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="hotel_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                      <td class="text-right"><input type="text" name="hotel_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="hotel_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left" style="width: 20%;"><div class="input-group date">
                          <input type="text" name="hotel_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                      <td class="text-left"><button type="button" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $discount_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="6"></td>
                      <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?php echo $button_discount_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            
            
            
            
            
            <div class="tab-pane" id="tab-image">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_image; ?></td>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
                      <td class="text-left"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" /></td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_additional_image; ?></td>
                      <td class="text-right"><?php echo $entry_sort_order; ?></td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $image_row = 0; ?>
                    <?php foreach ($hotel_images as $product_image) { ?>
                    <tr id="image-row<?php echo $image_row; ?>">
                      <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="hotel_images[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                      <td class="text-right"><input type="text" name="hotel_images[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                      <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $image_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <!-- category tab-->
            <div class="tab-pane" id="tab-category">
              <div class="row">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-blocked-dates"><?php echo $entry_black_out_dates?></label>
                  <div class="col-sm-3">
                    <input type="text" name="hotel_special[<?php echo $language['language_id']; ?>][balckout_date]"  id="input-name<?php echo $language['language_id']; ?>" class="form-control"> 
                  </div>
                  
                </div>
              </div>
              <div class="row">
               <div class="table-responsive">
                <div class="col-sm-12">
                  <?php 
                    $roomtype_row = 1;
                    $roomcalender_row = 1;
                  ?>
                <!-- room type div-->
                  <table id="roomtype" class="table table-striped table-bordered table-hover">
                    <tbody> 
                      <?php
                      if($room_categories){ 
                      $count = 1;
                      foreach($room_categories as $roomCategory){ ?>
                      <!-- start main room row-->
                      <tr>
                        <td style="background: #ad5252;color:#fff;"><label class="control-label">Room <?php echo $count; ?></label></td> 
                      </tr>             
                      <tr>
                        <td>
                          <table id="roomcalender_<?php echo $roomtype_row; ?>" class="table table-striped table-bordered table-hover">
                              <thead>
                                <tr>
                                  <td class="text-left"><?php echo $entry_room_name; ?></td>    
                                 <!--  <td></td> -->
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>
                                    <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][roomname]" value="<?php echo $roomCategory['room_category']; ?>" class="form-control">
                                  </td>
                                  <!-- <td></td> -->
                                </tr> 
                                <?php if($roomCategory['rooms_added']){ 
                                $roomcount = 1;
                                foreach($roomCategory['rooms_added'] as $rooms){ ?>                  
                                <!-- start stay period table-->
                                <tr class="stay_period">
                                  <td style="background: #342f4e;color: #fff;"><label class="control-label">Stay Period <?php echo $roomcount; ?></label></td>
                                </tr>
                                <tr>
                                  <td>
                                    <!-- stay period table-->
                                    <table  class="table table-striped table-bordered table-hover">
                                    <thead>
                                      <tr>
                                        <td class="text-left"><?php echo $entry_stay_period; ?></td>     
                                        <td class="text-left" colspan="2"><?php echo $entry_room_rate; ?></td>    
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr>
                                        <td>
                                          <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][stay_period]" class="form-control" value="<?php echo date('d/m/Y',strtotime($rooms['stay_period_start'])).'-'.date('d/m/y',strtotime($rooms['stay_period_end'])); ?>">
                                        </td>
                                        <td>All Market
                                          <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][all_market_price]" class="form-control" value="<?php echo $rooms['all_market_price']; ?>">
                                        </td>
                                        <td>Indian Market
                                          <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][indian_market_price]" class="form-control" value="<?php echo $rooms['ind_market_price']; ?>">
                                        </td>
                                      </tr>
                                      <tr>                                
                                        <td colspan="3"> 
                                         <label class="control-label">Meals Option Available</label> 
                                        </td>                               
                                      </tr>
                                      <tr>
                                        <td colspan="3"> 
                                          <?php 
                                          $meals_opriotns = explode(',',$rooms['meal_options']);
                                          $na_selected = '';
                                          if(in_array('NA',$meals_opriotns)){ 
                                            $na_selected = 'checked';
                                          } 
                                          $bb_selected = '';
                                          if(in_array('BB',$meals_opriotns)){ 
                                            $bb_selected = 'checked';
                                          }
                                          $hb_selected = '';
                                          if(in_array('HB',$meals_opriotns)){ 
                                            $hb_selected = 'checked';
                                          }
                                          $fb_selected = '';
                                          if(in_array('FB',$meals_opriotns)){ 
                                            $fb_selected = 'checked';
                                          } 
                                          ?>
                                          <input type="checkbox" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][meal_option][]" value="NA" <?php echo $na_selected; ?> >No Option Available
                                          <input type="checkbox" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][meal_option][]" value="BB" <?php echo $bb_selected; ?> >Bed & Breakfast
                                          <input type="checkbox" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][meal_option][]" value="HB" <?php echo $hb_selected; ?> >Half Board
                                          <input type="checkbox" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][meal_option][]" value="FB" <?php echo $fb_selected; ?> >Full Board
                                        </td>
                                      </tr>
                                      <tr>                                
                                        <td colspan="3"> 
                                         <label class="control-label">Meals Plan Rate</label> 
                                        </td>                               
                                      </tr>
                                      <tr><!-- meals price table-->
                                        <td><label class="control-label">All Market</label>
                                          <table class="table table-striped table-bordered table-hover">
                                              <thead>
                                                <tr>
                                                  <td class="text-left">&nbsp;</td>     
                                                  <td class="text-left">Adult</td>     
                                                  <td class="text-left">Child</td>     
                                                </tr>
                                              </thead>
                                              <tbody>
                                                <tr>
                                                  <td>Bed & Breakfast</td>
                                                    <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][all_adult_bed_breakfast_price]" value="<?php echo $rooms['all_adult_BB_price'] ?>"></td>
                                                    <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][all_child_bed_breakfast_price]" value="<?php echo $rooms['all_child_BB_price'] ?>"></td>
                                                </tr>
                                                <tr>
                                                  <td>Half Board</td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][all_adult_half_board_price]" value="<?php echo $rooms['all_adult_HB_price'] ?>" ></td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][all_child_half_board_price]" value="<?php echo $rooms['all_child_HB_price'] ?>"></td>
                                                </tr>
                                                <tr>
                                                  <td>Full Board</td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][all_adult_full_board_price]" value="<?php echo $rooms['all_adult_FB_price'] ?>" ></td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][all_child_full_board_price]" value="<?php echo $rooms['all_child_FB_price'] ?>" ></td>
                                                </tr>
                                              </tbody>
                                          </table>
                                        </td>
                                        <td><label class="control-label">Indian Market</label>
                                          <table class="table table-striped table-bordered table-hover">
                                              <thead>
                                                <tr>
                                                  <td class="text-left">&nbsp;</td>     
                                                  <td class="text-left">Adult</td>     
                                                  <td class="text-left">Child</td>     
                                                </tr>
                                              </thead>
                                               <tbody>
                                                <tr>
                                                  <td>Bed & Breakfast</td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][ind_adult_bed_breakfast_price]" value="<?php echo $rooms['ind_adult_BB_price'] ?>"></td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][ind_child_bed_breakfast_price]" value="<?php echo $rooms['ind_child_BB_price'] ?>"></td>
                                                </tr>
                                                <tr>
                                                  <td>Half Board</td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][ind_adult_half_board_price]" value="<?php echo $rooms['ind_adult_HB_price'] ?>" ></td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][ind_child_half_board_price]" value="<?php echo $rooms['ind_child_HB_price'] ?>" ></td>
                                                </tr>
                                                <tr>
                                                  <td>Full Board</td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][ind_adult_full_board_price]" value="<?php echo $rooms['ind_adult_FB_price'] ?>" ></td>
                                                  <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][ind_child_full_board_price]" value="<?php echo $rooms['ind_child_FB_price'] ?>"></td>
                                                </tr>
                                              </tbody>
                                          </table>
                                        </td>
                                      </tr>
                                      <tr>
                                        <td> 
                                         <label class="control-label">Booking Period</label> 
                                        </td>
                                        <td><label class="control-label">Discount Percentage(%)</label></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][booking_period]" class="form-control" value="<?php echo date('d/m/Y',strtotime($rooms['book_period_start'])).'-'.date('d/m/Y',strtotime($rooms['book_period_end'])); ?>" >
                                        </td>
                                        <td>
                                          Indian Market <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][ind_ebd_discount]" class="form-control" value="<?php echo $rooms['ind_discount_percentage']; ?>">
                                          All Market <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][all_ebd_discount]" class="form-control" value="<?php echo $rooms['all_discount_percentage']; ?>">
                                        </td>
                                        <td>                                     
                                    </td>
                                      </tr>
                                      <tr>
                                        <td> 
                                         <label class="control-label">Adult Occupancy</label> 
                                        </td>
                                        <td><label class="control-label">Child Occupancy</label></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <select name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][adult_occupancy]" class="form-control">
                                            <?php for($i=1;$i<=5;$i++){ ?>
                                            <option value="<?php echo $i; ?>" <?php if($rooms['adult_occupancy']==$i){ echo 'selected="selected"'; } ?> ><?php echo $i; ?></option>
                                              <?php } ?>
                                          </select>
                                        </td>
                                        <td>
                                          <select name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][child_occupancy]" class="form-control">
                                            <?php for($i=1;$i<=5;$i++){ ?>
                                            <option value="<?php echo $i; ?>" <?php if($rooms['child_occupancy']==$i){ echo 'selected="selected"'; }  ?> ><?php echo $i; ?></option>
                                              <?php } ?>
                                          </select>
                                        </td>
                                      </tr>
                                    </tbody> 
                                                              
                                  </table>
                                  <!-- end stay period table-->
                                  </td>                            
                                </tr>
                                <?php 
                                  if(!empty($hotel_specials)){
                                    $blocked_start = $hotel_specials['date_start'];
                                    $blocked_end   = $hotel_specials['date_end'];
                                  } 
                                  $stay_start = $rooms['stay_period_start'];
                                  $stay_end   = $rooms['stay_period_end'];
                                  if($rooms['book_period_start'] && $rooms['book_period_end']){
                                    $book_start = $rooms['book_period_start'];
                                    $book_end   = $rooms['book_period_end'];
                                  }else{
                                    $book_start = date('Y-m-d');
                                    $book_end   = date('Y-m-d');
                                  }
                                ?>
                                <script type="text/javascript">
                                  $(function() {
                                            var editcurdate = new Date();
                                            var editbetween = [];                                           
                                            var editformatted =   editcurdate.getFullYear()+"/"+(editcurdate.getMonth() + 1) +"/"+editcurdate.getDate();
                                            $('input[name="hotel_special[1][balckout_date]"]').daterangepicker({
                                                  locale: {
                                                      format: 'YYYY-MM-DD',
                                                      separator: " / ",
                                                  },
                                                  startDate: '<?php echo $blocked_start; ?>',
                                                  endDate: '<?php echo $blocked_end; ?>'
                                              }, 
                                              function(start, end, label) {
                                                editbetween = [];                                               
                                                editcurdate = new Date(start);      
                                                 while (editcurdate <= end) {
                                                    var editfullDate = new Date(editcurdate);
                                                    editbetween.push(editfullDate.getDate()+ "-"+(editfullDate.getMonth()+1)+"-"+editfullDate.getFullYear());
                                                    editcurdate.setDate(editcurdate.getDate() + 1);
                                                }                                              
                                                
                                            });
                                           $('input[name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][stay_period]"').daterangepicker({
                                                  locale: {
                                                    format: 'YYYY-MM-DD',
                                                    separator: " / "
                                                  },
                                                  startDate: '<?php echo $stay_start; ?>',
                                                  endDate: '<?php echo $stay_end; ?>',
                                                  isInvalidDate:function(date){
                                                    console.log(editbetween);
                                                    if (jQuery.inArray(date.format('D-MM-YYYY'), editbetween)!='-1') {
                                                        return true;  
                                                    }                                
                                                  }
                                            });
                                            
                                            
                                             $('input[name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcount; ?>][booking_period]"').daterangepicker({
                                                  locale: {
                                                    format: 'YYYY-MM-DD',
                                                    separator: " / "
                                                  },
                                                  startDate: '<?php echo $book_start; ?>',
                                                  endDate: '<?php echo $book_end; ?>',
                                                  isInvalidDate:function(date){
                                                    if (jQuery.inArray(date.format('D-MM-YYYY'), editbetween)!='-1') {
                                                        return true;  
                                                    }                                
                                                  }
                                            });
                                        });                                  
                                </script>
                                <!-- end stay period table-->
                                <?php 
                                $roomcount++;
                                ?>
                               

                               <?php  }  ?>     
                                <?php }  ?>
                              </tbody>
                              <tfoot>
                                <!-- add new calender to the room - btn-->
                                <tr>
                                  <td colspan="1" class="text-right"><label class="control-label">Add New Calender</label></td>
                                  <td class="text-left"><button type="button" onclick="addCalender(<?php echo $roomtype_row; ?>);" data-toggle="tooltip" title="<?php echo $btn_add_roomtype; ?>" class="btn btn-danger"><i class="fa fa-plus-circle"></i></button></td>
                                </tr>
                                <!-- end add calender button-->                           
                              </tfoot>   
                          </table>
                        </td>
                        
                      </tr> 
                      <!-- end main row --> 


                      <?php 
                      $count++;

                      $roomtype_row++;

                      } ?>


                        
                      <?php }else{ ?>       
                      
                      <!-- start main room row-->
                      <tr>
                        <td style="background: #ad5252;color:#fff;"><label class="control-label">Room <?php echo $roomtype_row; ?></label></td> 
                      </tr>             
                      <tr>
                        <td>
                          <table id="roomcalender_<?php echo $roomtype_row; ?>" class="table table-striped table-bordered table-hover">
                          <thead>
                            <tr>
                              <td class="text-left"><?php echo $entry_room_name; ?></td>    
                             <!--  <td></td> -->
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>
                                <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][roomname]" class="form-control">
                              </td>
                              <!-- <td></td> -->
                            </tr>                                                   
                            <!-- start stay period table-->
                            <tr class="stay_period">
                              <td style="background: #342f4e;color: #fff;"><label class="control-label">Stay Period <?php echo $roomcalender_row; ?></label></td>
                            </tr>
                            <tr>
                              <td>
                                <table  class="table table-striped table-bordered table-hover">
                                <thead>
                                  <tr>
                                    <td class="text-left"><?php echo $entry_stay_period; ?></td>     
                                    <td class="text-left" colspan="2"><?php echo $entry_room_rate; ?></td>    
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>
                                      <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][stay_period]" class="form-control">
                                    </td>
                                    <td>All Market
                                      <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][all_market_price]" class="form-control">
                                    </td>
                                    <td>Indian Market
                                      <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][indian_market_price]" class="form-control">
                                    </td>
                                  </tr>
                                  <tr>                                
                                    <td colspan="3"> 
                                     <label class="control-label">Meals Option Available</label> 
                                    </td>                               
                                  </tr>
                                  <tr>
                                    <td colspan="3"> 
                                      <input type="checkbox" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][meal_option][]" value="NA">No Option Available
                                      <input type="checkbox" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][meal_option][]" value="BB">Bed & Breakfast
                                      <input type="checkbox" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][meal_option][]" value="HB">Half Board
                                      <input type="checkbox" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][meal_option][]" value="FB" >Full Board
                                    </td>
                                  </tr>
                                  <tr>                                
                                    <td colspan="3"> 
                                     <label class="control-label">Meals Plan Rate</label> 
                                    </td>                               
                                  </tr>
                                  <tr><!-- meals price table-->
                                    <td><label class="control-label">All Market</label>
                                      <table class="table table-striped table-bordered table-hover">
                                          <thead>
                                            <tr>
                                              <td class="text-left">&nbsp;</td>     
                                              <td class="text-left">Adult</td>     
                                              <td class="text-left">Child</td>     
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                              <td>Bed & Breakfast</td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][all_adult_bed_breakfast_price]"></td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][all_child_bed_breakfast_price]"></td>
                                            </tr>
                                            <tr>
                                              <td>Half Board</td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][all_adult_half_board_price]"></td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][all_child_half_board_price]"></td>
                                            </tr>
                                            <tr>
                                              <td>Full Board</td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][all_adult_full_board_price]"></td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][all_child_full_board_price]"></td>
                                            </tr>
                                          </tbody>
                                      </table>
                                    </td>
                                    <td><label class="control-label">Indian Market</label>
                                      <table class="table table-striped table-bordered table-hover">
                                          <thead>
                                            <tr>
                                              <td class="text-left">&nbsp;</td>     
                                              <td class="text-left">Adult</td>     
                                              <td class="text-left">Child</td>     
                                            </tr>
                                          </thead>
                                           <tbody>
                                            <tr>
                                              <td>Bed & Breakfast</td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][ind_adult_bed_breakfast_price]"></td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][ind_child_bed_breakfast_price]"></td>
                                            </tr>
                                            <tr>
                                              <td>Half Board</td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][ind_adult_half_board_price]"></td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][ind_child_half_board_price]"></td>
                                            </tr>
                                            <tr>
                                              <td>Full Board</td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][ind_adult_full_board_price]"></td>
                                              <td><input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][ind_child_full_board_price]"></td>
                                            </tr>
                                          </tbody>
                                      </table>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td> 
                                     <label class="control-label">Booking Period</label> 
                                    </td>
                                    <td><label class="control-label">Discount Percentage(%)</label></td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][booking_period]" class="form-control">
                                    </td>
                                    <td>
                                      Indian Market<input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][ind_ebd_discount]" class="form-control">
                                      All Market<input type="text" name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][all_ebd_discount]" class="form-control">
                                    </td>
                                  </tr>
                                  <tr>
                                    <td> 
                                     <label class="control-label">Adult Occupancy</label> 
                                    </td>
                                    <td><label class="control-label">Child Occupancy</label></td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <select name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][adult_occupancy]" class="form-control">
                                        <?php for($i=1;$i<=5;$i++){ ?>
                                          <option value="<?php echo $i; ?>" ><?php echo $i; ?></option>
                                        <?php } ?>
                                      </select>
                                    </td>
                                    <td>
                                      <select name="hotel_roomtype[<?php echo $roomtype_row; ?>][room_options][<?php echo $roomcalender_row; ?>][child_occupancy]" class="form-control">
                                        <?php for($i=1;$i<=5;$i++){ ?>
                                          <option value="<?php echo $i; ?>" ><?php echo $i; ?></option>
                                        <?php } ?>                                        
                                      </select>
                                    </td>
                                  </tr>
                                </tbody> 
                                                          
                              </table>
                              </td>                            
                            </tr>
                            <!-- end stay period table-->
                          </tbody>
                          <tfoot>
                            <!-- add new calender to the room - btn-->
                            <tr>
                              <td colspan="1" class="text-right"><label class="control-label">Add New Calender</label></td>
                              <td class="text-left"><button type="button" onclick="addCalender(<?php echo $roomtype_row; ?>);" data-toggle="tooltip" title="<?php echo $btn_add_roomtype; ?>" class="btn btn-danger"><i class="fa fa-plus-circle"></i></button></td>
                            </tr>
                            <!-- end add calender button-->                           
                          </tfoot>   
                      </table>
                        </td>
                        
                      </tr> 
                      <!-- end main row --> 
                      <?php }  ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <td colspan="1" class="text-right"><label class="control-label">Add New Room</label></td>
                        <td class="text-left"><button type="button" onclick="addRoomType();" data-toggle="tooltip" title="<?php echo $btn_add_roomtype; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                      </tr>
                    </tfoot>
                  </table>
                  <!-- end main table-->
                            

                </div>
               </div>
              </div>


            </div>
            <!-- end category tab-->
            
            <!-- facilities tab-->
            <div class="tab-pane" id="tab-facility">
              <div class="form-group">
                 <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $entry_facility_options; ?>"><?php echo $entry_facility_options; ?></span></label>
                 <div class="col-sm-10">
                  <input type="text" name="facility" value="" placeholder="<?php echo $entry_facility_options; ?>" id="input-related" class="form-control" />
                  <div id="facilities-providing" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_categories as $facility) { ?>
                    <div id="facility-providing<?php echo $facility['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $facility['name']; ?>
                      <input type="hidden" name="facility_provinding[]" value="<?php echo $facility['category_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <!-- end facility tab-->
            
            <div class="tab-pane hide" id="tab-reward">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="points" value="<?php echo $points; ?>" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_customer_group; ?></td>
                      <td class="text-right"><?php echo $entry_reward; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <tr>
                      <td class="text-left"><?php echo $customer_group['name']; ?></td>
                      <td class="text-right"><input type="text" name="hotel_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" class="form-control" /></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="tab-pane hide" id="tab-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left"><?php echo $entry_store; ?></td>
                      <td class="text-left"><?php echo $entry_layout; ?></td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left"><?php echo $text_default; ?></td>
                      <td class="text-left"><select name="hotel_layout[0]" class="form-control">
                          <option value=""></option>
                          <?php foreach ($layouts as $layout) { ?>
                          <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                          <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                        </select></td>
                    </tr>
                    <?php foreach ($stores as $store) { ?>
                    <tr>
                      <td class="text-left"><?php echo $store['name']; ?></td>
                      <td class="text-left">
                          <select name="hotel_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                              <option value=""></option>
                              <?php foreach ($layouts as $layout) { ?>
                              <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                              <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                              <?php } ?>
                              <?php } ?>
                          </select>
                      </td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </div>

            
            
            
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>

<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<?php if(empty($hotel_specials)){ ?>
<script type="text/javascript"><!--
  var curdate = new Date();
  var between = [];
  var formatted =   curdate.getFullYear()+"/"+(curdate.getMonth() + 1) +"/"+curdate.getDate();
--></script>
<script type="text/javascript"><!--
$(function() {    
    $('input[name="hotel_special[1][balckout_date]"]').daterangepicker({ 
        locale: {
          format: 'YYYY-MM-DD',
          separator: " / "
        },
        minDate: formatted
    }, 
    function(start, end, label) {
      
      currentDate = new Date(start);      
       while (currentDate <= end) {
          var fullDate = new Date(currentDate);
          between.push(fullDate.getDate()+ "-"+(fullDate.getMonth()+1)+"-"+fullDate.getFullYear());
          currentDate.setDate(currentDate.getDate() + 1);
      }     
   
      
    });

   $('input[name="hotel_roomtype[1][room_options][1][stay_period]"').daterangepicker({
        locale: {
          format: 'YYYY-MM-DD',
          separator: " / "
        },         
        minDate: formatted,
        isInvalidDate:function(date){
          if (jQuery.inArray(date.format('D-MM-YYYY'), between)!='-1') {
              return true;  
          }                                
        }
    });
    
    
     $('input[name="hotel_roomtype[1][room_options][1][booking_period]"').daterangepicker({  
          locale: {
            format: 'YYYY-MM-DD',
            separator: " / "
          },       
          minDate: formatted,
          isInvalidDate:function(date){
            if (jQuery.inArray(date.format('D-MM-YYYY'), between)!='-1') {
                return true;  
            }                                
          }
    });
});

//--></script>
<?php } ?>

  <script type="text/javascript"><!--
// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					manufacturer_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['manufacturer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'manufacturer\']').val(item['label']);
		$('input[name=\'manufacturer_id\']').val(item['value']);
	}
});

// Category
$('input[name=\'category\']').autocomplete({ 
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/hotel_category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
				    return {
						label: item['name'],
						value: item['hotel_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
	   
//alert (JSON.stringify(item)); 
		$('input[name=\'category\']').val('');

		$('#product-category' + item['value']).remove();

		$('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="hotel_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Filter
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#product-filter' + item['value']).remove();

		$('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="hotel_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Downloads
$('input[name=\'download\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['download_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'download\']').val('');

		$('#product-download' + item['value']).remove();

		$('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="hotel_download[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-download').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Related
$('input[name=\'related\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/hotels/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['hotel_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'related\']').val('');

		$('#product-related' + item['value']).remove();

		$('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="hotel_related[]" value="' + item['value'] + '" /></div>');
	}
});

$('#product-related').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

//facilities
$('input[name=\'facility\']').autocomplete({
  'source': function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/hotel_facility/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['facility_name'],
            value: item['facility_id']
          }
        }));
      }
    });
  },
  'select': function(item) {
    $('input[name=\'related\']').val('');

    $('#facility-provinding' + item['value']).remove();

    $('#facilities-providing').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="facility_provinding[]" value="' + item['value'] + '" /></div>');
  }
});

$('#facilities-providing').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

//--></script>
  <script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
    html  = '<tr id="attribute-row' + attribute_row + '">';
	html += '  <td class="text-left" style="width: 20%;"><input type="text" name="hotel_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="hotel_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><textarea name="hotel_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
    <?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr>';

	$('#attribute tbody').append(html);

	attributeautocomplete(attribute_row);

	attribute_row++;
}

function attributeautocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
		}
	});
}

$('#attribute tbody tr').each(function(index, element) {
	attributeautocomplete(index);
});
//--></script>
 
  <script type="text/javascript"><!--
var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue(option_row) {
	html  = '<tr id="option-value-row' + option_value_row + '">';
	html += '  <td class="text-left"><select name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
	html += $('#option-values' + option_row).html();
	html += '  </select><input type="hidden" name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][hotel_option_value_id]" value="" /></td>';
	html += '  <td class="text-right"><input type="text" name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><select name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][subtract]" class="form-control">';
	html += '    <option value="1"><?php echo $text_yes; ?></option>';
	html += '    <option value="0"><?php echo $text_no; ?></option>';
	html += '  </select></td>';
	html += '  <td class="text-right"><select name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><select name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><select name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
	html += '    <option value="+">+</option>';
	html += '    <option value="-">-</option>';
	html += '  </select>';
	html += '  <input type="text" name="hotel_option[' + option_row + '][hotel_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#option-value' + option_row + ' tbody').append(html);
	$('[rel=tooltip]').tooltip();

	option_value_row++;
}
//--></script>
  <script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tr id="discount-row' + discount_row + '">';
    html += '  <td class="text-left"><select name="hotel_discount[' + discount_row + '][customer_group_id]" class="form-control">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
    <?php } ?>
    html += '  </select></td>';
    html += '  <td class="text-right"><input type="text" name="hotel_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
    html += '  <td class="text-right"><input type="text" name="hotel_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
	html += '  <td class="text-right"><input type="text" name="hotel_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
    html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="hotel_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="hotel_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#discount tbody').append(html);

	$('.date').datetimepicker({
		pickTime: false
	});

	discount_row++;
}
//--></script>
 
<script type="text/javascript"><!--
var roomtype_row = <?php echo ($roomtype_row + 1) ; ?>;
var roomtypecalender_row = 0;
function addRoomType(){ 
  roomtypecalender_row = roomtypecalender_row + 1;
  html='<tr>';
  html+='<td style="background: #ad5252;color:#fff;"><label class="control-label">Room '+ ( roomtype_row )  +'</label></td>';              
  html+='<tr>';
  html+='<td>';
  html+='<table id="roomcalender_'+ roomtype_row +'" class="table table-striped table-bordered table-hover">'
  html+='<thead>';
  html+='<tr>';
  html+='<td class="text-left">Room Category</td>';    
  html+='</tr></thead> <tbody>';
  html+='<tr><td>';
  html+='<input type="text" name="hotel_roomtype['+ roomtype_row +'][roomname]" class="form-control">';
  html+='</td></tr><!-- start stay period table-->';
  html+='<tr class="stay_period">';
  html+='<td style="background: #342f4e;color: #fff;"><label class="control-label">Stay Period '+ roomtypecalender_row +'</label></td>';
  html+='</tr><tr><td>';
  html+='<table  class="table table-striped table-bordered table-hover">';
  html+='<thead>';
  html+='<tr>';
  html+='<td class="text-left">Stay Period</td>';     
  html+='<td class="text-left" colspan="2">Room Rate</td>';    
  html+='</tr></thead><tbody>';
  html+='<tr><td>';
  html+='<input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][stay_period]" class="form-control">';
  html+='</td>';
  html+='<td>All Market';
  html+='<input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_market_price]" class="form-control">';
  html+='</td>';
  html+='<td>Indian Market';
  html+='<input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][indian_market_price]" class="form-control">';
  html+='</td></tr>';
  html+='<tr>';                             
  html+='<td colspan="3">'; 
  html+='<label class="control-label">Meals Option Available</label>'; 
  html+='</td></tr>';
  html+='<tr>';
  html+='<td colspan="3">'; 
  html+='<input type="checkbox" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][meal_option][]" value="NA">No Option Available';
  html+='<input type="checkbox" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][meal_option][]" value="BB">Bed & Breakfast';
  html+='<input type="checkbox" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][meal_option][]" value="HB">Half Board';
  html+='<input type="checkbox" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][meal_option][]" value="FB">Full Board';
  html+='</td></tr>';
  html+='<tr>';                              
  html+='<td colspan="3">';
  html+='<label class="control-label">Meals Plan Rate</label>'; 
  html+='</td>';                             
  html+='</tr>';
  html+='<tr><!-- meals price table-->';
  html+='<td><label class="control-label">All Market</label>';
  html+='<table class="table table-striped table-bordered table-hover">';
  html+='<thead>';
  html+='<tr>';
  html+='<td class="text-left">&nbsp;</td>';     
  html+='<td class="text-left">Adult</td>';    
  html+='<td class="text-left">Child</td>';    
  html+='</tr>';
  html+='</thead>';
  html+='<tbody>';
  html+='<tr>';
  html+='<td>Bed & Breakfast</td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_adult_bed_breakfast_price]"></td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_child_bed_breakfast_price]"></td>';
  html+='</tr>';
  html+='<tr>';
  html+='<td>Half Board</td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_adult_half_board_price]"></td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_child_half_board_price]"></td>';
  html+='</tr>';
  html+='<tr>';
  html+='<td>Full Board</td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_adult_full_board_price]"></td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_child_full_board_price]"></td>';
  html+='</tr></tbody></table></td>';
  html+='<td><label class="control-label">Indian Market</label>';
  html+='<table class="table table-striped table-bordered table-hover">';
  html+='<thead>';
  html+='<tr>';
  html+='<td class="text-left">&nbsp;</td>';     
  html+='<td class="text-left">Adult</td>';    
  html+='<td class="text-left">Child</td>';     
  html+='</tr></thead>';
  html+='<tbody>';
  html+='<tr>';
  html+='<td>Bed & Breakfast</td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][ind_adult_bed_breakfast_price]"></td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][ind_child_bed_breakfast_price]"></td>';
  html+='</tr>';
  html+='<tr>';
  html+='<td>Half Board</td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][ind_adult_half_board_price]"></td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][ind_child_half_board_price]"></td>';
  html+='</tr>';
  html+='<tr>';
  html+='<td>Full Board</td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][ind_adult_full_board_price]"></td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][ind_child_full_board_price]"></td>';
  html+='</tr></tbody></table></td></tr>';
  html+='<tr>';
  html+='<td>'; 
  html+='<label class="control-label">Booking Period</label>'; 
  html+='</td>';
  html+='<td><label class="control-label">Discount Percentage(%)</label></td>';
  html+='</tr>';
  html+='<tr>';
  html+='<td>';
  html+='<input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][booking_period]" class="form-control">';
  html+='</td>';
  html+='<td>';
  html+='Indian Market<input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][ind_ebd_discount]" class="form-control">';
  html+='All Market<input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_ebd_discount]" class="form-control">';
  html+='</td></tr>';
  html +='<label class="control-label">Adult Occupancy</label>'; 
  html +='</td><td><label class="control-label">Child Occupancy</label></td></tr>';
  html +='<tr><td>';
  html +='<select name="hotel_roomtype['+ roomtype_row +'][room_options]['+ roomtypecalender_row +'][adult_occupancy]" class="form-control">';
  html +='<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="4">5</option></select>';
  html +='</td><td>';
  html +='<select name="hotel_roomtype['+ roomtype_row +'][room_options]['+ roomtypecalender_row +'][child_occupancy]" class="form-control">';
  html +='<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="4">5</option>';
  html +='</select></td></tr>';
  html +='</tbody></table></td></tr>';
  html+='<!-- end stay period table-->';
  html+='</tbody>';
  html+='<tfoot>';
  html+='<!-- add new calender to the room - btn-->';
  html+='<tr>';
  html+='<td colspan="1" class="text-right"><label class="control-label">Add New Calender</label></td>';
  html+='<td class="text-left"><button type="button" onclick="addCalender('+roomtype_row+');" data-toggle="tooltip" title="<?php echo $btn_add_roomtype; ?>" class="btn btn-danger"><i class="fa fa-plus-circle"></i></button></td>';
  html+='</tr>';
  html+='<!-- end add calender button-->';                         
  html+='</tfoot>';   
  html+='</table></td></tr>';
  html+='<tr><td>'; 


  $('#roomtype').append(html);

  $('input[name="hotel_roomtype['+ roomtype_row +'][room_options]['+ roomtypecalender_row +'][stay_period]"').daterangepicker({
          locale: {
            format: 'YYYY-MM-DD',
            separator: " / "
          },
          minDate: formatted,
          isInvalidDate:function(date){
            console.log(between);
            if (jQuery.inArray(date.format('D-MM-YYYY'), between)!='-1') {
                return true;  
            }                                
          }
    });
        
     $('input[name="hotel_roomtype['+ roomtype_row +'][room_options]['+ roomtypecalender_row +'][booking_period]"').daterangepicker({
          locale: {
            format: 'YYYY-MM-DD',
            separator: " / "
          },
          minDate: formatted,
          isInvalidDate:function(date){
            console.log(between);
            if (jQuery.inArray(date.format('D-MM-YYYY'), between)!='-1') {
                return true;  
            }                                
          }
    });

  roomtype_row++;
}
//--></script>
<script type="text/javascript"><!--
var calender_roomtype_row = <?php echo $roomtype_row; ?>;
//var roomcalender_row = <?php echo $roomcalender_row + 1; ?>;
function addCalender(roomtypeRow){  
  console.log(roomtypeRow);
  var roomcalender_row = ( $('#roomcalender_'+roomtypeRow+' tbody tr.stay_period').length + 1);
  html  = '<tr class="stay_period"><td style="background: #342f4e;color: #fff;"><label class="control-label">Stay Period '+ roomcalender_row +'</label></td></tr>';
  html +='<tr id="roomcalender_'+ calender_roomtype_row+'">';
  html +='<td><table  class="table table-striped table-bordered table-hover"><thead>';
  html +='<tr>';
  html +='<td class="text-left">Stay Period</td>';     
  html +='<td class="text-left" colspan="2">Room Rate</td>'    
  html +='</tr></thead><tbody><tr>';
  html +='<td>';
  html +='<input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][stay_period]" class="form-control">';
  html +='</td>';
  html +='<td>All Market';
  html +='<input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][all_market_price]" class="form-control">';
  html +='</td>';
  html +='<td>Indian Market';
  html +='<input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][indian_market_price]" class="form-control">';
  html +='</td> </tr>';
  html +='<tr>';                                
  html +='<td colspan="3">'; 
  html +='<label class="control-label">Meals Option Available</label>'; 
  html +='</td></tr>';
  html +='<tr>';
  html +='<td colspan="3">'; 
  html +='<input type="checkbox" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][meal_option][]" value="NA">No Option Available';
  html +='<input type="checkbox" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][meal_option][]" value="BB">Bed & Breakfast';
  html +='<input type="checkbox" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][meal_option][]" value="HB">Half Board';
  html +='<input type="checkbox" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][meal_option][]" value="FB">Full Board';
  html +='</td></tr>';
  html +='<tr>'                                
  html +='<td colspan="3">'; 
  html +='<label class="control-label">Meals Plan Rate</label>'; 
  html +='</td></tr>';
  html +='<tr><!-- meals price table-->';
  html +='<td><label class="control-label">All Market</label>';
  html +='<table class="table table-striped table-bordered table-hover">';
  html +='<thead>';
  html +='<tr>';
  html +='<td class="text-left">&nbsp;</td>';     
  html +='<td class="text-left">Adult</td>';     
  html +='<td class="text-left">Child</td>';     
  html +='</tr>';
  html +='</thead>';
  html +='<tbody>';
  html +='<tr>';
  html +='<td>Bed & Breakfast</td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+roomcalender_row+'][all_adult_bed_breakfast_price]"></td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+roomcalender_row+'][all_child_bed_breakfast_price]"></td>';
  html +='</tr>';
  html +='<tr>';
  html +='<td>Half Board</td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][all_adult_half_board_price]"></td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][all_child_half_board_price]"></td>';
  html +='</tr>';
  html +='<tr>';
  html +='<td>Full Board</td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][all_adult_full_board_price]"></td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][all_child_full_board_price]"></td>';
  html +='</tr>';
  html +='</tbody></table></td>';
  html +='<td><label class="control-label">Indian Market</label>';
  html +='<table class="table table-striped table-bordered table-hover">';
  html +='<thead>';
  html +='<tr>';
  html +='<td class="text-left">&nbsp;</td>';  
  html +='<td class="text-left">Adult</td>';     
  html +='<td class="text-left">Child</td>';     
  html +='</tr>';
  html +='</thead><tbody>';
  html+='<tr>';
  html+='<td>Bed & Breakfast</td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+roomcalender_row+'][ind_adult_bed_breakfast_price]"></td>';
  html+='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+roomcalender_row+'][ind_child_bed_breakfast_price]"></td>';
  html+='</tr>';
  html +='<tr>';
  html +='<td>Half Board</td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][ind_adult_half_board_price]"></td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][ind_child_half_board_price]"></td>';
  html +='</tr>';
  html +='<tr>';
  html +='<td>Full Board</td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][ind_adult_full_board_price]"></td>';
  html +='<td><input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][ind_child_full_board_price]"></td>';
  html +='</tr></tbody></table>';
  html +='</td></tr>';
  html +='<tr><td>'; 
  html +='<label class="control-label">Booking Period</label>'; 
  html +='</td>';
  html +='<td><label class="control-label">Discount Percentage(%)</label></td>';
  html +='</tr><tr>';
  html +='<td>';
  html +='<input type="text" name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][booking_period]" class="form-control">';
  html +='</td><td>';
  html +='Indian Market<input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][ind_ebd_discount]" class="form-control">';
  html +='All Market<input type="text" name="hotel_roomtype['+ roomtype_row +'][room_options]['+roomtypecalender_row+'][all_ebd_discount]" class="form-control">';
  html +='</td></tr>';
  html +='<tr><td>';
  html +='<label class="control-label">Adult Occupancy</label>'; 
  html +='</td><td><label class="control-label">Child Occupancy</label></td></tr>';
  html +='<tr><td>';
  html +='<select name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][adult_occupancy]" class="form-control">';
  html +='<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="4">5</option></select>';
  html +='</td><td>';
  html +='<select name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][child_occupancy]" class="form-control">';
  html +='<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="4">5</option>';
  html +='</select></td></tr>';
  html +='</tbody></table></td></tr>';  

  //console.log(html);   
  
  $('#roomcalender_'+ roomtypeRow).append(html);

  $('input[name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][stay_period]"').daterangepicker({
          locale: {
            format: 'YYYY-MM-DD',
            separator: " / "
          },
          minDate: formatted,
          isInvalidDate:function(date){
            console.log(between);
            if (jQuery.inArray(date.format('D-MM-YYYY'), between)!='-1') {
                return true;  
            }                                
          }
    });
        
    $('input[name="hotel_roomtype['+ roomtypeRow +'][room_options]['+ roomcalender_row +'][booking_period]"').daterangepicker({
          locale: {
            format: 'YYYY-MM-DD',
            separator: " / "
          },
          minDate: formatted,
          isInvalidDate:function(date){
            console.log(between);
            if (jQuery.inArray(date.format('D-MM-YYYY'), between)!='-1') {
                return true;  
            }                                
          }
    });  

  roomcalender_row++;
}
//--></script>

  <script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
	html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="hotel_images[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="hotel_images[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#images tbody').append(html);

	image_row++;
}
//--></script>

  

  <script type="text/javascript"><!--
var recurring_row = <?php echo $recurring_row; ?>;

function addRecurring() {
	html  = '<tr id="recurring-row' + recurring_row + '">';
	html += '  <td class="left">';
	html += '    <select name="hotel_recurring[' + recurring_row + '][recurring_id]" class="form-control">>';
	<?php foreach ($recurrings as $recurring) { ?>
	html += '      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>';
	<?php } ?>
	html += '    </select>';
	html += '  </td>';
	html += '  <td class="left">';
	html += '    <select name="hotel_recurring[' + recurring_row + '][customer_group_id]" class="form-control">>';
	<?php foreach ($customer_groups as $customer_group) { ?>
	html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
	<?php } ?>
	html += '    <select>';
	html += '  </td>';
	html += '  <td class="left">';
	html += '    <a onclick="$(\'#recurring-row' + recurring_row + '\').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
	html += '  </td>';
	html += '</tr>';

	$('#tab-recurring table tbody').append(html);
	
	recurring_row++;
}
//--></script>
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>

  <script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#option a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>
