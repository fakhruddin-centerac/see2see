<?php echo $header; ?>
<div class="container">
    <div class="row">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
    </div>
</div>

<section class="panel-section active">
    <div class="container">
        <div class="row">
            <div class="section-list-inner search-form-section">
                <h2><?php echo $heading_title; ?></h2>
                <p><?php //echo $description; ?></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 hotel-form-main search-hotel-main">
                <form class="home-hotel-form" name="hotel-search" id="hotel-search" action="<?php echo 'index.php?route=product/hotels'; ?>" method="post" data-toggle="validator" role="form">
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
                            </div>
                        </div>
                    </div>
                    <div class="hotel-form-section">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-xs-4 col-sm-4">
                                <select name="filter_rooms" id="filter_rooms">
                                  <!-- <option value="" selected>Rooms</option> -->
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
                            </div>
                            <div class="col-xs-4 col-sm-4">
                               <select name="filter_adult" id="filter_adult">
                                    <!-- <option value="" selected>Adults</option> -->
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
                            </div>
                            <div class="col-xs-4 col-sm-4">
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
                                <div class="clear"></div>
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
                            </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <input type="text" class="hotelChekin" placeholder="Check-in" name="filter_checkin" readonly >
                                    </div>
                                    <div class="col-xs-6">
                                        <input type="text" class="hotelChekout" placeholder="Check-out" name="filter_checkout" readonly >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="hotel-form-section search-mobile-margin search-mobile-margin">
                        <div class="row">
                            
                            
                        </div>
                    </div>
                    <div class="hotel-form-section hotel-form-gap">
                        <div class="row">
                            <div class="col-sm-6"> 
                                <div class="hotel-check-star">
                                    <input type="checkbox" name="filter_quantity[]" value="1"/>
                                    <div>
                                        <label>1</label>
                                        <span class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div>
                                <div class="hotel-check-star">
                                    <input type="checkbox" name="filter_quantity[]" value="2"/>
                                    <div>
                                        <label>2</label>
                                        <span class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div>                               
                                <div class="hotel-check-star">
                                    <input type="checkbox" name="filter_quantity[]" value="3"/>

                                    <div>
                                        <label>3</label>
                                        <span class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div>
                                <div class="hotel-check-star">
                                    <input type="checkbox" name="filter_quantity[]" value="4"/>

                                    <div>
                                        <label>4</label>
                                        <span class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div>
                                <div class="hotel-check-star">
                                    <input type="checkbox" name="filter_quantity[]" value="5"/>

                                    <div>
                                        <label>5</label>
                                        <span class="glyphicon glyphicon-star"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 pad-l-5">
                                <p><b>Do you require visa</b></p>

                                <div class="row">
                                    <div class="col-md-12">                                        
                                        <div class="radio">
                                            <input id="radio-2" name="filter_visa" type="radio" checked value="no">
                                            <label for="radio-2" class="radio-label">No</label>
                                        </div>
                                        <div class="radio">
                                            <input id="radio-1" name="filter_visa" type="radio" value="yes">
                                            <label for="radio-1" class="radio-label">Yes</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="hotel-form-section hotel-form-gap search-hotel-bottom">
                        <input type="submit" value="SEARCH"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
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


    $(document).on('change', '#filter_child', function() {
      console.log($(this).val());
    });
</script>
<script type="text/javascript">
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
    </script>
