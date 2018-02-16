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
<section class="hotel-tab-head make-packg-head">
    <div class="container">
        <ul class="clearfix mainitems <?php if($visa_option==1){ echo 'div-seven'; }?>">
            <li class="active">HOTEL BOOKING</li>
            <?php if($visa_option==1){?>
            <li>VISA</li>
            <?php } ?>
            <li>TOURS & EXCURSIONS</li>
            <li>PARK</li>
            <li>AIRPORT TRANSFER</li>
            <li>FLIGHT TICKET</li>
            <li>SUMMARY</li>
        </ul>
    </div>
</section>

<form method="post" class="no-bot-margin" name="room_options" id="room_type_form" enctype="multipart/form-data">
<section class="panel-section active no-pad-bottom">
    <div class="container clearfix">
        <div class="hotel-inner-page-main pakage-hotel">
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

            <div class="hotel-single-table">
                <!-- validation error message-->
                <div class="">
                    <p class="roomsel-error hide" id="roomsel-error">Please select your no of rooms and meal option</p>
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
                <?php foreach($room_options as $key=>$options){                

                ?>                   

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
                            <?php                             
                            $mealoptions = explode(',',$options['meal_options']); 
                           

                            ?>
                            <select id="meals_option_<?php echo $key; ?>" name="room_options_sel[<?php echo $key; ?>][meals_option]" data-key="<?php echo $key; ?>" class="meals_option">
                                <option value="">SELECT</option>
                                <?php if(in_array("NA", $mealoptions)){ ?>
                                <option value="NA">No Meals Available</option>
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
                                <p><span>Adults : </span><?php echo $currencysymbol; ?><span id="meal_adult_no_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span><?php echo $currencysymbol; ?><span id="meal_child_no_<?php echo $key; ?>">0</span></p>
                            </div>
                             <div class="option_NA_<?php echo $key; ?> hide">
                                <p><span>Adults : </span><?php echo $currencysymbol; ?><span id="meal_adult_NA_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span><?php echo $currencysymbol; ?><span id="meal_child_NA_<?php echo $key; ?>">0</span></p>
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
                                <p><span>Adults : </span> <span id="meal_adult_no_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span> <span id="meal_child_no_<?php echo $key; ?>">0</span></p>
                            </div>
                             <div class="option_NA_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <span id="meal_adult_NA_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span> <span id="meal_child_NA_<?php echo $key; ?>">0</span></p>
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
                                <?php if($filter_id==99){ ?>
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
                                <option  value="0" selected>SELECT</option>
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
                            <p>Total : <?php echo $currencysymbol; ?> <span id="room_total_price">0</span> / Meal Plan : <?php echo $currencysymbol; ?> <span id="meal_total_price">0</span></p>
                        </td>
                        <td class="details-bottom-button">
                            <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                            <a href="javascript:void(0);" class="next" id="hotel_next"> <?php if($visa_option==1){ echo 'proceed to visa'; }else{ echo 'proceed to tours'; } ?></a>
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
            <div class="visa-note">
                <p>Note : If the country belongs to a banned nationality then the application will be rejected. Please familiarize yourself with the visa rules and regulations of the UAE prior to applying. CTC takes no responsibility of rejected applicant's as a result of the underlying regulations.</p>
            </div>
            <!-- validation error message-->
            <div class="">
                <p class="visa-error hide" id="visa-error">Please fill the information to proceed next</p>
            </div>
            <!-- end validation message-->
            <table class="table table-bordered" id="visa_table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Visa Type</th>
                    <th> Price</th>
                    <th> Attach Passport</th>
                    <th>Action</th>
                </tr>

                </thead>
                <tbody>
                <?php  $visa_row = 0; ?>
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
                                <?php foreach($visaoptions as $visa){ ?>
                                <option value="<?php echo $visa['option_name']; ?>" data-option-id="<?php echo $visa['option_id']; ?>" data-price="<?php echo $visa['option_value']; ?>"><?php echo $visa['option_name']; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="hotel-room-price">
                            <div class="hotel-main-rate">
                                <h2><span class="main-rate" id="visa_rate_<?php echo $visa_row; ?>"><?php echo $currencysymbol; ?>0</span></h2>
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
                                <?php foreach($visaoptions as $visa){ ?>
                                <option value="<?php echo $visa['option_name']; ?>" data-option-id="<?php echo $visa['option_id']; ?>" data-price="<?php echo $visa['option_value']; ?>"><?php echo $visa['option_name']; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="hotel-room-price">
                            <div class="hotel-main-rate">
                                <h2><?php echo $currencysymbol; ?> <span class="main-rate" id="visa_rate_<?php echo $visa_row; ?>">0</span></h2>
                                <input type="hidden" name="visa_appication[<?php echo $visa_row?>][visa_price]" id="visa_price_<?php echo $visa_row; ?>" class="visa_price">
                            </div>
                        </td>
                        <td>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][travellerspassportfront]" class="passportfront mandatory"/>
                                <input type="text" name="passport_front_<?php echo $visa_row; ?>" placeholder="Attach your passport front"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                            </div>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][travellerspassportback]" class="mandatory"/>
                                <input type="text" name="passort_back_<?php echo $visa_row; ?>" placeholder="Attach your passport back"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                            </div>
                            <div class="attach-copy">
                                <input type="file" name="visa_appication[<?php echo $visa_row; ?>][passportphoto]" class="mandatory"/>
                                <input type="text" name="passort_photo_<?php echo $visa_row; ?>" placeholder="Attach your Picture"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
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
    <div class="next-button-table">
        <div class="container clearfix">
            <table>
                <tbody>
                <tr>
                    <td class="details-bottom">
                        <ul>
                            <!-- <li>Rooms : <span>2</span></li> -->
                            <li>Adult : <span><?php echo $filter_adult; ?></span></li>
                            <li>Children : <span><?php echo $filter_child; ?></span></li>
                        </ul>
                        <p>Total : <?php echo $currencysymbol; ?> <span id="visa_total_price">0</span></p>
                    </td>
                    <td class="details-bottom-button">
                        <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                        <a href="javascript:void(0);" class="next" id="visa_next">proceed to tours</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<?php } ?>
<section class="panel-section package-tours-excursion no-pad-bottom">
    <div class="container">
        <div class="tours-band tour-band">
            <ul>
                <?php foreach($tours as $menukey=>$tour){ $menuclass=''; if($menukey==0){ $menuclass='active'; }?>
                <li class="<?php echo $menuclass; ?>"><?php echo $tour['name']; ?></li>
                <?php } ?>
                
            </ul>
        </div>
        <div class="tours-band-container tour-band-container">
            <?php foreach($tours as $key=>$tour){  $class=''; if($key==0){ $class='active'; } ?>
                <div class="section-list section-list-inner tours-band-content <?php echo $class; ?>">
                <div class="package-tours-accordian">
                    <ul class="accord-conatiner">
                        <?php foreach($tour['ProResult'] as $ProResult){ 

                        $product_id = $ProResult['product_id'];
                        $category_id= $ProResult['category_id'];
                        $options = $ProResult['options'];
                        $top_up = $ProResult['top_up']; 
                        ?>
                        <li class="accord-list">
                            <h2><?php echo $ProResult['name']; ?></h2>

                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="inner-wrap">
                                        <div><?php echo $ProResult['description'];?></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="item-book-now">
                                        <h2>BOOK NOW</h2>

                                        <div class="item-book-drop">                                          

                                            <!-- custo add ionput hidden filed for child total and adult total -->
                                            <input type="hidden" name="tours[<?php echo $product_id; ?>][top_up]" class="top_up_<?php echo $product_id; ?>" value="<?php echo $ProResult['top_up'];?>">
                                            <input type="hidden" name="tours[<?php echo $product_id; ?>][familytype]" value="<?php echo $ProResult['family'];?>">
                                            <input type="hidden" name="tours[<?php echo $product_id; ?>][totalpriceadult]" value="0" class="totalpriceadult_<?php echo $product_id; ?>">
                                            <input type="hidden" name="tours[<?php echo $product_id; ?>][totalpricechild]" value="0" class="totalpricechild_<?php echo $product_id; ?>">
                                            <input type="hidden" name="tours[<?php echo $product_id; ?>][travel_type]" value="0" class="travel_type_<?php echo $product_id; ?>">
                                            <div class="otpinhidvaluehere_<?php echo $product_id; ?>"></div>
                                            <div class="myfirstsectlcus_<?php echo $product_id; ?> cs-select cs-skin-border" tabindex="0">
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
                                                                if($optionmy['required']==1){
                                                                   
                                                                   if($optionmy['name']=='SIC' ||$optionmy['name']=='Without Transfer')
                                                                   {
                                                                        //'.$optionmy['product_option_value'][0]['price'].'  '.$optionmy['name'].',
                                                                        
                                                                        $attr = 'data-product-option-value-id="'.$optionmy['product_option_value'][0]['product_option_value_id'].'"  data-product-option-id="'.$optionmy['product_option_id'].'" data-childprice="'.$optionmy['product_option_value'][0]['child_price'].'" data-option-id="'.$optionmy['option_id'].'" data-price="'.$optionmy['product_option_value'][0]['orignalprice'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationscombo('.$optionmy['option_id'].','.$product_id.')" ';
                                                                   }
                                                                   else
                                                                   {
                                                                    
                                                                        /*$attr = 'data-product-option-id="'.$optionmy['product_option_id'].'" data-option-id="'.$optionmy['option_id'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationsprivate('.$optionmy['option_id'].')" ';*/
                                                                        $attr = 'data-childprice="'.$optionmy['product_option_value'][0]['top_up_child'].'" data-price="'.$optionmy['product_option_value'][0]['top_up_adults'].'"  data-product-option-id="'.$optionmy['product_option_id'].'" data-option-id="'.$optionmy['option_id'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationsprivateparent('.$optionmy['option_id'].','.$product_id.')" '.$price;
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
                                        <div class="myboxescalculations_<?php echo $product_id; ?>">
                                            <div class="book-rate">
                                                <span>Adult: </span>
                                                <span><?php echo $currencysymbol; ?> 0</span>
                                                <span>Children:</span>
                                                <span><?php echo $currencysymbol; ?> 0</span>
                                            </div>
                                            <div class="book-pick">
                                                <span>No of Adults</span>
                                                <span><input type="text" placeholder="00" disabled=""></span>
                                                <!--<input onblur="priceadult(this.value,price)" name="adultnumbers" type="text" placeholder="00">-->
                                                <span>No of Childrens</span>
                                                <span><input type="text" placeholder="00" disabled=""></span>
                                            </div>
                                        </div>
                                        <div class="myboxforprivate_<?php echo $product_id; ?> hide">
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
                                                                        $attr = 'data-product-option-value-id="'.$optionprivate['product_option_value_id'].'"   data-product-option-id="'.$optionmy['product_option_id'].'" data-price="'.$optionprivate['orignalprice'].'" data-option-value-id="'.$optionprivate['option_value_id'].'" onclick="mycalculationprivate('.$optionprivate['option_value_id'].','.$product_id.')"  ';
                                                                    
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
                                                <input type="text" onblur="chkvaldation(this.val,<?php echo $product_id; ?>)" name="tours[<?php echo $product_id; ?>][tourdate]" id="datepicker_<?php echo $product_id; ?>" class="choose-location-book datepickeroncat" placeholder="Date"></span>
                                            <span id="pickup_<?php echo $product_id; ?>">
                                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                <input type="text" onblur="chkvaldation(this.val,<?php echo $product_id; ?>)"  name="tours[<?php echo $product_id; ?>][pickuplocation]" id="pickuplocations_<?php echo $product_id; ?>" class="pick-up-location_<?php echo $product_id; ?>" placeholder="Pickup Location">
                                            </span>
                                        </div>
                                        <div class="setcalprice_<?php echo $product_id; ?> hide">
                                            <div class="book-rate">
                                                <span>Adult : </span>
                                                <span class="adultpricetotal"><?php echo $currencysymbol; ?>  0</span>
                                                <span>Children:</span>
                                                <span class="childpricetotal"><?php echo $currencysymbol; ?>  0</span>
                                            </div>
                                        </div>
                                        <div class="transfer_rate_<?php echo $product_id; ?> hide">
                                            <div class="book-rate">
                                                <span>Transfer Charges : </span>
                                                <span class="transferprice"> <?php echo $currencysymbol; ?> 0</span>
                                               
                                            </div>
                                        </div>
                                        <div class="book-total_<?php echo $product_id; ?> book-rate"><span>Total: </span> <span><?php echo $currencysymbol; ?> 0 </span></div>
                                        <!-- hideen data  -->
                                        <input type="hidden" value="1" name="tours[<?php echo $product_id; ?>][childhidprice]" class="childhidprice_<?php echo $product_id; ?>"/>
                                        <input type="hidden" value="1" name="tours[<?php echo $product_id; ?>][parenthidprice]" class="parenthidprice_<?php echo $product_id; ?>"/>
                                        <div>
                                            <input type="checkbox" class="tour_to_package" name="tour_add_package_<?php echo $product_id; ?>" id="tour_add_package_<?php echo $product_id; ?>" data-product-id="<?php echo $product_id; ?>" data-product-name="<?php echo $ProResult['name']; ?>" disabled> Add To My Package
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </li>
                        <?php } ?>
                        

                    </ul>
                </div>

            </div>
            <?php } ?>

        </div>
        <!-- <div class="next-button-table clearfix">
            <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
            <table class="next-button">
                <tbody>
                <tr>
                    <td><p>Total : AED <span id="tours_total_price">0</span></p></td>
                    <td><a href="javascript:void(0);" class="next">proceed to parks</a></td>
                </tr>
                </tbody>
            </table>
        </div> -->
    </div>
    <div class="next-button-table" id="tours_table_summary">
        <div class="container clearfix">
            <table>
                <tbody>
                <tr>
                    <td class="details-bottom">
                        <ul>
                            <!-- <li>Rooms : <span>2</span></li> -->
                            <li>Adult : <span><?php echo $filter_adult; ?></span></li>
                            <li>Children : <span><?php echo $filter_child; ?></span></li>
                        </ul>
                        <p>Total : <?php echo $currencysymbol; ?> <span id="tours_total_price">0</span></p>
                    </td>
                    <td class="details-bottom-button">
                        <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                        <a href="javascript:void(0);" class="next">proceed to parks</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<section class="panel-section package-parks no-pad-bottom">
    <div class="container">
        <div class="parks-band park-band">
            <ul>
                <?php foreach($parks as $menukey=>$park){ $menuclass=''; if($menukey==0){ $menuclass='active'; }?>
                <li class="<?php echo $menuclass; ?>"><?php echo $park['name']; ?></li>
                <?php } ?>
                
            </ul>
        </div>
        <div class="parks-band-container park-band-container">
            <?php foreach($parks as $key=>$park){  $class=''; if($key==0){ $class='active'; } ?>
                <div class="section-list section-list-inner parks-band-content <?php echo $class; ?>">
                <div class="package-parks-accordian">
                    <ul class="accord-conatiner">
                        <?php foreach($park['ProResult'] as $ProResult){ 

                        $product_id = $ProResult['product_id'];
                        $category_id= $ProResult['category_id'];
                        $options = $ProResult['options'];
                        $top_up = $ProResult['top_up']; 
                        ?>
                        <li class="accord-list">
                            <h2><?php echo $ProResult['name']; ?></h2>

                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="inner-wrap">
                                        <div><?php echo $ProResult['description'];?></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="item-book-now">
                                        <h2>BOOK NOW</h2>

                                        <div class="item-book-drop">                                          

                                            <!-- custo add ionput hidden filed for child total and adult total -->
                                            <input type="hidden" name="parks[<?php echo $product_id; ?>][top_up]" class="top_up_<?php echo $product_id; ?>" value="<?php echo $ProResult['top_up'];?>">
                                            <input type="hidden" name="parks[<?php echo $product_id; ?>][familytype]" value="<?php echo $ProResult['family'];?>">
                                            <input type="hidden" name="parks[<?php echo $product_id; ?>][totalpriceadult]" value="0" class="totalpriceadult_<?php echo $product_id; ?>">
                                            <input type="hidden" name="parks[<?php echo $product_id; ?>][totalpricechild]" value="0" class="totalpricechild_<?php echo $product_id; ?>">
                                            <input type="hidden" name="parks[<?php echo $product_id; ?>][travel_type]" value="0" class="travel_type_<?php echo $product_id; ?>">
                                            <div class="otpinhidvaluehere_<?php echo $product_id; ?>"></div>
                                            <div class="myfirstsectlcus_<?php echo $product_id; ?> cs-select cs-skin-border" tabindex="0">
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
                                                                if($optionmy['required']==1){
                                                                   
                                                                   if($optionmy['name']=='SIC' ||$optionmy['name']=='Without Transfer')
                                                                   {
                                                                        //'.$optionmy['product_option_value'][0]['price'].'  '.$optionmy['name'].',
                                                                        
                                                                        $attr = 'data-product-option-value-id="'.$optionmy['product_option_value'][0]['product_option_value_id'].'"  data-product-option-id="'.$optionmy['product_option_id'].'" data-childprice="'.$optionmy['product_option_value'][0]['child_price'].'" data-option-id="'.$optionmy['option_id'].'" data-price="'.$optionmy['product_option_value'][0]['orignalprice'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationscomboparks('.$optionmy['option_id'].','.$product_id.')" ';
                                                                   }
                                                                   else
                                                                   {
                                                                    
                                                                        /*$attr = 'data-product-option-id="'.$optionmy['product_option_id'].'" data-option-id="'.$optionmy['option_id'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationsprivateparks('.$optionmy['option_id'].')" ';*/
                                                                        $attr = 'data-childprice="'.$optionmy['product_option_value'][0]['top_up_child'].'" data-price="'.$optionmy['product_option_value'][0]['top_up_adults'].'"  data-product-option-id="'.$optionmy['product_option_id'].'" data-option-id="'.$optionmy['option_id'].'" data-type="'.$optionmy['name'].'" onclick="mycalculationsprivateparentparks('.$optionmy['option_id'].','.$product_id.')" '.$price;
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
                                        <div class="myboxescalculations_<?php echo $product_id; ?>">
                                            <div class="book-rate">
                                                <span>Adult: </span>
                                                <span><?php echo $currencysymbol; ?> 0</span>
                                                <span>Children:</span>
                                                <span><?php echo $currencysymbol; ?> 0</span>
                                            </div>
                                            <div class="book-pick">
                                                <span>No of Adults</span>
                                                <span><input type="text" placeholder="00" disabled=""></span>
                                                <!--<input onblur="priceadult(this.value,price)" name="adultnumbers" type="text" placeholder="00">-->
                                                <span>No of Childrens</span>
                                                <span><input type="text" placeholder="00" disabled=""></span>
                                            </div>
                                        </div>
                                        <div class="myboxforprivate_<?php echo $product_id; ?> hide">
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
                                                                        $attr = 'data-product-option-value-id="'.$optionprivate['product_option_value_id'].'"   data-product-option-id="'.$optionmy['product_option_id'].'" data-price="'.$optionprivate['orignalprice'].'" data-option-value-id="'.$optionprivate['option_value_id'].'" onclick="mycalculationprivateparks('.$optionprivate['option_value_id'].','.$product_id.')" ';
                                                                    
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
                                                <input type="text" onblur="chkvaldationpark(this.val,<?php echo $product_id; ?>)" name="parks[<?php echo $product_id; ?>][tourdate]" id="datepicker_<?php echo $product_id; ?>" class="choose-location-book datepickeroncat" placeholder="Date"></span>
                                            <span id="pickup_<?php echo $product_id; ?>">
                                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                                <input type="text" onblur="chkvaldationpark(this.val,<?php echo $product_id; ?>)"  name="parks[<?php echo $product_id; ?>][pickuplocation]" id="pickuplocations_<?php echo $product_id; ?>" class="pick-up-location" placeholder="Pickup Location">
                                            </span>
                                        </div>
                                        <div class="setcalprice_<?php echo $product_id; ?> hide">
                                            <div class="book-rate">
                                                <span>Adult : </span>
                                                <span class="adultpricetotal"><?php echo $currencysymbol; ?>  0</span>
                                                <span>Children:</span>
                                                <span class="childpricetotal"><?php echo $currencysymbol; ?>  0</span>
                                            </div>
                                        </div>
                                        <div class="transfer_rate_<?php echo $product_id; ?> hide">
                                            <div class="book-rate">
                                                <span>Transfer Charges : </span>
                                                <span class="transferprice_<?php echo $product_id; ?>"> <?php echo $currencysymbol; ?> 0</span>
                                               
                                            </div>
                                        </div>
                                        <div class="book-total_<?php echo $product_id; ?> book-rate"><span>Total: </span> <span><?php echo $currencysymbol; ?> 0 </span></div>
                                         <!-- hideen data  -->
                                        <input type="hidden" value="1" name="parks[<?php echo $product_id; ?>][childhidprice]" class="childhidprice_<?php echo $product_id; ?>"/>
                                        <input type="hidden" value="1" name="parks[<?php echo $product_id; ?>][parenthidprice]" class="parenthidprice_<?php echo $product_id; ?>"/>
                                        <div>
                                            <input type="checkbox" class="parks_to_package" name="parks_add_package_<?php echo $product_id; ?>" id="parks_add_package_<?php echo $product_id; ?>" data-product-id="<?php echo $product_id; ?>" data-product-name="<?php echo $ProResult['name']; ?>" > Add To My Package
                                        </div>
                                       
                                    </div>
                                </div>


                            </div>
                        </li>
                        <?php } ?>
                        

                    </ul>
                </div>

            </div>
            <?php } ?>

        </div>
        
    </div>
    <div class="next-button-table" id="parks_table_summary">
        <div class="container clearfix">
            <table>
                <tbody>
                <tr>
                    <td class="details-bottom">
                        <ul>
                            <!-- <li>Rooms : <span>2</span></li> -->
                            <li>Adult : <span><?php echo $filter_adult; ?></span></li>
                            <li>Children : <span><?php echo $filter_child; ?></span></li>
                        </ul>
                        <p>Total : <?php echo $currencysymbol; ?> <span id="parks_total_price">0</span></p>
                    </td>
                    <td class="details-bottom-button">
                        <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                        <a href="javascript:void(0);" class="next">proceed to airport transfer</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<?php //if($transfer_option==1){ ?>
<section class="panel-section airport-section no-pad-bottom">
    <div class="container">
        <div class="row" id="airport_section">
            <div class="col-md-6 airport-form">
                <select name="transfer[vehicle]" id="vehicle">
                    <option value="">Select Vehicle</option>
                    <?php foreach($transfer_products as $transport){ ?>                    
                    <option value="<?php echo $transport['product_id']; ?>"><?php echo $transport['name']; ?></option>
                    <?php } ?> 
                </select>
            </div>
            <div class="col-md-6 airport-form">
                <select id="airport_primary">
                    <option value="">Select Airport</option>                    
                </select>
                <?php foreach($transfer_products as $transport){ ?> 
                <select name="transfer[airport]" id="airport_<?php echo $transport['product_id']; ?>" class="airport_options hide">
                    <option value="">Select Airport</option> 
                    <?php foreach($transport['options'] as $option){
                        $attr = 'data-price="'.$option['product_option_value'][0]['price'].'" data-product-option-id="'.$option['product_option_id'].'" data-product-option-value-id="'.$option['product_option_value'][0]['product_option_value_id'].'" data-option-id="'.$option['option_id'].'" data-type="'.$option['name'].'" onclick="setoptionvalue('.$option['option_id'].')" ';
                    ?>
                    <option <?php echo $attr; ?> ><?php echo $option['name']; ?></option>
                    <?php }?>                   
                </select>
                <?php } ?>    
            </div>
            <?php if($transfer_option=='one'){?>
            <div class="col-md-6 airport-form">
                <select name="transfer[typedirection]" id="typedirection">
                    <option value="" disabled selected>Transfer From</option>
                    <option value="From Airport to Hotel in Dubai">From Airport to Hotel in Dubai</option>
                    <option value="From Hotel To Airport in Dubai">From Hotel To Airport in Dubai</option>
                </select>
            </div>
            <?php }else{ ?>
                <input type="hidden" name="transfer[typedirection]" id="typedirection" value="Two Way (Airport to Hotel, Hotel to Airport)">
            <?php } ?>
            <div class="col-md-6 airport-form airport-form-icon">
                <i class="fa fa-calendar" aria-hidden="true"></i>
                <input type="text" name="transfer[tourdate]" class="airport-dt datepickeroncat" placeholder="Date"/>
            </div>
            <div class="col-md-6 airport-form airport-form-icon">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <input type="text" name="transfer[pickuplocation]" id="pickuplocation" class="airport-dt" placeholder="Pick Up Location" onblur="chkvaldation1(this.val)"/>
            </div>
            <div class="col-md-6 airport-form airport-form-icon">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <input type="text" name="transfer[dropofflocation]" id="dropofflocation" class="airport-dt" placeholder="Drop off Location" onblur="chkvaldation1(this.val)" value="<?php echo $heading_title; ?>"/>
            </div>
            <div class="col-md-6 airport-form airport-form-icon">
                <i class="fa fa-clock-o" aria-hidden="true"></i>
                <input type="text" name="transfer[pickuptime]" id="pickuptime" class="airport-dt" placeholder="Pickup Time" onblur="chkvaldation1(this.val)"/>
            </div>
            <div class="fixedhid"></div>
            <div class="optionhidset"></div>
        </div>         
    </div>
    <div class="next-button-table">
        <div class="container clearfix">
            <table>
                <tbody>
                <tr>
                    <td class="details-bottom">
                        <ul>
                            <!-- <li>Rooms : <span>2</span></li> -->
                            <li>Adult : <span><?php echo $filter_adult; ?></span></li>
                            <li>Children : <span><?php echo $filter_child; ?></span></li>
                        </ul>
                        <p>Total : <?php echo $currencysymbol; ?> <span id="airport_total_price">0</span></p>
                    </td>
                    <td class="details-bottom-button">
                        <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                        <a href="javascript:void(0);" class="next" id="last_next"> proceed to flight ticket</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
<?php //} ?>
<section class="panel-section flightticket-section no-pad-bottom">
    <div class="container">
        <div class="container">
            <div class="hotel-single-table">
                <table class="table table-bordered" id="flightticket_table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Attach Flight Ticket</th>
                    <th>Action</th>
                </tr>

                </thead>
                <tbody>
                <?php $ticket_row = 0; ?>
                <?php 
                if($total_people > 0 ){
                
                    for($i=1;$i<=$total_people;$i++){
                    $ticket_row = $i;
                    ?>
                    <tr id="<?php echo $ticket_row;?>">                    
                        <td>
                            <input type="text" placeholder="Your name" name="flight_ticket[<?php echo $visa_row?>][passenger_name]" id="flight_ticket_<?php echo $ticket_row?>"/>
                        </td>
                        <td>
                            <div class="attach-copy">
                                <input type="file" name="flight_ticket[<?php echo $ticket_row; ?>][travellerflightticket]" class="flightticket"/>
                                <input type="text"  placeholder="Attach your flight ticket"/>
                                <span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>
                                <span class="view-attachement">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                     <div class="attachment-view">
                                         <i class="fa fa-times attach-close" aria-hidden="true"></i>
                                         <img id="flight_ticket[<?php echo $ticket_row; ?>][travellerflightticket]" src="#" alt="your image" />
                                     </div>
                                </span>
                            </div>                           
                        </td>
                        <td class="vertical-middle">
                            <div class="inline-block"><i class="fa fa-trash row-delete" aria-hidden="true"></i></div>
                        </td>                         
                    </tr> 
                    <?php } 
                    } ?> 

                </tbody>
                <tfoot>
                <!-- <tr>
                    <td colspan="2">
                        <button id="add_ticket">ADD +</button>
                    </td>
                </tr> -->
                </tfoot>
            </table>
            </div>
        </div>        
    </div>
    <div class="next-button-table">
            <div class="container clearfix">
                <table>
                    <tbody>
                    <tr>                        
                        <td class="details-bottom-button">
                            <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                            <a href="javascript:void(0);" class="next" id="flight_next">proceed to summary</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
</section>

<section class="panel-section hotel-summary">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="summary-table">
                    <h2><img src="catalog/view/theme/theme_c2c/images/summary/icon1.svg"/>Hotel Booking</h2>
                    <table id="hotel_book_summary">
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
                <?php if($visa_option==1){ ?>
                <div class="summary-table">
                    <h2><img src="catalog/view/theme/theme_c2c/images/summary/icon2.svg"/>Visa Application</h2>
                    <table id="visa_app_summary">
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
                <?php } ?>

                <div class="summary-table">
                    <h2><img src="catalog/view/theme/theme_c2c/images/summary/icon3.svg"/>Tours & Excursions</h2>
                    <table id="tours_summary">
                        <tbody>

                        </tbody>
                    </table>
                </div>
                 <div class="summary-table">
                    <h2><img src="catalog/view/theme/theme_c2c/images/icon-parks.svg"/>Parks</h2>
                    <table id="parks_summary">
                        <tbody>
                       
                        </tbody>
                    </table>
                </div>
                <?php //if($transfer_option==1){ ?>
                <div class="summary-table">
                    <h2><img src="catalog/view/theme/theme_c2c/images/summary/icon4.svg"/>Airport Transfer</h2>
                    <table id="airport_summary">
                        <tbody>
                       

                        </tbody>
                    </table>
                </div>
                <?php //} ?>
            </div>
            <div class="col-md-4">
                <div class="next-button-table summary-table-final">
                    <table>
                        <tbody>
                        <tr>
                            <td><h2>Your package is ready</h2></td>
                        </tr>
                        <tr>
                            <td>
                                <p><i class="fa fa-check" aria-hidden="true"></i>Hotel <span class="include_label">(included Meal Price)</span></p>

                                <p id="hotel_total_amount">0 <?php echo $currencysymbol; ?></p>
                            </td>
                        </tr>
                        <?php if($visa_option==1){ ?>
                        <tr>
                            <td>
                                <p><i class="fa fa-check" aria-hidden="true"></i>Visa</p>

                                <p id="visa_total_amount">0 <?php echo $currencysymbol; ?></p>
                            </td>
                        </tr>  
                         <?php } ?>                      
                        <tr>
                            <td>
                                <p><i class="fa fa-check" aria-hidden="true"></i>Tours & Excursions</p>

                                <p id="tours_total_amount"><?php echo $total_tour_price; ?> <?php echo $currencysymbol; ?></p>
                            </td>
                        </tr> 
                         <tr>
                            <td>
                                <p><i class="fa fa-check" aria-hidden="true"></i>Parks</p>

                                <p id="parks_total_amount">0 <?php echo $currencysymbol; ?></p>
                            </td>
                        </tr>                        
                        <?php //if($transfer_option==1){ ?>
                        <tr>
                            <td>
                                <p><i class="fa fa-check" aria-hidden="true"></i>Airport Transfer</p>

                                <p id="airport_total_amount">0 <?php echo $currencysymbol; ?></p>
                            </td>
                        </tr>
                        <?php //} ?>
                        <tr class="summary-total-price">
                            <td><p>Total : <?php echo $currencysymbol; ?><span id="summary_total_price">0</span></p></td>

                        </tr>
                        <tr class="summary-table-addCart">

                            <td><a href="javascript:void(0)" id="buttonstorepackage">ADD TO CART</a></td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<div id="product">
<input type="hidden" name="product_id" value="<?php echo $package_id; ?>" />
<input type="hidden" name="custom_price" id="custom_price" value="" />
<input type="hidden" name="room_options" id="room_options" value="" />
<input type="hidden" name="discounts" id="discounts" value="" />
<input type="hidden" name="meals_options" id="meals_options" value="" />
<input type="hidden" name="visa_options" id="visa_options" value="" />
<input type="hidden" name="tour_options" id="tour_options" value="" />
<input type="hidden" name="park_options" id="park_options" value="" />
<input type="hidden" name="nationality"  id="nationality" value="<?php echo $filter_id; ?>" />
<input type="hidden" name="no_of_days"  id="no_of_day" value="<?php echo $no_of_days; ?>" />
<input type="hidden" name="adult_num"  id="adult_num" value="<?php echo $filter_adult; ?>" />
<input type="hidden" name="child_num"  id="child_num" value="<?php echo $filter_child; ?>" />
<input type="hidden" name="product_type"  id="product_type" value="MP" />

<input type="hidden" value="<?php echo date("d-m-Y"); ?>" name="tourdate" class="tourdatevisa"/>
<input type="hidden" value="" name="pickuplocation" class="pickuplocationvisa"/>
<input type="hidden" value="1" name="childhidprice" class="childhidprice"/>
<input type="hidden" value="1" name="parenthidprice" class="parenthidprice"/>
<div class="otpinhidvaluehere"></div>
</div>
<div id="touroptions"></div>
<div id="parkoptions"></div>
</form>

<?php echo $footer; ?>
<script type="text/javascript">
    $( function() {
        $("ul.tabs").tabs();
    });
    function calculateTourTotal(){
        console.log('indide tout total calculation');
        var tour_total_amount = 0;
        $('#touroptions').html('');
        $( ".tour_to_package" ).each(function( index ) {
            if($(this).prop('checked')){
                var productkey      = $(this).attr("data-product-id");
                console.log(productkey); 
                var tour_package_total = $('.book-total_'+productkey).text(); 
                var touramount   = tour_package_total.split(" ").pop();
                tour_total_amount = parseFloat(tour_total_amount) + parseFloat(touramount);
                console.log(tour_total_amount);
                $('#touroptions').append($('.otpinhidvaluehere_'+productkey).html());                 
            } 
        });
        $('#tours_total_price').html(tour_total_amount);
        
    }
    $(document).on('change','.tour_to_package',function(){           
        
       calculateTourTotal(); 
       $('html, body').animate({ scrollTop: $('#tours_table_summary').offset().top}, 2000);      
 
    });
    function calculateParksTotal(){
        console.log('indide parks total calculation');
        var park_total_amount = 0;
        $('#parkoptions').html('');
        $( ".parks_to_package" ).each(function( index ) {
            if($(this).prop('checked')){
                var productkey      = $(this).attr("data-product-id");
                console.log(productkey); 
                var park_package_total = $('.book-total_'+productkey).text(); 
                var parkamount   = park_package_total.split(" ").pop();
                park_total_amount = parseFloat(park_total_amount) + parseFloat(parkamount);
                console.log(park_total_amount);  
                $('#parkoptions').append($('.otpinhidvaluehere_'+productkey).html());             
            } 
        });
        $('#parks_total_price').html(park_total_amount);
        
    }
    $(document).on('change','.parks_to_package',function(){           
        
        calculateParksTotal();       
        $('html, body').animate({ scrollTop: $('#parks_table_summary').offset().top}, 2000); 
        
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
            $('.option_NA_'+key).addClass('hide');
            $('.option_HB_'+key).removeClass('hide');
            $('.option_BB_'+key).addClass('hide');
            $('.option_FB_'+key).addClass('hide');
        }else if(selected=='FB'){
            $('.option_no_'+key).addClass('hide');
            $('.option_NA_'+key).addClass('hide');
            $('.option_FB_'+key).removeClass('hide');
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
                var room_total_amount  = (per_night * room_count);
                if($('#discount_'+key).val()){
                    console.log($('#discount_'+key).val());
                    var discount_percentage = $('#discount_'+key).val();
                    var discount_amount = (discount_percentage / 100) * per_night;
                    console.log(discount_amount);
                    room_total_amount = (room_total_amount - discount_amount);
                }
                total_amount = parseFloat(total_amount) + parseFloat(room_total_amount);
            }               

        });
        //calculate meals option pricing
        var adult_count = '<?php echo $filter_adult; ?>';
        var child_count = '<?php echo $filter_child; ?>';
        $( ".meals_option" ).each(function( index ) {
            var meals_option  = $(this).find(":selected").val();
            console.log(meals_option);
            var key = $(this).attr('data-key');
            var room_count  = $('#rooms_count_'+key).find(":selected").val();
            console.log(room_count);
            if(meals_option!='' && room_count!=0){                
                var meal_adult_price = $('#meal_adult_'+meals_option+'_'+key).html().replace(/[^\d\.]/g, '');
                var meal_child_price = $('#meal_child_'+meals_option+'_'+key).html().replace(/[^\d\.]/g, '');
                console.log('adult price:'+meal_adult_price);
                console.log('child price:'+meal_child_price); 
                var meal_total =  parseFloat(meal_adult_price * adult_count) + parseFloat(meal_child_price * child_count);                  
                meals_total_amount = parseFloat(meals_total_amount) + parseFloat(meal_total);
            }                          
        });
        
        $('#room_total_price').html(total_amount.toFixed(2));
        $('#meal_total_price').html(meals_total_amount.toFixed(2));
        $('html, body').animate({ scrollTop: $('#room_table_summary').offset().top}, 2000);
    });
    //calculate meals option pricing
    $(document).on('change','.meals_option',function(){
        var meals_total_amount  = 0;
        var adult_count = '<?php echo $filter_adult; ?>';
        var child_count = '<?php echo $filter_child; ?>';

        $( ".meals_option" ).each(function( index ) {
            var meals_option  = $(this).find(":selected").val();
            var key = $(this).attr('data-key');
            var room_count = $('#rooms_count_'+key).find(":selected").val();
            if(meals_option!='' && room_count !=0){                    

                var meal_adult_price = $('#meal_adult_'+meals_option+'_'+key).html();
                var meal_child_price = $('#meal_child_'+meals_option+'_'+key).html();
                console.log('adult price:'+meal_adult_price);
                console.log('child price:'+meal_child_price); 
                var meal_total =  parseFloat(meal_adult_price * adult_count) + parseFloat(meal_child_price * child_count);                  
                meals_total_amount = parseFloat(meals_total_amount) + parseFloat(meal_total);
            } 
                      
        });

        $('#meal_total_price').html(meals_total_amount.toFixed(2));
    });
    $(document).on('change','.visa_option',function(){             
        var visa_price  = $(this).find(":selected").attr('data-price');
        var key         = $(this).attr('data-key'); 
        //var price_element = '<h2>'+visa_price+'</h2>';
        //var new_price = visa_price.replace("AED ", "");
        $('#visa_rate_'+key).html(CURRENCY_SYMBOL+""+visa_price);
        $('#visa_price_'+key).val(visa_price);
        var visa_total = 0;
        $( ".visa_price" ).each(function( index ) { 
            var visa_amount = $(this).val();
            console.log(visa_amount);
            if(visa_amount!=""){
                 visa_total = parseFloat(visa_total) + parseFloat(visa_amount);
            }
           
        });
        console.log(visa_total);
        $('#visa_total_price').html(visa_total);
    });
    $(document).on('change','#vehicle',function(){        
        var vehicle_id = $(this).val();        
        $('#airport_primary').addClass('hide');
        $('.airport_options').each(function(index){
            $(this).addClass('hide');
        });
        $('#airport_'+vehicle_id).removeClass('hide');

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
            tabLoader(); 
           /* var $first = $('li:first', 'ul.mainitems');
            var $next, $selected = $("ul.mainitems li.active"),$tab_selected=$('section.active');
            $next = $selected.next('ul.mainitems li').length ? $selected.next('ul.mainitems li') : $first;
            $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
            $selected.removeClass("active");
            $next.addClass('active');
            $tab_selected.removeClass("active");
            $tabnext.addClass('active');*/

            var isvalidate =0;
            var isairvalidate =0;
            var roomvalidate = 1;
            /* validation */
            var roomoptions   = '';
            var mealsoptions   = '';
            var discounts   = '';
            var next_id = $(this).attr('id');
            var num_of_rooms = '<?php echo $filter_rooms; ?>';
            var sel_num_rooms = 0;
            if(next_id=='hotel_next' || next_id=='visa_next' || next_id=='last_next'){
                if(next_id=='hotel_next'){
                    console.log('hotel next');
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
                        var $first = $('ul.mainitems li:first', 'ul.mainitems');
                        var $next, $selected = $("ul.mainitems li.active"),$tab_selected=$('section.active');
                        $next = $selected.next('li').length ? $selected.next('li') : $first;
                        $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
                        $selected.removeClass("active");
                        $next.addClass('active');
                        $tab_selected.removeClass("active");
                        $tabnext.addClass('active');
                    }else{
                        console.log('room section validation error');
                        $('#roomsel-error').addClass('hide');
                        $('#roomcount-error').addClass('hide');
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
                        console.log($(this).attr('name'));
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
                        var $first = $('ul.mainitems li:first', 'ul.mainitems');
                        var $next, $selected = $("ul.mainitems li.active"),$tab_selected=$('section.active');
                        $next = $selected.next('li').length ? $selected.next('li') : $first;
                        $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
                        $selected.removeClass("active");
                        $next.addClass('active');
                        $tab_selected.removeClass("active");
                        $tabnext.addClass('active');
                    }           
                }
                if(next_id=='last_next'){               
                    $('#airport_section .mandatory').each(function(){                     
                        console.log($(this).attr('name'));
                        if($(this).val()=='' || $(this).val()==null){
                            $(this).addClass('haserror');
                            isairvalidate =1;
                        }else{
                            $(this).removeClass('haserror');
                        }
                    });
                    if(isairvalidate==1){
                        return false;
                    }else{
                        var $first = $('ul.mainitems li:first', 'ul.mainitems');
                        var $next, $selected = $("ul.mainitems li.active"),$tab_selected=$('section.active');
                        $next = $selected.next('li').length ? $selected.next('li') : $first;
                        $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
                        $selected.removeClass("active");
                        $next.addClass('active');
                        $tab_selected.removeClass("active");
                        $tabnext.addClass('active');
                    }           
                }

            }else{
                var $first = $('ul.mainitems li:first', 'ul.mainitems');
                var $next, $selected = $("ul.mainitems li.active"),$tab_selected=$('section.active');
                $next = $selected.next('li').length ? $selected.next('li') : $first;
                $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
                $selected.removeClass("active");
                $next.addClass('active');
                $tab_selected.removeClass("active");
                $tabnext.addClass('active');
            }            
            /*validation*/

            if(next_id=='last_next'){
                var hotelsummary = '';
                var visasummary   = '';
                var toursummary   = '';
                var parksummary   = '';
                $( "#rooms_list tbody tr" ).each(function( index ) {                   
                    var row_id = $(this).attr('id');
                    var rooms_selected = $('#rooms_count_'+row_id).val();
                    if(rooms_selected != 0){
                        var room_type = $('#room_category_'+row_id).html();
                        var meals_option_sel = $('#meals_option_'+row_id).val();
                        if(meals_option_sel=='NA'){
                            var meal_option = 'No Meals';
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
                        if(index!=0){
                            hotelsummary += '<tr><td></td></tr>';
                        }
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
                hotelsummary +='<tr><td style="font-weight:bold;">Room\'s Total Price</td><td style="font-weight:bold;">: '+CURRENCY_SYMBOL+''+$('#room_total_price').html()+'</td></tr>';
                hotelsummary +='<tr><td style="font-weight:bold;">Meal Price</td><td style="font-weight:bold;">: '+CURRENCY_SYMBOL+''+$('#meal_total_price').html()+'</td></tr>';
                $('#hotel_book_summary tbody').append(hotelsummary);

                //visa summary
                var visaoptions = '';
                $( "#visa_table tbody tr" ).each(function( index ) {
                    console.log(index);
                    var visa_row = $(this).attr('id');
                    var applicant_name  = $('#visa_applicant_'+visa_row).val();
                    var visa_option     = $('#visa_option_'+visa_row+' option:selected').text();
                    var visa_amount     = $('#visa_rate_'+visa_row).html();                    
                    var visa_id = $('#visa_option_'+visa_row+' option:selected').attr('data-option-id');
                    if(visaoptions!=''){
                        visaoptions +=',';
                    }
                    visaoptions += visa_id;
                    if(index!=0){
                        visasummary += '<tr><td></td></tr>';
                    }   
                    visasummary +='<tr><td style="font-weight:bold;">Applicant '+(index+1)+'</td></tr>';
                    visasummary +='<tr><td>Name</td><td>: '+applicant_name+'</td></tr>';
                    visasummary +='<tr><td>Visa Type</td><td>: '+visa_option+'</td></tr>';
                    visasummary +='<tr><td>Price</td><td>: '+visa_amount+'</td></tr>'; 
                                       
                    
                });
                
                $('#visa_options').val(visaoptions);
                $('#visa_app_summary tbody').append(visasummary); 
                //tours summary
                var tours_count = 0;
                $( ".tour_to_package").each(function( index ) {
                    if($(this).prop('checked')){
                        tours_count = tours_count + 1;
                        var product_id = $(this).attr('data-product-id');
                        var travel_type = $('.travel_type_'+product_id).val();
                        var adultnumbers = $('#adultnumbers_'+product_id).val();
                        var childumbers = $('#childnumbers_'+product_id).val();
                        var adultprice = $('.totalpriceadult_'+product_id).val();
                        var childprice = $('.totalpricechild_'+product_id).val();                     
                        var tourdate = $('#datepicker_'+product_id).val();
                        var pickupLocation = $("#pickuplocations_"+product_id).val();
                        if(index!=0){
                            toursummary += '<tr><td></td></tr>';
                        }
                        if(childumbers==""){
                            childumbers = 0;
                        }   
                        toursummary += '<tr><td style="font-weight:bold;">Tour '+tours_count+'</td></tr>';
                        toursummary +='<tr><td>Tour Name </td><td>: '+ $(this).attr('data-product-name')+'</td></tr>';                        
                        toursummary +='<tr><td>Tour Type </td><td>: '+ travel_type +'</td></tr>'; 
                        toursummary +='<tr><td>Tour Date </td><td>: '+ tourdate +'</td></tr>'; 
                        ///SIC 
                        if(travel_type=="SIC"){                                           
                            toursummary +='<tr><td>Adult </td><td>: '+ adultnumbers +'</td></tr>';                        
                            toursummary +='<tr><td>Child </td><td>: '+ childumbers +'</td></tr>';                        
                            toursummary +='<tr><td>Adult Price </td><td>: '+CURRENCY_SYMBOL+''+ adultprice +'</td></tr>';                        
                            toursummary +='<tr><td>Child Price </td><td>: '+CURRENCY_SYMBOL+''+ childprice +'</td></tr>';                        
                            toursummary +='<tr><td>Pickup Location </td><td>: '+ pickupLocation +'</td></tr>'; 
                        }
                        ///PRIVATE
                        if(travel_type=="Private"){
                            var privatPrice = $("#tour_privatepricepakage_"+product_id).val(); 
                            var textvalset      = $('.myboxforprivate_'+product_id+' .cs-options ul li.cs-selected').children('span').text();
                            console.log(textvalset);
                            toursummary +='<tr><td>Passengers </td><td>: '+ textvalset +'</td></tr>';
                            toursummary +='<tr><td>Private Price </td><td>: '+CURRENCY_SYMBOL+''+ privatPrice +'</td></tr>';
                        }
                        //WITHOUT TRANSFER 
                        if(travel_type=='without_transfer'){
                            toursummary +='<tr><td>Adult </td><td>: '+ adultnumbers +'</td></tr>';                        
                            toursummary +='<tr><td>Child </td><td>: '+ childumbers +'</td></tr>';                        
                            toursummary +='<tr><td>Adult Price </td><td>: '+CURRENCY_SYMBOL+''+ adultprice +'</td></tr>';                        
                            toursummary +='<tr><td>Child Price </td><td>: '+CURRENCY_SYMBOL+''+ childprice +'</td></tr>';      
                        }                      
                    }
                });
                if(tours_count==0){
                    toursummary += '<tr><td> No tours selected</td></tr>';
                    $('#tours_summary tbody').append(toursummary);
                }else{
                  $('#tours_summary tbody').append(toursummary);  
                }
                
                 //parks summary
                var parks_count = 0;
                $( ".parks_to_package").each(function( index ) {
                    if($(this).prop('checked')){  
                        parks_count = parks_count + 1;
                        var product_id = $(this).attr('data-product-id');
                        var travel_type = $('.travel_type_'+product_id).val();
                        var adultnumbers = $('#adultnumbers_'+product_id).val();
                        var childumbers = $('#childnumbers_'+product_id).val();
                        var adultprice = $('.totalpriceadult_'+product_id).val();
                        var childprice = $('.totalpricechild_'+product_id).val();                     
                        var tourdate = $('#datepicker_'+product_id).val();
                        var pickupLocation = $("#pickuplocations_"+product_id).val();
                        if(index!=0){
                            parksummary += '<tr><td></td></tr>';
                        }   
                        if(childumbers==""){
                            childumbers = 0;
                        }
                        parksummary += '<tr><td style="font-weight:bold;">Parks '+parks_count+'</td></tr>';
                        parksummary +='<tr><td>Park Name </td><td>: '+ $(this).attr('data-product-name')+'</td></tr>';                        
                        parksummary +='<tr><td>Travel Type </td><td>: '+ travel_type +'</td></tr>'; 
                        parksummary +='<tr><td>Travel Date </td><td>: '+ tourdate +'</td></tr>'; 
                        ///SIC 
                        if(travel_type=="SIC"){                                           
                            parksummary +='<tr><td>Adult </td><td>: '+ adultnumbers +'</td></tr>';                        
                            parksummary +='<tr><td>Child </td><td>: '+ childumbers +'</td></tr>';                        
                            parksummary +='<tr><td>Adult Price </td><td>: '+CURRENCY_SYMBOL+''+ adultprice +'</td></tr>';                        
                            parksummary +='<tr><td>Child Price </td><td>: '+CURRENCY_SYMBOL+''+ childprice +'</td></tr>';                        
                            parksummary +='<tr><td>Pickup Location </td><td>: '+ pickupLocation +'</td></tr>'; 
                        }
                        ///PRIVATE
                        if(travel_type=="Private"){
                            var textvalset  = $('.myboxforprivate_'+product_id+' .cs-options ul li.cs-selected').children('span').text();
                            parksummary +='<tr><td>Passengers </td><td>: '+ textvalset +'</td></tr>';
                        }
                        //WITHOUT TRANSFER 
                        if(travel_type=='without_transfer'){
                            parksummary +='<tr><td>Adult </td><td>: '+ adultnumbers +'</td></tr>';                        
                            parksummary +='<tr><td>Child </td><td>: '+ childumbers +'</td></tr>';                        
                            parksummary +='<tr><td>Adult Price </td><td>: '+CURRENCY_SYMBOL+''+ adultprice +'</td></tr>';                        
                            parksummary +='<tr><td>Child Price </td><td>: '+CURRENCY_SYMBOL+''+ childprice +'</td></tr>';      
                        }                         
                    }
                });
                if(tours_count==0){
                    parksummary += '<tr><td> No parks selected</td></tr>';
                    $('#parks_summary tbody').append(parksummary);
                }else{
                  $('#parks_summary tbody').append(parksummary);  
                }
                
                ///airport transfer summary
                var vehicle_selected = $("#vehicle option:selected").text();
                var transfer_summary = '';
                if(vehicle_selected=="Select Vehicle"){
                    transfer_summary += '<tr>'
                    transfer_summary += '<td colspan="2">No transportation selected</td>';                    
                    transfer_summary += '</tr>';
                    $('#airport_summary tbody').append(transfer_summary);
                }else{
                    var vehicle_id       = $("#vehicle option:selected").val();
                    var airport_selected = $("#airport_"+vehicle_id+" option:selected").text();
                    var transfer_from    = $('#typedirection').val();
                    var tour_date        = $('input[name=tourdate]').val();
                    var pickuplocation   = $('#pickuplocation').val();
                    var dropofflocation  = $('#dropofflocation').val();
                    var pickuptime       = $('#pickuptime').val();              
                    $('#sel_vehicle').append(vehicle_selected);        
                    $('#sel_airport').append(airport_selected);        
                    $('#sel_transfer').append(transfer_from);        
                    $('#sel_tourdate').append(tour_date);        
                    $('#sel_pickuplocation').append(pickuplocation);        
                    $('#sel_dropofflocation').append(dropofflocation);        
                    $('#sel_pickuptime').append(pickuptime);
                    $('#pickuplocationvisa').val(pickuplocation);
                    transfer_summary += '<tr>';
                    transfer_summary += '<td>Selected Vehicle </td>';
                    transfer_summary += '<td id="sel_vehicle">: '+vehicle_id+'</td>';
                    transfer_summary += '</tr>';
                    transfer_summary += '<tr>';
                    transfer_summary += '<td>Selected Airport</td>';
                    transfer_summary += '<td id="sel_airport">: '+airport_selected+'</td>';
                    transfer_summary += '</tr>';                    
                    transfer_summary += '<tr>';
                    transfer_summary += '<td>Transfer From</td>';
                    transfer_summary += '<td id="sel_transfer">: '+transfer_from+'</td>';
                    transfer_summary += '</tr>';                       
                    transfer_summary += '<tr>';
                    transfer_summary += '<td>Travel Date</td>';
                    transfer_summary += '<td id="sel_tourdate">: '+tour_date+'</td>';
                    transfer_summary += '</tr>';
                    transfer_summary += '<tr>';
                    transfer_summary += '<td>Pickup location</td>';
                    transfer_summary += '<td id="sel_pickuplocation">: '+pickuplocation+'</td>';
                    transfer_summary += '</tr>';
                    transfer_summary += '<tr>';
                    transfer_summary += '<td>Drop Off location</td>';
                    transfer_summary += '<td id="sel_dropofflocation">: '+dropofflocation+'</td>';
                    transfer_summary += '</tr>';
                    transfer_summary += '<tr>';
                    transfer_summary += '<td>Pickup Time</td>';
                    transfer_summary += '<td id="sel_pickuptime">: '+pickuptime+'</td>';
                    transfer_summary += '</tr>';  
                    $('#airport_summary tbody').append(transfer_summary);
                }     

            }            

            var total_room_price    = parseFloat($('#room_total_price').html()) + parseFloat($('#meal_total_price').html());
            total_room_price = total_room_price.toFixed(2);
            var meal_total_price    = $('#meal_total_price').html();
            var total_visa_price    = $('#visa_total_price').html();
            var total_tour_price    = $('#tours_total_price').html();
            var parks_total_price    = $('#parks_total_price').html();
            var total_airport_price = $('#airport_total_price ').html();


            //set all total amount for the summary
            $('#hotel_total_amount').html(CURRENCY_SYMBOL+''+total_room_price);
            $('#visa_total_amount').html(CURRENCY_SYMBOL+''+total_visa_price);
            $('#tours_total_amount').html(CURRENCY_SYMBOL+''+total_tour_price);
            $('#parks_total_amount').html(CURRENCY_SYMBOL+''+parks_total_price);
            $('#airport_total_amount').html(CURRENCY_SYMBOL+''+total_airport_price);

            var total_package_price = 0;
            if(total_room_price !=undefined){
                total_package_price = parseFloat(total_package_price) + parseFloat(total_room_price);
            }
            if(total_visa_price !=undefined){
                total_package_price = parseFloat(total_package_price) + parseFloat(total_visa_price);
            }
            if(total_tour_price !=undefined){
                total_package_price = parseFloat(total_package_price) + parseFloat(total_tour_price);
            }
            if(parks_total_price !=undefined){
                total_package_price = parseFloat(total_package_price) + parseFloat(parks_total_price);
            }
            if(total_airport_price !=undefined){
                total_package_price = parseFloat(total_package_price) + parseFloat(total_airport_price);
            }

            $('#summary_total_price').html(total_package_price.toFixed(2));
            $('#custom_price').val(total_package_price.toFixed(2));


        });

    $( function() {
          $( ".datepickeroncat" ).datepicker({ 
            dateFormat: 'dd-mm-yy' , 
            minDate : 0,
            onSelect: function(dateText, inst) {
                $('#'+inst.id).attr('value',dateText);
                $(this).trigger('blur');
            }
            });
        } );
</script>
<?php if($visa_option==1){?>
<script type="text/javascript">
    var visa_row = '<?php echo $visa_row +1 ; ?>';
    $(document).on('click','#add_visa',function(e){
        e.preventDefault(); 
        console.log('add visa');
        html='<tr id="'+visa_row+'">';
        html+='<td>';
        html+='<input type="text" placeholder="Your name" name="visa_appication['+visa_row+'][applicant_name]" id="visa_applicant_'+visa_row+'" class="mandatory"/>';
        html+='</td>';
        html+='<td>';
        html+='<select id="visa_option_'+visa_row+'" data-key="'+visa_row+'" name=visa_appication['+visa_row+'][visa_option]" class="visa_option mandatory">';
        html+='<option value="">Select</option>';
        <?php foreach($visaoptions as $options){ ?>
        html+='<option value="<?php echo $options['option_name']; ?>" data-option-id="<?php echo $options['option_id']; ?>" data-price="<?php echo preg_replace( '/[^.\d]/', '', $options['option_value']); ?>"><?php echo $options['option_name']; ?></option>';
        <?php } ?>
        html+='</select></td>';
        html+='<td class="hotel-room-price">';
        html+='<div class="hotel-main-rate">';
        html+='<h2><span class="main-rate visa_main_rate" id="visa_rate_'+visa_row+'" >'+CURRENCY_SYMBOL+'0</span></h2>';
        html+='<input type="hidden" name="visa_appication['+visa_row+'][visa_price]" id="visa_price_'+visa_row+'" class="visa_price">'
        html+='</div>';
        html+='</td>';
        html+='<td>';
        html+='<div class="attach-copy">';
        html+='<input type="file" name="visa_appication['+visa_row+'][travellerspassportfront]" class="mandatory"/>';
        html+='<input type="text" placeholder="Attach your passport front"/>';
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
        html+='<input type="file" name="visa_appication['+visa_row+'][travellerspassportback]" class="mandatory"/>';
        html+='<input type="text" placeholder="Attach your passport back"/>';
        html+='<span class="attachment-attach"><i class="fa fa-paperclip" aria-hidden="true"></i></span>';
        html+='<span class="view-attachement">';
        html+='<i class="fa fa-eye" aria-hidden="true"></i>';
        html+=' <div class="attachment-view">';
        html+=' <i class="fa fa-times attach-close" aria-hidden="true"></i>';
        html+=' <img id="visa_appication['+visa_row+'][travellerspassportback]" src="#" alt="your image" />';
        html+='</div>';
        html+='</span>';
        html+='</div>';
        html+='<div class="attach-copy">';
        html+='<input type="file" name="visa_appication['+visa_row+'][passportphoto]" class="mandatory"/>';
        html+='<input type="text" placeholder="Attach your Picture"/>';
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
    });
    </script>
    <?php } ?>

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
    $(document).ready(function () {

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
    
    $(document).on('change','.airport_options',function(){
        var product_option_id       = $('option:selected', this).attr('data-product-option-id'); 
        var product_option_value_id = $('option:selected', this).attr('data-product-option-value-id'); 
        var data_type               = $('option:selected', this).attr('data-type'); 
        var data_price              = $('option:selected', this).attr('data-price').replace(/[^\d\.]/g, ''); 
        console.log(data_price);
        //$('#airport_total_price').text(Math.ceil(data_price));
        $('#airport_total_price').text(data_price);
        optionhtml = '<input class="optionhidval" type="hidden" name="transfer[transfer_option]['+product_option_id+']" value="'+product_option_value_id+'" />';
        $('.optionhidset').html(optionhtml);
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
        //console.log($('#room_type_form').serialize());
        var room_otions = new FormData($('#room_type_form')[0]);
        var visa_application = new FormData($('#visa_form')[0]);
         $.ajax({
            url: 'index.php?route=product/makepackage/addRoomOptions',
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
        $("#buttonstorepackage").click(function(){
            console.log('add to cart');

            //formroomssubmit();
            /*return false;*/ 

           $.ajax({
                    url: 'index.php?route=checkout/cart/add',
                    type: 'post',
                    dataType: 'json',
                    //data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueidtour,.cusproductoptionvalueidpark,.pickuplocationvisa,.tourdatevisa, #airport_section input[type=\'text\'], #airport_section input[type=\'hidden\'], #airport_section select,#touroptions input[type=\'hidden\'],#parkoptions input[type=\'hidden\']'),
                    data: new FormData($('#room_type_form')[0]),                    
                    processData: false,
                    contentType: false,
                    beforeSend: function() {
                        $('#buttonstorepackage').button('loading');
                    },
                    complete: function() {
                        $('#buttonstorepackage').button('reset');
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
                           //formroomssubmit();
                         
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
    });   
</script>
<script type="text/javascript"><!--
        
/*defalut call function mycalculationscombo(14) for without transfer */

function chkvaldation(val,product_id)
{
    
    console.log('inside check validation');
    var n_adultnumbers = $( "#adultnumbers_"+product_id ).val();
    console.log('adult numbers'+n_adultnumbers);
    /*var n_adultnumbers = $( "input[name='childumbers']" ).length;*/
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker_"+product_id).val();
    var pickuplocations_chk     = $("#pickuplocations_"+product_id).val();
    console.log(datepicker_chk);
    /*  if parent child concept is there or not   */
    if(n_adultnumbers>0)
    {
        var chk_adultnumbers = $( "#adultnumbers_"+product_id ).val();
        var chk_childumbers = $( "#childumbers_"+product_id ).val();
        
        if(chk_adultnumbers!=0 || chk_childumbers!=0 )
        {           


            if(datepicker_chk!='' && pickuplocations_chk!='' )
            {
                //$('#button-cart').prop('disabled', false);
                $("#tour_add_package_"+product_id).prop('disabled', false);
            }
            else
            {
                //$('#button-cart').prop('disabled', true);
                $("#tour_add_package_"+product_id).prop('disabled', true);
            }    
        }
        else
        {
            $("#tour_add_package_"+product_id).prop('disabled', true);
            //$('#button-cart').prop('disabled', true);
        }
            
    }
    else
    {
        /*it means private */
        var chk_private = $('.cusproductoptionvalueid_'+product_id).length;
        if(chk_private!=0)
        {
             
             var chk_adultnumbers = $( "#adultnumbers_"+product_id ).val();
             var chk_childumbers = $( "#childumbers_"+product_id ).val();
             if(datepicker_chk!='' && pickuplocations_chk!='' )
             {
                //$('#button-cart').prop('disabled', false);
                $("#tour_add_package_"+product_id).prop('disabled', false);
             }
             else
             {
                //$('#button-cart').prop('disabled', true);
                $("#tour_add_package_"+product_id).prop('disabled', true);
             } 
        }
        else
        {
            //$('#button-cart').prop('disabled', true);
            $("#tour_add_package_"+product_id).prop('disabled', true);
        }
    }
    
}

function chkvaldationpark(val,product_id)
{
    console.log(product_id);
    console.log('inside check validation');
    var n_adultnumbers = $( "#adultnumbers_"+product_id ).val();
    console.log('adult numbers'+n_adultnumbers);
    /*var n_adultnumbers = $( "input[name='childumbers']" ).length;*/
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker_"+product_id).val();
    var pickuplocations_chk     = $("#pickuplocations_"+product_id).val();
    
    /*  if parent child concept is there or not   */
    if(n_adultnumbers>0)
    {
        var chk_adultnumbers = $( "#adultnumbers_"+product_id ).val();
        var chk_childumbers = $( "#childumbers_"+product_id ).val();
        
        if(chk_adultnumbers!=0 || chk_childumbers!=0 )
        {
          
            var type =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li.cs-selected').children('span').text();
            console.log(type);
            if(type=='Without Transfer'){

                console.log('inside type:');
                console.log(datepicker_chk);
                console.log($("#datepicker_"+product_id).val());
                if($("#datepicker_"+product_id).val()!=''){
                    //$('#button-cart').prop('disabled', false);
                    $("#parks_add_package_"+product_id).prop('disabled', false);
                }else{
                    //$('#button-cart').prop('disabled', true);
                    $("#parks_add_package_"+product_id).prop('disabled', true);
                } 
            

            }else{
                if(datepicker_chk!='' && pickuplocations_chk!='' ){
                    //$('#button-cart').prop('disabled', false);
                    $("#parks_add_package_"+product_id).prop('disabled', false);
                }else{
                    //$('#button-cart').prop('disabled', true);
                    $("#parks_add_package_"+product_id).prop('disabled', true);
                } 

            }


        }
        else
        {
            $("#parks_add_package_"+product_id).prop('disabled', true);
            //$('#button-cart').prop('disabled', true);
        }
            
    }
    else
    {
        /*it means private */
        var chk_private = $('.cusproductoptionvalueid_'+product_id).length;
        if(chk_private!=0)
        {
             
             var chk_adultnumbers = $( "#adultnumbers_"+product_id ).val();
             var chk_childumbers = $( "#childumbers_"+product_id ).val();
             if(datepicker_chk!='' && pickuplocations_chk!='' )
             {
                //$('#button-cart').prop('disabled', false);
                $("#parks_add_package_"+product_id).prop('disabled', false);
             }
             else
             {
                //$('#button-cart').prop('disabled', true);
                $("#parks_add_package_"+product_id).prop('disabled', true);
             } 
        }
        else
        {
            //$('#button-cart').prop('disabled', true);
            $("#parks_add_package_"+product_id).prop('disabled', true);
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
function mycalculationsprivateparent(optionid,product_id) //771
{
    
    ///remove add to package checkbox tick mark
    $("#tour_add_package_"+product_id).prop('checked', false); 
    $("#tour_add_package_"+product_id).prop('disabled', true);
    calculateTourTotal();

    $('.setcalprice_'+product_id).removeClass('hide');
    $('.setcalprice_'+product_id).html('');
    totalsumtext        = "Total: "+CURRENCY_SYMBOL+" 0";
    $('.book-total_'+product_id).text(totalsumtext);
     
    top_up =   $('.top_up_'+product_id).val(); 
    console.log(top_up); 
    $('.myboxescalculations_'+product_id).html(''); 
    /*inputhideengen = '<input type="hidden" name="privatetypepackage" />';*/
    if(top_up==1)
      {
       
        adult_price =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-price');
        child_price =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-childprice');
         
         html = '<div class="book-rate_'+product_id+'"><span>Adult: </span><span class="adultpricetotal_'+product_id+'">'+CURRENCY_SYMBOL+'  0</span><span>Children:</span><span class="childpricetotal_'+product_id+'">'+CURRENCY_SYMBOL+' 0</span></div>';
         $('.setcalprice_'+product_id).removeClass('hide');
         $('.setcalprice_'+product_id).html(html);
         $(".myboxescalculations_"+product_id).html('<div class="book-pick"><span>No of Adults</span><span><input value="" class="adultssss_'+product_id+'" onblur="priceadult(this.value,'+adult_price+','+product_id+')"  name="tours['+product_id+'][adultnumbers]" type="text" placeholder="00"></span><span>No of Childrens</span><span><input value="" class="childssss_'+product_id+'" onblur="pricechild(this.value,'+child_price+','+product_id+')" name="tours['+product_id+'][childumbers]"  type="text" placeholder="00"></span></div>');
      }
    else
    {
         $(".childhidprice_"+product_id).val(0)
         $(".parenthidprice_"+product_id).val(1)
        
    }  
       
    type = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-type');
    $('.myfirstsectlcus_'+product_id+' .cs-selected').removeClass('cs-selected');  
    $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('class','cs-selected');
    $('.myfirstsectlcus_'+product_id+' .cs-placeholder').text(type);
    $('.myboxforprivate_'+product_id).removeClass('hide');
    $(".transfer_rate_"+product_id).addClass('hide');
    $(".transferprice_"+product_id).html(' ');

    if(type=='Without Transfer')
       {  type_latest='Without Transfer';}
      else{
        type_latest=type;
      } 
      
     $(".travel_type_"+product_id).val(type_latest);
    //html ='<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">Select Transfer</span><div class="cs-options"><ul></ul></div></div>';
    /*option element null html remove input*/
     optioninput  ='';
    
     $('.otpinhidvaluehere_'+product_id).html(optioninput);
    
}
//parks
function mycalculationsprivateparentparks(optionid,product_id) //771
{
    ///remove add to package checkbox tick mark
    $("#parks_add_package_"+product_id).prop('checked', false);
    $("#parks_add_package_"+product_id).prop('disabled', true); 
    calculateParksTotal();

    $('.setcalprice_'+product_id).removeClass('hide');
    $('.setcalprice_'+product_id).html('');
    totalsumtext        = "Total: "+CURRENCY_SYMBOL+" 0";
    $('.book-total_'+product_id).text(totalsumtext);
     
    top_up =   $('.top_up_'+product_id).val(); 
    console.log(top_up); 
    $('.myboxescalculations_'+product_id).html(''); 
    /*inputhideengen = '<input type="hidden" name="privatetypepackage" />';*/
    if(top_up==1)
      {
       
        adult_price =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-price');
        child_price =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-childprice');
         
         html = '<div class="book-rate"><span>Adult: </span><span class="adultpricetotal_'+product_id+'">'+CURRENCY_SYMBOL+'  0</span><span> Children:</span><span class="childpricetotal_'+product_id+'">'+CURRENCY_SYMBOL+' 0</span></div>';
         $('.setcalprice_'+product_id).removeClass('hide');
         $('.setcalprice_'+product_id).html(html);
         $(".myboxescalculations_"+product_id).html('<div class="book-pick"><span>No of Adults</span><span><input value="" id="adultnumbers_'+product_id+'" class="adultssss_'+product_id+'" onblur="priceadultparks(this.value,'+adult_price+','+product_id+')"  name="parks['+product_id+'][adultnumbers]" type="text" placeholder="00"></span><span>No of Childrens</span><span><input value="" class="childssss_'+product_id+'" id="adultnumbers_'+product_id+'" onblur="pricechildparks(this.value,'+child_price+','+product_id+')" name="parks['+product_id+'][childumbers]"  type="text" placeholder="00"></span></div>');
      }
    else
    {
         $(".childhidprice_"+product_id).val(0)
         $(".parenthidprice_"+product_id).val(1)
        
    }  
       
    type = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-type');
    $('.myfirstsectlcus_'+product_id+' .cs-selected').removeClass('cs-selected');  
    $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('class','cs-selected');
    $('.myfirstsectlcus_'+product_id+' .cs-placeholder').text(type);
    $('.myboxforprivate_'+product_id).removeClass('hide');
    $(".transfer_rate_"+product_id).addClass('hide');
    $(".transferprice_"+product_id).html(' ');
    console.log
    if(type=='Without Transfer')
       {  type_latest='Without Transfer';}
      else{
        type_latest=type;
      } 
      
     $(".travel_type_"+product_id).val(type_latest);
    //html ='<div class="cs-select cs-skin-border" tabindex="0"><span class="cs-placeholder">Select Transfer</span><div class="cs-options"><ul></ul></div></div>';
    /*option element null html remove input*/
     optioninput  ='';
    
     $('.otpinhidvaluehere_'+product_id).html(optioninput);
    
}

function mycalculationprivate(optionidprivate,product_id)
{
    
    ///remove add to package checkbox tick mark
    $("#tour_add_package_"+product_id).prop('checked', false);
    $("#tour_add_package_"+product_id).prop('disabled', true); 
    calculateTourTotal();

    var top_up = $('.top_up_'+product_id).val();
    
    
    //type                = $('.myboxforprivate .cs-options ul li[data-option-id='+optionidprivate+']').attr('data-type');
    privateprice        = $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-price').replace(/[^\d\.]/g, '');
    totalsumtext        = "Total: "+CURRENCY_SYMBOL+" "+privateprice;
    
    productoptionid         = $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-product-option-id');
    productoptionvalueid    = $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-product-option-value-id');
    textvalset              = $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').children('span').text();
    
    if(top_up==1)
    {
        
        adult_price =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-product-option-id='+productoptionid+']').attr('data-price');
        
        child_price =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-product-option-id='+productoptionid+']').attr('data-childprice');
        child =  $('.childssss_'+product_id).val();
        adults =  $('.adultssss_'+product_id).val();
        $('.book-total_'+product_id).text('');
        child_values =    child*child_price;
        adults_values =   adults* adult_price;
        
        $(".transfer_rate_"+product_id).removeClass('hide');
        $(".transferprice_"+product_id).html(CURRENCY_SYMBOL+' '+parseFloat(privateprice));
        
        privateprice=  parseFloat(child_values) + parseFloat(adults_values) + parseFloat(privateprice);
        totalsumtext        = "Total: "+CURRENCY_SYMBOL+" "+privateprice;
                                
        $('.book-total_'+product_id).text(totalsumtext);
        
    }
    else
    {
          $('.book-total_'+product_id).text(totalsumtext);
    }
     $('.myboxforprivate_'+product_id+' .cs-selected').removeClass('cs-selected');  
     $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('class','cs-selected');
     $('.myboxforprivate_'+product_id+' .cs-placeholder').text(textvalset);
    
     $('.book-total_'+product_id).text(totalsumtext);
     $('.booktotal_'+product_id+' input [name="tours['+product_id+'][privatepricepakage]"]').html('');
     $('.book-total_'+product_id).append("<input type='hidden' name='tours["+product_id+"][privatepricepakage]' id='tour_privatepricepakage_"+product_id+"' value='"+privateprice+"' />");
    //html                = '<div class="book-rate"><span>Package </span><span class="privatepricepricetotal">AED : '+ privateprice +'</span></div><input type="hidden" name="privatepricepakage" />';
    //$('.myboxescalculations').html(html);
    /*hiden option value here*/
     $('.privatetotal_'+product_id).val(privateprice);
     optioninput  ='<input type="hidden" class="cusproductoptionvalueid_'+product_id+' cusproductoptionvalueidtour" name="tours['+product_id+'][option]['+productoptionid+']" value="'+productoptionvalueid+'" />';
     $('.otpinhidvaluehere_'+product_id).html(optioninput);
     
     
     /* Common Variable For date and locaion input val  */
     var datepicker_chk          = $("#datepicker_"+product_id).val();
     var pickuplocations_chk     = $("#pickuplocations_"+product_id).val();
     
     
     if(datepicker_chk!='' && pickuplocations_chk!='')
     {
        //$('#button-cart').prop('disabled', false);
        $("#tour_add_package_"+product_id).prop('disabled', false);
     }
     else
     {
        //$('#button-cart').prop('disabled', true);
        $("#tour_add_package_"+product_id).prop('disabled', true);
     }
     
    
}
////parks
function mycalculationprivateparks(optionidprivate,product_id)
{
    
    ///remove add to package checkbox tick mark
    $("#parks_add_package_"+product_id).prop('checked', false); 
    $("#parks_add_package_"+product_id).prop('disabled', true); 
    calculateParksTotal();

    var top_up = $('.top_up_'+product_id).val();
    
    
    //type                = $('.myboxforprivate .cs-options ul li[data-option-id='+optionidprivate+']').attr('data-type');
    privateprice        = $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-price').replace(/[^\d\.]/g, '');
    totalsumtext        = "Total: "+CURRENCY_SYMBOL+""+privateprice;
    
    productoptionid         = $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-product-option-id');
    productoptionvalueid    = $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('data-product-option-value-id');
    textvalset              = $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').children('span').text();
    
    if(top_up==1)
    {
        
        adult_price =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-product-option-id='+productoptionid+']').attr('data-price');
        
        child_price =  $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-product-option-id='+productoptionid+']').attr('data-childprice');
        child =  $('.childssss_'+product_id).val();
        adults =  $('.adultssss_'+product_id).val();
        $('.book-total_'+product_id).text('');
        child_values =    child*child_price;
        adults_values =   adults* adult_price;
        
        $(".transfer_rate_"+product_id).removeClass('hide');
         $(".transferprice_"+product_id).html(CURRENCY_SYMBOL+' '+parseFloat(privateprice));
        
        privateprice=  parseFloat(child_values) + parseFloat(adults_values) + parseFloat(privateprice);
        totalsumtext        = "Total: "+CURRENCY_SYMBOL+" "+privateprice;
                                
        $('.book-total_'+product_id).text(totalsumtext);
        
    }
    else
    {
          $('.book-total_'+product_id).text(totalsumtext);
    }
     $('.myboxforprivate_'+product_id+' .cs-selected').removeClass('cs-selected');  
     $('.myboxforprivate_'+product_id+' .cs-options ul li[data-option-value-id='+optionidprivate+']').attr('class','cs-selected');
     $('.myboxforprivate_'+product_id+' .cs-placeholder').text(textvalset);
    
     $('.book-total_'+product_id).text(totalsumtext);
     $('.booktotal_'+product_id+' input [name="parks['+product_id+'][privatepricepakage]"]').html('');
     $('.book-total_'+product_id).append("<input type='hidden' name='parks["+product_id+"][privatepricepakage]' value='"+privateprice+"' />");
    //html                = '<div class="book-rate"><span>Package </span><span class="privatepricepricetotal">AED : '+ privateprice +'</span></div><input type="hidden" name="privatepricepakage" />';
    //$('.myboxescalculations').html(html);
    /*hiden option value here*/
     $('.privatetotal_'+product_id).val(privateprice);
     optioninput  ='<input type="hidden" class="cusproductoptionvalueid_'+product_id+' cusproductoptionvalueidparks" name="parks['+product_id+'][option]['+productoptionid+']" value="'+productoptionvalueid+'" />';
     $('.otpinhidvaluehere_'+product_id).html(optioninput);
     
     
     /* Common Variable For date and locaion input val  */
     var datepicker_chk          = $("#datepicker").val();
     var pickuplocations_chk     = $("#pickuplocations").val();
     
     
     if(datepicker_chk!='' && pickuplocations_chk!='')
     {
        //$('#button-cart').prop('disabled', false);
        $("#tour_add_package_"+product_id).prop('disabled', false);
     }
     else
     {
        //$('#button-cart').prop('disabled', true);
        $("#tour_add_package_"+product_id).prop('disabled', true);
     }
     
    
}

function mycalculationscombo(optionid,product_id){
   
   console.log('mycalculationscombo');
   /*this function is for only SIC ANd Without transfer*/
     /*number of child andd adult  set by deafault 0 */
    familytype = $('input[name="familytype_'+product_id+'"]').val();     
    top_up     = $('input[name="top_up_'+product_id+'"]').val();
    ///remove add to package checkbox tick mark
    $("#tour_add_package_"+product_id).prop('checked', false); 
    $("#tour_add_package_"+product_id).prop('disabled', true); 
   
    calculateTourTotal();

    $(".childhidprice_"+product_id).val(0)
    $(".parenthidprice_"+product_id).val(0)   
     
     var html = '';
     $('.myboxforprivate_'+product_id).addClass('hide');
     
     type                    = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-type');
     price                   = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-price').replace(/[^\d\.]/g, '');
     childprice              = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-childprice').replace(/[^\d\.]/g, '');
     productoptionid         = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-id');
     productoptionvalueid    = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-value-id');
     console.log(type);
     if(type=='Without Transfer'){       
       type_latest='without_transfer';
       $('#pickup_'+product_id).addClass('hide');
    }else{
        type_latest=type;
        $('#pickup_'+product_id).removeClass('hide');

    }
     $(".travel_type_"+product_id).val(type_latest);
     //alert('productoptionvalueid:-'+productoptionvalueid +' productoptionid:-'+productoptionid);
     
     $('.myfirstsectlcus_'+product_id+' .cs-selected').removeClass('cs-selected');  
     $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('class','cs-selected');
     $('.myfirstsectlcus_'+product_id+' .cs-placeholder').text(type);
     totalsumtext        = CURRENCY_SYMBOL+"0";
     $('.book-total_'+product_id).text(totalsumtext); 
     
     /*first flush old value*/
     optioninput  ='';
     $('.otpinhidvaluehere_'+product_id).html(optioninput);
     optioninput  ='<input type="hidden" class="cusproductoptionvalueidtour" name="tours['+product_id+'][option]['+productoptionid+']" value="'+productoptionvalueid+'" />';
     $('.otpinhidvaluehere_'+product_id).html(optioninput);
     
     $(".transfer_rate_"+product_id).addClass('hide');
     $(".transferprice_"+product_id).html(' ');  
     if(familytype==1)
     {
         console.log('family type 1');
         $(".parenthidprice_"+product_id).val(1)
         
         //$(".myboxescalculations").html('<div class="book-pick"><span>No of Adults</span><span>2</span><span>No of Childrens</span><span>2</span></div>');
         inputhtmlfixed = '<div class="hide"><input value="1" name="tours['+product_id+'][adultnumbers]" type="hidden" id="adultnumbers_'+product_id+'><input value="" name="childumbers"  type="hidden" id="childnumbers_'+product_id+'></div>';
         $(".myboxescalculations").html('<div class="book-pick"><span>(1 Day) - (Family) - 2Adult & 2 Child</span>'+inputhtmlfixed+'</div>');
         //var $inputs = $('#form').find('input');
         priceadult(1,price);
     }
     else
     {
        console.log('family type 0');
     //alert(price);
         html    = '<div class="book-rate"><span>Adult: </span><span class="adultpricetotal_'+product_id+'">'+CURRENCY_SYMBOL+' 0</span><span>Children:</span><span class="childpricetotal_'+product_id+'">'+CURRENCY_SYMBOL+' 0</span></div>';
         $('.setcalprice_'+product_id).removeClass('hide');
         $('.setcalprice_'+product_id).html(html);
         $(".myboxescalculations_"+product_id).html('<div class="book-pick"><span>No of Adults</span><span><input value="" onblur="priceadult(this.value,price,'+product_id+')"  name="tours['+product_id+'][adultnumbers]" type="text" placeholder="00" id="adultnumbers_'+product_id+'"></span><span>No of Childrens</span><span><input value="" onblur="pricechild(this.value,childprice,'+product_id+')" name="tours['+product_id+'][childumbers]"  type="text" placeholder="00" id="childnumbers_'+product_id+'"></span></div>');      
    }    
}

//parks
function mycalculationscomboparks(optionid,product_id)
{
   
   console.log('mycalculationscombo');
   /*this function is for only SIC ANd Without transfer*/
     /*number of child andd adult  set by deafault 0 */
    familytype = $('input[name="familytype_'+product_id+'"]').val();     
    top_up     = $('input[name="top_up_'+product_id+'"]').val();
    
    ///remove add to package checkbox tick mark
    $("#parks_add_package_"+product_id).prop('checked', false); 
    $("#parks_add_package_"+product_id).prop('disabled', true);
    calculateParksTotal();

    $(".childhidprice_"+product_id).val(0)
    $(".parenthidprice_"+product_id).val(0)   
     
     var html = '';
     $('.myboxforprivate_'+product_id).addClass('hide');
     
     type                    = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-type');
     price                   = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-price').replace(/[^\d\.]/g, '');
     childprice              = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-childprice').replace(/[^\d\.]/g, '');
     productoptionid         = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-id');
     productoptionvalueid    = $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('data-product-option-value-id');
    if(type=='Without Transfer'){       
       type_latest='without_transfer';
       $('#pickup_'+product_id).addClass('hide');
    }else{
        type_latest=type;
        $('#pickup_'+product_id).removeClass('hide');

    } 
     $(".travel_type_"+product_id).val(type_latest);
     //alert('productoptionvalueid:-'+productoptionvalueid +' productoptionid:-'+productoptionid);
     
     $('.myfirstsectlcus_'+product_id+' .cs-selected').removeClass('cs-selected');  
     $('.myfirstsectlcus_'+product_id+' .cs-options ul li[data-option-id='+optionid+']').attr('class','cs-selected');
     $('.myfirstsectlcus_'+product_id+' .cs-placeholder').text(type);
     totalsumtext        = CURRENCY_SYMBOL+"0";
     $('.book-total_'+product_id).text(totalsumtext); 
     
     /*first flush old value*/
     optioninput  ='';
     $('.otpinhidvaluehere'+product_id).html(optioninput);
     optioninput  ='<input type="hidden" class="cusproductoptionvalueidpark" name="parks['+product_id+'][option]['+productoptionid+']" value="'+productoptionvalueid+'" />';
     $('.otpinhidvaluehere_'+product_id).html(optioninput);

     $(".transfer_rate_"+product_id).addClass('hide');
     $(".transferprice_"+product_id).html(' ');  
     if(familytype==1)
     {
         console.log('family type 1');
         $(".parenthidprice_"+product_id).val(1)
         
         //$(".myboxescalculations").html('<div class="book-pick"><span>No of Adults</span><span>2</span><span>No of Childrens</span><span>2</span></div>');
         inputhtmlfixed = '<div class="hide"><input value="1" name="adultnumbers" type="hidden" ><input value="" name="childumbers"  type="hidden"></div>';
         $(".myboxescalculations").html('<div class="book-pick"><span>(1 Day) - (Family) - 2Adult & 2 Child</span>'+inputhtmlfixed+'</div>');
         //var $inputs = $('#form').find('input');
         priceadult(1,price);
     }
     else
     {
        console.log('family type 0');
     //alert(price);
         html    = '<div class="book-rate"><span>Adult: </span><span class="adultpricetotal_'+product_id+'">'+CURRENCY_SYMBOL+' 0</span><span>Children:</span><span class="childpricetotal_'+product_id+'">'+CURRENCY_SYMBOL+' 0</span></div>';
         $('.setcalprice_'+product_id).removeClass('hide');
         $('.setcalprice_'+product_id).html(html);
         $(".myboxescalculations_"+product_id).html('<div class="book-pick"><span>No of Adults</span><span><input value="" onblur="priceadultparks(this.value,price,'+product_id+')"  name="parks['+product_id+'][adultnumbers]" type="text" placeholder="00" id="adultnumbers_'+product_id+'"></span><span>No of Childrens</span><span><input value="" onblur="pricechildparks(this.value,childprice,'+product_id+')" name="parks['+product_id+'][childumbers]"  type="text" placeholder="00" id="childnumbers_'+product_id+'"></span></div>');      
    }    
}

function priceadult(val,priceadult,product_id)
{
    console.log(priceadult);
    ///remove add to package checkbox tick mark
    $("#tour_add_package_"+product_id).prop('checked', false); 
    $("#tour_add_package_"+product_id).prop('disabled', true); 
    calculateTourTotal();

    var adultprice      = val*priceadult;
    texttotaladult      = CURRENCY_SYMBOL+': '+adultprice;
    $('.adultpricetotal_'+product_id).text(texttotaladult);
    $('input[name="tours['+product_id+'][totalpriceadult]"]').val(adultprice);
    childpriceget       = $('input[name="tours['+product_id+'][totalpricechild]"]').val();
    totalpricesum       = parseFloat(adultprice)+parseFloat(childpriceget);
    totalsumtext        = " Total: "+CURRENCY_SYMBOL+" "+totalpricesum;
    $('.book-total_'+product_id).text(totalsumtext);
    /*parenthidprice-childhidprice*/
    $('input[name="tours['+product_id+'][parenthidprice]"]').val(val)
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker_"+product_id).val();
    var pickuplocations_chk     = $("#pickuplocations_"+product_id).val();
   
    if(val!=0 && datepicker_chk!='' && pickuplocations_chk!='')
    {
        //$('#button-cart').prop('disabled', false);
        $("#tour_add_package_"+product_id).prop('disabled', false);
    }
    else
    {
        //$('#button-cart').prop('disabled', true);
        $("#tour_add_package_"+product_id).prop('disabled', true);
    }
    
}
//parks
function priceadultparks(val,priceadult,product_id)
{
    ///remove add to package checkbox tick mark
    $("#parks_add_package_"+product_id).prop('checked', false); 
    calculateParksTotal();

    console.log(priceadult);
    var adultprice      = val*priceadult;
    texttotaladult      = CURRENCY_SYMBOL+' '+adultprice;
    $('.adultpricetotal_'+product_id).text(texttotaladult);
    $('input[name="parks['+product_id+'][totalpriceadult]"]').val(adultprice);
    childpriceget       = $('input[name="parks['+product_id+'][totalpricechild]"]').val();
    totalpricesum       = parseFloat(adultprice)+parseFloat(childpriceget);
    totalsumtext        = " Total: "+CURRENCY_SYMBOL+" "+totalpricesum;
    $('.book-total_'+product_id).text(totalsumtext);
    /*parenthidprice-childhidprice*/
    $('input[name="parks['+product_id+'][parenthidprice]"]').val(val)
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker_"+product_id).val();
    var pickuplocations_chk     = $("#pickuplocations_"+product_id).val();
   
    if(val!=0 && datepicker_chk!='' && pickuplocations_chk!='')
    {
        //$('#button-cart').prop('disabled', false);
        $("#tour_add_package_"+product_id).prop('disabled', false);
    }
    else
    {
        //$('#button-cart').prop('disabled', true);
        $("#tour_add_package_"+product_id).prop('disabled', true);
    }
    
}
function pricechild(val,pricechild,product_id)
{
    ///remove add to package checkbox tick mark
    $("#tour_add_package_"+product_id).prop('checked', false); 
    calculateTourTotal()
    //alert("value=:-"+val+"Aduklt price per"+priceadult);
    var childpriceval    = val*pricechild;
    texttotalchild= CURRENCY_SYMBOL+': '+childpriceval;
    $('.childpricetotal_'+product_id).text(texttotalchild);
    /*totalpricechild*/
    $('input[name="tours['+product_id+'][totalpricechild]"]').val(childpriceval);
    adultpriceget       = $('input[name="tours['+product_id+'][totalpriceadult]"]').val();
    //if(childpriceget=='' || childpriceget==' '){alert("hdjkjdkhjdhjj");}
    totalpricesum       = parseFloat(adultpriceget)+parseFloat(childpriceval);
    totalsumtext = " Total: "+CURRENCY_SYMBOL+" "+totalpricesum;
    $('.book-total_'+product_id).text(totalsumtext);
    /*parenthidprice-childhidprice*/
    $('input[name="tours['+product_id+'][childhidprice]"]').val(val)
    
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker_"+product_id).val();
    var pickuplocations_chk     = $("#pickuplocations_"+product_id).val();
    if(datepicker_chk!='' || pickuplocations_chk!='')
    {
        //$('#button-cart').prop('disabled', false);
        $("#tour_add_package_"+product_id).prop('disabled', false);
    }
    else
    {
        //$('#button-cart').prop('disabled', true);
        $("#tour_add_package_"+product_id).prop('disabled', true);
    }
} 
//parks
function pricechildparks(val,pricechild,product_id)
{
    ///remove add to package checkbox tick mark
    $("#parks_add_package_"+product_id).prop('checked', false); 
    calculateParksTotal();

    //alert("value=:-"+val+"Aduklt price per"+priceadult);
    var childpriceval    = val*pricechild;
    texttotalchild= CURRENCY_SYMBOL+' '+childpriceval;
    $('.childpricetotal_'+product_id).text(texttotalchild);
    /*totalpricechild*/
    $('input[name="parks['+product_id+'][totalpricechild]"]').val(childpriceval);
    adultpriceget       = $('input[name="parks['+product_id+'][totalpriceadult]"]').val();
    //if(childpriceget=='' || childpriceget==' '){alert("hdjkjdkhjdhjj");}
    totalpricesum       = parseFloat(adultpriceget)+parseFloat(childpriceval);
    totalsumtext = " Total: "+CURRENCY_SYMBOL+" "+totalpricesum;
    $('.book-total_'+product_id).text(totalsumtext);
    /*parenthidprice-childhidprice*/
    $('input[name="parks['+product_id+'][childhidprice]"]').val(val)
    
    /* Common Variable For date and locaion input val  */
    var datepicker_chk          = $("#datepicker_"+product_id).val();
    var pickuplocations_chk     = $("#pickuplocations_"+product_id).val();
    if( datepicker_chk!='' || pickuplocations_chk!='')
    {
        //$('#button-cart').prop('disabled', false);
        $("#tour_add_package_"+product_id).prop('disabled', false);
    }
    else
    {
        //$('#button-cart').prop('disabled', true);
        $("#tour_add_package_"+product_id).prop('disabled', true);
    }
} 



//--></script>