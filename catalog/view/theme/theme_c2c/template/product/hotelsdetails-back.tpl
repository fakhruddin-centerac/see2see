<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>
<section class="hotel-tab-head">
    <div class="container">
        <ul class="clearfix">
            <li class="active">HOTEL BOOKING</li>
            <?php if($visa_option==1){ ?>
            <li>UAE VISA</li>
            <?php } ?>
            <li>SUMMARY</li>
        </ul>
    </div>
</section>


<section class="panel-section active">

    <div class="container clearfix">
        <div class="side-panel">
            <div class="side-panel-box">
                <div class="hotel-form-main">
                    <form class="home-hotel-form" name="hotel-search" id="hotel-search" action="<?php echo 'index.php?route=product/hotels'; ?>" method="post">
                        <h2>MODIFY SEARCH</h2>                        
                        <div class="hotel-form-section">
                            <select name="filter_nationality" id="nationality">
                                <option disabled selected>Nationality</option>
                                <?php foreach($countries as $country){?>  
                                <option value="<?php echo $country['country_id']; ?>" <?php if($filter_nationality==$country['country_id']){ echo 'selected'; } ?> ><?php echo $country['name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="hotel-form-section">                            
                            <input type="text" placeholder="Emirate" name="filter_sku" id="emirate"  value="<?php echo $filter_sku; ?>">
                        </div>
                        <div class="hotel-form-section">
                            <div class="row">
                                <div class="col-xs-6">
                                    <input type="text" class="hotelChekin" placeholder="Check-in" name="filter_checkin" value="<?php echo $filter_checkin; ?>">
                                </div>
                                <div class="col-xs-6">
                                    <input type="text" class="hotelChekout" placeholder="Check-out" name="filter_checkout" value="<?php echo $filter_checkout; ?>">
                                </div>
                            </div>
                        </div>
                        <div class="hotel-form-section">
                            <div class="row">
                                <div class="col-xs-4">
                                    <select name="filter_rooms" id="filter_rooms">
                                        <option value="" selected>Rooms</option>
                                        <?php for($i=1;$i<=5;$i++){?>
                                        <option value="<?php echo $i;?>" <?php if($i==$filter_rooms){ echo 'selected'; } ?> ><?php echo $i; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="col-xs-4">
                                    <select name="filter_adult" id="filter_adult">
                                        <option value="" selected>Adults</option>
                                       <?php for($i=1;$i<=5;$i++){?>
                                        <option value="<?php echo $i;?>" <?php if($i==$filter_adult){ echo 'selected'; } ?> ><?php echo $i; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="col-xs-4">
                                    <select name="filter_child" id="filter_child"> 
                                        <option value="" selected>Child</option>
                                        <?php for($i=1;$i<=5;$i++){?>
                                        <option value="<?php echo $i;?>" <?php if($i==$filter_child){ echo 'selected'; } ?> ><?php echo $i; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="filter_visa" value="<?php echo $filter_visa; ?>">

                        <div class="hotel-form-section hotel-form-gap">
                            <input type="submit" value="Modify"/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="side-panel-box">
                <div class="filter-box">
                    <h2>Filter your search</h2>

                    <form>
                        <div class="filter-box-section">
                            <select>
                                <option>Price Low to High</option>
                            </select>
                        </div>
                        <div class="filter-box-section">
                            <select>
                                <option>Star Rating</option>
                            </select>
                        </div>
                        <div class="filter-box-section">
                            <select>
                                <option>Landmarks</option>
                            </select>
                        </div>
                        <div class="filter-box-section">
                            <select>
                                <option>Location</option>
                            </select>
                        </div>
                        <div class="filter-box-section">
                            <input type="submit" value="Search"/>
                        </div>
                    </form>

                </div>
            </div>
            <div class="side-panel-box">
                <div class="guest-box">
                    <h2>Guests Love</h2>
                    <ul class="common-info">
                        <li><span><img src="catalog/view/theme/theme_c2c/images/round-right-arrow.svg"/></span>
                            “wonderful staff” 49 related reviews
                        </li>
                        <li><span><img src="catalog/view/theme/theme_c2c/images/round-right-arrow.svg"/></span>
                            “location was great” 36 related reviews
                        </li>
                        <li><span><img src="catalog/view/theme/theme_c2c/images/round-right-arrow.svg"/></span> “fast
                            WiFi” 12 related reviews
                        </li>
                    </ul>

                    <ul class="added-addon">
                        <li><span><img src="catalog/view/theme/theme_c2c/images/wifi-icon.svg"/></span> <label>Free
                                WiFi</label> Guests consistently rate the WiFi as excellent
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="content-panel hotel-inner-page-main">
            <div class="hotel-slider">
                <div class="clearfix">
                    <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                       <?php
                       foreach($images as $image){ ?>
                         <li data-thumb="<?php echo $image['thumb']; ?>">
                            <img src="<?php echo $image['popup']; ?>"/ >
                        </li>
                      <?php } ?>
                    </ul>
                </div>
            </div>
            <div class="hotel-single">
                <div class="hotel-search-box ">
                    <div class="hotel-info">
                        <h2><?php echo $heading_title; ?></h2>
                        <div class="stars stars-example-bootstrap">
                            <select class="hotel-rating-star" name="rating" autocomplete="off">
                                <?php for($i=1;$i<=5;$i++){?>
                                    <option value="<?php echo $i; ?>" <?php if($i==$star_rating){ echo 'selected'; } ?> ><?php echo $i; ?></option>
                                <?php } ?>                                
                            </select>
                        </div>
                        <div class="hotel-location">
                            <div class="hotel-loaction-img">
                                <img src="catalog/view/theme/theme_c2c/images/hotel-location.png"/>
                            </div>
                            <div class="hotel-location-info">
                                <p><?php echo $location; ?></p>
                            </div>
                        </div>
                        <div class="hotel-guest-rating">
                            <p>Guest Rating <span><?php echo $rating; ?></span></p>
                        </div>
                    </div>
                    <div class="hotel-price">
                        <div class="hotel-share-main">
                            <div class="hotel-heart"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
                            <div class="hotel-share"><img class="share-icon"
                                                          src="catalog/view/theme/theme_c2c/images/share-icon.svg"/>
                            </div>
                        </div>
                        <div class="hotel-main-rate">
                            <p>Per Night</p>

                            <h2>AED <span class="main-rate"><?php echo $price; ?></span></h2>
                        </div>
                    </div>
                </div>

                <div class="hotel-single-description">
                    <p><?php echo $description; ?></p>
                </div>

                <div class="hotel-amenity">
                    <table>
                        <tbody>
                        <tr>
                            <td>
                                <div class="amenity-icon" data-value="Description">
                                    <img src="catalog/view/theme/theme_c2c/images/description-icon.svg"/>

                                    <p>Description</p>
                                </div>
                            </td>
                            <td>
                                <div class="amenity-icon" data-value="Facilities">
                                    <img src="catalog/view/theme/theme_c2c/images/facility-icon.svg"/>

                                    <p>Facilities</p>
                                </div>
                            </td>
                            <td>
                                <div class="amenity-icon" data-value="Directions">
                                    <img src="catalog/view/theme/theme_c2c/images/direction-icon.svg"/>

                                    <p>Directions</p>
                                </div>
                            </td>
                            <td class="instant-confirmation">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td><img src="catalog/view/theme/theme_c2c/images/confirm-icon.svg"/></td>
                                        <td><p>Instant Confirmation </p></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="hotel-amenity-pop">
                    <div class="amenity-contianer">
                        <div class="overly-click"></div>
                        <div class="amenity-pop-main">
                            <h2 class="amenity-head"></h2>
                            <button type="button" class="close" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <div id="exTab1">
                                <ul class="nav nav-pills">
                                    <li class="active">
                                        <a href="#1a" data-toggle="tab">Description</a>
                                    </li>
                                    <li><a href="#2a" data-toggle="tab">Facilities</a>
                                    </li>
                                    <li><a href="#3a" data-toggle="tab">Directions</a>
                                    </li>

                                </ul>
                                <div class="tab-content clearfix">
                                    <div class="tab-pane active" id="1a">
                                        <p><?php echo $description; ?></p>
                                    </div>
                                    <div class="tab-pane" id="2a">
                                        <ul>
                                        <?php foreach($facilities as $facility){?>
                                            <li><img src="<?php echo $facility['facility_image']; ?>"><?php echo $facility['facility_name']; ?></li>
                                        <?php } ?>
                                        </ul>
                                    </div>
                                    <div class="tab-pane" id="3a">
                                       <?php echo $map; ?>
                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
<form method="post" class="" name="room_options" id="room_type_form" enctype="multipart/form-data">
    <div class="container">         
        <div class="hotel-single-table">
            <table class="table table-bordered" id="rooms_list">
                <thead>
                <tr>
                    <th>Room category</th>
                    <th>Max</th>
                    <th>Meal Plan</th>
                    <th>Offer</th>
                    <th>Room Price</th>
                    <th>No. of Rooms</th>
                </tr>

                </thead>
                <tbody>
                <?php foreach($room_options as $key=>$options){ ?>                   

                    <input type="hidden" name="room_options[<?php echo $key; ?>][product_id]" value="<?php echo $_GET['hotel_id']; ?>"><input type="hidden" name="room_options[<?php echo $key; ?>][room_option_id]" value="<?php echo $options['product_room_option_id']; ?>">
                    <input type="hidden" name="room_options[<?php echo $key; ?>][room_type]" value="<?php echo $options['room_category']; ?>">
                    <tr id="<?php echo $key; ?>">
                        <td class="hotel-room-cat">
                            <p id="room_category_<?php echo $key; ?>"><?php echo $options['room_category']; ?></p>
                            <label class="hotel-available">Available</label>
                        </td>
                        <td class="hotel-max-people">
                            <div class="max-people-container">
                                <div class="people-adult">
                                    <?php 
                                    $adult_occupancy = $options['adult_occupancy']; 
                                    $adult_path = 'personBig'.$adult_occupancy.'.png';
                                    ?>
                                    <img src="catalog/view/theme/theme_c2c/images/person/<?php echo $adult_path; ?>">
                                </div>
                                <sapn>+</sapn>
                                <div class="people-child">
                                    <?php 
                                    $child_occupancy = $options['child_occupancy']; 
                                    $child_path = 'personSml'.$child_occupancy.'.png';
                                    ?>
                                    <img src="catalog/view/theme/theme_c2c/images/person/<?php echo $child_path; ?>">
                                </div>
                            </div>
                        </td>
                        <td class="hotel-meal-plan">
                            <select id="meals_option_<?php echo $key; ?>" name="room_options[<?php echo $key; ?>][meals_option]" data-key="<?php echo $key; ?>" class="meals_option">
                                <option value="BB">bed & Breakfast</option>
                                <option value="HB">Half Board</option>
                                <option value="FB">Full Board</option>
                            </select>
                            <?php 
                            if($filter_id==1){ ?>
                            <div class="option_BB_<?php echo $key; ?>">
                                <p><span>Adults : </span><span><?php echo $options['ind_adult_BB_price']; ?> AED</span></p>
                                <p><span>Children : </span><span><?php echo $options['ind_child_BB_price']; ?> AED</span></p>
                            </div>
                            <div class="option_HB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span><span><?php echo $options['ind_adult_HB_price']; ?> AED</span></p>
                                <p><span>Children : </span><span><?php echo $options['ind_child_HB_price']; ?> AED</span></p>
                            </div>
                            <div class="option_FB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span><span><?php echo $options['ind_adult_FB_price']; ?> AED</span></p>
                                <p><span>Children : </span><span><?php echo $options['ind_child_FB_price']; ?> AED</span></p>
                            </div>
                            <?php  }else{ ?>
                            <div class="option_BB_<?php echo $key; ?>">
                                <p><span>Adults : </span><span><?php echo $options['all_adult_BB_price']; ?> AED</span></p>
                                <p><span>Children : </span><span><?php echo $options['all_child_BB_price']; ?> AED</span></p>
                            </div>
                            <div class="option_HB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span><span><?php echo $options['all_adult_HB_price']; ?> AED</span></p>
                                <p><span>Children : </span><span><?php echo $options['all_child_HB_price']; ?> AED</span></p>
                            </div>
                            <div class="option_FB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span><span><?php echo $options['all_adult_FB_price']; ?> AED</span></p>
                                <p><span>Children : </span><span><?php echo $options['all_child_FB_price']; ?> AED</span></p>
                            </div>  

                            <?php }  ?>

                        </td>
                        <td class="hotel-offers">
                            <p><?php 
                                $now = new DateTime();
                                $startdate = new DateTime($options['book_period_start']);
                                $enddate = new DateTime($options['book_period_end']);
                                if($startdate <= $now && $now <= $enddate) {
                                    echo $options['discount_percentage']." % discount"; ?>
                                    <input type="hidden" name="room_options[<?php echo $key; ?>][discount]" id="discount_<?php echo $key; ?>" value="<?php echo $options['discount_percentage']; ?>">
                                <?php }else{
                                    echo "No Offers";
                                }
                            ?></p>
                        </td>
                        <td class="hotel-room-price">
                            <div class="hotel-main-rate">
                                <p>Per Night</p>

                                <h2>AED 
                                <?php if($filter_id==1){ ?>
                                    <span class="main-rate" id="main_rate_<?php echo $key; ?>"><?php echo $options['all_market_price']; ?></span></h2>
                                    <input type="hidden" name="room_options[<?php echo $key; ?>][market_price]" value="<?php echo $options['all_market_price']; ?>">
                                <?php }else{ ?>
                                     <span class="main-rate" id="main_rate_<?php echo $key; ?>"><?php echo $options['ind_market_price']; ?></span></h2>
                                     <input type="hidden" name="room_options[<?php echo $key; ?>][market_price]" value="<?php echo $options['ind_market_price']; ?>">
                                <?php } ?>
                            </div>
                        </td>
                        <td class="hotel-num-room">
                            <select name="room_options[<?php echo $key; ?>][room_selected]" id="rooms_count_<?php echo $key; ?>" data-key="<?php echo $key; ?>" class="rooms_select">
                                <option  value="0" selected>SELECT</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </td>
                    </tr>

                <?php } ?>

                </tbody>
            </table>
        </div>
       
        <div class="next-button-table">
            <table>
                <tbody>
                <tr>
                    <td><p>Total : AED <span id="room_total_price">0</span></p></td>
                    <td><a href="javascript:void(0);" class="next" <?php if($visa_option==0){ ?> id="visa_next" <?php } ?>>Next</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

<?php if($visa_option==1){ ?>
<section class="panel-section hotel-visa-section">
    <div class="container">
        <div class="hotel-single-table">
            <div class="msgpart"></div>
            <table class="table table-bordered" id="visa_table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Visa Type</th>
                    <th>Price</th>
                    <th>Attach Passport Front</th>
                    <th>Attach Passport Back</th>
                    <th>Attach Photo</th>
                </tr>

                </thead>
                <tbody>
                <?php $visa_row = 0; ?>
                <tr id="<?php echo $visa_row;?>">                    
                    <td>
                        <input type="text" placeholder="Your name" name="visa_appication[<?php echo $visa_row?>][applicant_name]" id="visa_applicant_<?php echo $visa_row?>"/>
                    </td>
                    <td>
                        <select id="visa_option_<?php echo $visa_row; ?>" data-key="<?php echo $visa_row; ?>" name="visa_appication[<?php echo $visa_row?>][visa_option]" class="visa_option">
                            <option disabled selected>SELECT</option>
                            <?php foreach($visaproduct as $visa){ ?>
                            <option value="<?php echo $visa['product_id']; ?>" data-price="<?php echo $visa['price']; ?>"><?php echo $visa['name']; ?></option>
                            <?php } ?>
                        </select>
                    </td>
                    <td class="hotel-room-price">
                        <div class="hotel-main-rate">
                            <h2><span class="main-rate" id="visa_rate_<?php echo $visa_row; ?>">AED 0</span></h2>
                            <input type="hidden" name="visa_appication[<?php echo $visa_row?>][visa_price]" id="visa_price_<?php echo $visa_row; ?>" class="visa_price">
                        </div>
                    </td>
                    <td>
                        <div class="attach-copy">
                            <input type="file" id="passport_<?php echo $visa_row; ?>" name="visa_appication[<?php echo $visa_row?>][travellerspassportfront]"/>                        
                        </div>
                    </td>
                    <td>
                        <div class="attach-copy">
                            <input type="file" id="passport_<?php echo $visa_row; ?>" name="visa_appication[<?php echo $visa_row?>][travellerspassportback]"/>                        
                        </div>
                    </td>
                    <td>
                        <div class="attach-copy">
                            <input type="file" id="passport_<?php echo $visa_row; ?>" name="visa_appication[<?php echo $visa_row?>][passportphoto]"/>                        
                        </div>
                    </td>
                </tr>               

                </tbody>
                <tfoot>
                <tr>
                    <td colspan="6">
                        <button id="add_visa">ADD +</button>
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="next-button-table">
            <table>
                <tbody>
                <tr>
                    <td><p>Total : AED <span id="visa_total_price">0</span></p></td>
                    <td><a href="javascript:void(0);" class="next" <?php if($visa_option==1){ ?> id="visa_next" <?php } ?> >Next</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<?php } ?>
</form>

<section class="panel-section hotel-summary">
    <div class="container">
        <table>
            <tbody>
                <tr>
                    <td>
                        <h2>Hotel Booking</h2>
                        <table id="hotel_booking">
                            <tbody>
                                
                            </tbody>
                        </table>
                    </td>
                    <?php if($visa_option==1){ ?>
                    <td>
                        <h2>Visa Application</h2>
                        <table id="visa_summary">
                            <tbody>                         

                            </tbody>
                        </table>
                    </td>
                    <?php } ?>
                </tr>
            </tbody>
        </table>
        <div class="next-button-table">
            <table>
                <tbody>
                <tr>
                    <td><p>Total : AED <span id="total_booking_price">350</span></p></td>
                    <td><a href="javascript:void(0)" id="buttonstorehotel" >ADD TO CART</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</section>
<div id="product">
<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
<input type="hidden" name="custom_price" id="custom_price" value="" />
<!-- hideen data  -->
<input type="hidden" value="1" name="childhidprice" class="childhidprice"/>
<input type="hidden" value="1" name="parenthidprice" class="parenthidprice"/>
<input type="hidden" value="<?php echo date("d-m-Y"); ?>" name="tourdate" class="tourdatevisa"/>
<input type="hidden" value="" name="pickuplocation" class="pickuplocationvisa"/>
</div>

<?php echo $footer; ?>


<script type="text/javascript">
    /**home page hotel section the form calender**/
    var d = new Date();
    var curentmonth = d.getMonth();
    var curentdate = d.getDate();
    var year = d.getFullYear();
    d.setFullYear(year);
    d.setMonth(0);
    $('.hotelChekin, .hotelChekout').datepicker({
        dateFormat: 'dd-mm-yy',
        changeMonth: true,
        changeYear: true,
        yearRange: '1950:<?php echo date('Y');?>',
        defaultDate: d,
        maxDate: new Date('<?php echo date('Y');?>', curentmonth, curentdate),
    })
    ;
    /**end of home page hotel section the form calender**/

    /**home page hotel section the form selectbox**/
    $('.hotel-form-section select').select2({
        minimumResultsForSearch: -1
    });
    /**home page hotel section the form selectbox**/


    /**home page hotel section the star rating**/
    $(function () {
        $('.hotel-rating-star').barrating({
            theme: 'bootstrap-stars',
        });
    });
    /**home page hotel section the star rating**/
</script>
<script>
    function formroomssubmit(){
        console.log($('#room_type_form').serialize());
        var room_otions = new FormData($('#room_type_form')[0]);
        var visa_application = new FormData($('#visa_form')[0]);
         $.ajax({
            url: 'index.php?route=product/hotels/addRoomOptions',
            type: 'post',
            dataType: 'json',
            /*data: $("#visamodleform").serialize(),*/
            data: new FormData($('#room_type_form')[0]),
            processData: false,
            contentType: false,
            beforeSend: function() {
                //$('#button-review').button('loading');
            },
            complete: function() {
                //$('#button-review').button('reset');
            },
            success: function(json) {
                
                console.log(json);

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
    $(document).ready(function () {
        $("#buttonstorehotel").click(function(){
            console.log('add to cart');

            /*formroomssubmit();
            return false;*/
           $.ajax({
                    url: 'index.php?route=checkout/cart/add',
                    type: 'post',
                    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueid,.pickuplocationvisa,.tourdatevisa'),
                    dataType: 'json',
                    beforeSend: function() {
                        $('#buttonstorehotel').button('loading');
                    },
                    complete: function() {
                        $('#buttonstorehotel').button('reset');
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
                         
                         /*here we need to add room options data on separet table */
                           formroomssubmit();
                         
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
        $('#image-gallery').lightSlider({
            gallery: true,
            item: 1,
            thumbItem: 9,
            slideMargin: 0,
            speed: 500,
            auto: true,
            loop: true,
            onSliderLoad: function () {
                $('#image-gallery').removeClass('cS-hidden');
            }
        });

        $(document).on('click','.next',function(e){
            e.preventDefault();
            var $first = $('li:first', 'ul');
            var $next, $selected = $("li.active"),$tab_selected=$('section.active');
            $next = $selected.next('li').length ? $selected.next('li') : $first;
            $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
            $selected.removeClass("active");
            $next.addClass('active');
            $tab_selected.removeClass("active");
            $tabnext.addClass('active');
            var next_id = $(this).attr('id');
            if(next_id=='visa_next'){
                var hotelsummary = '';
                var visaummary   = '';
                $( "#rooms_list tbody tr" ).each(function( index ) {                   
                    var row_id = $(this).attr('id');
                    var rooms_selected = $('#rooms_count_'+row_id).val();
                    if(rooms_selected != null){
                        var room_type = $('#room_category_'+row_id).html();
                        var meals_option_sel = $('#meals_option_'+row_id).val();
                        if(meals_option_sel=='BB'){
                            var meal_option = 'Bed & Breakfast';
                        }else if(meals_option_sel=='HB'){
                            var meal_option = 'Half Board';
                        }else if(meals_option_sel=='FB'){
                            var meal_option = 'Full Board';
                        }
                        var price_per_night = $('#main_rate_'+row_id).html();
                        hotelsummary = '<tr><td>Room Category</td><td>: '+room_type+'</td></tr>';
                        hotelsummary +='<tr><td>Number of People</td><td>: 3</td></tr>';
                        hotelsummary +='<tr><td>Meal Plan</td><td>: '+meal_option+'</td></tr>';
                        hotelsummary +='<tr><td>Room Price</td><td>: '+price_per_night+' AED</td></tr>';
                        hotelsummary +='<tr><td>No. Of Rooms</td><td>: '+rooms_selected+'</td></tr>';
                        $('#hotel_booking tbody').append(hotelsummary);
                   }
                });
                $( "#visa_table tbody tr" ).each(function( index ) {
                    var visa_row = $(this).attr('id');
                    var applicant_name  = $('#visa_applicant_'+visa_row).val();
                    var visa_option     = $('#visa_option_'+visa_row+' option:selected').text();
                    var visa_amount     = $('#visa_rate_'+visa_row).html();
                    console.log(visa_option);
                    console.log(visa_amount);

                    visasummary ='<tr><td>Name</td><td>: '+applicant_name+'</td></tr>';
                    visasummary +='<tr><td>Visa Type</td><td>: '+visa_option+'</td></tr>';
                    visasummary +='<tr><td>Price</td><td>: '+visa_amount+'</td></tr>';
                    $('#visa_summary tbody').append(visasummary);
                });
                var room_total_price = $('#room_total_price').html();
                var total_visa_price = $('#visa_total_price').html();
                console.log(total_visa_price);
                if(total_visa_price !=undefined){
                    var total_booking_amount = parseInt(room_total_price) + parseInt(total_visa_price);
                }
                else{
                    var total_booking_amount = parseInt(room_total_price);
                }
                
                $('#total_booking_price').html(total_booking_amount);
                $('#custom_price').val(total_booking_amount);

            }
        });
        
        $(document).on('change','.meals_option',function(){           
            var selected = $(this).find(":selected").val();
            var item_id  = $(this).attr("id");
            var key      = $(this).attr("data-key");            
            if(selected=='BB'){
                $('.option_BB_'+key).removeClass('hide');
                $('.option_HB_'+key).addClass('hide');
                $('.option_FB_'+key).addClass('hide');
            }else if(selected=='HB'){
                $('.option_HB_'+key).removeClass('hide');
                $('.option_BB_'+key).addClass('hide');
                $('.option_FB_'+key).addClass('hide');
            }else if(selected=='FB'){
                $('.option_FB_'+key).removeClass('hide');
                $('.option_BB_'+key).addClass('hide');
                $('.option_HB_'+key).addClass('hide');
            }
        });
        /* total price for room calculation*/
        
        $(document).on('change','.rooms_select',function(){ 
            var total_amount = 0;
            $( ".rooms_select" ).each(function( index ) {
                var room_count  = $(this).find(":selected").val();
                if(room_count!='0'){
                    var key = $(this).attr('data-key');
                    var per_night = $('#main_rate_'+key).html();
                    var room_total_amount  = (per_night * room_count);
                    if($('#discount_'+key).val()){
                        console.log($('#discount_'+key).val());
                        var discount_percentage = $('#discount_'+key).val();
                        var discount_amount = (discount_percentage / 100) * per_night;
                        console.log(discount_amount);
                        room_total_amount = (room_total_amount - discount_amount);
                    }
                    total_amount = parseInt(total_amount) + parseInt(room_total_amount);
                }               

            });
            
            $('#room_total_price').html(total_amount);
        });


        $(document).on('change','.visa_option',function(){             
            var visa_price  = $(this).find(":selected").attr('data-price');
            var key         = $(this).attr('data-key'); 
            //var price_element = '<h2>'+visa_price+'</h2>';
            var new_price = visa_price.replace("AED ", "");
            $('#visa_rate_'+key).html(visa_price);
            $('#visa_price_'+key).val(new_price);
            var visa_total = 0;
            $( ".visa_price" ).each(function( index ) { 
                var visa_amount = $(this).val();
                visa_total = parseInt(visa_total) + parseInt(visa_amount);
            });
            $('#visa_total_price').html(visa_total);
        });

    });


</script>

<?php if($visa_option==1){ ?>
<script type="text/javascript">
    var visa_row = '<?php echo $visa_row +1 ; ?>';
    $(document).on('click','#add_visa',function(e){
        e.preventDefault(); 
        console.log('add visa');
        html='<tr id="visa_row_'+visa_row+'">';
        html+='<td><input type="text" placeholder="Your name" name="visa_appication['+visa_row+'][applicant_name]" /></td>';
        html+='<td>';
        html+='<select id="visa_option_'+visa_row+'" data-key="'+visa_row+'" name=visa_appication['+visa_row+'][visa_option]" class="visa_option">';
        html+='<option disabled selected>SELECT</option>';
            <?php foreach($visaproduct as $visa){ ?>
                html+='<option value="<?php echo $visa['product_id']; ?>" data-price="<?php echo $visa['price']; ?>"><?php echo $visa['name']; ?></option>';
            <?php } ?>
        html+='</select></td>';
        html+='<td class="hotel-room-price">';
        html+='<div class="hotel-main-rate">';
        html+='<h2><span class="main-rate" id="visa_rate_'+visa_row+'">AED 0</span>';
        html+='<input type="hidden" name="visa_appication['+visa_row+'][visa_price]" id="visa_price_'+visa_row+'" class="visa_price"></h2>';
        html+='</div></td>';
        html+='<td>';
        html+='<div class="attach-copy">';
        html+='<input type="file" id="passport_'+visa_row+'" />';
        html+='<input type="text" placeholder="" id="passport_attach_'+visa_row+'" />';
        html+='<span class="attachment-attach" id="attachment-attach_'+visa_row+'"><i class="fa fa-paperclip" aria-hidden="true"></i></span>';
        html+='<span class="attachment-view lightgallery" id="attachment-view_'+visa_row+'">';
        html+='<a id="view-attached" href="">';
        html+='<i class="fa fa-eye" aria-hidden="true"></i>';
        html+='</a>';
        html+='<div class="attached-img-show">';
        html+='<button type="button" class="close" aria-label="Close">';
        html+='<span aria-hidden="true">×</span>';
        html+='</button>';
        html+='<img id="img-attached_'+visa_row+'" src="" />';
        html+='</div>';
        html+='</span>';
        html+='</div>';
        html+='</td>';
        html+='</tr>';

        $('#visa_table tbody').append(html);

        function readURLAjax(input) {
            console.log('read image url');
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#img-attached_'+visa_row).attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }

            console.log(reader);
        }

        $(".attach-copy #passport_"+visa_row).change(function(){
            console.log('change file type');
            readURLAjax(this);
            var files = $(this).prop('files');
            var flist = "";

            for(var i=0; i < files.length; i++)
            {
                if(flist!="")
                    flist+=", ";
                flist+=files[i]['name'];
            }
            $(this).next().val( flist );
            $(this).next().next().fadeOut();
            $(this).next().next().next().fadeIn();
        

        });

        $('#attachment-view_'+visa_row).on('click', function (e) {
            e.preventDefault();
            $('.attached-img-show').addClass('active');
            $('.top-header-wrap ').fadeOut();

        });
        $('.attached-img-show').click(function (ev) {
            ev.stopPropagation();
            $(this).removeClass('active');
            $('.top-header-wrap ').fadeIn();
            console.log('clicked');
        });
        $('.attached-img-show img').click(function (e) {
            e.stopPropagation();
        });
        
        visa_row++;
    });
</script>
<?php } ?>
