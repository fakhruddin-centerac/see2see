<?php echo $header; ?>


          
        </div>
        <div class="menu-full-wrap">
          <div class="container">
            <div class="menu-nav-wrap">
              <ul id="menus">
                <li class="active menu-uae-visa" data-aos="fade-up" data-aos-duration="700"><a href="#pageVisa"><span>UAE VISA </span></a></li>
                <li class="menu-hotles" data-aos="fade-up" data-aos-duration="1000"><a href="#PageHotels"><span>HOTELS (Coming Soon)</span></a></li>
                <li class="menu-packages" data-aos="fade-up" data-aos-duration="1300"><a href="#pagePackages"><span>PACKAGES (Coming Soon)</span></a></li>
                <li class="menu-tours" data-aos="fade-up" data-aos-duration="1600"><a href="#pageTours"><span>TOURS & EXCURSIONS</a></span></li>
                <li class="menu-parks" data-aos="fade-up" data-aos-duration="1900"><a href="#pageParks"><span>PARKS</span></a></li>
                <li class="menu-limo" data-aos="fade-up" data-aos-duration="2200"><a href="#PageLimo"><span>LIMO & TRANSFER</span></a></li>
              </ul>
            </div>
            
          </div>
        </div>
      </div>
      <div class="section" id="pageVisa">
        <div class="pageName"><span>UAE VISA</span></div>
        <div class="container">
          <div class="search-wrap">
              <div class="search-block">
                <div class="row">
                  <div class="search-input">
                    <input type="text" placeholder="You are looking for">
                  </div>
                  <div class="search-date">
                    <input type="text" id="datepicker" placeholder="Date">
                  </div>
                  <div class="search-price">
                    <p>
                      <label for="amount">AED 1700 - AED 2000</label>
                    </p>
                    <div id="slider-range"></div>
                    <input type="text" id="amount" readonly >
                  </div>
                  <div class="search-button">
                    <input type="submit" value="SEARCH">
                  </div>
                </div>
              </div>
            </div>
          <div class="page-title visa-title">
            <h1><span>UAE VISA</span></h1>
          </div>
          <div class="tab-pannel-wrap">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
              
              <?php 
                    $countactive = 1;
                    
                    foreach($visaproduct as $visatours)
                    {  
                        $id          ='visatour-'.$visatours['product_id'];
                        $nametour    = explode(" ",$visatours['name']);
                        $active     ='';
                        if($countactive ==1){$active ='active';}              
              ?>
                        <li role="presentation" class="<?php  echo $active; ?>">
                            <a href="#<?php echo $id; ?>" aria-controls="<?php echo $id; ?>" role="tab" data-toggle="tab">
                              <div class="tab-wrap" data-aos="fade-up" data-aos-duration="800">
                                <div class="tab-days">
                                  <span><?php echo $nametour[0]; ?></span>
                                  <span><?php echo $nametour[1]; ?></span>
                                </div>
                                <div class="tab-visa-type">
                                  <span><?php echo $nametour[2]; ?></span>
                                  <span><?php echo $nametour[3]; ?></span>
                                </div>
                              </div>
                            </a>
                        </li>
              <?php  
                        $countactive ++;
                    }
              ?>
           </ul>
            <!-- Tab panes -->
              <div class="tab-content">
                
                
                 <?php 
                    $countactive = 1;
                    
                    foreach($visaproduct as $visatours)
                    {  
                        $id          = 'visatour-'.$visatours['product_id'];
                        $classmycus  = '';
                        $nametour    = explode(" ",$visatours['name']);
                        $active      = '';
                        if($countactive ==1){$active ='in active';}              
                ?>
                    <div role="tabpanel" class="tab-pane fade <?php  echo $active; ?>" id="<?php  echo $id; ?>">
                      <div class="tab-inner">
                        <div class="row">
                          
                            <?php echo $visatours['description']; ?>
                            <div class="tab-book" data-aos="fade-up" data-aos-duration="2200">
                              <span><?php echo $visatours['price']; ?></span>
                              <span><a class="<?php echo $countactive; ?>" href="<?php echo $visatours['href']; ?>">BOOK NOW</a></span>
                            </div>
                        </div>
                      </div>
                    </div>
                <?php  
                
                         $countactive ++;
                    }
                ?>
              </div>
          </div>
          <div class="docu-faq-tabs">
		  <div class="panel-group" id="accordion1">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion1" href="#collapse-docu" class="collapsed" aria-expanded="false">
        <img src="catalog/view/theme/theme_c2c/image/documentation.png"/>
        Documentation</a>
      </h4>
    </div>

 <div id="collapse-docu" class="panel-collapse collapse" aria-expanded="false" style="height: 60px;">
      <div class="panel-body">
<div class="visa-doc-left">
                          <h3>Visitor: Mandatory</h3>
                          <ul>
                            <li>Passport copy (min validity of 6 months from date of travel)</li>
                            <li>Passport size pic with white background</li>
                            <li>Confirmed return air ticket </li>
                            <li>Mobile number with country code</li>
                            <li>Email address</li>
                          </ul>
						  <h3>Guarantor: (UAE Reference) Mandatory Where Applicable</h3>
                          <ul>
                            <li>Passport copy (min validity of 3 months)</li>
                            <li>UAE residence visa copy (min validity of 3 months)</li>
                            <li>Residence Address</li>
                            <li>Landline Number</li>
                            <li>Mobile Number</li>
                            <li>Email address</li>
                            
                          </ul>
						  </div>
						  
						  <div class="visa-doc-right">
                          <h3>Other documents: May/May not be required depending on the application</h3>
                          <ul>
                            <li>1.	Confirmed hotel reservation under the name of the visitor</li>
                            <li>2.	Proof of qualification certificate of the visitor</li>
                            <li>3.	Last exit stamp of the visitor from UAE</li>
                            <li>4.	Marriage certificate</li>
                       
                          </ul>
						 
						  </div>


 </div>
    </div>
    
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion1" href="#collapse-faq" class="collapsed" aria-expanded="false">
        <img src="catalog/view/theme/theme_c2c/image/faq.png"/>
       FAQ</a>
      </h4>
    </div>
  
 <div id="collapse-faq" class="panel-collapse collapse" aria-expanded="false" style="height: 100px;">
      <div class="panel-body">
<div class="nested-panel">
 <div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
        How long is my tourist visa valid?</a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse in">
      <div class="panel-body">All tourist visas have two types of validity, namely 'validity before entry' and 'validity after entry'. The validity before entry for all categories of visas is 60 days from the date of issuance. This means that the visitor has 60 days from the date of visa issuance to enter UAE after which the visa will no longer be valid. The validity after entry is the number of days the traveller is allowed to stay in UAE after entering, which is 14 days for a 14 days visa, 30 days for a 30 days visa and 90 days for a 90 days visa. The day the traveller has entered is counted as the day 1. </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
        Can I extend my tourist visa? Can I change my tourist visa to residence/employment visa?</a>
      </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse">
      <div class="panel-body">Only the 14 days tourist visa can be extended by an additional 14 days (additional charges may apply). All other visa categories are non-extendable.
All tourist visa categories can be transferred to residence/employment without exiting the country. However, it is not possible to transfer from one tourist visa to another tourist visa. In order to continue his/her on a tourist visa, the passenger must first leave UAE and come back on a new tourist visa.   

	  </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
        What happens if I exceed the permitted stay duration?</a>
      </h4>
    </div>
    <div id="collapse3" class="panel-collapse collapse">
      <div class="panel-body">Under no circumstances you should exceed the permitted stay duration. Our company policy is to report the visa holder as absconded after 2 days of overstay. Once you have been reported as absconded by us, you will not be permitted to exit the country without paying a fine of AED 7500/- to us and taking all the necessary approvals from our company. Also, your visa application will be rejected by the Immigration Authorities the next time you apply for a visa.</div>
    </div>
  </div>
  
  
   <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
        What if my employment/residence visa is under process? Do I still need to leave the country if my tourist visa is expiring?</a>
      </h4>
    </div>
    <div id="collapse4" class="panel-collapse collapse">
      <div class="panel-body">In case your employment visa is under process and your tourist visa is expiring, we strongly advise you to leave the country till your employment visa is approved and then come back in UAE on your employment visa. </div>
    </div>
  </div>
  
   <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">
       Can I work on a tourist visa?</a>
      </h4>
    </div>
    <div id="collapse5" class="panel-collapse collapse">
      <div class="panel-body">It is against the law to work on a tourist visa. You can attend interviews and participate in the recruitment process, however do not start to work on the tourist visa. Wait for your employer to issue your employment visa before you join work.  Some employers may ask you to start working on the tourist visa itself but this can be very dangerous for you. Labour inspections are very common in UAE and if you are found working on a tourist visa, you can be imprisoned and penalised up to AED 25000/-. You will also be deported after your jail sentence and imposed with a life ban.</div>
    </div>
  </div>
  
</div>
</div>
	  </div>
    </div>
  </div>
 
  
 
</div>
	</div>
          
          
        </div>
      </div>
      
      

        <!--
      <div class="section" id="pagePackages">
        <div class="pageName"><span>UAE HOLIDAY PACKAGES</span></div>
        <div class="container">
          <div class="page-title packages-title">
            <h1><span>UAE HOLIDAY PACKAGES</span></h1>
          </div>
            <div class="col-sm-6">
              <div class="package-wrap standerd-package">
                <div class="pckge-icon" data-aos="fade-up" data-aos-duration="500"><img src="catalog/view/theme/theme_c2c/images/icon-package-1.svg"></div>
                <h2 data-aos="fade-up" data-aos-duration="700">Standard <br/>Package</h2>
                <h3 data-aos="fade-up" data-aos-duration="900">Available Options</h3>
                <div class="rating-package" data-aos="fade-up" data-aos-duration="1100">
                  <span><a href="">3 Star</a></span>
                  <span><a href="">4 Star</a></span>
                  <span><a href="">5 Star</a></span>
                </div>
                <div class="more-btn" data-aos="fade-up" data-aos-duration="1300"><a href="">VIEW MORE</a></div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="package-wrap make-package">
                <div class="pckge-icon" data-aos="fade-up" data-aos-duration="500"><img src="catalog/view/theme/theme_c2c/images/icon-package-2.svg"></div>
                <h2 data-aos="fade-up" data-aos-duration="700">Standard <br/>Package</h2>
                <h3 data-aos="fade-up" data-aos-duration="900">Available Options</h3>
                <div class="rating-package" data-aos="fade-up" data-aos-duration="1100">
                  <span><a href="">3 Star</a></span>
                  <span><a href="">4 Star</a></span>
                  <span><a href="">5 Star</a></span>
                </div>
                <div class="more-btn" data-aos="fade-up" data-aos-duration="1300"><a href="">VIEW MORE</a></div>
              </div>
            </div>
        </div>
      </div>
        -->
        

      <div class="section " id="pageTours">
        <div class="pageName"><span>TOURS & EXCURSIONS</span></div>
        <div class="container">
          <div class="page-title tours-title">
            <h1><span>TOURS & EXCURSIONS</span></h1>
          </div>
          <div class="tours-wrap">
            <div class="row">
              <?php
                 foreach($tourscategoriesHome as $tourscategoryHome)
              {
                ?>
                <div class="col-sm-4">
                    <div class="tours-item" data-aos="fade-up" data-aos-duration="500">
                      <div class="tours-img"><a href="<?php echo $tourscategoryHome['href']; ?>"><img src="<?php echo $tourscategoryHome['image']; ?>"></a></div>
                      <h3><?php echo $tourscategoryHome['name']; ?></h3>
                      <p><?php echo $tourscategoryHome['description']; ?></p>
                    </div>
                </div>
               <?php 
              }
              
              ?>
              <div class="col-sm-12">
                <div class="page-more-link">
                  <span class="hide"><a href="#">View All</a></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      
      
      <div class="section " id="pageParks">
        <div class="pageName"><span>PARKS</span></div>
        <div class="container">
          <div class="page-title parks-title">
            <h1><span>PARKS</span></h1>
          </div>
          <div class="parks-wrap">
            <div class="row">
            <?php if(isset($park_product_large[0])) { ?>
              <div class="col-sm-4">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="parks-item park-thumb-full" data-aos="fade-up" data-aos-duration="1000">
                      <div class="parks-img"><img src="<?php echo HTTP_SERVER.'image/'.$park_product_large[0]['image'] ?>"></div>
                      <div class="parks-item-hover">
                        <div class="parks-hover-sub">
                          <h2><?php echo $park_product_large[0]['name'] ?></h2>
                          <?php $description = html_entity_decode($park_product_large[0]['description'], ENT_QUOTES, 'UTF-8');
                           echo strlen($description)<=100 ? $description : substr($description,0,100).'...';  ?>
                          <div class="more-btn"><a href="<?php echo 'index.php?route=product/product&product_id='.$park_product_large[0]['product_id']; ?>">VIEW MORE</a></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
             <?php } ?> 
              
              <div class="col-sm-8">
                <div class="row">
                    <?php foreach($park_product_small as $key=> $value) { ?>
                  <div class="col-sm-6">
                      <div class="parks-item park-thumb-half" data-aos="fade-up" data-aos-duration="1500">
                        <div class="parks-img"><img src="<?php echo HTTP_SERVER.'image/'.$value['image'] ?>"></div>
                        <div class="parks-item-hover">
                          <div class="parks-hover-sub">
                            <h2><?php echo $value['name'] ?></h2>
                            <?php $description = html_entity_decode($value['description'], ENT_QUOTES, 'UTF-8');
                            echo strlen($description)<=100 ? $description : substr($description,0,100).'...';  ?>
                            <div class="more-btn"><a href="<?php echo 'index.php?route=product/product&product_id='.$value['product_id']; ?>">VIEW MORE</a></div>
                          </div>
                        </div>
                      </div>
                  </div>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        
        <!--
        <div class="section" id="PageHotels">
        <div class="pageName"><span>HOTELS BOOKING</span></div>
        <div class="container">
          <div class="page-title hotels-title">
            <h1><span>HOTELS BOOKING</span></h1>
          </div>
          <div class="row">
            <div class="hotel-wrap">
              <div class="col-sm-6">
                <div class="row hotel-item" data-aos="fade-up" data-aos-duration="1000">
                  <div class="col-sm-5">
                    <div class="hotel-item-img"><a href=""><img src="catalog/view/theme/theme_c2c/images/hotel-fortune.jpg"></a></div>
                  </div>
                  <div class="col-sm-7">
                    <div class="hotel-dtls">
                      <h3>Fortune Hotel Deira</h3>
                      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam...</p>
                      <div class="hotel-price-wrap">
                        <div class="price-info">AED 350</div>
                        <div class="book-btn"><a href="">BOOK NOW</a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="row hotel-item" data-aos="fade-up" data-aos-duration="1300">
                  <div class="col-sm-5">
                    <div class="hotel-item-img"><a href=""><img src="catalog/view/theme/theme_c2c/images/City-Max-Hotel.jpg"></a></div>
                  </div>
                  <div class="col-sm-7">
                    <div class="hotel-dtls">
                      <h3>City Max Hotel Bur Dubai</h3>
                      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam...</p>
                      <div class="hotel-price-wrap">
                        <div class="price-info">AED 350</div>
                        <div class="book-btn"><a href="">BOOK NOW</a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="row hotel-item" data-aos="fade-up" data-aos-duration="1700">
                  <div class="col-sm-5">
                    <div class="hotel-item-img"><a href=""><img src="catalog/view/theme/theme_c2c/images/IBIS-ALBARSHA.jpg"></a></div>
                  </div>
                  <div class="col-sm-7">
                    <div class="hotel-dtls">
                      <h3>IBIS HotelAl - Barsha</h3>
                      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam...</p>
                      <div class="hotel-price-wrap">
                        <div class="price-info">AED 350</div>
                        <div class="book-btn"><a href="">BOOK NOW</a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="row hotel-item" data-aos="fade-up" data-aos-duration="2000">
                  <div class="col-sm-5">
                    <div class="hotel-item-img"><a href=""><img src="catalog/view/theme/theme_c2c/images/Sadaf-Delmon-hotel.jpg"></a></div>
                  </div>
                  <div class="col-sm-7">
                    <div class="hotel-dtls">
                      <h3>Sadaf Delmon Hotel</h3>
                      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam...</p>
                      <div class="hotel-price-wrap">
                        <div class="price-info">AED 350</div>
                        <div class="book-btn"><a href="">BOOK NOW</a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-12 ">
                <div class="page-more-link">
                  <span class="hide"><a href="">View All</a></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      -->
      
        
      <div class="section" id="PageLimo">
        <div class="pageName"><span>LIMOS & AIRPORT TRANSFERS</span></div>
        <div class="container">
          <div class="row">
            <?php
            foreach($limoservicecategoriesHome as $limoservicecategoriesHomess)
            {
            ?>
            <div class="col-sm-6">
              <div class="page-title limo-title" data-aos="fade-up" data-aos-duration="1000">
                <h1><span><?php echo $limoservicecategoriesHomess['name'] ; ?></span></h1>
              </div>
              <div class="limo-wrap" data-aos="fade-up" data-aos-duration="1400">
                <div class="limo-img"><a href="<?php echo $limoservicecategoriesHomess['href'] ; ?>"><img src="<?php echo $limoservicecategoriesHomess['image'] ; ?>"></a></div>
                <div class="limo-dtls">
                  <h2><?php echo $limoservicecategoriesHomess['name'] ; ?></h2>
                  <p><?php echo $limoservicecategoriesHomess['description'] ; ?></p>
                   <!--<div class="hotel-price-wrap">
                    <div class="price-info">AED 350</div>
                    <div class="book-btn"><a href="">BOOK NOW</a></div>
                  </div>-->
                </div>
              </div>
             </div>
            <?php
            }
            ?>
            
           
          </div>
        </div>
      </div>


<?php echo $footer; ?>