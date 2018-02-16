<div class="section fp-auto-height" id="pageFooter">
        <footer>
          <div class="container">
            <div class="row">
              <div class="footer-item">
                <h2><a href="javascript:void(0)" class="drop-menu">UAE Visa</a></h2>
                 <?php 
                    foreach($visaproductmenu as $visalink)
                    {
                ?>        
                <h4><a href="<?php echo $visalink['href']; ?>"><?php echo $visalink['name']; ?></a></h4>
                <?php    
                    }
                ?>  
                <div class="footer-desc-none">
                    <h2><a href="javascript:void(0)" class="drop-menu">PACKAGES</a></h2>
                    <h4><a href="<?php echo 'index.php?route=product/standardpackage&product_id=238'; ?>">CTC Standard Package</a></h4>
                    <h4><a href="<?php echo 'index.php?route=product/makepackage&product_id=241'; ?>">Make Your Holiday Package</a></h4>
                </div>                                 
              </div>
              <div class="footer-item footer-mob-view">
                <h2><a href="javascript:void(0)" class="drop-menu">PACKAGES</a></h2>
                  <h4><a href="<?php echo 'index.php?route=product/standardpackage&product_id=238'; ?>">CTC Standard Package</a></h4>
                  <h4><a href="<?php echo 'index.php?route=product/makepackage&product_id=241'; ?>">Make Your Holiday Package</a></h4>
              </div>
              <div class="footer-item">
                <h2><a href="javascript(0);" class="drop-menu">TOURS & EXCURSIONS</a></h2>
                <?php
                    foreach($tourscategoriesHome as $tourscategoryHome)
                    {
                       ?>
                       <h4><a href="<?php echo $tourscategoryHome['href']; ?>" ><?php echo $tourscategoryHome['name']; ?></a></h4>
                       <?php
                    } 
                ?>
              </div>
              <div class="footer-item">
                <h2><a href="javascript:void(0)" class="drop-menu">PARKS</a></h2>
                <?php
                    foreach($parkscategoriesHome as $parkscategoryHome)
                    {
                       ?>
                       <h4><a href="<?php echo $parkscategoryHome['href']; ?>" ><?php echo $parkscategoryHome['name']; ?></a></h4>
                       <?php
                    } 
                ?>
              </div>
              <div class="footer-item">
                <h2><a href="javascript:void(0)" class="drop-menu">LIMO TRANSFER</a></h2>
                <?php
                    foreach($lscategoriesHome as $lscategoryHome)
                    {
                       ?>
                       <h4><a href="<?php echo $lscategoryHome['href']; ?>" ><?php echo $lscategoryHome['name']; ?></a></h4>
                       <?php
                    } 
                ?>
              </div>
              <div class="footer-item">
                <?php
                    if ($informations) 
                    {
                         ?>
                         <div class="footer-page">
                             <h2><a href="javascript:void(0)" class="drop-menu">Pages</a></h2>
                             <!--<ul class="list-unstyled">-->
                                 <?php
                                 foreach ($informations as $information) 
                                 {
                                ?>
                                    <h4><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></h4>
                                <?php
                                  }
                                ?>
                                    <h4><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></h4>
                                    <h4><a href="<?php echo 'index.php?route=information/about'; ?>">About Us</a></h4>
                                    <h4><a href="<?php echo 'index.php?route=information/career'; ?>">Careers</a></h4>
                             <!--</ul>-->
                         </div>
                     <?php       
                     }  
                ?>
                    <div class="footer-share">
                        <span><a target="_blank" href="<?php echo $facebook; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-fb.svg"/></a></span>
                       <span><a target="_blank" href="<?php echo $twitter; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-tweet.svg"/></a></span>
                        <!-- <span><a target="_blank" href="<?php echo $instagram; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-instagram.svg"/></a></span>-->
                        <span><a target="_blank" href="<?php echo $linkedin;   ?>"><img src="catalog/view/theme/theme_c2c/images/icon-linkdIn.svg"/></a></span>
                    </div>
              </div>
              
              <div class="ftr-newsletter">
                <div class="ftr-sub">
                  <div class="tel-ftr"><?php echo $telephone; ?></div>
                  <p>Copyright &copy; <?php echo date('Y');?>. All Rights Reserved.</p>
                </div>
                <div class="newsleter-block">
                  <p>we accept all major credit cards</p>
                  <img src="catalog/view/theme/theme_c2c/images/payment-methods-box.png">
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    <div id="myModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content upgrade">
             <!--<div class="modal-header">
                  <img src="http://www.ctctourism.com/catalog/view/theme/theme_c2c/images/logo.svg" width="100px" />

              </div>-->
              <div class="modal-body">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <div class="container-fluid">
                      <div class="row">
                          <div class="col-sm-12">
                              <p>Dear Customers,</p>

                              <p>Coast to Coast Tourism (CTC) is happy to present a soft launch of our new and upgraded website
                                  <a href="">www.ctctourism.com</a> which is currently in its testing phase to enhance user experience and
                                  capability.</p>

                              <p>Official launch post testing will be done in the coming weeks.</p>

                              <p>Stay tuned for more updates and special offers.</p>

                              <p>Thanks,</br>
                                  CTC Management Team</p>
                          </div>

                      </div>
                  </div>


              </div>

          </div>

      </div>
  </div>
  <div id="infoModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content upgrade">
             <!--<div class="modal-header">
                  <img src="http://www.ctctourism.com/catalog/view/theme/theme_c2c/images/logo.svg" width="100px" />

              </div>-->
              <div class="modal-body">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <div class="container-fluid">
                      <div class="row">
                          <div class="col-sm-12">
                              <p>Dear Customers,</p>

                              <p>We are working on updating this at the moment</p>

                              <p>Thanks,</br>
                                  CTC Management Team</p>
                          </div>

                      </div>
                  </div>


              </div>

          </div>

      </div>
  </div>



   <script src="catalog/view/theme/theme_c2c/js/jquery-ui.min.js"></script>
   <script src="catalog/view/theme/theme_c2c/js/jquery.ui.touch-punch.min.js"></script>
    <!--  for  sect option on product page-->
    <script src="catalog/view/theme/theme_c2c/js/classie.js"></script>
    <script src="catalog/view/theme/theme_c2c/js/selectFx.js"></script>
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="catalog/view/theme/theme_c2c/js/aos.js"></script>
    <script src="catalog/view/theme/theme_c2c/js/bootstrap.min.js"></script>
    <script src="catalog/view/theme/theme_c2c/js/owl.carousel.min.js"></script>
    <script src="catalog/view/theme/theme_c2c/js/jquery.barrating.min.js"></script>
    <script src="catalog/view/theme/theme_c2c/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="catalog/view/theme/theme_c2c/js/lightslider.min.js"></script>
    <script src="catalog/view/theme/theme_c2c/js/custom.js"></script>
    <!-- select 2-->
    <script src="catalog/view/theme/theme_c2c/js/select2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.3/velocity.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.2.3/velocity.ui.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
         //$("#myModal").modal('show');
         $('#agent_login').on('click', function(e) {            
            $("#infoModal").modal('show');
         });

      });
   </script>
    <script>
      //AOS.init();
      AOS.init({
        offset: 10,
        delay: 0,
        easing: 'ease',
    });
    </script>
    <script>

    /*(function() {
            [].slice.call( document.querySelectorAll( 'select.cs-select' ) ).forEach( function(el) {  
              new SelectFx(el);
            } );
          })();*/
          setTimeout(function(){ $('.country_select').select2(); }, 1000);
        /*now start condition for qualificatio stamp */
          (function() {
            [].slice.call( document.querySelectorAll( 'select.cs-select' ) ).forEach( function(el) {  
              new SelectFx(el,{
              onChange: function(val) {
                //alert("jj="+el.parent().attr('rel'));
                var nameofsele='';
                var relationtype=''; 
                nameofsele = el.name;
                if(nameofsele=='applicantinfo[0][country]')
                {
                    /*applicantinfo-1-country*/
                    numberofapplicant = $('.applcatentblock > div').length;
                    texval = $('.visa-main.applicantno-0 .orignalcountry .cs-options ul li[data-value='+val+'] span').text();
                    //alert(texval+"--");
                    if(numberofapplicant>1)
                    {
                        apllcounter =1;
                        for(i=2;i<=$('.applcatentblock > div').length;i++)
                        {
                            //$('.visa-main.applicantno-1 .applicantinfo-1-country span.cs-placeholder').text(texval);
                            //alert(texval);
                            $('.visa-main.applicantno-'+apllcounter+' .applicantinfo-'+apllcounter+'-country .cs-options ul li').hide();
                            $('.visa-main.applicantno-'+apllcounter+' .applicantinfo-'+apllcounter+'-country .cs-options ul li[data-value='+val+']').show();
                            $('.visa-main.applicantno-'+apllcounter+' .applicantinfo-'+apllcounter+'-country select').val(val);
                            $('.visa-main.applicantno-'+apllcounter+' .applicantinfo-'+apllcounter+'-country .cs-placeholder').html(texval);
                            apllcounter++;
                        }
                        
                    }
                    
                }
                console.log($("#number_of_applicant").val());

               if($("#number_of_applicant").val()==1) 
                 {
                    if($('.personrelationshipvisa .cs-placeholder').length == 1)
                     {
                        relationtype = $('.personrelationshipvisa .cs-placeholder').eq(0).text();
                     }
                    else
                     {
                        relationtype = $('.personrelationshipvisa .cs-placeholder').eq(1).text();
                     }
                 }
                else
                {
                    console.log('set relation null');
                    relationtype='';
                    relationtype = $('.applicantno-1 .personrelationshipvisa .cs-placeholder').text();
                    console.log('new relationship:'+relationtype);
                    
                }  
                
                console.log('relationship type:'+relationtype);
                //if(relationtype=='Other' && nameofsele=='applicantinfo[0][qualification]')
                if(nameofsele=='applicantinfo[0][qualification]')
                {
                    var country_flag = $('input[name="country_flag"]').val();    
                    
                   console.log('country flag:'+country_flag);
                   console.log('relation ship type:'+relationtype);
                    if(country_flag=='LIMITED' && relationtype!='Other') /*14 30 without bangladash*/
                    {
                        console.log('inside latest non uae condition with india');
                        var typeofregident_latest = $('.typeofresidentapplicant select').val();
                        if(typeofregident_latest!='NON UAE RESIDENT (WITHOUT UAE REFERENCE)')
                         {
                       
                             
                             if(val=='Diploma' || val=='High School' || val=='Does not apply')
                                {
                                    $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                    $('.applicantinfomation-0 .exitstampcls').remove();
                                    htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                    htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                                  //  $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                }
                                else if(val=='Bachelors' || val=='Masters' || val=='Phd')
                                {
                                      /*27-9nigh
                                      $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                      */
                                      $('.applicantinfomation-0 .exitstampcls').remove();
                                }
                             
                            
                        }  
                        if(typeofregident_latest=='NON UAE RESIDENT (WITHOUT UAE REFERENCE)' && relationtype=='Relationship with UAE resident applicant'){
                            if(val=='Diploma' || val=='High School' || val=='Does not apply')
                                {
                                    $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                    $('.applicantinfomation-0 .exitstampcls').remove();
                                    htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                    htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                                    $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                }
                                else if(val=='Bachelors' || val=='Masters' || val=='Phd')
                                {
                                      /*27-9nigh
                                      $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                      */
                                      $('.applicantinfomation-0 .exitstampcls').remove();
                                }
                             
                        }
                        
                    }
                    
                    else if(country_flag=='LIMITED' && relationtype=='Other') /*14 30 without bangladash*/
                    {
                        console.log('inside 14 days with other relation');
                        if(val=='Diploma' || val=='High School' || val=='Does not apply')
                        {
                            $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                            $('.applicantinfomation-0 .exitstampcls').remove();
                            htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                            htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                            $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                        }
                        else if(val=='Bachelors' || val=='Masters' || val=='Phd')
                        {
                              /*27-9nigh
                              $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                              */
                              $('.applicantinfomation-0 .exitstampcls').remove();
                        }
                    }
                    else 
                    {
                        console.log('inside all countries');
                        /*now need to check bangldash,pak...etc */
                         var restrict_country_limited = ["18","156","144","162"];
                         applicantcountry = $('.applicantno-0 .countryy_select select').val();
                         //alert("country:- "+applicantcountry);
                        var checklimitedHasforone = restrict_country_limited.indexOf(applicantcountry);
                        var typeofregident_latest = $('.typeofresidentapplicant select').val();
                        console.log('checklimit vivek:'+checklimitedHasforone);
                        if(typeofregident_latest!='NON UAE RESIDENT (WITHOUT UAE REFERENCE)')
                         {
                            
                              console.log('checkloimit'+checklimitedHasforone);
                              if(checklimitedHasforone==-1)
                                {
                                  console.log('inside checking condition vivek');                                  
                                  
                                  if(typeofregident_latest =='UAE RESIDENT'){
                                  
                                    if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype=='Other')){
                                      console.log('adding prrof of exit stamp');
                                      $('.applicantinfomation-0 .exitstampcls').remove();
                                      $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                      htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                      htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                                      $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);


                                    
                                    }else if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype!='Other')){
                                        console.log('inside spuse condoition');
                                       // $('.applicantinfomation-0 .qualificationcertificatecls').addClass('hide');
                                        $('.applicantinfomation-0 .exitstampcls').remove();
                                        //new -vivek
                                        $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                        /*htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';*/
                                        /*htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';*/
                                        //$('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                    }else if( (val=='Bachelors' || val=='Masters' || val=='Phd') && (relationtype=='Other') ){
                                      console.log('inside remove class');
                                      $('.applicantinfomation-0 .qualificationcertificatecls').removeClass('hide');
                                      $('.applicantinfomation-0 .exitstampcls').remove();
                                      //$('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                     /* htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                      $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);*/
                                      
                                    }
                                  }
                                  if( typeofregident_latest == 'NON UAE RESIDENT (WITH UAE REFERENCE)'){
                                    console.log('inside non uae condition-vivek');
                                    if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype!='Other')){
                                        /*$('.applicantinfomation-0 .qualificationcertificatecls').addClass('hide');
                                        htmladdcer = '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                                        $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);*/
                                       /* $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                        htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                        $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);*/


                                    }else if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype=='Other')){
                                      $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                      $('.applicantinfomation-0 .exitstampcls').remove();
                                        htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                        htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                                        $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);

                                    }else if((val=='Bachelors' || val=='Masters' || val=='Phd') && (relationtype!='Other')){
                                      $('.applicantinfomation-0 .exitstampcls').remove();
                                      $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                    }else if((val=='Bachelors' || val=='Masters' || val=='Phd') && (relationtype=='Other')){
                                      $('.applicantinfomation-0 .exitstampcls').remove();
                                      //$('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                    }
                                  }
                                 
                                    /*
                                     if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype!='Other'))
                                        {
                                            $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                              $('.applicantinfomation-0 .exitstampcls').remove();
                                        }
                                       if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype=='Other'))
                                        {  
                                            $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                            $('.applicantinfomation-0 .exitstampcls').remove();
                                            htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                            htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                                            $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                        } 
                                        else if(val=='Bachelors' || val=='Masters' || val=='Phd')
                                        {
                                              $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                              $('.applicantinfomation-0 .exitstampcls').remove();
                                        }
                                    */
                               }else{
                                  console.log('inside conditional country');
                                  if( typeofregident_latest == 'UAE RESIDENT' || typeofregident_latest == 'NON UAE RESIDENT (WITH UAE REFERENCE)'){
                                      if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype!='Other')){
                                        
                                        //$('.applicantinfomation-0 .qualificationcertificatecls').addClass('hide');
                                        $('.applicantinfomation-0 .exitstampcls').remove();
                                        $('.applicantinfomation-0 .qualificationcertificatecls').remove();                                        
                                        htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                        $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                      
                                      }else if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype=='Other')){
                                        
                                        $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                        $('.applicantinfomation-0 .exitstampcls').remove(); 
                                        htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                        /*htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';*/
                                        $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                      
                                      }else if((val=='Bachelors' || val=='Masters' || val=='Phd') && (relationtype!='Other')){
                                        console.log('test test tests');
                                        $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                        $('.applicantinfomation-0 .exitstampcls').remove();
                                        htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                        $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                      
                                      }else if((val=='Bachelors' || val=='Masters' || val=='Phd') && (relationtype=='Other')){   
                                        $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                        $('.applicantinfomation-0 .exitstampcls').remove();                                        
                                        htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                        $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                      }
                                  }
                               }
                      
                         }else{
                          console.log('iside else part non uae resident - vivek');                          
                          var noOfApplicants = $("#number_of_applicant").val();
                          console.log('no of applicants:'+noOfApplicants);
                          if(noOfApplicants == 1 ){
                            if(val=='Diploma' || val=='High School' || val=='Does not apply'){
                              console.log('adding exit stamp for others with low qualification');
                              $('.applicantinfomation-0 .exitstampcls').remove();
                             
                              htmladdcer = '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                              $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                            } else if(val=='Bachelors' || val=='Masters' || val=='Phd'){
                              $('.applicantinfomation-0 .exitstampcls').remove();
                            }                         
                            if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype!='Other')){
                                console.log('inside another if condition');
                                $('.applicantinfomation-0 .qualificationcertificatecls').addClass('hide');
                                $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                //$('.applicantinfomation-0 .exitstampcls').remove();
                                htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);

                            }else if((val=='Bachelors' || val=='Masters' || val=='Phd') && (relationtype!='Other')){
                                console.log('higher education inside');
                                //$('.applicantinfomation-0 .exitstampcls').remove();
                                $('.applicantinfomation-0 .qualificationcertificatecls').removeClass('hide');
                                $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                $('.applicantinfomation-0 .exitstampcls').remove();
                                htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);

                            }
                          }else{
                            if(typeofregident_latest == 'NON UAE RESIDENT (WITHOUT UAE REFERENCE)'){
                              console.log('inside non uae without reference adding qualification mandatory');
                              if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype!='Other')){
                                if(checklimitedHasforone!=-1){
                                  console.log('eligible country with limitation qualification');
                                  $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                  $('.applicantinfomation-0 .exitstampcls').remove();
                                  htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                  $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                                }
                                
                              }if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype=='Other')){
                                $('.applicantinfomation-0 .exitstampcls').remove();
                                htmladdcer = '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                              $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                              }else if((val=='Bachelors' || val=='Masters' || val=='Phd') && (relationtype=='Other')){
                                console.log('inside higher with other');
                                $('.applicantinfomation-0 .exitstampcls').remove();
                                $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';                               
                                $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                              }
                              
                            }else{
                              if((val=='Diploma' || val=='High School' || val=='Does not apply') && (relationtype!='Other')){
                                  $('.applicantinfomation-0 .qualificationcertificatecls').addClass('hide');
                                  $('.applicantinfomation-0 .qualificationcertificatecls').remove();

                              }else if((val=='Bachelors' || val=='Masters' || val=='Phd') && (relationtype!='Other')){
                                  console.log('higher education inside multiple');
                                  //$('.applicantinfomation-0 .exitstampcls').remove();
                                  $('.applicantinfomation-0 .qualificationcertificatecls').removeClass('hide');                                
                                  $('.applicantinfomation-0 .qualificationcertificatecls').remove();

                              }else {
                                $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                  htmladdcer  = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                              }
                            }
                              
                          }
                      
                      }
                        
                       
                      
                    }
                  }  
                  /*add event on input type file*/
                     $('#visa-2 input[type=file]').change(function(ev) {
                        var fileselect = $(this).val();
                        var filename = fileselect.replace(/^.*[\\\/]/, '')
                        $(this).parents(".c2c-file-upload").siblings('.file-text').text(filename);
                        $(this).parents(".c2c-file-upload").parents('.file-wrap').removeClass('haserror');
                    });
                  console.log('val', val); //callback for value change
              }
            });
            });
          })();
          /*close*/  
          /*function myMap() {
                var mapCanvas = document.getElementById("map");
                var mapOptions = {
                    center: new google.maps.LatLng(25.232074,55.300919), zoom: 13
                };
                //25.232074,55.300919,13.25z/
                var map = new google.maps.Map(mapCanvas, mapOptions);
    }*/
    function initMap() {
        var myLatLng = {lat: 25.2420199, lng: 55.305922};

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: myLatLng
        });

        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: 'Coast to Coast Tourism LLC'
        });
      }
        $( function() {
          $( "#datepicker" ).datepicker({ 
            dateFormat: 'dd-mm-yy' , 
            minDate : 0,
            onSelect: function(dateText, inst) {
                $('#'+inst.id).attr('value',dateText);
            }
            });

          $( "#dobpicker" ).datepicker({ 
            dateFormat : 'mm/dd/yy',
            changeMonth : true,
            changeYear : true,
            yearRange: '-100y:c+nn',
            maxDate: '-1d'
          });

        } );
    </script>
    <script>
        $( function() {
          $( "#slider-range" ).slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 75, 300 ],
            slide: function( event, ui ) {
              console.log(ui);
              $('#minval').val(ui.values[ 0 ])
              $('#maxval').val(ui.values[ 1 ])
              $( "#amount" ).val( CURRENCY_SYMBOL + ui.values[ 0 ] + " - "+ CURRENCY_SYMBOL + ui.values[ 1 ] );
            }
          });
          $( "#amount" ).val( CURRENCY_SYMBOL + $( "#slider-range" ).slider( "values", 0 ) + " - "+ CURRENCY_SYMBOL + $( "#slider-range" ).slider( "values", 1 ) );
        } );
        
    </script>
<script>
    $(document).ready(function () {
          var start = new Date();
        start.setFullYear(start.getFullYear() - 50);
        //alert(start.getFullYear());
        $("#hide").click(function () {
            $(".docu-faq-tabs .tab-content").slideUp("slow");
            $("#show").css("display", "block");
            $("#hide").css("display", "none");
        });

        $("#show").click(function () {
            $(".docu-faq-tabs .tab-content").slideDown("slow");
            $("#hide").css("display", "block");
            $("#show").css("display", "none");
        });
        



    });
</script>
<script type="text/javascript">
  $(document).ready(function () {
      $('#enquiry_submit').on('click', function(e) { 
        
       
       $("#enquiry_form").validate({
          // Specify validation rules
          rules: {
            name: "required",
            email : {
              required: true,
              email: true
            },
            country_code: "required",
            phone: "required",
            enquiry: "required"
          },
          // Specify validation error messages
          messages: {
            name: "Please enter your name",
            email : "Please enter a valid email",
            country_code: "Please specify the country code",
            phone: "Please enter your phone number",
            enquiry: "Please enter message"
          },
          
          submitHandler: function(form) {
            $.ajax({
              url: 'index.php?route=information/contact/enquiry',
              type: 'post',
                  data: $('#enquiry_form').serialize(),
              dataType: 'json',
              beforeSend: function() {
                $('#enquiry_submit').val('Sending...');
              },
              complete: function() {
                $('#enquiry_submit').val('Done');
              },
              success: function(json) {          
                      
                if (json['success']) {
                  $('#enquiry_msg').show();                
                }
              },
                  error: function(xhr, ajaxOptions, thrownError) {
                      console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                  }
            });          

          }
        }); 
    });

    $('#whatsapp_submit').on('click', function(e) { 
     $("#whatsapp_form").validate({
          // Specify validation rules
          rules: {
            name: "required",
            email : {
              required: true,
              email: true
            },
            country_code: "required",
            phone: "required"
            
          },
          // Specify validation error messages
          messages: {
            name: "Please enter your name",
            email : "Please enter a valid email",
            country_code: "Please specify the country code",
            phone: "Please enter your phone number",
            enquiry: "Please enter your phone number"
          },
          
          submitHandler: function(form) {
              $.ajax({
                url: 'index.php?route=information/contact/whatsappRegister',
                type: 'post',
                    data: $('#whatsapp_form').serialize(),
                dataType: 'json',
                beforeSend: function() {
                  $('#whatsapp_submit').val('Sending...');
                },
                complete: function() {
                  $('#whatsapp_submit').val('Done');
                },
                success: function(json) {          
                        
                  if (json['success']) {
                    $('#whatsapp_msg').show();                
                  }
                },
                    error: function(xhr, ajaxOptions, thrownError) {
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
              });  

          }
        });
    });


  });
</script>
<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHvJSRK7On_qPoa50lEtlQi9KZUXy_Wl4&callback=myMap"></script>-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHvJSRK7On_qPoa50lEtlQi9KZUXy_Wl4&callback=initMap"></script>

</body></html>