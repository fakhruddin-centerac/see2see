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


<section class="panel-section active no-pad-bottom">

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
                            <label class="field-name">Nationality</label>
                        </div>
                        <div class="hotel-form-section">                            
                            <select name="filter_sku" id="filter_sku" required>                          
                                <!-- <input type="text" placeholder="Emirate" name="filter_sku" id="emirate"  value="<?php echo $filter_sku; ?>"> -->
                                <option  value="" selected>Emirate</option>
                                <option value="Abu Dhabi" <?php if($filter_sku=="Abu Dhabi"){ echo 'selected'; }?> >Abu Dhabi</option>
                                <option value="Ajman" <?php if($filter_sku=="Ajman"){ echo 'selected'; } ?> >Ajman</option>
                                <option value="Dubai" <?php if($filter_sku=="Dubai"){ echo 'selected'; } ?> >Dubai</option>
                                <option value="Fujairah" <?php if($filter_sku=="Fujairah"){ echo 'selected'; } ?> >Fujairah</option>
                                <option value="Ras al-Khaimah" <?php if($filter_sku=="Ras al-Khaimah"){ echo 'selected'; } ?> >Ras al-Khaimah</option>
                                <option value="Sharjah" <?php if($filter_sku=="Sharjah"){ echo 'selected'; } ?> >Sharjah</option>
                                <option value="Umm al-Quwain" <?php if($filter_sku=="Umm al-Quwain"){ echo 'selected'; } ?>>Umm al-Quwain</option>
                            </select>
                            <label class="field-name">Emirate</label>
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
                                <div class="col-xs-6">
                                    <select name="filter_rooms" id="filter_rooms">
                                        <?php for($i=1;$i<=30;$i++){ 
                                            if($i==1){
                                                $roomString = 'room';
                                            }else{
                                                $roomString = 'rooms';
                                            }
                                          ?>
                                        <option value="<?php echo $i; ?>" <?php if($i==$filter_rooms){ echo 'selected'; } ?> ><?php echo $i; ?> <?php echo $roomString; ?></option>
                                    <?php } ?>
                                    </select>
                                    <label class="field-name">Rooms</label>
                                </div>
                                <div class="col-xs-6">
                                    <select name="filter_adult" id="filter_adult">
                                        <?php for($i=1;$i<=30;$i++){ 
                                        if($i==1){
                                            $adultString = 'Adult';
                                        }else{
                                            $adultString = 'Adults';
                                        }
                                        ?>
                                        <option value="<?php echo $i; ?>" <?php if($i==$filter_adult){ echo 'selected'; } ?> ><?php echo $i; ?> <?php echo $adultString; ?></option>
                                        <?php } ?>
                                    </select>
                                    <label class="field-name">Adult</label>
                                </div>
                            </div>
                        </div>
                        <div class="hotel-form-section">
                            <div class="row">
                                <div class="col-xs-6">
                                    <select name="filter_child" id="filter_child">
                                        <option value="0" selected>No Children</option>
                                        <?php for($i=1;$i<=10;$i++){ ?>
                                        <option value="<?php echo $i; ?>" <?php if($i==$filter_child){ echo 'selected'; } ?>><?php echo $i; ?></option>
                                        <?php } ?>
                                    </select>
                                    <label class="field-name">No Children</label>
                                </div>
                                <div class="col-xs-6 child-age <?php if($filter_child==0){ echo 'hide'; } ?>">
                                    <select name="filter_child_age" id="filter_child_age">
                                        <option value="" selected>Age of Children</option>
                                        <?php for($i=1;$i<=17;$i++){
                                        if($i==1){
                                            $childageString = 'Years old';
                                        }else{
                                            $childageString = 'Years old';
                                        }
                                        ?>
                                        <option value="<?php echo $i; ?>" <?php if($i==$filter_child_age){ echo 'selected'; } ?> ><?php echo $i; ?> <?php echo $childageString; ?></option>
                                        <?php } ?>
                                    </select>
                                    <label class="field-name">Age of Children</label>
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

                    <form name="filter_form" action="<?php echo 'index.php?route=product/hotels'; ?>" method="post">
                        <div class="filter-box-section">
                            <select name="hotel_sort" id="hotel_sort">
                               <option value="sort=p.sort_order&order=ASC">Sort By</option>
                               <option value="sort=pd.name&order=ASC" <?php if($hotel_sort == "sort=pd.name&order=ASC"){ echo 'selected'; } ?> >Name (A - Z)</option>
                               <option value="sort=pd.name&order=DESC" <?php if($hotel_sort == "sort=pd.name&order=DESC"){ echo 'selected'; } ?> >Name (Z - A)</option>
                               <option value="sort=p.price&order=ASC" <?php if($hotel_sort == "sort=p.price&order=ASC"){ echo 'selected'; } ?> >Price (Low &gt; High)</option>
                               <option value="sort=p.price&order=DESC" <?php if($hotel_sort == "sort=p.price&order=DESC"){ echo 'selected'; } ?> >Price (High &gt; Low)</option>
                               <!-- <option value="sort=quantity&order=DESC" <?php if($hotel_sort == "sort=quantity&order=DESC"){ echo 'selected'; } ?> >Rating (Highest)</option>
                               <option value="sort=quantity&order=ASC" <?php if($hotel_sort == "sort=quantity&order=ASC"){ echo 'selected'; } ?> >Rating (Lowest)</option> -->
                            </select>
                        </div>
                        <!-- <div class="filter-box-section">
                           <select name="filter_landmarks" id="filter_landmarks">
                                <option value="">Landmarks</option>
                            </select>
                        </div> -->
                        <div class="filter-box-section">
                            <select>
                                <option value="" >Location</option>
                                <?php foreach($locations as $location){?>
                                <option value="<?php echo $location; ?>" <?php if($location==$filter_sku){ echo 'selected'; } ?>><?php echo $location; ?></option>
                                <?php }?>
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
                       <!--  <div class="hotel-share-main">
                            <div class="hotel-heart"><i class="fa fa-heart-o" aria-hidden="true"></i></div>
                            <div class="hotel-share"><img class="share-icon"
                                                          src="catalog/view/theme/theme_c2c/images/share-icon.svg"/>
                            </div>
                        </div> -->
                        <div class="hotel-main-rate">
                            <p>Per Night</p>

                            <h2><span class="main-rate"><?php echo $price; ?></span></h2>
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
            <!-- validation error message-->
            <div class="">
                <p class="roomsel-error hide" id="roomsel-error">Please select your no of rooms and meal plan</p>
            </div>
            <div class="">
                <p class="roomsel-error hide" id="roomcount-error">The number of rooms selected is greater than the number of rooms required.</p>
            </div>
            <!-- end validation message-->
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

                    <input type="hidden" name="room_options_sel[<?php echo $key; ?>][product_id]" value="<?php echo $_GET['hotel_id']; ?>">
                    <input type="hidden" name="room_options_sel[<?php echo $key; ?>][room_option_id]" value="<?php echo $options['product_room_option_id']; ?>">
                    <input type="hidden" name="room_options_sel[<?php echo $key; ?>][room_type]" value="<?php echo $options['room_category']; ?>">
                    <input type="hidden" name="room_options_sel[<?php echo $key; ?>][no_of_days]" value="<?php echo $no_of_days; ?>">
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
                            <?php $mealoptions = explode(',',$options['meal_options']); ?>
                            <select id="meals_option_<?php echo $key; ?>" name="room_options_sel[<?php echo $key; ?>][meals_option]" data-key="<?php echo $key; ?>" class="meals_option">
                                <option value="">Select Meal Plan</option>
                                <?php if(in_array("NA", $mealoptions)){ ?>
                                <option value="NA">Room Only</option>
                                <?php } ?>
                                <?php if(in_array("BB", $mealoptions)){ ?>
                                <option value="BB">Bed & Breakfast</option>
                                <?php } ?>
                                <?php if(in_array("HB", $mealoptions)){ ?>
                                <option value="HB">Half Board</option>
                                <?php } ?>
                                <?php if(in_array("FB", $mealoptions)){ ?>
                                <option value="FB">Full Board</option>
                                <?php } ?>
                            </select>
                            <?php                           
                            if($filter_id==99){ ?>
                            <div class="option_no_<?php echo $key; ?>">
                                <p><span>Adults : </span> <?php echo $currencysymbol; ?> <span id="meal_adult_no_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span> <?php echo $currencysymbol; ?> <span id="meal_child_no_<?php echo $key; ?>">0</span></p>
                            </div>
                            <div class="option_NA_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <?php echo $currencysymbol; ?> <span id="meal_adult_NA_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span> <?php echo $currencysymbol; ?> <span id="meal_child_NA_<?php echo $key; ?>">0</span></p>
                            </div>
                            <div class="option_BB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <span id="meal_adult_BB_<?php echo $key; ?>"><?php echo $options['ind_adult_BB_price']; ?></span></p>
                                <p><span>Children : </span> <span id="meal_child_BB_<?php echo $key; ?>"><?php echo $options['ind_child_BB_price']; ?></span></p>
                            </div>
                            <div class="option_HB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <span id="meal_adult_HB_<?php echo $key; ?>"><?php echo $options['ind_adult_HB_price']; ?></span></p>
                                <p><span>Children : </span> <span id="meal_child_HB_<?php echo $key; ?>"><?php echo $options['ind_child_HB_price']; ?></span></p>
                            </div>
                            <div class="option_FB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <span id="meal_adult_FB_<?php echo $key; ?>"><?php echo $options['ind_adult_FB_price']; ?></span></p>
                                <p><span>Children : </span> <span id="meal_child_FB_<?php echo $key; ?>"><?php echo $options['ind_child_FB_price']; ?></span></p>
                            </div>
                            <?php  }else{ ?>
                            <div class="option_no_<?php echo $key; ?>">
                                <p><span>Adults : </span> <?php echo $currencysymbol; ?> <span id="meal_adult_no_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span> <?php echo $currencysymbol; ?> <span id="meal_child_no_<?php echo $key; ?>">0</span></p>
                            </div>
                            <div class="option_NA_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <?php echo $currencysymbol; ?> <span id="meal_adult_NA_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span> <?php echo $currencysymbol; ?> <span id="meal_child_NA_<?php echo $key; ?>">0</span></p>
                            </div>
                            <div class="option_BB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <span id="meal_adult_BB_<?php echo $key; ?>"><?php echo $options['all_adult_BB_price']; ?></span></p>
                                <p><span>Children : </span> <span id="meal_child_BB_<?php echo $key; ?>"><?php echo $options['all_child_BB_price']; ?></span></p>
                            </div>
                            <div class="option_HB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <span id="meal_adult_HB_<?php echo $key; ?>"><?php echo $options['all_adult_HB_price']; ?></span></p>
                                <p><span>Children : </span> <span id="meal_child_HB_<?php echo $key; ?>"><?php echo $options['all_child_HB_price']; ?></span></p>
                            </div>
                            <div class="option_FB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <span id="meal_adult_FB_<?php echo $key; ?>"><?php echo $options['all_adult_FB_price']; ?></span></p>
                                <p><span>Children : </span> <span id="meal_child_FB_<?php echo $key; ?>"><?php echo $options['all_child_FB_price']; ?></span></p>
                            </div> 
                            <?php }  ?>
                        </td>
                        <td class="hotel-offers">
                            <p><?php                           
                                if($filter_id==99){ 
                                    $now = new DateTime();
                                    $startdate = new DateTime($options['book_period_start']);
                                    $enddate = new DateTime($options['book_period_end']);
                                    if($startdate <= $now && $now <= $enddate) {
                                        echo $options['ind_discount_percentage']." % discount"; ?>
                                        <input type="hidden" name="room_options_sel[<?php echo $key; ?>][discount]" id="discount_<?php echo $key; ?>" value="<?php echo $options['ind_discount_percentage']; ?>">
                                    
                                    <?php }else{
                                        echo "No Offers"; 
                                    ?>
                                        <input type="hidden" name="room_options_sel[<?php echo $key; ?>][discount]" id="discount_<?php echo $key; ?>" value="0">
                                    <?php }
                                }else{ 
                                    $now = new DateTime();
                                    $startdate = new DateTime($options['book_period_start']);
                                    $enddate = new DateTime($options['book_period_end']);
                                    if($startdate <= $now && $now <= $enddate) {
                                        echo $options['all_discount_percentage']." % discount"; ?>
                                        <input type="hidden" name="room_options_sel[<?php echo $key; ?>][discount]" id="discount_<?php echo $key; ?>" value="<?php echo $options['all_discount_percentage']; ?>">
                                    
                                    <?php }else{
                                        echo "No Offers"; 
                                    ?>
                                        <input type="hidden" name="room_options_sel[<?php echo $key; ?>][discount]" id="discount_<?php echo $key; ?>" value="0">
                                    <?php }   ?>


                                <?php }?>
                            </p>
                        </td>
                        <td class="hotel-room-price">
                            <div class="hotel-main-rate">
                                <p>Per Night</p>

                                <h2> 
                                <?php                                
                                if($filter_id==99){ ?>                                   
                                    <span class="main-rate" id="main_rate_<?php echo $key; ?>"><?php echo $options['ind_market_price']; ?></span></h2>
                                     <input type="hidden" name="room_options_sel[<?php echo $key; ?>][market_price]" id="room_options_<?php echo $key; ?>_market_price" value="<?php echo preg_replace( '/[^.\d]/', '', $options['ind_market_price']); ?>">
                                <?php }else{ ?>
                                    <span class="main-rate" id="main_rate_<?php echo $key; ?>"><?php echo $options['all_market_price']; ?></span></h2>
                                    <input type="hidden" name="room_options_sel[<?php echo $key; ?>][market_price]" id="room_options_<?php echo $key; ?>_market_price" value="<?php echo preg_replace( '/[^.\d]/', '', $options['all_market_price']); ?>">
                                <?php } ?>
                            </div>
                        </td>
                        <td class="hotel-num-room">
                            <select name="room_options_sel[<?php echo $key; ?>][room_selected]" id="rooms_count_<?php echo $key; ?>" data-key="<?php echo $key; ?>" class="rooms_select">
                                <option  value="0" selected>Select</option>
                                <?php for($i=1;$i<=$filter_rooms;$i++){?>
                                <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                                <?php } ?>
                               
                            </select>
                        </td>
                    </tr>

                <?php } ?>

                </tbody>
            </table>
        </div>       
    </div>
    <div class="next-button-table" id="room_table_summary">
        <div class="container clearfix">
            <table>
                <tbody>
                <tr>
                    <td class="details-bottom">
                        <ul>
                            <li>Rooms : <span><?php echo $filter_rooms; ?></span></li> 
                            <li>No of Days : <span id="no_of_days"><?php echo $no_of_days; ?></span></li>
                            <li>Adult : <span><?php echo $filter_adult; ?></span></li>
                            <li>Children : <span><?php echo $filter_child; ?></span></li>                            
                        </ul>
                        <p>Room Total :  <?php echo $currencysymbol; ?> <span id="room_total_price">0</span> / Meal Plan :  <?php echo $currencysymbol; ?> <span id="meal_total_price">0</span></p>
                    </td>
                    <td class="details-bottom-button">
                        <a href="javascript:void(0);" class="next" id="hotel_next"> <?php if($visa_option==1){ echo 'Proceed to Visa';}else{ echo 'proceed to summary'; } ?> </a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

<?php if($visa_option==1){ ?>
<section class="panel-section hotel-visa-section no-pad-bottom">
    <div class="container">
        <div class="hotel-single-table">
            <div class="msgpart"></div>
            <!-- validation error message-->
            <div class="">
                <p class="visa-error hide" id="visa-error">Please fill the informations to proceed next</p>
            </div>
            <!-- end validation message-->
            <table class="table table-bordered" id="visa_table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Visa Type</th>
                    <th>Price</th>
                    <th>Attach Passport</th>     
                    <th>Action</th>               
                </tr>

                </thead>
                <tbody>
                <?php $visa_row = 0; ?>
                 

                <?php 
                if($total_people >0 ){
                
                    for($i=1;$i<=$total_people;$i++){
                    $visa_row = $i;
                    ?>
                    <tr id="<?php echo $visa_row;?>">                                        
                        <td>
                            <input type="text" placeholder="Your name" name="visa_appication[<?php echo $visa_row?>][applicant_name]" id="visa_applicant_<?php echo $visa_row?>" class="mandatory"/>
                        </td>
                        <td>
                            <select id="visa_option_<?php echo $visa_row; ?>" data-key="<?php echo $visa_row; ?>" name="visa_appication[<?php echo $visa_row?>][visa_option]" class="visa_option mandatory">
                                <option disabled selected>Select visa type</option>
                                <?php foreach($visaproduct as $visa){ ?>
                                <option value="<?php echo $visa['name']; ?>" data-price="<?php echo preg_replace( '/[^.\d]/', '', $visa['price']);  ?>" data-visaid="<?php echo $visa['product_id'];?>"><?php echo $visa['name']; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="hotel-room-price">
                            <div class="hotel-main-rate">
                                <h2><span class="main-rate" id="visa_rate_<?php echo $visa_row; ?>"><?php echo $currencysymbol; ?> 0</span></h2>
                                <input type="hidden" name="visa_appication[<?php echo $visa_row?>][visa_price]" id="visa_price_<?php echo $visa_row; ?>" class="visa_price">
                            </div>
                        </td>
                        <td>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][travellerspassportfront]" class="passportfront mandatory"/>
                                <input type="text"  placeholder="Attach your passport front"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                                <span class="view-attachement">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                     <div class="attachment-view">
                                         <i class="fa fa-times attach-close" aria-hidden="true"></i>
                                         <img id="visa_appication[<?php echo $visa_row; ?>][travellerspassportfront]" src="#" alt="your image" />
                                     </div>
                                </span>
                            </div>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][travellerspassportback]" class="mandatory"/>
                                <input type="text" placeholder="Attach your passport back"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                                <span class="view-attachement">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                     <div class="attachment-view">
                                         <i class="fa fa-times attach-close" aria-hidden="true"></i>
                                         <img id="visa_appication[<?php echo $visa_row; ?>][travellerspassportback]" src="#" alt="your image" />
                                     </div>
                                </span>
                            </div>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][passportphoto]" class="mandatory"/>
                                <input type="text" placeholder="Attach your Picture"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                                <span class="view-attachement">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                     <div class="attachment-view">
                                         <i class="fa fa-times attach-close" aria-hidden="true"></i>
                                         <img id="visa_appication[<?php echo $visa_row; ?>][passportphoto]" src="#" alt="your image" />
                                     </div>
                                </span>
                            </div>
                        </td>
                       <td class="vertical-middle">
                           <!-- <div class="inline-block view-image" data-key="'+visa_row+'"><i class="fa fa-eye" aria-hidden="true"></i></div> -->
                        <div class="inline-block"><i class="fa fa-trash row-delete" aria-hidden="true"></i></div>
                        </td> 
                        
                    </tr> 
                     <?php } 

                }else{?>
                    <tr id="<?php echo $visa_row;?>">                    
                        <td>
                            <input type="text" placeholder="Your name" name="visa_appication[<?php echo $visa_row?>][applicant_name]" id="visa_applicant_<?php echo $visa_row?>" class="mandatory"/>
                        </td>
                        <td>
                            <select id="visa_option_<?php echo $visa_row; ?>" data-key="<?php echo $visa_row; ?>" name="visa_appication[<?php echo $visa_row?>][visa_option]" class="visa_option mandatory">
                                <option disabled selected>Select visa type</option>
                                <?php foreach($visaproduct as $visa){ ?>
                                <option value="<?php echo $visa['product_id']; ?>" data-price="<?php echo preg_replace( '/[^.\d]/', '', $visa['price']);  ?>"><?php echo $visa['name']; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="hotel-room-price">
                            <div class="hotel-main-rate">
                                <h2><span class="main-rate" id="visa_rate_<?php echo $visa_row; ?>"><?php echo $currencysymbol; ?> 0</span></h2>
                                <input type="hidden" name="visa_appication[<?php echo $visa_row?>][visa_price]" id="visa_price_<?php echo $visa_row; ?>" class="visa_price">
                            </div>
                        </td>
                        <td>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][travellerspassportfront]" class="passportfront mandatory"/>
                                <input type="text" name="passport_front_<?php echo $visa_row; ?>" placeholder="Attach your passport front"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                                <span class="view-attachement">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                     <div class="attachment-view">
                                         <i class="fa fa-times attach-close" aria-hidden="true"></i>
                                         <img id="visa_appication[<?php echo $visa_row; ?>][travellerspassportfront]" src="#" alt="your image" />
                                     </div>
                                </span>
                            </div>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][travellerspassportback]" class="mandatory"/>
                                <input type="text" name="passort_back_<?php echo $visa_row; ?>" placeholder="Attach your passport back"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                                <span class="view-attachement">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                     <div class="attachment-view">
                                         <i class="fa fa-times attach-close" aria-hidden="true"></i>
                                         <img id="visa_appication[<?php echo $visa_row; ?>][travellerspassportback]" src="#" alt="your image" />
                                     </div>
                                </span>
                            </div>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][passportphoto]" class="mandatory"/>
                                <input type="text" name="passort_photo_<?php echo $visa_row; ?>" placeholder="Attach your Picture"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                                <span class="view-attachement">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                     <div class="attachment-view">
                                         <i class="fa fa-times attach-close" aria-hidden="true"></i>
                                         <img id="visa_appication[<?php echo $visa_row; ?>][passportphoto]" src="#" alt="your image" />
                                     </div>
                                </span>
                            </div>
                        </td>
                       
                        <td class="vertical-middle">
                           <!-- <div class="inline-block view-image" data-key="'+visa_row+'"><i class="fa fa-eye" aria-hidden="true"></i></div> -->
                        <div class="inline-block"><i class="fa fa-trash row-delete" aria-hidden="true"></i></div>
                        </td>                  
                    </tr>
                <?php } ?>
                </tbody>
                <tfoot>
                <tr>
               
                    <td colspan="5">
                        <button id="add_visa">ADD +</button>
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>       
    </div>
    <div class="next-button-table" id="visa_table_summary">
        <div class="container clearfix">
            <table>
                <tbody>
                <tr>
                    <td class="details-bottom">
                        <ul>
                            <ul>
                            <!-- <li>Rooms : <span><?php ?></span></li> -->
                            <li>Adult : <span><?php echo $filter_adult; ?></span></li>
                            <li>Children : <span><?php echo $filter_child; ?></span></li>
                        </ul>
                        </ul>
                        <p>Visa Total : <?php echo $currencysymbol; ?> <span id="visa_total_price">0</span></p>
                    </td>
                    <td class="details-bottom-button">
                        <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                        <a href="javascript:void(0);" class="next" <?php if($visa_option==1){ ?>
                        id="visa_next" <?php } ?> >proceed to summary</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<?php } ?>


<section class="panel-section hotel-summary no-pad-bottom">
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
    </div>
    <div class="next-button-table">
        <div class="container clearfix">
            <table>
                <tbody>
                <tr>
                    <td class="details-bottom">
                        <ul>
                            <li>Rooms : <span><?php echo $filter_rooms; ?></span></li>
                            <li>No of Days : <span><?php echo $no_of_days; ?></span></li> 
                            <li>Adult : <span><?php echo $filter_adult; ?></span></li>
                            <li>Children : <span><?php echo $filter_child; ?></span></li>
                        </ul>
                        <p>Total : <?php echo $currencysymbol; ?> <span id="total_booking_price">0</span></p>
                    </td>
                    <td class="details-bottom-button">
                        <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                        <a href="javascript:void(0)" id="buttonstorehotel">ADD TO CART</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</section>
<div id="product">
<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
<input type="hidden" name="custom_price" id="custom_price" value="" />
<input type="hidden" name="room_options" id="room_options" value="" />
<input type="hidden" name="discounts" id="discounts" value="" />
<input type="hidden" name="meals_options" id="meals_options" value="" />
<input type="hidden" name="visa_options" id="visa_options" value="" />
<input type="hidden" name="nationality"  id="nationality" value="<?php echo $filter_id; ?>" />
<input type="hidden" name="no_of_days"  id="no_of_day" value="<?php echo $no_of_days; ?>" />
<input type="hidden" name="adult_num"  id="adult_num" value="<?php echo $filter_adult; ?>" />
<input type="hidden" name="child_num"  id="child_num" value="<?php echo $filter_child; ?>" />
<input type="hidden" name="product_type"  id="product_type" value="HB" />

<!-- hideen data  -->
<input type="hidden" value="1" name="childhidprice" class="childhidprice"/>
<input type="hidden" value="1" name="parenthidprice" class="parenthidprice"/>
<input type="hidden" value="<?php echo date("d-m-Y"); ?>" name="tourdate" class="tourdatevisa"/>
<input type="hidden" value="" name="pickuplocation" class="pickuplocationvisa"/>
</div>
</form>

<?php echo $footer; ?>


<script type="text/javascript">
    /**home page hotel section the form calender**/
    var date = new Date();
    date.setDate(date.getDate()-1);
    /*$('.hotelChekin, .hotelChekout').datepicker({ 
      dateFormat: 'dd-mm-yy',      
      minDate:new Date()
    });*/
    /**end of home page hotel section the form calender**/
    $('.hotelChekin').datepicker({
        dateFormat: 'mm-dd-yy',      
        minDate:new Date("<?php echo date('m-d-Y',strtotime($filter_checkin)); ?>"),
        onSelect:function(selectedDate){
            var sel_checkin = selectedDate.split('-');
            var checkin_date  = sel_checkin["1"]+'-'+sel_checkin["0"]+'-'+sel_checkin["2"];
            $('input[name="filter_checkin"]').val(checkin_date);           
            
            var today = new Date(selectedDate);
            var tomorrow = new Date(today);
            tomorrow.setDate(today.getDate()+1);
            $('.hotelChekout').datepicker('destroy');
            $('.hotelChekout').datepicker({
              dateFormat: 'mm-dd-yy',      
              minDate: tomorrow,
              onSelect:function(checkoutDate){
                console.log(checkoutDate);
                var sel_checkout = checkoutDate.split('-');
                var checkout_date  = sel_checkout["1"]+'-'+sel_checkout["0"]+'-'+sel_checkout["2"];    
                $('input[name="filter_checkout"]').val(checkout_date); 
              }
            });   
            return false;
        }
      });
    /*$('.hotelChekin').change(function () {
        console.log($('.hotelChekin').val());
        $('.hotelChekout').datepicker('destroy');
        $('.hotelChekout').datepicker({
          dateFormat: 'dd-mm-yy',      
          minDate:$('.hotelChekin').val()
        });
    });*/
    $('.hotelChekout').datepicker({
        dateFormat: 'dd-mm-yy',      
        minDate:new Date("<?php echo date('m-d-Y',strtotime($filter_checkout)); ?>")
      });
   /* $('.hotelChekin').datepicker({
        dateFormat: 'dd-mm-yy',      
        minDate:new Date()
      }).on('changeDate', function (ev) {
        $('.hotelChekin').change();
    });*/
    /**end of page hotel section the form calender**/

    /**home page hotel section the form selectbox**/
    $('.hotel-form-section select').select2({
        //minimumResultsForSearch: -1
    });
    /**home page hotel section the form selectbox**/


    /**home page hotel section the star rating**/
    $(function () {
        $('.hotel-rating-star').barrating({
            theme: 'bootstrap-stars',
        });
    });
    /**home page hotel section the star rating**/
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#traveller_passport').attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(".passportfront").change(function(){
        readURL(this);
    });
</script>

<script>
    function tabLoader(){
        console.log('tab loader');
        $('.main-loader').show();
        setTimeout(function(){
            $('.main-loader').fadeOut();
        },500);
    }
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
                    //data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueid,.pickuplocationvisa,.tourdatevisa'),
                    dataType: 'json',
                    data: new FormData($('#room_type_form')[0]),                    
                    processData: false,
                    contentType: false,
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
        
        $(document).on('click','.prev-button',function(e){
            e.preventDefault();
            tabLoader();
            var $last = $('li:last', 'ul');
            var $previous, $selected = $("li.active"),$tab_selected=$('section.active');
            $previous = $selected.prev('li').length ? $selected.prev('li') : $last;
            $tabprev = $tab_selected.prev('section').length ? $tab_selected.prev('section') : $last;
            $selected.removeClass("active");
            $previous.addClass('active');
            $tab_selected.removeClass("active");
            $tabprev.addClass('active');
        });    
        $(document).on('click','.next',function(e){
            e.preventDefault();
            roomvalidate =1; 
            roomnumvalidate =1; 
            isvalidate =0;
            var totalAmount = 0;
            tabLoader();
            var next_id = $(this).attr('id');
            var roomoptions   = '';
            var mealsoptions   = '';
            var discounts   = '';
            var num_of_rooms = '<?php echo $filter_rooms; ?>';
            var sel_num_rooms = 0;
            if(next_id=='hotel_next'){
                $('#rooms_list .rooms_select').each(function(){                     
                    if($(this).val()!='0'){
                        sel_num_rooms = sel_num_rooms + parseInt($(this).val());
                        var room_key = $(this).attr('data-key');
                        if(roomoptions!=''){
                            roomoptions +=',';
                        }
                        roomoptions += room_key;
                        if(discounts!=''){
                            discounts +=',';
                        }
                        discounts += $('#discount_'+room_key).val(); 

                        if($('#meals_option_'+room_key).val()!=''){
                            roomvalidate =0;
                            if(mealsoptions!=''){
                                mealsoptions +=',';
                            }
                            mealsoptions += $('#meals_option_'+room_key).val();

                        }else{
                            roomvalidate =1;
                        }                                                
                    }
                    console.log('selected total:'+sel_num_rooms);
                    if(sel_num_rooms > num_of_rooms){
                        roomnumvalidate =1;
                    }else{
                        roomnumvalidate =0;
                    }

                });
                
                console.log(roomvalidate);
                if(roomvalidate==0 && roomnumvalidate==0){
                    $('#room_options').val(roomoptions);
                    $('#discounts').val(discounts);
                    $('#meals_options').val(mealsoptions);
                    $('#roomsel-error').addClass('hide');
                    $('#roomcount-error').addClass('hide');
                    var $first = $('li:first', 'ul');
                    var $next, $selected = $("li.active"),$tab_selected=$('section.active');
                    $next = $selected.next('li').length ? $selected.next('li') : $first;
                    $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
                    $selected.removeClass("active");
                    $next.addClass('active');
                    $tab_selected.removeClass("active");
                    $tabnext.addClass('active');
                }else{
                    if(roomvalidate==1){
                        $('#roomsel-error').removeClass('hide');
                    }else{
                        $('#roomcount-error').removeClass('hide');
                    }
                    
                    return false;
                }
            }
           
            if(next_id=='visa_next'){               
                $('#visa_table .mandatory').each(function(){   
                    if($(this).val()=='' || $(this).val()==null){
                        $('#visa-error').removeClass('hide');
                        if($(this).attr('type')=='file'){
                            
                            $(this).parent().addClass('haserror');
                        }else{
                           $(this).addClass('haserror'); 
                        }                        
                        isvalidate =1;
                    }else{
                        if($(this).attr('type')=='file'){
                            $(this).parent().removeClass('haserror');
                        }else{
                           $(this).removeClass('haserror'); 
                        }
                        
                    }
                });
                if(isvalidate==1){
                    return false;
                }else{
                    $('#visa-error').addClass('hide');
                    var $first = $('li:first', 'ul');
                    var $next, $selected = $("li.active"),$tab_selected=$('section.active');
                    $next = $selected.next('li').length ? $selected.next('li') : $first;
                    $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
                    $selected.removeClass("active");
                    $next.addClass('active');
                    $tab_selected.removeClass("active");
                    $tabnext.addClass('active');
                }           
            }

            //if(next_id=='visa_next'){

                var hotelsummary = '';
                var visasummary   = '';
                
                $( "#rooms_list tbody tr" ).each(function( index ) {                   
                    var row_id = $(this).attr('id');
                    var rooms_selected = $('#rooms_count_'+row_id).val();
                    if(rooms_selected != 0){                     

                        var room_type = $('#room_category_'+row_id).html();
                        var meals_option_sel = $('#meals_option_'+row_id).val();
                        if(meals_option_sel=='NA'){
                            var meal_option = 'No Meals Available';
                        }if(meals_option_sel=='BB'){
                            var meal_option = 'Bed & Breakfast';
                        }else if(meals_option_sel=='HB'){
                            var meal_option = 'Half Board';
                        }else if(meals_option_sel=='FB'){
                            var meal_option = 'Full Board';
                        }

                        var price_per_night = $('#room_options_'+row_id+'_market_price').val();
                        var discount_per = $('#discount_'+row_id).val();                        
                        var no_of_days = $('#no_of_days').html();
                        var room_total_amount  = (price_per_night * rooms_selected);
                        if(discount_per!=0){                            
                            var discount_amount = (discount_per / 100) * price_per_night;
                            room_total_amount = (room_total_amount - discount_amount);
                        }

                        hotelsummary += '<tr><td></td></tr>';
                        hotelsummary += '<tr><td style="font-weight:bold;">Room '+(index+1)+'</td></tr>';
                        hotelsummary += '<tr><td>Room Category</td><td>: '+room_type+'</td></tr>';
                        hotelsummary +='<tr><td>Meal Plan</td><td>: '+meal_option+'</td></tr>';
                        hotelsummary +='<tr><td>Price Per Night</td><td>: '+CURRENCY_SYMBOL+''+price_per_night+' </td></tr>';
                        hotelsummary +='<tr><td>Discount Percentage</td><td>: '+discount_per+' %</td></tr>';
                        hotelsummary +='<tr><td>No. Of Rooms</td><td>: '+rooms_selected+'</td></tr>';
                        hotelsummary +='<tr><td>Room '+(index+1)+' Total Price</td><td>: '+CURRENCY_SYMBOL+''+room_total_amount+' </td></tr>';     
                         
                   }
                });
                hotelsummary += '<tr><td></td></tr>';
                hotelsummary += '<tr><td></td></tr>';
                hotelsummary +='<tr><td style="font-weight:bold;">Room\'s Total Price</td><td style="font-weight:bold;">: '+CURRENCY_SYMBOL+''+$('#room_total_price').html()+'</td></tr>';
                hotelsummary +='<tr><td style="font-weight:bold;">Meal Option Total Price</td><td style="font-weight:bold;">: '+CURRENCY_SYMBOL+''+$('#meal_total_price').html()+'</td></tr>';
                $('#hotel_booking tbody').html(hotelsummary);
                
                var visaoptions = '';
                $( "#visa_table tbody tr" ).each(function( index ) {
                    var visa_row = $(this).attr('id');
                    console.log('visa row:'+visa_row);

                    var applicant_name  = $('#visa_applicant_'+visa_row).val();
                    var visa_option     = $('#visa_option_'+visa_row+' option:selected').text();
                    var visa_amount     = $('#visa_rate_'+visa_row).html();
                    console.log(visa_option);
                    console.log(visa_amount);
                    var visa_id = $('#visa_option_'+visa_row+' option:selected').attr('data-visaid');
                    if(visaoptions!=''){
                        visaoptions +=',';
                    }
                    visaoptions += visa_id;
                    visasummary += '<tr><td></td></tr>';
                    visasummary += '<tr><td style="font-weight:bold;">Applicant '+(index+1)+'</td></tr>';
                    visasummary +='<tr><td>Name</td><td>: '+applicant_name+'</td></tr>';
                    visasummary +='<tr><td>Visa Type</td><td>: '+visa_option+'</td></tr>';
                    visasummary +='<tr><td>Price</td><td>: '+visa_amount+'</td></tr>';
                    
                });
                $('#visa_options').val(visaoptions);
                $('#visa_summary tbody').html(visasummary);
                var room_total_price = parseFloat($('#room_total_price').html()) + parseFloat($('#meal_total_price').html());
                console.log('room total price:'+room_total_price);
                var meal_total_price = $('#meal_total_price').html();
                var total_visa_price = $('#visa_total_price').html();
                console.log(total_visa_price);
                if(total_visa_price !=undefined){
                    var total_booking_amount = parseFloat(room_total_price) + parseFloat(total_visa_price);
                }
                else{
                    var total_booking_amount = parseFloat(room_total_price);
                }
                
                $('#total_booking_price').html(total_booking_amount);
                $('#custom_price').val(total_booking_amount);

            //}
        });
        
        $(document).on('change','.meals_option',function(){           
            var selected = $(this).find(":selected").val();
            var item_id  = $(this).attr("id");
            var key      = $(this).attr("data-key"); 
            if(selected=='NA'){
                $('.option_no_'+key).addClass('hide');
                $('.option_NA_'+key).removeClass('hide');
                $('.option_BB_'+key).addClass('hide');
                $('.option_HB_'+key).addClass('hide');
                $('.option_FB_'+key).addClass('hide');
            }else if(selected=='BB'){
                $('.option_no_'+key).addClass('hide');
                $('.option_NA_'+key).addClass('hide');
                $('.option_BB_'+key).removeClass('hide');
                $('.option_HB_'+key).addClass('hide');
                $('.option_FB_'+key).addClass('hide');
            }else if(selected=='HB'){
                $('.option_no_'+key).addClass('hide');
                $('.option_HB_'+key).removeClass('hide');
                $('.option_NA_'+key).addClass('hide');
                $('.option_BB_'+key).addClass('hide');
                $('.option_FB_'+key).addClass('hide');
            }else if(selected=='FB'){
                $('.option_no_'+key).addClass('hide');
                $('.option_FB_'+key).removeClass('hide');
                $('.option_NA_'+key).addClass('hide');
                $('.option_BB_'+key).addClass('hide');
                $('.option_HB_'+key).addClass('hide');
            }else{
                $('.option_no_'+key).removeClass('hide');
                $('.option_NA_'+key).addClass('hide');
                $('.option_FB_'+key).addClass('hide');
                $('.option_BB_'+key).addClass('hide');
                $('.option_HB_'+key).addClass('hide');
            }
        });
        /* total price for room calculation*/
        
        $(document).on('change','.rooms_select',function(){ 
            var total_amount = 0;
            var meals_total_amount  = 0;
            $( ".rooms_select" ).each(function( index ) {
                var room_count  = $(this).find(":selected").val();
                if(room_count!='0'){
                    var key = $(this).attr('data-key');
                    var per_night = $('#room_options_'+key+'_market_price').val();
                    var no_of_days = $('#no_of_days').html();
                    console.log(per_night);
                    var room_total_amount  = (per_night * room_count);
                    if($('#discount_'+key).val()!=0){
                        var discount_percentage = $('#discount_'+key).val();
                        var discount_amount = (discount_percentage / 100) * per_night;
                        room_total_amount = (room_total_amount - discount_amount);
                    }
                    total_amount = parseFloat(total_amount) + parseFloat(room_total_amount);
                    
                }               

            });
            //calculate meals option pricing
            var adult_count = '<?php echo $filter_adult; ?>';
            var child_count = '<?php echo $filter_child; ?>';
            var no_of_days = $('#no_of_days').html();
            $( ".meals_option" ).each(function( index ) {
                var meals_option  = $(this).find(":selected").val();
                var key = $(this).attr('data-key');
                var room_count = $('#rooms_count_'+key).find(":selected").val();
                if(meals_option!='' && room_count !=0){
                    var key = $(this).attr('data-key');
                    var meal_adult_price = $('#meal_adult_'+meals_option+'_'+key).html().replace(/[^\d\.]/g, '');
                    var meal_child_price = $('#meal_child_'+meals_option+'_'+key).html().replace(/[^\d\.]/g, '');                 
                    console.log('adult price:'+meal_adult_price);
                    console.log('child price:'+meal_child_price); 
                    var meal_total =  parseFloat(meal_adult_price * adult_count) + parseFloat(meal_child_price * child_count);                  
                    meals_total_amount = parseFloat(meals_total_amount) + parseFloat(meal_total);
                }                          
            });
            meals_total_amount = (meals_total_amount * no_of_days);
            total_amount = (total_amount * no_of_days);
            $('#room_total_price').html(total_amount.toFixed(2));
            $('#meal_total_price').html(meals_total_amount.toFixed(2));
            $('html, body').animate({ scrollTop: $('#room_table_summary').offset().top}, 2000);
        });
        //calculate meals option pricing
        $(document).on('change','.meals_option',function(){
            var meals_total_amount  = 0;
            var adult_count = '<?php echo $filter_adult; ?>';
            var child_count = '<?php echo $filter_child; ?>';
            var no_of_days = $('#no_of_days').html();
            $( ".meals_option" ).each(function( index ) {
                var meals_option  = $(this).find(":selected").val();
                var key = $(this).attr('data-key');
                var room_count = $('#rooms_count_'+key).find(":selected").val();
                
                if(meals_option!='' && room_count !=0){                    

                    var meal_adult_price = $('#meal_adult_'+meals_option+'_'+key).html().replace(/[^\d\.]/g, '');
                    var meal_child_price = $('#meal_child_'+meals_option+'_'+key).html().replace(/[^\d\.]/g, '');
                    console.log('adult price:'+meal_adult_price);
                    console.log('child price:'+meal_child_price); 
                    var meal_total =  parseFloat(meal_adult_price * adult_count) + parseFloat(meal_child_price * child_count);                  
                    meals_total_amount = parseFloat(meals_total_amount) + parseFloat(meal_total);
                } 
                          
            });
            meals_total_amount = (meals_total_amount * no_of_days);
            $('#meal_total_price').html(meals_total_amount.toFixed(2));
        });
        $(document).on('change','.visa_option',function(){             
            var visa_price  = $(this).find(":selected").attr('data-price');
            var key         = $(this).attr('data-key'); 
            console.log(visa_price);
            console.log(key);
            //var price_element = '<h2>'+visa_price+'</h2>';
            /*var new_price = visa_price.replace("", "");
            console.log(new_price);*/
            $('#visa_rate_'+key).html(CURRENCY_SYMBOL+""+visa_price);
            $('#visa_price_'+key).val(visa_price);
            var visa_total = 0;
            $( ".visa_price" ).each(function( index ) { 
                var visa_amount = $(this).val();                
                if(visa_amount !=''){
                    visa_total = parseFloat(visa_total) + parseFloat(visa_amount);
                }
                
            });
            $('#visa_total_price').html(visa_total);
        });

    });


</script>

<?php if($visa_option==1){ 
?>
<script type="text/javascript">
    var visa_row = '<?php echo $visa_row +1 ; ?>';
    $(document).on('click','#add_visa',function(e){
        e.preventDefault(); 
        console.log('add visa');
        html='<tr id="'+visa_row+'">';
        html+='<td><input type="text" placeholder="Your name" name="visa_appication['+visa_row+'][applicant_name]" id="visa_applicant_'+visa_row+'" /></td>';
        html+='<td>';
        html+='<select id="visa_option_'+visa_row+'" data-key="'+visa_row+'" name=visa_appication['+visa_row+'][visa_option]" class="visa_option">';
        html+='<option disabled selected>SELECT</option>';
        <?php foreach($visaproduct as $visaoptions){  ?>
            html+='<option value="<?php echo $visaoptions['product_id']; ?>" data-price="<?php echo preg_replace( '/[^.\d]/', '', $visaoptions['price']);  ?>" data-visaid="<?php echo $visaoptions['product_id'];?>"><?php echo $visaoptions['name']; ?></option>';
        <?php } ?>
        html+='</select></td>';
        html+='<td class="hotel-room-price">';
        html+='<div class="hotel-main-rate">';
        html+='<h2><span class="main-rate" id="visa_rate_'+visa_row+'">'+CURRENCY_SYMBOL+'0</span>';
        html+='<input type="hidden" name="visa_appication['+visa_row+'][visa_price]" id="visa_price_'+visa_row+'" class="visa_price"></h2>';
        html+='</div></td>';
        html+='<td>';
        html+='<div class="attach-copy">';
        html+='<input type="file" name="visa_appication['+visa_row+'][travellerspassportfront]"/>';
        html+='<input type="text" name="passport_front_'+visa_row+'" placeholder="Attach your passport front"/>';
        html+='<span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>';
        html+='<span class="view-attachement">';
        html+='<i class="fa fa-eye" aria-hidden="true"></i>';
        html+='<div class="attachment-view">';
        html+='<i class="fa fa-times attach-close" aria-hidden="true"></i>';
        html+='<img id="visa_appication['+visa_row+'][travellerspassportfront]" src="#" alt="your image" />';
        html+='</div>';
        html+='</span>';
        html+='</div>';
        html+='<div class="attach-copy">';
        html+='<input type="file" name="visa_appication['+visa_row+'][travellerspassportback]"/>';
        html+='<input type="text" name="passport_back_'+visa_row+'" placeholder="Attach your passport back"/>';
        html+='<span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>';
        html+='<span class="view-attachement">';
        html+='<i class="fa fa-eye" aria-hidden="true"></i>';
        html+='<div class="attachment-view">';
        html+='<i class="fa fa-times attach-close" aria-hidden="true"></i>';
        html+='<img id="visa_appication['+visa_row+'][travellerspassportback]" src="#" alt="your image" />';
        html+='</div>';
        html+='</span>';
        html+='</div>';
        html+='<div class="attach-copy">';
        html+='<input type="file" name="visa_appication['+visa_row+'][passportphoto]"/>';
        html+='<input type="text" name="passport_photo_'+visa_row+'" placeholder="Attach your Picture"/>';
        html+='<span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>';
        html+='<span class="view-attachement">';
        html+='<i class="fa fa-eye" aria-hidden="true"></i>';
        html+='<div class="attachment-view">';
        html+='<i class="fa fa-times attach-close" aria-hidden="true"></i>';
        html+='<img id="visa_appication['+visa_row+'][passportphoto]" src="#" alt="your image" />';
        html+='</div>';
        html+='</span>';
        html+='</div>';
        html+='</td>';
        html+='<td class="vertical-middle">';
        /*html+='<div class="inline-block view-image" data-key="'+visa_row+'"><i class="fa fa-eye" aria-hidden="true"></i></div>';*/
        html+='<div class="inline-block"><i class="fa fa-trash row-delete" aria-hidden="true"></i></div>';
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
