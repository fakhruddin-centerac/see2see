<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>

    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <!--<script src="catalog/view/javascript/jquery/jquery-migrate-1.2.1.js" type="text/javascript"></script>-->
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <!--<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->

    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css"/>
    <link href="catalog/view/theme/theme_c2c/stylesheet/stylesheet.css" rel="stylesheet"/>
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
    <link href="catalog/view/theme/theme_c2c/css/aos.css" rel="stylesheet">
    <link href="catalog/view/theme/theme_c2c/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="catalog/view/theme/theme_c2c/css/jquery-ui.css">
    <link href="catalog/view/theme/theme_c2c/css/owl.carousel.min.css" rel="stylesheet">
    <link href="catalog/view/theme/theme_c2c/css/owl.theme.default.css" rel="stylesheet">
    <link href="catalog/view/theme/theme_c2c/css/bootstrap-stars.css" rel="stylesheet">
    <link href="catalog/view/theme/theme_c2c/css/jquery.mCustomScrollbar.min.css" rel="stylesheet">
    <link href="catalog/view/theme/theme_c2c/css/lightslider.min.css" rel="stylesheet">
    <link href="catalog/view/theme/theme_c2c/css/style.css" rel="stylesheet">
    <link href="catalog/view/theme/theme_c2c/css/responsive.css" rel="stylesheet">
    <!-- select 2 min-->
    <link href="catalog/view/theme/theme_c2c/css/select2.min.css" rel="stylesheet">

    <!-- validation js-->

    <script src="catalog/view/theme/theme_c2c/js/jquery.validate.js" type="text/javascript"></script>
    <script src="catalog/view/theme/theme_c2c/js/additional-methods.js" type="text/javascript"></script>
    <script type="text/javascript">
        var CURRENCY_SYMBOL = '<?php echo $currencysymbol; ?>';
    </script>
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
	var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
	s1.async=true;
	s1.src='https://embed.tawk.to/5a5c92424b401e45400c18bb/default';
	s1.charset='UTF-8';
	s1.setAttribute('crossorigin','*');
	s0.parentNode.insertBefore(s1,s0);
	})();
     </script>
     <!--End of Tawk.to Script-->

</head>
<body class="destroy-active <?php echo $class; ?>">
<div class="pop-menu">
    <div class="container">
        <div class="menu-item menu-icon-uae-visa">
            <h2>UAE VISA</h2>
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
        <div class="menu-item menu-icon-hotels">
            <h2>Hotels</h2>
            <ul>
                <li><a href="<?php echo 'index.php?route=product/hotels/landing'; ?>">Hotels</a></li>
                <!-- <li><a href="<?php echo 'index.php?route=product/hotels&filter_star=4'; ?>">4 Star Hotels</a></li>
                <li><a href="<?php echo 'index.php?route=product/hotels&filter_star=5'; ?>">5 Star Hotels</a></li> -->
            </ul>
        </div>
        <div class="menu-item menu-icon-packages">
            <h2>PACKAGES</h2>
            <ul>
                <li><a href="<?php echo 'index.php?route=product/standardpackage&product_id=238'; ?>">CTC Standard
                        Package</a>
                    <ul class="submenu">
                        <li><a href="index.php?route=product/standardpackage&product_id=238&filter_star=3">3 Star</a>
                        </li>
                        <li><a href="index.php?route=product/standardpackage&product_id=238&filter_star=4">4 Star</a>
                        </li>
                        <li><a href="index.php?route=product/standardpackage&product_id=238&filter_star=5">5 Star</a>
                        </li>
                    </ul>
                </li>
                <li><a href="<?php echo 'index.php?route=product/makepackage&product_id=241'; ?>">Make Your Holiday
                        Package</a></li>
            </ul>
        </div>
        <div class="menu-item menu-icon-tours">
            <h2>TOURS & EXCURSIONS</h2>
            <ul>
                <?php
                    foreach($tourscategories as $tourscategorie )
                    {
                    ?>
                <li><a href="<?php echo $tourscategorie['href'] ?>"><?php echo $tourscategorie['name'] ?></a></li>
                <?php
                    }
                ?>
            </ul>
        </div>
        <div class="menu-item menu-icon-parks">
            <h2>PARKS</h2>
            <ul>
                <?php
                    foreach($parkscategories as $parkscategorie )
                    {
                    ?>
                <li><a href="<?php echo $parkscategorie['href'] ?>"><?php echo $parkscategorie['name'] ?></a></li>
                <?php
                    }
                ?>
            </ul>
        </div>
        <div class="menu-item menu-icon-limo">
            <h2>LIMO TRANSFER</h2>
            <ul>
                <?php
                    foreach($limoservicecategories as $limoservicecategorie )
                    {
                    ?>
                <li>
                    <a href="<?php echo $limoservicecategorie['href'] ?>"><?php echo $limoservicecategorie['name'] ?></a>
                </li>
                <?php
                    }
                ?>
            </ul>
        </div>
    </div>
</div>
<div class="menu-icon mobile-menu">
    <a href="javascript:void(0)" class="toggle-mnu">
        <span></span>
    </a>
</div>
<!--<div class="top-header-wrap <?php if($pagetypectrl=='information'){echo 'short-header';} ?>">-->
<div class="top-header-wrap <?php if($pagetypectrl=='information'){echo '';} ?>">
    <div class="container">
        <div class="logo"><a href="<?php echo $home; ?>"><img src="catalog/view/theme/theme_c2c/images/logo.svg"></a>
            <?php /*if ($logo) { ?>
            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>"
                                                alt="<?php echo $name; ?>" class="img-responsive"/></a>
            <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><img src="catalog/view/theme/theme_c2c/images/logo.svg"></a></h1>
            <?php } */?>

        </div>
        <div class="hdr-contact">
            <span class="hdr-tel"><a href="tel:971234567891"></a></span>

            <div class="header-share">
                <span><a target="_blank" href="<?php echo $facebook; ?>"><img
                                src="catalog/view/theme/theme_c2c/images/icon-fb.svg"/></a></span>
                <span><a target="_blank" href="<?php echo $twitter; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-tweet.svg"/></a></span>
                <!--<span><a target="_blank" href="<?php echo $instagram; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-instagram.svg"/></a></span>-->
                <span><a target="_blank" href="<?php echo $linkedin;   ?>"><img src="catalog/view/theme/theme_c2c/images/icon-linkdIn.svg"/></a></span>
            </div>
        </div>
        <div class="menu-icon">
            <a href="javascript:void(0)" class="toggle-mnu">
                <span></span>
            </a>
        </div>
        <div class="cart-div">
            <?php echo $cart; ?>
        </div>


        <div class="head-menu-sub clearfix">


            <div class="menuitemabout">
                <a href="<?php echo 'index.php?route=information/about'; ?>">About Us<i
                            class="fa fa-users contact-icon-header" aria-hidden="true"></i></a>
            </div>
            <div class="menuitemcontact">
                <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?><i class="fa fa-phone contact-icon-header"
                                                                                 aria-hidden="true"></i></a>
            </div>
            <div class="menuitemlogin">
                <a href="javascript:void(0);" id="agent_login">Agent Login<i class="fa fa-phone contact-icon-header"
                                                                             aria-hidden="true"></i></a>
            </div>
        </div>

        <div class="currency-div desktop-view">
            <?php echo $currency; ?>
        </div>

        <!--
        <div class="top-cart">
        <span>0.00</span>
        </div>
        -->
        <div class="top-login"><a href=""></a></div>
    </div>
</div>
<div id="fullpage">
    <?php
        /*
            identityfication mated for $class is 
            home page  --common-home 
            category p[age-  product-category-66]
            productpage-  product-category-66
        */
        
        if($class=='common-home')
        {
            ?>

    <div class="section " id="pageHome">
        <a href="<?php echo 'index.php?route=information/contact'; ?>" class="feedbackbtn">
            <span class="feed_text">Feedback</span>
        </a>

        <div class="social-sticky">
            <ul>
                <li>
                    <a href="" class="social-click">
                        <div class="social-main">
                            <img src="catalog/view/theme/theme_c2c/images/social-icons/whatsapp-w.svg"/>
                        </div>
                        <div class="clearfix social-sub">
                            <div class="social-sub-img">
                                <img src="catalog/view/theme/theme_c2c/images/social-icons/whatsapp-w.svg"/>
                            </div>
                            <div class="social-sub-info">
                                <p>WhatsApp</p>
                            </div>
                        </div>
                    </a>

                    <div class="slide-left-top">
                        <form id="whatsapp_form">
                            <div class="top-form">
                                <div class="top-form-group text-right">
                                    <span class="slide-left-close"></span>
                                </div>
                                <div class="top-form-group">
                                    <h2>Register your number</h2>
                                </div>
                                <div class="top-form-group">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <input type="text" placeholder="Name" name="name"/>
                                </div>
                                <div class="top-form-group">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <input type="email" placeholder="Email" name="email"/>
                                </div>
                                <div class="top-form-group">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <input type="text" placeholder="+971" name="code" class="contactcode"/>
                                    <input type="text" placeholder="Telephone" name="phone" class="contactno"/>
                                </div>

                                <div class="top-form-group text-right">
                                    <input type="submit" value="Send" id="whatsapp_submit"/>

                                    <p class="top-form-message" id="whatsapp_msg"><i class="fa fa-check-circle"
                                                                                     aria-hidden="true"></i> Your
                                        Request sent</p>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>
                <li>
                    <a href="" class="social-click">
                        <div class="social-main">
                            <img src="catalog/view/theme/theme_c2c/images/social-icons/top-msg-w.svg"/>
                        </div>
                        <div class="clearfix social-sub">
                            <div class="social-sub-img">
                                <img src="catalog/view/theme/theme_c2c/images/social-icons/top-msg-w.svg"/>
                            </div>
                            <div class="social-sub-info">
                                <p>Enquiry</p>
                            </div>
                        </div>
                    </a>

                    <div class="slide-left-top">
                        <form id="enquiry_form">
                            <div class="top-form">
                                <div class="top-form-group text-right">
                                    <span class="slide-left-close"></span>
                                </div>
                                <div class="top-form-group">
                                    <h2>Quick Enquiry</h2>
                                </div>
                                <div class="top-form-group">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <input type="text" placeholder="Name" name="name"/>
                                </div>
                                <div class="top-form-group">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <input type="email" placeholder="Email" name="email"/>
                                </div>
                                <div class="top-form-group">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                    <input type="text" placeholder="+971" name="code" class="contactcode"/>
                                    <input type="text" placeholder="Telephone" name="phone" class="contactno"/>
                                </div>
                                <div class="top-form-group top-form-group-msg">
                                    <i class="fa fa-comments" aria-hidden="true"></i>
                                    <textarea placeholder="Message" name="enquiry"></textarea>
                                </div>
                                <div class="top-form-group text-right">
                                    <input type="submit" value="Send" id="enquiry_submit"/>

                                    <p class="top-form-message" id="enquiry_msg"><i class="fa fa-check-circle"
                                                                                    aria-hidden="true"></i> Your Enquiry
                                        sent</p>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>
                <li>
                    <a href="" class="social-click">
                        <div class="social-main">
                            <img src="catalog/view/theme/theme_c2c/images/social-icons/top-phone-w.svg"/>
                        </div>
                        <div class="clearfix social-sub">
                            <div class="social-sub-img">
                                <img src="catalog/view/theme/theme_c2c/images/social-icons/top-phone-w.svg"/>
                            </div>
                            <div class="social-sub-info">
                                <p>Call Us</p>
                            </div>
                        </div>
                    </a>

                    <div class="slide-left-top">

                        <div class="top-form">
                            <div class="top-form-group text-right">
                                <span class="slide-left-close"></span>
                            </div>
                            <div class="top-form-group">
                                <h2>Customer Care</h2>
                            </div>
                            <div class="top-form-group">
                                <div class="top-form-detail">
                                    <h5><i class="fa fa-map-marker" aria-hidden="true"></i> UAE</h5>

                                    <p>Office 406, Business Venue Blg,
                                        Oud Metha, Dubai, UAE., 29160
                                        Dubai, United Arab Emirates</p>
                                </div>
                                <div class="top-form-detail">
                                    <h5><i class="fa fa-map-marker" aria-hidden="true"></i> INDIA</h5>

                                    <p>Gustad Chambers, Plot 108/110, Laxman Narayan Jadhav Road, Jail Road, Umerkhadi,
                                        Byculla, Office 15, Ground Floor, Mumbai, Maharashtra 400009, India</p>
                                </div>
                                <div class="top-form-contact">
                                    <a href="mailto:reservations@ctctourism.ae"><i><img
                                                    src="catalog/view/theme/theme_c2c/images/social-icons/mail-blue.svg"/></i>
                                        reservations@ctctourism.ae</a>
                                    <a href="tel:0097143979979"><i><img
                                                    src="catalog/view/theme/theme_c2c/images/social-icons/phone-blue.svg"/></i>
                                        + 971 (0) 43 979 979 </a>
                                </div>
                            </div>
                        </div>

                    </div>
                </li>
            </ul>
        </div>
        <div class="header-banner owl-carousel owl-theme">
            <?php
                    foreach($homeBannerheder as $homeBannerhederss)
                    {
                      $newItemClass="";
                      $imageArr = explode('/',$homeBannerhederss['image']);                       
                      if(end($imageArr) =='banner-harbour.jpg'){
                        $newItemClass="topbannerImage";
                      }
                  ?>
            <div class="item <?php echo $newItemClass; ?>"
                 style="background-image: url(<?php echo $homeBannerhederss['image'] ;?>);">
                <div class="container">
                    <div class="banner-title">
                        <h5 data-aos="fade-up" data-aos-duration="700"><?php echo $homeBannerhederss['title'] ;?></h5>

                        <h1 data-aos="fade-up" data-aos-duration="1000">THE LEADING <br/>DESTINATION MANAGERS <br/>IN
                            DUBAI</h1>
                    </div>
                </div>
            </div>
            <?php
                    }
                  ?>
            <?php
        }
        else
        {
            /*now chweck type of page throung variable-> pagetypectrl */
            if($pagetypectrl=='information')
            {
            ?>
            <div class="inner-banner">
                <div class="owl-carousel owl-theme banner-slide">


                    <div class="item">
                        <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/contact.jpg">
                        </div>
                        <!--<div class="container">
                          <div class="inner-title">
                            <h1>Overnight<br/>Desert Safari</h1>
                          </div>
                        </div>-->
                    </div>


                </div>
            </div>

            <?php
                
            }
            else
            {
         ?>
            <div class="inner-banner">
                <div class="owl-carousel owl-theme banner-slide">
                    <?php
                
                  if(is_array($ProductCategoryBanners))
                  {
                        foreach($ProductCategoryBanners as $ProductCategoryBanner)
                        {
                  ?>
                    <div class="item">
                        <div class="inner-banner-image"><img src="<?php echo $ProductCategoryBanner['image']; ?>"></div>
                        <div class="container">
                            <div class="inner-title">
                                <h1><?php echo $ProductCategoryBanner['categoryname']; ?></h1>
                            </div>
                        </div>
                    </div>
                    <?php
                        } 
                  }
                  else
                  {
                   ?>
                    <div class="item">
                        <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/banner-bg-4.jpg">
                        </div>
                        <div class="container">
                            <div class="inner-title">
                                <h1>Overnight<br/>Desert Safari</h1>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/banner-bg-3.jpg">
                        </div>
                        <div class="container">
                            <div class="inner-title">
                                <h1>Overnight<br/>Desert Safari</h1>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/banner-bg-2.jpg">
                        </div>
                        <div class="container">
                            <div class="inner-title">
                                <h1>Overnight<br/>Desert Safari</h1>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/banner-bg-1.jpg">
                        </div>
                        <div class="container">
                            <div class="inner-title">
                                <h1>Overnight<br/>Desert Safari</h1>
                            </div>
                        </div>
                    </div>
                    <?php
                  }
                  ?>
                </div>
            </div>
            <?php
            }
        }
        ?>