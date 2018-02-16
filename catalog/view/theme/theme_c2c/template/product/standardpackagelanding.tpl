<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>

<section class="panel-section active">
    <div class="container">
        <div class="section-list-inner search-form-section">
            <h2><?php echo $heading_title; ?></h2>
            <p><?php echo $description; ?></p>
        </div>
        <div class="row">
            <div class="col-md-12 hotel-form-main search-hotel-main">
                <form class="home-hotel-form" name="hotel-search" id="hotel-search" action="<?php echo 'index.php?route=product/standardpackage/hotels'; ?>" method="post" data-toggle="validator" role="form">
                    <h2>SEARCH FOR HOTEL</h2>

                    <div class="hotel-form-section">
                        <div class="row">
                            <div class="col-sm-6">
                                <select name="filter_nationality" id="nationality">
                                    <option  value="" selected>Nationality</option>
                                    <?php foreach($countries as $country){?>
                                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                    <?php } ?>
                                </select>
                                <label class="field-name">Nationality</label>
                            </div>
                            <div class="col-sm-6">
                                <select name="filter_sku" id="filter_sku" required>
                                    <option  value="" selected>Emirate</option>
                                    <option value="Abu Dhabi">Abu Dhabi</option>
                                    <option value="Ajman">Ajman</option>
                                    <option value="Dubai">Dubai</option>
                                    <option value="Fujairah">Fujairah</option>
                                    <option value="Ras al-Khaimah">Ras al-Khaimah</option>
                                    <option value="Sharjah">Sharjah</option>
                                    <option value="Umm al-Quwain">Umm al-Quwain</option>
                                </select>
                                <label class="field-name">Emirate</label>
                            </div>
                        </div>
                    </div>
                    <div class="hotel-form-section">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6">
                                    <select name="filter_rooms" id="filter_rooms">
                                        <?php for($i=1;$i<=30;$i++){
                                            if($i==1){
                                                $roomString = 'room';
                                            }else{
                                                $roomString = 'rooms';
                                            }
                                        ?>
                                        <option value="<?php echo $i; ?>"><?php echo $i; ?> <?php echo $roomString; ?></option>
                                        <?php } ?>
                                    </select>
                                        <label class="field-name">Room</label>
                            </div>
                                    <div class="col-xs-6 col-sm-6">
                               <select name="filter_adult" id="filter_adult">
                                   <?php for($i=1;$i<=30;$i++){
                                    if($i==1){
                                        $adultString = 'Adult';
                                    }else{
                                        $adultString = 'Adults';
                                    }
                                    ?>
                                    <option value="<?php echo $i; ?>"><?php echo $i; ?> <?php echo $adultString; ?></option>
                                    <?php } ?>
                              </select>
                                        <label class="field-name">Adult</label>
                            </div>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6">
                                        <select name="filter_child" id="filter_child">
                                            <option value="0" selected>No Children</option>
                                            <?php for($i=1;$i<=10;$i++){
                                        if($i==1){
                                            $childString = 'Child';
                                        }else{
                                            $childString = 'Childs';
                                        }
                                        ?>
                                            <option value="<?php echo $i; ?>"><?php echo $i; ?> <?php echo $childString; ?></option>
                                            <?php } ?>
                                        </select>
                                        <label class="field-name">No Children</label>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 child-age hide">
                                        <select name="filter_child_age" id="filter_child_age" style="display: none;">
                                            <option value="" selected>Age of Children</option>
                                            <?php for($i=0;$i<=17;$i++){
                                            if($i==1){
                                                $childageString = 'Years old';
                                            }else{
                                                $childageString = 'Years old';
                                            }
                                            ?>
                                            <option value="<?php echo $i; ?>"><?php echo $i; ?> <?php echo $childageString; ?></option>
                                            <?php } ?>
                                        </select>
                                        <label class="field-name">Age of Children</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hotel-form-section">
                        <div class="row">
                            <div class="col-xs-6">
                                <input type="text" class="hotelChekin" placeholder="Check-in" name="filter_checkin" readonly>
                            </div>
                            <div class="col-xs-6">
                                <input type="text" class="hotelChekout" placeholder="Check-out" name="filter_checkout" readonly>
                            </div>
                        </div>
                    </div>


                    <!--<div class="hotel-form-section search-mobile-margin search-mobile-margin">
                        <div class="row">


                        </div>
                    </div>-->
                    <div class="hotel-form-section hotel-form-gap">
                        <div class="row">
                            <div class="col-sm-6 col-md-3">
                                <div class="hotel-check-star">
                                    <input type="radio" name="filter_quantity[]" value="3"  <?php if($filter_star =='3'){ echo 'checked'; } ?> />

                                    <div>
                                        <label>3</label>
                                        <span class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div>
                                <div class="hotel-check-star">
                                    <input type="radio" name="filter_quantity[]" value="4" <?php if($filter_star =='4'){ echo 'checked'; } ?> />

                                    <div>
                                        <label>4</label>
                                        <span class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div>
                                <div class="hotel-check-star">
                                    <input type="radio" name="filter_quantity[]" value="5" <?php if($filter_star =='5'){ echo 'checked'; } ?> />

                                    <div>
                                        <label>5</label>
                                        <span class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 margin-ipad">
                                <p><b>Do you require visa</b></p>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <input id="radio-2" name="filter_visa" type="radio" value="no" checked>
                                            <label for="radio-2" class="radio-label">No</label>
                                        </div>
                                        <div class="radio">
                                            <input id="radio-1" name="filter_visa" value="yes" type="radio">
                                            <label for="radio-1" class="radio-label">Yes</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <p><b>Airport Transfer</b></p>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="radio">
                                            <input id="radio-4" name="filter_transfer" type="radio" checked value="one">
                                            <label for="radio-4" class="radio-label">One Way (Airport to Hotel)</label>
                                        </div>
                                        <div class="radio">
                                            <input id="radio-3" name="filter_transfer" type="radio" value="two">
                                            <label for="radio-3" class="radio-label">Two Way (Airport to Hotel, Hotel to Airport)</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="hotel-form-section hotel-form-gap search-hotel-bottom">
                        <input type="hidden" name="package_id" value="<?php echo $product_id; ?>">
                        <input type="submit" value="SEARCH"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<?php echo $footer; ?>

<script type="text/javascript">
     $('#filter_child').on("change", function(e) {
        
        if($(this).val()!="0"){
            $('.child-age').removeClass('hide');
        }else{
            $('.child-age').addClass('hide');
        }
       
    }); 
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
    $(function () {
        $('.hotel-rating-star').barrating({
            theme: 'bootstrap-stars',
        });
    });
    /**home page hotel section the star rating**/
</script>
<script type="text/javascript">
      $( function() {

        $(function() {
            $("form[name='hotel-search']").validate({
              // Specify validation rules
              rules: {
                filter_nationality: "required",
                filter_sku : "required",
                filter_checkin: "required",
                filter_checkout: "required",
                filter_rooms: "required",
                filter_adult: "required"
              },
              // Specify validation error messages
              messages: {
                filter_nationality: "Please select your nationality",
                filter_sku : "Please select emirate",
                filter_checkin: "Please select your checkin date",
                filter_checkout: "Please select your checkout date",
                filter_rooms: "Please select no of rooms",
                filter_adult: "Please select no of adults"
              },

              submitHandler: function(form) {
                form.submit();
              }
            });
        });
    });
</script>
