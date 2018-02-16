<div class="section fp-auto-height" id="pageFooter">
    <footer>
        <div class="container">
            <div class="row">
                <div class="footer-item" data-aos="fade-up" data-aos-duration="1500">
                    <h2><a href="">UAE Visa</a></h2>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($visaproductmenu as $visalink)
                        {
                    ?>
                            <li><a href="<?php echo $visalink['href']; ?>"><?php echo $visalink['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                    <h2><a href="">PACKAGES</a></h2>

                    <div class="ftr-links">
                        <ul>
                            <li><a href="javascript:void(0)">CTC Standard Package</a></li>
                            <li><a href="javascript:void(0)">Make Your Holiday Package</a></li>
                        </ul>
                    </div>
                </div>
                <div class="footer-item" data-aos="fade-up" data-aos-duration="1500">
                    <h2><a href="">TOURS & EXCURSIONS</a></h2>
                    <h4><a href="">Desert Tours</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($desrttour as $desert)
                        {
                    ?>
                            <li><a href="<?php echo $desert['href']; ?>"><?php echo $desert['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                    <h4><a href="#">Dhow Cruise Tours</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($dhow as $dhowtour)
                        {
                    ?>
                            <li><a href="<?php echo $dhowtour['href']; ?>"><?php echo $dhowtour['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                    <h4><a href="#">Aerial Tours</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($aerial as $aerialtour)
                        {
                    ?>
                            <li><a href="<?php echo $aerialtour['href']; ?>"><?php echo $aerialtour['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                    <h4><a href="#">Sightseeing Tours</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($sight as $sighttour)
                        {
                    ?>
                            <li><a href="<?php echo $sighttour['href']; ?>"><?php echo $sighttour['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                    <h4><a href="#">Combo Tours</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($comobo as $comobotour)
                        {
                    ?>
                            <li><a href="<?php echo $comobotour['href']; ?>"><?php echo $comobotour['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                </div>

                <div class="footer-item" data-aos="fade-up" data-aos-duration="1500">

                    <h2><a href="#">PARKS</a></h2>
                    <h4><a href="#">Water Parks</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($waterpark as $water)
                        {
                    ?>
                            <li><a href="<?php echo $water['href']; ?>"><?php echo $water['name']; ?></a></li>
                            <?php
                        }
                    ?>

                        </ul>
                    </div>
                    <h4><a href="#">Theme Parks</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($themepark as $theme)
                        {
                    ?>
                            <li><a href="<?php echo $theme['href']; ?>"><?php echo $theme['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                    <h4><a href="#">Combo Tickets</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <li><a href="javascript:void(0)">Combo Pass - Motion Gate +</a></li>
                            <li><a href="javascript:void(0)">Bollywood Park + Legoland</a></li>
                            <li><a href="javascript:void(0)">Combo Pass - Ferrari World</a></li>
                        </ul>
                    </div>
                </div>
                <div class="footer-item" data-aos="fade-up" data-aos-duration="1500">
                    <h2><a href="">Water Sports</a></h2>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($watersport as $watersp)
                        {/*
                            ?>
                            <li><a href="<?php echo $watersp['href']; ?>"><?php echo $watersp['name']; ?></a></li>
                            <?php
                            */}
                    ?>

                            <li><a href="javascript:void(0)">Fly Bike (30 mins)</a></li>
                            <li><a href="javascript:void(0)">Water Ski/Zup Board</a></li>
                            <li><a href="javascript:void(0)">Knee boarding (15 mins)</a></li>
                            <li><a href="javascript:void(0)">Wake boarding (15 mins)</a></li>
                            <li><a href="javascript:void(0)">Banana Ride (15 mins)</a></li>
                            <li><a href="javascript:void(0)">Fly Fish (15 mins)</a></li>
                            <li><a href="javascript:void(0)">Donut Ride (15 mins)</a></li>
                            <li><a href="javascript:void(0)">Parasailing</a></li>
                            <li><a href="javascript:void(0)">Parasailing Tandem</a></li>
                            <li><a href="javascript:void(0)">Scuba Diving Tour</a></li>
                            <li><a href="javascript:void(0)">Jet Ski single</a></li>
                            <li><a href="javascript:void(0)">Jet Ski single</a></li>
                            <li><a href="javascript:void(0)">Jet Ski double</a></li>
                        </ul>
                    </div>
                    <h2><a href="#">LIMO TRANSFER</a></h2>
                    <h4><a href="#">Limousine Services</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($limoservice as $limo)
                        {
                    ?>
                            <li><a href="<?php echo $limo['href']; ?>"><?php echo $limo['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                    <h4><a href="#">Airport Transfers</a></h4>

                    <div class="ftr-links">
                        <ul>
                            <?php
                        foreach($airporttransfer as $airport)
                        {
                    ?>
                            <li><a href="<?php echo $airport['href']; ?>"><?php echo $airport['name']; ?></a></li>
                            <?php
                        }
                    ?>
                        </ul>
                    </div>
                </div>
                <div class="footer-item" data-aos="fade-up" data-aos-duration="1500">

                    <?php if ($informations) { ?>
                    <div class="footer-page">
                        <h5><?php //echo $text_information; ?>Pages</h5>
                        <ul class="list-unstyled">
                            <?php foreach ($informations as $information) { ?>
                            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
                            </li>
                            <?php } ?>
                            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                        </ul>
                    </div>
                    <?php } ?>

                    <div class="footer-share">
                        <span><a target="_blank" href="<?php echo $facebook; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-fb.svg"/></a></span>
                        <span><a target="_blank" href="<?php echo $twitter; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-tweet.svg"/></a></span>
                        <span><a target="_blank" href="<?php echo $instagram; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-instagram.svg"/></a></span>
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


<script src="catalog/view/theme/theme_c2c/js/jquery-ui.min.js"></script>
<script src="catalog/view/theme/theme_c2c/js/jquery.ui.touch-punch.min.js"></script>
<!--  for  sect option on product page-->
<script src="catalog/view/theme/theme_c2c/js/classie.js"></script>
<script src="catalog/view/theme/theme_c2c/js/selectFx.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="catalog/view/theme/theme_c2c/js/aos.js"></script>
<script src="catalog/view/theme/theme_c2c/js/bootstrap.min.js"></script>
<script src="catalog/view/theme/theme_c2c/js/owl.carousel.min.js"></script>
<script src="catalog/view/theme/theme_c2c/js/custom.js"></script>
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

    /*now start condition for qualificatio stamp */
    (function () {
        [].slice.call(document.querySelectorAll('select.cs-select')).forEach(function (el) {
            new SelectFx(el, {
                onChange: function (val) {
                    //alert("jj="+el.parent().attr('rel'));
                    var nameofsele = '';
                    var relationtype = '';
                    nameofsele = el.name;
                    if (nameofsele == 'applicantinfo[0][country]') {
                        /*applicantinfo-1-country*/
                        numberofapplicant = $('.applcatentblock > div').length;
                        texval = $('.visa-main.applicantno-0 .orignalcountry .cs-options ul li[data-value=' + val + '] span').text();
                        //alert(texval+"--");
                        if (numberofapplicant > 1) {
                            apllcounter = 1;
                            for (i = 2; i <= $('.applcatentblock > div').length; i++) {
                                //$('.visa-main.applicantno-1 .applicantinfo-1-country span.cs-placeholder').text(texval);
                                //alert(texval);
                                $('.visa-main.applicantno-' + apllcounter + ' .applicantinfo-' + apllcounter + '-country .cs-options ul li').hide();
                                $('.visa-main.applicantno-' + apllcounter + ' .applicantinfo-' + apllcounter + '-country .cs-options ul li[data-value=' + val + ']').show();
                                $('.visa-main.applicantno-' + apllcounter + ' .applicantinfo-' + apllcounter + '-country select').val(val);
                                $('.visa-main.applicantno-' + apllcounter + ' .applicantinfo-' + apllcounter + '-country .cs-placeholder').html(texval);
                                apllcounter++;
                            }

                        }

                    }
                    if ($('.personrelationshipvisa .cs-placeholder').length == 1) {
                        relationtype = $('.personrelationshipvisa .cs-placeholder').eq(0).text();
                    }
                    else {
                        relationtype = $('.personrelationshipvisa .cs-placeholder').eq(1).text();
                    }
                    //if(relationtype=='Other' && nameofsele=='applicantinfo[0][qualification]')
                    if (nameofsele == 'applicantinfo[0][qualification]') {
                        var country_flag = $('input[name="country_flag"]').val();
                        if (country_flag == 'LIMITED') /*14 30 without bangladash*/
                        {
                            if (val == 'Diploma' || val == 'High School' || val == 'Does not apply') {
                                $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                $('.applicantinfomation-0 .exitstampcls').remove();
                                htmladdcer = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                                $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                            }
                            else if (val == 'Bachelors' || val == 'Masters' || val == 'Phd') {
                                /*27-9nigh
                                 $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                 */
                                $('.applicantinfomation-0 .exitstampcls').remove();
                            }
                        }
                        else {
                            /*now need to check bangldash,pak...etc */
                            var restrict_country_limited = ["18", "156", "144", "162"];
                            applicantcountry = $('.applicantno-0 .countryy_select select').val();
                            //alert("country:- "+applicantcountry);
                            var checklimitedHasforone = restrict_country_limited.indexOf(applicantcountry);
                            // alert(checklimitedHasforone);
                            // if(checklimitedHasforone==-1)
                            // {
                            /*countrey not found so apply condion as like above*/

                            if (val == 'Diploma' || val == 'High School' || val == 'Does not apply') {
                                $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                $('.applicantinfomation-0 .exitstampcls').remove();
                                htmladdcer = '<div class="col-sm-4 qualificationcertificatecls fgg"><div class="file-wrap"><div class="c2c-file-upload mandatory  "><input name="applicantinfo[0][qualificationcertificate]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Qualification Certificate</div></div></div>';
                                htmladdcer += '<div class="col-sm-4 exitstampcls"><div class="file-wrap"><div class="c2c-file-upload mandatory"><input name="applicantinfo[0][exitstamp]" type="file"><img src="catalog/view/theme/theme_c2c/images/attachmnt-icon.svg"></div><div class="file-text">Proof of Exit Stamp from the UAE</div></div></div>';
                                $('.applicantinfomation-0 .qualificationofapplicant').after(htmladdcer);
                            }
                            else if (val == 'Bachelors' || val == 'Masters' || val == 'Phd') {
                                $('.applicantinfomation-0 .qualificationcertificatecls').remove();
                                $('.applicantinfomation-0 .exitstampcls').remove();
                            }
                            // }
                        }
                    }
                    /*add event on input type file*/
                    $('#visa-2 input[type=file]').change(function (ev) {
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
    $(function () {
        $("#datepicker").datepicker({
            dateFormat: 'dd-mm-yy',
            minDate: 0,
            onSelect: function (dateText, inst) {
                $('#' + inst.id).attr('value', dateText);
            }
        });
    });
</script>
<script>
    $(function () {
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 500,
            values: [75, 300],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + $("#slider-range").slider("values", 0) +
                " - $" + $("#slider-range").slider("values", 1));
    });

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
<!--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHvJSRK7On_qPoa50lEtlQi9KZUXy_Wl4&callback=myMap"></script>-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHvJSRK7On_qPoa50lEtlQi9KZUXy_Wl4&callback=initMap"></script>

</body></html>