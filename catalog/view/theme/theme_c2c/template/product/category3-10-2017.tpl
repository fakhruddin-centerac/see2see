<?php 
//echo "<pre>";print_r($products);exit;  

echo $header; ?>
    
    <div class="section item-section">
        <div class="container">
            <div class="page-title hotels-title">
                <h1><span><?php echo $heading_title; ?></span></h1>
            </div>
            <div class="section-list">
                <div class="row">
                    <?php 
                    if($category_tp=='LS')
                    {
                        foreach ($products as $product) {  ?>
                    <div class="col-sm-4">
                        <div class="sec-list-wrap">
                            <div class="list-item-img">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
                            </div>
                            <div class="list-item-dsc">
                                <h3><?php echo $product['name']; ?></h3>
                                <p><?php echo $product['description']; ?></p>
                                <div class="list-item-action">
                                    <span class="lsit-item-more"><a  data-toggle="modal" product-key="<?php echo $product['product_id']; ?>" data-target="#productcus-<?php echo $product['product_id']; ?>" >ADD</a></span>
                                </div>
                          </div>
                        </div>
                    </div>
                    <?php } 
                    
                    }
                    else{
                    foreach ($products as $product) {  ?>
                    <div class="col-sm-4">
                        <div class="sec-list-wrap">
                            <div class="list-item-img">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
                            </div>
                            <div class="list-item-dsc">
                                <h3><?php echo $product['name']; ?></h3>
                                <p><?php echo $product['description']; ?></p>
                                <div class="list-item-action">
                                    <span class="lsit-item-more"><a href="<?php echo $product['href']; ?>">KNOW MORE</a></span>
                                </div>
                          </div>
                        </div>
                    </div>
                    <?php } 
                    }
                    ?>
                    
                    
                </div>
            </div>
        </div>
    </div>
    <?php  if($category_tp=='LS')
    { ?>
    <!-- All modal box for only 69 and 70   -->
    <?php foreach ($products as $product) {  ?>
             <div class="modal fade" id="productcus-<?php echo $product['product_id']; ?>" role="dialog">
                <div class="modal-dialog">
                
                  <!-- Modal content-->
                  <div class="modal-content" id="product">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title"><?php echo $product['name']; ?></h4>
                    </div>
                    <div class="modal-body">
                        <?php if($maincategoryidcus==69)
                        {
                            $attr = 'data-price="'.$product['options'][0]['product_option_value'][0]['price'].'"  data-product-option-id="'.$product['options'][0]['product_option_id'].'" data-product-option-value-id="'.$product['options'][0]['product_option_value'][0]['product_option_value_id'].'" data-option-id="'.$product['options'][0]['option_id'].'" data-type="'.$product['options'][0]['name'].'"  ';
                        ?>
                        <div class="inputgropcus">
                            <input <?php echo $attr; ?>type="text" class="numberofhourls" onblur="numbetofhoursc(this.value,<?php echo $product['options'][0]['option_id']; ?>)" for="numberofhourls" name="parenthidprice" placeholder="Enter No. of Hours"  />    
                        </div>
                        <?php } ?>
                        <div>
                        <div class="fixedhid"></div>
                        <!--
                        <input value="1" onblur="pricechild" name="childhidprice"  type="hidden" />
                        <input value="1" onblur="pricechild" name="pickuplocation"  type="hidden" />
                        <input value="1" onblur="pricechild" name="tourdate"  type="hidden" />
                        -->
                        <div class="optionhidset"></div>
                        
                        
                        <?php if($maincategoryidcus==70)
                        {
                        ?>
                        <div class="myfirstsectlcus cs-select cs-skin-border" tabindex="0">
                            <span class="cs-placeholder">Select Transfer</span>
                            <div class="cs-options">
                                <ul>
                        <?php 
                            
                            foreach($product['options'] as $option)
                            {
                                $attr = 'data-price="'.$option['product_option_value'][0]['price'].'" data-product-option-id="'.$option['product_option_id'].'" data-product-option-value-id="'.$option['product_option_value'][0]['product_option_value_id'].'" data-option-id="'.$option['option_id'].'" data-type="'.$option['name'].'" onclick="setoptionvalue('.$option['option_id'].')" ';
                            ?>
                                
                                    <li <?php echo $attr; ?> ><span><?php echo $option['name']; ?></span></li>     
                                   
                            <!--<select name="option[<?php echo $option['product_option_id']; ?>]">
                                <option value="<?php echo $option['product_option_value'][0]['product_option_value_id']; ?>"><?php echo $option['name']; ?></option>
                            </select>-->
                            <?php                                 
                            }
                        ?>
                                </ul>
                             </div>
                        </div>
                        
                        <?php 
                        }
                        ?>
                        <div class="book-total">Total : AED  </div>
                      </div>
                      <!--<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '1');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md">Add to Cart</span></button>-->
                      
                    </div>
                    <div class="modal-footer book-add-cart12">
                        <!--<button type="button" id="button-cart" data-dismiss="modal" data-loading-text="Loading..." class="btn btn-primary btn-lg btn-block">Add to Cart</button>-->
                        <button type="button" data-loading-text="Loading..." class="btn btn-primary btn-lg btn-block button-cartcusvivi"><?php echo $button_cart; ?></button>
                      <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                    </div>
                  </div>
                </div>
             </div>
        
    <?php  } 
    }
    ?>
    <!-- close  -->
    <!--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>-->


<?php
/*
<div class="container">
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
3    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($thumb || $description) { ?>
      <div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <hr>
      <?php } ?>
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
      <div class="row">
        <div class="col-md-2 col-sm-6 hidden-xs">
          <div class="btn-group btn-group-sm">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="form-group">
            <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
          </div>
        </div>
        <div class="col-md-4 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-md-3 col-xs-6">
          <div class="form-group input-group input-group-sm">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
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
      <div class="row">
        <?php foreach ($products as $product) {  ?>
        <div class="  product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <p><?php echo $product['description']; ?></p>
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
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
              <div class="button-group">
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
*/
?>
<script type="text/javascript"><!--

$('.cs-select').click(function(){
   $(this).toggleClass('cs-active'); 
});

/*  function for set option id*/
function setoptionvalue(optionid)
{
    $('.modal.fade.in .button-cartcusvivi').prop('disabled', false);
    $('.optionhidset').html('');
    product_option_id            = $('.modal.fade.in .myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-id');//option name
    product_option_value_id      = $('.modal.fade.in .myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-value-id');//option value
    data_type                    = $('.modal.fade.in .myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-type');//selected val
    data_price                    = $('.modal.fade.in .myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-price');//total
    
    $('.book-total').text('Total : AED  '+data_price);
    $('.myfirstsectlcus .cs-placeholder').text(data_type);
    $('input[name="pickuplocation"]').val(data_type);
    optionhtml                   = '<input class="optionhidval" type="hidden" name="option['+product_option_id+']" value="'+product_option_value_id+'" />';
    $('.optionhidset').html(optionhtml);
    
}
function numbetofhoursc(val,optionid)
{
    if(val!='' ||val!=0)
    {
        $('.in .button-cartcusvivi').prop('disabled', false);    
    }
    $('.optionhidset').html('');
    product_option_id            = $('.modal.fade.in .inputgropcus .numberofhourls[data-option-id='+optionid+']').attr('data-product-option-id');//option name
    product_option_value_id      = $('.modal.fade.in .inputgropcus .numberofhourls[data-option-id='+optionid+']').attr('data-product-option-value-id');//option value
    data_price                   = $('.modal.fade.in .inputgropcus .numberofhourls[data-option-id='+optionid+']').attr('data-price');//total
    totalpeghour                 = parseInt(val)*parseInt(data_price);
    //alert($('.modal.fade.in .inputgropcus .numberofhourls[data-option-id='+optionid+']').length);
    /*in case of hourly we are need to multiply price to hours so that we are putting hourly valu to hidde name parenthidprice*/
    $('.fixedhid input[name="parenthidprice"').remove();
    $('.book-total').text('Total : AED  '+totalpeghour);
    optionhtml                   = '<input class="optionhidval" type="hidden" name="option['+product_option_id+']" value="'+product_option_value_id+'" />';
    $('.optionhidset').html(optionhtml);
}

$(".list-item-action .lsit-item-more a").on('click',function(){
    
   modelid        = $(this).attr('data-target');
   productid      = $(this).attr('product-key');
   $('.modal.fade.in .button-cartcusvivi').prop('disabled', true);
   
   /*
   <input value="1" onblur="pricechild" name="childhidprice"  type="hidden" />
   <input value="1" onblur="pricechild" name="parenthidprice"  type="hidden" />
    <input value="1" onblur="pricechild" name="pickuplocation"  type="hidden" />
    <input value="1" onblur="pricechild" name="tourdate"  type="hidden" />
    <input value="'+productid+'" onblur="pricechild" name="product_id"  type="hidden" />
   */
   fixedhidhtml = '<input value="1" onblur="pricechild" name="childhidprice"  type="hidden" /><input value="1" onblur="pricechild" name="pickuplocation"  type="hidden" /><input value="1" onblur="pricechild" name="tourdate"  type="hidden" /><input value="'+productid+'" onblur="pricechild" name="product_id"  type="hidden" /><input value="1" class="setpaentashours" name="parenthidprice"  type="hidden" />';
    
   $(modelid+' .fixedhid').html(fixedhidhtml); 
});

/*customadd from product.tpl*/

$('.button-cartcusvivi').on('click', function() { 
    $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		//data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueid,#datepicker,#pickuplocations'),
        data: $('.in #product input[type=\'hidden\'],.in .inputgropcus .numberofhourls'),
		dataType: 'json',
		beforeSend: function() {
			$('.modal.fade.in .button-cartcusvivi').button('loading');
		},
		complete: function() {
			$('.modal.fade .button-cartcusvivi').button('reset');
            $('.modal.fade.in .button-cartcusvivi').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

            /*remove default common hiden filed after use one*/
            $('.fixedhid').html('');
            $('.cs-placeholder').text('Select Transfer');
            $('.book-total').text('Total : AED  ');
            /**/
            
			if (json['error']) {
			
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
               
                $('.modal.in .button-cartcusvivi').prop('disabled', true);
                 $('.modal .button-cartcusvivi').prop('disabled', true);
                $('.modal.fade').each(function(){
                    $(this).find('.button-cartcusvivi').prop('disabled', true);    
                });
                
				/*$('#cart > ul').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');*/
                $('#cart > .customaddprice').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
                $('.modal').modal('hide');
                
                //location.reload();
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});

$(document).ready(function() {
$('.button-cartcusvivi').prop('disabled', true);
});

//--></script>
<style>
.modal-content{background: #f7f7f7;color:black;}
 .modal-content .inputgropcus .numberofhourls::-moz-placeholder,.modal-content .inputgropcus .numberofhourls{color:black;}
 .modal-content .inputgropcus .numberofhourls{border-bottom: 1px solid #000;}
 .modal-footer{text-align:center;} 
 .modal-content .modal-footer button.button-cartcusvivi.btn.btn-primary {background: transparent none repeat scroll 0 0;
  border: 2px solid #24a4e3;border-radius: 16px;color: #24a4e3;display: block;
  margin: auto;width: 50%;
} 
 
</style>
<?php echo $footer; ?>
