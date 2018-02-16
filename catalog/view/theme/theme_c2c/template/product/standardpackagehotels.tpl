<?php echo $header; ?>
<!-- jquery ui js-->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script>
  $( function() {
    var progressbar = $( "#progressbar" ),
      progressLabel = $( ".progress-label" );
 
    progressbar.progressbar({
      value: false,
      change: function() {
        progressLabel.text( progressbar.progressbar( "value" ) + "%" );
      },
      complete: function() {
        progressLabel.text( "Complete!" );
        $('.new-loader').fadeOut();
      }
    });
 
    function progress() {
      var val = progressbar.progressbar( "value" ) || 0;
 
      progressbar.progressbar( "value", val + 2 );
 
      if ( val < 99 ) {
        setTimeout( progress, 80 );
      }
    }
 
    setTimeout( progress, 2000 );
  } );
</script>
<div class="new-loader">
    <div class="progress-container">
        <h3 class="text-center">Please wait a moment while the data being fetched</h3>
        <div id="progressbar"><div class="progress-label">Loading...</div></div>
    </div>

</div>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>

<section class="panel-section active">
    <div class="container clearfix">
        <div class="side-panel">
            <div class="side-panel-box">
                <div class="hotel-form-main">
                    <form class="home-hotel-form" name="hotel-search" id="hotel-search" action="<?php echo 'index.php?route=product/standardpackage/hotels'; ?>" method="post">
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
                                <option  value="" selected>Emirate</option>
                                <option value="Abu Dhabi" <?php if($filter_sku=='Abu Dhabi'){ echo 'selected'; } ?> >Abu Dhabi</option>
                                <option value="Ajman" <?php if($filter_sku=='Ajman'){ echo 'selected'; } ?> >Ajman</option>
                                <option value="Dubai" <?php if($filter_sku=='Dubai'){ echo 'selected'; } ?> >Dubai</option>
                                <option value="Fujairah" <?php if($filter_sku=='Fujairah'){ echo 'selected'; } ?> >Fujairah</option>
                                <option value="Ras al-Khaimah" <?php if($filter_sku=='Ras al-Khaimah'){ echo 'selected'; } ?> >Ras al-Khaimah</option>
                                <option value="Sharjah" <?php if($filter_sku=='Sharjah'){ echo 'selected'; } ?> >Sharjah</option>
                                <option value="Umm al-Quwain" <?php if($filter_sku=='Umm al-Quwain'){ echo 'selected'; } ?>>Umm al-Quwain</option>
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
                        <input type="hidden" name="filter_nationality" value="<?php echo $filter_nationality; ?>" />
                        <input type="hidden" name="filter_sku" value="<?php echo $filter_sku; ?>" />
                        <input type="hidden" name="filter_checkin" value="<?php echo $filter_checkin; ?>" />
                        <input type="hidden" name="filter_checkout" value="<?php echo $filter_checkout; ?>" />
                        <input type="hidden" name="filter_rooms" value="<?php echo $filter_rooms; ?>" />
                        <input type="hidden" name="filter_adult" value="<?php echo $filter_adult; ?>" />
                        <input type="hidden" name="filter_child" value="<?php echo $filter_child; ?>" />
                        <input type="hidden" name="filter_quantity" value="<?php echo $filter_quantity; ?>" />
                        <input type="hidden" name="filter_visa" value="<?php echo $filter_visa; ?>" />

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
                            <select name="filter_sku" id="filter_sku"> 
                                <option value="" >Location</option>
                                <?php foreach($locations as $location){?>
                                <option value="<?php echo $location; ?>" <?php if($location==$filter_sku){ echo 'selected'; } ?>><?php echo $location; ?></option>
                                <?php }?>
                            </select>
                        </div>
                        <div class="filter-box-section">
                            <input type="submit" value="Search" />
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <div class="content-panel">
            <div class="hotel-result-main">
              
                <?php 
                if($hotels){
                    foreach($hotels as $hotel){
                    $hotel_id = $hotel['hotel_id'] ;
                ?>

                    <div class="hotel-result-container">
                        <div class="hotel-search-box">
                            <div class="hotel-image-thumb">
                                <img src="<?php echo $hotel['image']; ?>"/>
                            </div>
                            <div class="hotel-info">
                                <h2><a href="<?php echo 'index.php?route=product/standardpackage/packagedetails&hotel_id='.$hotel_id.'&package_id='.$package_id.'&star_rating='.$filter_star.'&filter_adult='.$filter_adult.'&filter_child='.$filter_child.'&total_people='.$total_people.'&filter='.$filter_nationality.'&filter_room='.$filter_rooms.'&checkin='.$filter_checkin.'&checkout='.$filter_checkout.'&visa_option='.$filter_visa.'&transfer_option='.$filter_transfer; ?>"><?php echo $hotel['name']; ?></a></h2>
                                <div class="stars stars-example-bootstrap">
                                    <select class="hotel-rating-star" name="rating" autocomplete="off">
                                    <?php for($i=1;$i<=5;$i++){?>
                                        <option value="<?php echo $i; ?>" <?php if($i==$hotel['quantity']){ echo 'selected'; } ?> ><?php echo $i; ?></option>
                                    <?php } ?>
                                    </select>
                                </div>
                                <div class="hotel-location">
                                    <div class="hotel-loaction-img">
                                        <img src="catalog/view/theme/theme_c2c/images/hotel-location.png"/>
                                    </div>
                                    <div class="hotel-location-info">
                                        <p><?php echo $hotel['location']; ?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hotel-main-rate">
                            <p>Per Night</p>
                            <h2><span class="main-rate"><?php echo $hotel['price']; ?></span></h2>
                        </div>
                    </div>


                <?php }

                }else{ ?>
                <div class="row">                
                    <div id="content" class="col-sm-12">      
                        <h3>Not results found!</h3>                     
                        <div class="buttons clearfix">
                            <div class="pull-right"><a href="http://localhost/ctctourism/index.php?route=common/home" class="btn btn-primary">Continue</a></div>
                        </div>
                    </div>
                </div>
                <?php } ?>
                



            </div>
        </div>
    </div>
</section>
<?php echo $footer; ?>


<script type="text/javascript">
    /**home page hotel section the form calender**/
    $('.hotelChekin').datepicker({
        dateFormat: 'mm-dd-yy',      
        minDate:new Date(),
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
    /**end of home page hotel section the form calender**/

    /**home page hotel section the form selectbox**/
    $('.hotel-form-section select').select2({
        //minimumResultsForSearch: -1
    });
    /**home page hotel section the form selectbox**/



    /**home page hotel section the star rating**/
    $(function() {
        $('.hotel-rating-star').barrating({
            theme: 'bootstrap-stars',
        });
    });
    /**home page hotel section the star rating**/
</script>
<script>
    $('#filter_child').on("change", function(e) {
        
        if($(this).val()!="0"){
            $('.child-age').removeClass('hide');
        }else{
            $('.child-age').addClass('hide');
        }
       
    }); 
    var progress = setInterval(function () {

        var $bar = $("#bar");

        if ($bar.width() >= 600) {
            clearInterval(progress);
            $(".loader").fadeOut(200);
        } else {
            $bar.width($bar.width() + 60);
        }
        $bar.text();

    }, 100);

    $(window).load(function () {
        $('.loader-container').removeClass('hide');
        $("#bar").width(600);

    });
</script>
