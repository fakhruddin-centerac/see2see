<?php 
//echo "<pre>";print_r($products);exit;  

echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>
    
    <div class="section item-section">
        <div class="container">
            <div class="page-title <?php echo ("Yacht Rental Services"==trim($heading_title))?'boat-title':'hotels-title' ?>">
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
                                <img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
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
                    foreach ($products as $product) {  
                        if($product['product_tp']=='PK' && $product['show_large']=='Y' && $product['home_display']=='Y')
                         {
                            
                         }
                        else
                        { 
                        ?>
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
                    <?php 
                       }
                     } 
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
                            $attr = 'data-price="'.preg_replace( '/[^.\d]/', '', $product['options'][0]['product_option_value'][0]['price']).'"  data-product-option-id="'.$product['options'][0]['product_option_id'].'" data-product-option-value-id="'.$product['options'][0]['product_option_value'][0]['product_option_value_id'].'" data-option-id="'.$product['options'][0]['option_id'].'" data-type="'.$product['options'][0]['name'].'"  ';
                        ?>
                        <div class="book-location inputgropcus">
                            <span>
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                <!-- <input <?php echo $attr; ?>type="text" class="numberofhourls" onkeyup="numbetofhoursc(this.value,<?php echo $product['options'][0]['option_id']; ?>)" for="numberofhourls" name="parenthidprice" placeholder="No. of Hours"  /> -->
                                <!-- <select <?php echo $attr; ?> name="parenthidprice" onchange="numbetofhoursc(this.value,<?php echo $product['options'][0]['option_id']; ?>)">
                                  <?php for($i=1;$i<=12;$i++){
                                  if($i==1){
                                    $hourString = 'Hour';
                                  }else{
                                    $hourString = 'Hours';
                                  }
                                  ?>
                                    <option value="<?php echo $i; ?>"><?php echo $i;?> <?php echo $hourString;?></option>
                                  <?php } ?>
                                </select> -->

                                <div class="numberofhourls cs-select cs-skin-border" tabindex="0">
                                  <span class="cs-placeholder">No. of Hours</span>
                                  <div class="cs-options">
                                  <ul> 
                                  <?php 
                                  
                                  if(isset($product['options'][1])){
                                    $min_hours = $product['options'][1]['value'];
                                  }else{
                                    $min_hours = 1;
                                  }

                                  for($i=$min_hours;$i<=12;$i++){
                                  if($i==1){
                                    $hourString = 'Hour';
                                  }else{
                                    $hourString = 'Hours';
                                  }
                                  ?>                                     
                                      
                                      <li <?php echo $attr; ?> onclick="numbetofhoursc(<?php echo $i; ?>,<?php echo $product['options'][0]['option_id']; ?>)"><span><?php echo $i; ?></span></li>     
                                         
                                 
                                  <?php                                 
                                  }
                              ?>
                                      </ul>
                                   </div>
                              </div>

                            </span>    
                        </div>
                        <div class="book-location customfiledslimo">
                            <span>
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                                <input type="text" onblur="chkvaldation(this.val)" name="tourdate"  class="choose-location-book datepickeroncat" placeholder="Date"/>
                            </span>
                            <span>
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <input type="text" onblur="chkvaldation(this.val)"  name="pickuplocation" id="pickuplocations" class="pick-up-location" placeholder="Pickup Location"/>
                            </span>
                            <span>
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                <input type="text" onblur="chkvaldation(this.val)"  name="pickuptime" id="pickuplocations" class="pick-up-location" placeholder="Please Enter Pickup Time 2:00 PM"/>
                            </span>
                            <span>
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <input type="text" onblur="chkvaldation(this.val)"  name="dropuplocation" id="dropuplocations" class="pick-up-location" placeholder="Dropup Location"/>
                            </span>
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
                            <span class="cs-placeholder">Select Airport</span>
                            <div class="cs-options">
                                <ul>
                        <?php 
                            
                            foreach($product['options'] as $option)
                            {
                                $attr = 'data-price="'.$option['product_option_value'][0]['price'].'" data-product-option-id="'.$option['product_option_id'].'" data-product-option-value-id="'.$option['product_option_value'][0]['product_option_value_id'].'" data-option-id="'.$option['option_id'].'" data-type="'.$option['name'].'" onclick="setoptionvalue('.$option['option_id'].')" ';
                            ?>
                                
                                    <li <?php echo $attr; ?> ><span><?php echo strtolower($option['name']); ?></span></li>     
                                   
                            <!--<select name="option[<?php echo $option['product_option_id']; ?>]">
                                <option value="<?php echo $option['product_option_value'][0]['product_option_value_id']; ?>"><?php echo $option['name']; ?></option>
                            </select>-->
                            <?php                                 
                            }
                        ?>
                                </ul>
                             </div>
                        </div>
                        <div class="book-location customfiledsairport ">
                            <!--<div class="inputgropcus">
                                <span>
                                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                                    <input type="text" onblur="chkvaldation1(this.val)" name="numberofpassenger" placeholder="Enter Number of Passenger"/>
                                </span>
                            </div>-->
                            <div class="way_type">
                              <div class="radio">
                                  <input id="radio-4" name="filter_transfer" type="radio" checked value="one" class="change_direction">
                                  <label for="radio-4" class="radio-label">Airport to Hotel or Hotel to Airport (One Way)</label>
                              </div>
                              <div class="radio">
                                  <input id="radio-3" name="filter_transfer" type="radio" value="two" class="change_direction">
                                  <label for="radio-3" class="radio-label">Airport to Hotel & Hotel to Airport</label>
                              </div>
                            </div>
                           <div class="direction_type hide">
                                <select name="typedirection" class="cs-select cs-skin-border ">
                                    <option value="" disabled selected>Select Transfer Option</option>
                                    <option value="From Airport to Hotel in Dubai">Selected Airport to Hotel (Dubai)</option>
                                    <option value="To Airport from Hotel in Dubai">Hotel (Dubai) to Selected Airport</option>
                                </select>
                           </div>
                           <span>
                                <i class="fa fa-calendar" aria-hidden="true"></i>
                                <input type="text" onblur="chkvaldation1(this.val)" name="tourdate" class="choose-location-book datepickeroncat" placeholder="Date"/>
                            </span>
                            <span>
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <input type="text" onblur="chkvaldation1(this.val)"  name="pickuplocation" id="pickuplocations" class="pick-up-location" placeholder="Pickup Location"/>
                            </span>
                            <div class="drop_off">
                                 <span>
                                  <i class="fa fa-map-marker" aria-hidden="true"></i>
                                  <input type="text" onblur="chkvaldation(this.val)"  name="dropuplocation" id="dropuplocations" class="pick-up-location" placeholder="Dropoff Location"/>
                              </span>
                           </div>
                            <span>
                                <i class="fa fa-clock-o" aria-hidden="true"></i>
                                <input type="text" onblur="chkvaldation1(this.val)"  name="pickuptime" id="pickuplocations" class="pick-up-location" placeholder="Pickup Time"/>
                            </span> 
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


 $( function() {
          $( ".datepickeroncat" ).datepicker({ 
            dateFormat: 'dd-mm-yy' , 
            minDate : 0,
            onSelect: function(dateText, inst) {
                $('#'+inst.id).attr('value',dateText);
            }
            });
        } );
        
$('.cs-select').click(function(){
   $(this).toggleClass('cs-active'); 
});

$(document).on('change','.change_direction',function(){
    console.log($(this).val());  
    if($(this).val()=='two'){
      $('.direction_type').addClass('hide');
    }else if($(this).val()=='one'){
      $('.direction_type').removeClass('hide');
    }
});
/*  function for set option id*/

/*taking global flag to get know that is select transfer is select or not*/
isairportselect = '';
function validationblack1(valblack)
{
    tourdateval       = $(".modal.fade.in .customfiledsairport input[name=tourdate]").val();
    pickuplocationval = $(".modal.fade.in .customfiledsairport input[name=pickuplocation]").val();
    numberofpassengerval = $(".modal.fade.in .customfiledsairport input[name=numberofpassenger]").val();
    pickuptimeval     = $(".modal.fade.in .customfiledsairport input[name=pickuptime]").val();
    /*dropuplocationval = $(".modal.fade.in .customfiledsairport input[name=dropuplocation]").val();*/
    
    if(tourdateval=='' || pickuplocationval=='' || pickuptimeval=='' || isairportselect=='' || numberofpassengerval=='')
    {
        return true;
    }
    else
    {
        return false;
        
    }
    
}
function chkvaldation1(thival)
{
    chkvaldate1 = validationblack1(this.value);
    if(chkvaldate1)
    {
        $('.in .button-cartcusvivi').prop('disabled', true);        
    }
    else
    {
        $('.in .button-cartcusvivi').prop('disabled', false);
    }
    
}
function setoptionvalue(optionid)
{
    
    isairportselect=1;// set this global variable to 1 as flag
    chkvaldate1 = validationblack1(this.value);
    if(chkvaldate1)
    {
        $('.in .button-cartcusvivi').prop('disabled', true);        
    }
    else
    {
        $('.in .button-cartcusvivi').prop('disabled', false);
    }
    $('.optionhidset').html('');
    product_option_id            = $('.modal.fade.in .myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-id');//option name
    product_option_value_id      = $('.modal.fade.in .myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-value-id');//option value
    data_type                    = $('.modal.fade.in .myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-type');//selected val
    data_price                   = $('.modal.fade.in .myfirstsectlcus .cs-options ul li[data-option-id='+optionid+']').attr('data-price');//total
    $('.book-total').text('Total : AED  '+data_price);
    $('.myfirstsectlcus .cs-placeholder').text(data_type);
    
    optionhtml                   = '<input class="optionhidval" type="hidden" name="option['+product_option_id+']" value="'+product_option_value_id+'" />';
    $('.optionhidset').html(optionhtml);
    
}
function chkvaldation(inpuvalvaldation)
{
    chkvaldate = validationblack(this.value);
    if(chkvaldate)
    {
        $('.in .button-cartcusvivi').prop('disabled', true);        
    }
    else
    {
        $('.in .button-cartcusvivi').prop('disabled', false);
    }
    
}
function validationblack(valblack)
{
    tourdateval       = $(".modal.fade.in .customfiledslimo input[name=tourdate]").val();
    pickuplocationval = $(".modal.fade.in .customfiledslimo input[name=pickuplocation]").val();
    pickuptimeval     = $(".modal.fade.in .customfiledslimo input[name=pickuptime]").val();
    dropuplocationval = $(".modal.fade.in .customfiledslimo input[name=dropuplocation]").val();
    noofhoursval      = $(".modal.fade.in  input[name=parenthidprice]").val();
    if(tourdateval=='' || pickuplocationval=='' || pickuptimeval=='' || dropuplocationval=='' || noofhoursval=='')
    {
        return true;
    }
    else
    {
        return false;
        /*if(isNaN(noofhoursval))
        {
            return true;    
        }
        else
        {
            if(noofhoursval==0 || noofhoursval=='0')
            {
                return true;
            }
            else
            {
                return false;
            }    
        }
        */
    }
    
}
function numbetofhoursc(val,optionid)
{
    
    console.log(val);
    if(isNaN(val))
    {
        $('.in .button-cartcusvivi').prop('disabled', true);    
    }
    else
    {
        if(val==0 || val=='0')
        {
            $('.in .button-cartcusvivi').prop('disabled', true);
        }
        else
        {
            /*now need to check all fileds are not blank*/
            $('.customfiledslimo input').each(function(){
                chkvaldate = validationblack(this.value);
                if(chkvaldate)
                {
                    $('.in .button-cartcusvivi').prop('disabled', true);        
                }
                else
                {
                    $('.in .button-cartcusvivi').prop('disabled', false);
                }
            });
            
            $('.optionhidset').html('');

            product_option_id            = $('.modal.fade.in .inputgropcus .numberofhourls .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-id');//option name
            product_option_value_id      = $('.modal.fade.in .inputgropcus .numberofhourls .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-value-id');//option value
            data_price                   = $('.modal.fade.in .inputgropcus .numberofhourls .cs-options ul li[data-option-id='+optionid+']').attr('data-price');//total
            console
            totalpeghour                 = parseInt(val)*parseInt(data_price);
            //alert($('.modal.fade.in .inputgropcus .numberofhourls[data-option-id='+optionid+']').length);
            /*in case of hourly we are need to multiply price to hours so that we are putting hourly valu to hidde name parenthidprice*/
            $('.fixedhid input[name="parenthidprice"').remove();
            $('.book-total').text('Total : AED  '+totalpeghour);
            optionhtml                   = '<input class="optionhidval" type="hidden" name="option['+product_option_id+']" value="'+product_option_value_id+'" />';
            $('.optionhidset').html(optionhtml);    
        }
            
                
    }
    
    
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
   fixedhidhtml = '<input value="1" onblur="pricechild" name="childhidprice"  type="hidden" /><input value="1" onblur="pricechild" name="pickuplocation"  type="hidden" /><input value="'+productid+'" onblur="pricechild" name="product_id"  type="hidden" /><input value="1" class="setpaentashours" name="parenthidprice"  type="hidden" />';
    
   $(modelid+' .fixedhid').html(fixedhidhtml); 
});

/*customadd from product.tpl*/

$('.button-cartcusvivi').on('click', function() { 
    $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		//data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueid,#datepicker,#pickuplocations'),
        data: $('.in #product input[type=\'hidden\'],.in .inputgropcus .numberofhourls,.customfiledslimo input,.customfiledsairport input'),
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
 .modal-content .inputgropcus .numberofhourls{border-bottom: none;}
 .modal-footer{text-align:center;} 
 .modal-content .modal-footer button.button-cartcusvivi.btn.btn-primary {background: transparent none repeat scroll 0 0;
  border: 2px solid #24a4e3;border-radius: 16px;color: #24a4e3;display: block;
  margin: auto;width: 50%;
} 
.cs-select ul span{font-size: 16px;}
 
</style>
<?php echo $footer; ?>
