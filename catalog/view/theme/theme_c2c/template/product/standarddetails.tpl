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
<section class="hotel-tab-head standard-packg-head">
    <div class="container">
        <ul class="clearfix <?php if($visa_option==1){ echo 'div-six'; }else{ echo 'div-five';}?>">
            <li class="active">HOTEL BOOKING</li>
            <?php if($visa_option==1){?>
            <li>VISA</li>
            <?php } ?>
            <li>TOURS & EXCURSIONS</li>
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
                                <option value="">SELECT</option>
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
                                <p><span>Adults : </span> <?php echo $currencysymbol; ?><span id="meal_adult_no_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span><?php echo $currencysymbol; ?><span id="meal_child_no_<?php echo $key; ?>">0</span></p>
                            </div>
                            <div class="option_NA_<?php echo $key; ?> hide">
                                <p><span>Adults : </span> <?php echo $currencysymbol; ?><span id="meal_adult_NA_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span> <?php echo $currencysymbol; ?><span id="meal_child_NA_<?php echo $key; ?>">0</span></p>
                            </div>
                            <div class="option_BB_<?php echo $key; ?> hide">
                                <p><span>Adults : </span><span id="meal_adult_BB_<?php echo $key; ?>"><?php echo $options['ind_adult_BB_price']; ?></span></p>
                                <p><span>Children : </span><span id="meal_child_BB_<?php echo $key; ?>"><?php echo $options['ind_child_BB_price']; ?></span></p>
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
                                <p><span>Adults : </span> <?php echo $currencysymbol; ?><span id="meal_adult_no_<?php echo $key; ?>">0</span></p>
                                <p><span>Children : </span> <?php echo $currencysymbol; ?><span id="meal_child_no_<?php echo $key; ?>">0</span></p>
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
                            <p>Room Total : <?php echo $currencysymbol; ?> <span id="room_total_price">0</span> / Meal Plan : <?php echo $currencysymbol; ?> <span id="meal_total_price">0</span></p>
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
                <?php $visa_row = 0; ?>

                <?php 
                if($total_people > 0 ){
                
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
                                <option value="<?php echo $visa['option_name']; ?>" data-option-id="<?php echo $visa['option_id']; ?>" data-price="<?php echo preg_replace( '/[^.\d]/', '', $visa['option_value']);  ?>"><?php echo $visa['option_name']; ?></option>
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
                               <?php foreach($visaoptions as $visa){ ?>
                                <option value="<?php echo $visa['option_name']; ?>" data-price="<?php echo $visa['option_value']; ?>"><?php echo $visa['option_name']; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <td class="hotel-room-price">
                            <div class="hotel-main-rate">
                                <h2><?php echo $currencysymbol; ?><span class="main-rate" id="visa_rate_<?php echo $visa_row; ?>"> 0</span></h2>
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
                        <p>Visa Total : <?php echo $currencysymbol; ?> <span id="visa_total_price">0</span></p>
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
        <div class="standard-tour-section">
            <?php   
            foreach($tourlist as $tours){
                $tour_class='';
                if($tours['product_id']==217){
                    $tour_class='desert-safari';
                }
                if($tours['product_id']== 112){
                    $tour_class='dubai-tour';
                }
                if($tours['product_id']== 104 || $tours['product_id']== 107 || $tours['product_id']== 109){
                    $tour_class='dinner-dhow';
                }
            ?>
            <div class="standard-tour-container <?php echo $tour_class; ?>">
                <h2><?php echo $tours['name']; ?></h2>
                <div class="comment more"><?php $pattern ="#<p>(\s|&nbsp;|</?\s?br\s?/?>)*</?p>#"; echo preg_replace($pattern, '', $tours['description']);  ?></div>
            </div>
            <?php } ?>
            <input type="hidden" name="tours[products]" value="<?php echo implode(',',$tourids); ?>">
            <input type="hidden" name="tours[tour_price]" value="<?php echo $total_tour_price; ?>">
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
                        <p>Tour's Total : <span id="tour_total_price"><?php echo $total_tour_price; ?></span></p>
                    </td>
                    <td class="details-bottom-button">
                        <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                        <a  href="javascript:void(0);" class="next">proceed to airport transfer</a>
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
                    <option>Select Airport</option>                    
                </select>
                <?php foreach($transfer_products as $transport){ ?> 
                <select name="transfer[airport]" id="airport_<?php echo $transport['product_id']; ?>" class="airport_options hide">
                    <option>Select Airport</option> 
                    <?php foreach($transport['options'] as $option){
                        $attr = 'data-price="'.$option['product_option_value'][0]['price'].'" data-product-option-id="'.$option['product_option_id'].'" data-product-option-value-id="'.$option['product_option_value'][0]['product_option_value_id'].'" data-option-id="'.$option['option_id'].'" data-type="'.$option['name'].'" onclick="setoptionvalue('.$option['option_id'].')" ';
                    ?>
                    <option <?php echo $attr; ?> ><?php echo $option['name']; ?></option>
                    <?php }?>                   
                </select>
                <?php } ?>    
            </div>
            <?php if($transfer_option==0){?>
            <div class="col-md-6 airport-form">
                <select name="transfer[typedirection]" id="typedirection">
                    <option value="" disabled selected>Transfer From</option>
                    <option value="From Airport to Hotel in Dubai">From Airport to Hotel in Dubai</option>
                    <option value="From Hotel To Airport in Dubai">From Hotel To Airport in Dubai</option>
                </select>
            </div>
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
                        <p>Airpot Transfer Total : <?php echo $currencysymbol; ?> <span id="airport_total_price">0</span></p>
                    </td>
                    <td class="details-bottom-button">
                        <button class="prev-button"><i class="fa fa-angle-left" aria-hidden="true"></i>Back</button>
                        <a href="javascript:void(0);" class="next" <?php //if($transfer_option==1){ ?> id="last_next" <?php //} ?>> proceed to flight ticket</a>
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
                        <tr>
                            <td>Tour 1</td>
                            <td>: Desert Safari</td>
                        </tr>
                        <tr>
                            <td>Tour 2</td>
                            <td>: Dubai City Tour</td>
                        </tr>
                        <?php if($star_rating=='3'){?>
                        <tr>
                            <td>Tour 3</td>
                            <td>: Dhow Cruise- Dubai Creek</td>
                        </tr>
                        <?php }else if($star_rating=='4'){ ?>
                        <tr>
                            <td>Tour 3</td>
                            <td>: Dhow Cruise- Dubai Marina</td>
                        </tr>   

                        <?php } if($star_rating=='5'){?>
                        <tr>
                            <td>Tour 3</td>
                            <td>: Dhow Cruise- Dubai Canal</td>
                        </tr>  
                        <?php } ?>
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

                                <p id="hotel_total_amount"><?php echo $currencysymbol; ?> 0</p>
                            </td>
                        </tr>
                        <?php if($visa_option==1){ ?>
                        <tr>
                            <td>
                                <p><i class="fa fa-check" aria-hidden="true"></i>Visa</p>

                                <p id="visa_total_amount"><?php echo $currencysymbol; ?> 0</p>
                            </td>
                        </tr>  
                         <?php } ?>                      
                        <tr>
                            <td>
                                <p><i class="fa fa-check" aria-hidden="true"></i>Tours & Excursions</p>

                                <p id="tours_total_amount"><?php echo $currencysymbol; ?> <?php echo $total_tour_price; ?></p>
                            </td>
                        </tr>                        
                        <?php //if($transfer_option==1){ ?>
                        <tr>
                            <td>
                                <p><i class="fa fa-check" aria-hidden="true"></i>Airport Transfer</p>

                                <p id="airport_total_amount"><?php echo $currencysymbol; ?> 0</p>
                            </td>
                        </tr>
                        <?php //} ?>
                        <tr class="summary-total-price">
                            <td><p>Total : <?php echo $currencysymbol; ?> <span id="summary_total_price">0</span></p></td>

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
<input type="hidden" name="tour_options" id="tour_options" value="<?php echo $star_rating; ?>" />
<input type="hidden" name="nationality"  id="nationality" value="<?php echo $filter_id; ?>" />
<input type="hidden" name="no_of_days"  id="no_of_day" value="<?php echo $no_of_days; ?>" />
<input type="hidden" name="adult_num"  id="adult_num" value="<?php echo $filter_adult; ?>" />
<input type="hidden" name="child_num"  id="child_num" value="<?php echo $filter_child; ?>" />
<input type="hidden" name="product_type"  id="product_type" value="SP" />
<!-- hideen data  -->
<input type="hidden" value="1" name="childhidprice" class="childhidprice"/>
<input type="hidden" value="1" name="parenthidprice" class="parenthidprice"/>
<input type="hidden" value="<?php echo date("d-m-Y"); ?>" name="tourdate" class="tourdatevisa"/>
<input type="hidden" value="" name="pickuplocation" class="pickuplocationvisa"/>
</div>
</form>


<?php echo $footer; ?>
<script type="text/javascript">
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
                if($('#discount_'+key).val()!=0){
                    console.log($('#discount_'+key).val());
                    var discount_percentage = $('#discount_'+key).val();
                    var discount_amount = (discount_percentage / 100) * per_night;
                    console.log(discount_amount);
                    room_total_amount = (room_total_amount - discount_amount);
                }
                total_amount = parseFloat(total_amount) + parseFloat(room_total_amount);
            }               

        });
        console.log('room total:'+total_amount);
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
        console.log('room total:'+total_amount);
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

                var meal_adult_price = $('#meal_adult_'+meals_option+'_'+key).html().replace(/[^\d\.]/g, '');
                var meal_child_price = $('#meal_child_'+meals_option+'_'+key).html().replace(/[^\d\.]/g, '');
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

            var next_id = $(this).attr('id');
            
            var isvalidate =0;
            var isairvalidate =0;
            var roomvalidate = 1;
            var roomnumvalidate =1;
            /* validation */
            var roomoptions   = '';
            var mealsoptions   = '';
            var discounts   = '';
            var num_of_rooms = '<?php echo $filter_rooms; ?>';
            var sel_num_rooms = 0;
            if(next_id=='hotel_next' || next_id=='visa_next' || next_id=='flight_next' || next_id=='last_next'){
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
                            }  
                        }
                        console.log('selected total:'+sel_num_rooms);
                        if(sel_num_rooms > num_of_rooms){
                            roomnumvalidate =1;
                        }else{
                            roomnumvalidate =0;
                        }
                    });

                    if(roomvalidate==0 && roomnumvalidate==0){
                        $('#room_options').val(roomoptions);
                        $('#discounts').val(discounts);
                        $('#meals_options').val(mealsoptions);

                        $('#roomsel-error').addClass('hide');
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
                        console.log($(this).attr('name'));
                        if($(this).val()=='' || $(this).val()==null){
                            $(this).addClass('haserror');
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
                if(next_id=='flight_next'){ 
                    var $first = $('li:first', 'ul');
                    var $next, $selected = $("li.active"),$tab_selected=$('section.active');
                    $next = $selected.next('li').length ? $selected.next('li') : $first;
                    $tabnext = $tab_selected.next('section').length ? $tab_selected.next('section') : $first;
                    $selected.removeClass("active");
                    $next.addClass('active');
                    $tab_selected.removeClass("active");
                    $tabnext.addClass('active');
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




            }else{
                var $first = $('li:first', 'ul');
                var $next, $selected = $("li.active"),$tab_selected=$('section.active');
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
                var visaummary   = '';
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
                hotelsummary +='<tr><td style="font-weight:bold;">Meal Option Total Price</td><td style="font-weight:bold;">: '+CURRENCY_SYMBOL+''+$('#meal_total_price').html()+'</td></tr>';
                $('#hotel_book_summary tbody').append(hotelsummary);
                //visa summary
                var visaoptions = '';
                var visasummary = '';
                $( "#visa_table tbody tr" ).each(function( index ) {
                    var visa_row = $(this).attr('id');
                    var applicant_name  = $('#visa_applicant_'+visa_row).val();
                    var visa_option     = $('#visa_option_'+visa_row+' option:selected').text();
                    var visa_amount     = $('#visa_rate_'+visa_row).html();
                    console.log(visa_option);
                    console.log(visa_amount);
                    var visa_id = $('#visa_option_'+visa_row+' option:selected').attr('data-option-id');
                    if(visaoptions!=''){
                        visaoptions +=',';
                    }
                    visaoptions += visa_id;
                    if(index!=0){
                        visasummary += '<tr><td></td></tr>';
                    }                     
                    visasummary += '<tr><td style="font-weight:bold;">Applicant '+(index+1)+'</td></tr>';
                    visasummary +='<tr><td>Name</td><td>: '+applicant_name+'</td></tr>';
                    visasummary +='<tr><td>Visa Type</td><td>: '+visa_option+'</td></tr>';
                    visasummary +='<tr><td>Price</td><td>: '+visa_amount+'</td></tr>';
                    
                });
                $('#visa_options').val(visaoptions);
                $('#visa_app_summary tbody').append(visasummary);
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

            var total_room_price    = parseFloat($('#room_total_price').html()) + parseFloat($('#meal_total_price').html()) ;
            total_room_price = total_room_price.toFixed(2);
            var meal_total_price    = $('#meal_total_price').html();
            var total_visa_price    = $('#visa_total_price').html();
            var total_tour_price    = $('#tour_total_price').html().replace(/[^\d\.]/g, '');
            var total_airport_price = $('#airport_total_price ').html();

            //set all total amount for the summary
            $('#hotel_total_amount').html(CURRENCY_SYMBOL+''+total_room_price);
            $('#visa_total_amount').html(CURRENCY_SYMBOL+''+total_visa_price);
            $('#tours_total_amount').html(CURRENCY_SYMBOL+''+total_tour_price);
            $('#airport_total_amount').html(CURRENCY_SYMBOL+''+total_airport_price);

            var total_package_price = 0;
            if(total_room_price !=undefined){
                console.log('room total:'+total_room_price);
                total_package_price = parseFloat(total_package_price) + parseFloat(total_room_price) ;
            }
            if(total_visa_price !=undefined){
                console.log('visa total:'+total_visa_price);
                total_package_price = parseFloat(total_package_price) + parseFloat(total_visa_price);
            }
            if(total_tour_price !=undefined){
                console.log('tour total:'+total_tour_price);
                total_package_price = parseFloat(total_package_price) + parseFloat(total_tour_price);
            }
            if(total_airport_price !=undefined){
                console.log('airport total:'+total_airport_price);
                total_package_price = parseFloat(total_package_price) + parseFloat(total_airport_price);
            }

            console.log('package total price:'+total_package_price);
            $('#summary_total_price').html(total_package_price.toFixed(2));
            $('#custom_price').val(total_package_price.toFixed(2));


        });

    $( function() {
          $( ".datepickeroncat" ).datepicker({ 
            dateFormat: 'dd-mm-yy' , 
            minDate : 0,
            onSelect: function(dateText, inst) {
                $('#'+inst.id).attr('value',dateText);
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
        html+='<select id="visa_option_'+visa_row+'" data-key="'+visa_row+'" name="visa_appication['+visa_row+'][visa_option]" class="visa_option mandatory">';
        html+='<option value="">Select</option>';
        <?php foreach($visaoptions as $options){ ?>
        html+='<option value="<?php echo $options['option_name']; ?>" data-option-id="<?php echo $options['option_id']; ?>" data-price="<?php echo preg_replace( '/[^.\d]/', '', $options['option_value']); ?>"><?php echo $options['option_name']; ?></option>';
        <?php } ?>
        html+='</select></td>';
        html+='<td class="hotel-room-price">';
        html+='<div class="hotel-main-rate">';
        html+='<h2><span class="main-rate visa_main_rate" id="visa_rate_'+visa_row+'" >'+CURRENCY_SYMBOL+' 0</span></h2>';
        html+='<input type="hidden" name="visa_appication['+visa_row+'][visa_price]" id="visa_price_'+visa_row+'" class="visa_price">'
        html+='</div>';
        html+='</td>';
        html+='<td>';
        html+='<div class="attach-copy">';
        html+='<input type="file" name="visa_appication['+visa_row+'][travellerspassportfront]" class="passportfront mandatory"/>';
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
        $('.optionhidset').html('');
        var product_option_id       = $('option:selected', this).attr('data-product-option-id'); 
        var product_option_value_id = $('option:selected', this).attr('data-product-option-value-id'); 
        var data_type               = $('option:selected', this).attr('data-type'); 
        var data_price              = $('option:selected', this).attr('data-price').replace(/[^\d\.]/g, ''); 
        console.log(data_price);
        $('#airport_total_price').text(data_price);
        //$('#airport_total_price').text(data_price);
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
        console.log($('#room_type_form').serialize());
        var room_otions = new FormData($('#room_type_form')[0]);
        var visa_application = new FormData($('#visa_form')[0]);
         $.ajax({
            url: 'index.php?route=product/standardpackage/addRoomOptions',
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

           /* formroomssubmit();
            return false;*/
           $.ajax({
                    url: 'index.php?route=checkout/cart/add',
                    type: 'post',
                    dataType: 'json',
                    //data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea,.parenthidprice,.childhidprice,.cusproductoptionvalueid,.pickuplocationvisa,.tourdatevisa, #airport_section input[type=\'text\'], #airport_section input[type=\'hidden\'], #airport_section select'),
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
