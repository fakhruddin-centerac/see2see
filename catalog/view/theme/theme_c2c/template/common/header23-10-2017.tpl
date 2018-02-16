<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <!--<script src="catalog/view/javascript/jquery/jquery-migrate-1.2.1.js" type="text/javascript"></script>-->
        <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <!--<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>-->
        
        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
        <link href="catalog/view/theme/theme_c2c/stylesheet/stylesheet.css" rel="stylesheet"/>
        <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
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
        <link href="catalog/view/theme/theme_c2c/css/style.css" rel="stylesheet">
        <link href="catalog/view/theme/theme_c2c/css/responsive.css" rel="stylesheet">
        
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
              <h2>Hotels (Coming Soon)</h2>
              <ul>
                <li><a href="javascript:void(0)">3 Star Hotels</a></li>
                <li><a href="javascript:void(0)">4 Star Hotels</a></li>
                <li><a href="javascript:void(0)">5 Star Hotels</a></li>
              </ul>
            </div>
            <div class="menu-item menu-icon-packages">
              <h2>PACKAGES(Coming Soon)</h2>
              <ul>
                <li><a href="javascript:void(0)">CTC Standard Package</a></li>
                <li><a href="javascript:void(0)">Make Your Holiday Package</a></li>
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
                     <li><a href="<?php echo $limoservicecategorie['href'] ?>"><?php echo $limoservicecategorie['name'] ?></a></li>
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
        <div class="top-header-wrap <?php if($pagetypectrl=='information'){echo 'short-header';} ?>">
          <div class="container">
            <div class="logo"><a href="<?php echo $home; ?>"><img src="catalog/view/theme/theme_c2c/images/logo.svg"></a>
                <?php /*if ($logo) { ?>
                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
                <h1><a href="<?php echo $home; ?>"><img src="catalog/view/theme/theme_c2c/images/logo.svg"></a></h1>
          <?php } */?>
                
            </div>
            <div class="hdr-contact">
              <span class="hdr-tel"><a href="tel:971234567891"></a></span>
              <div class="header-share">
                <span><a target="_blank" href="<?php echo $facebook; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-fb.svg"/></a></span>
                <span><a target="_blank" href="<?php echo $twitter; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-tweet.svg"/></a></span>
                <span><a target="_blank" href="<?php echo $instagram; ?>"><img src="catalog/view/theme/theme_c2c/images/icon-instagram.svg"/></a></span>
                <span><a target="_blank" href="<?php echo $linkedin;   ?>"><img src="catalog/view/theme/theme_c2c/images/icon-linkdIn.svg"/></a></span>
              </div>
            </div>
            <div class="menu-icon">
              <a href="javascript:void(0)" class="toggle-mnu">
                <span></span>
              </a>
            </div>
            <?php echo $cart; ?>
            <div class="menuitemcontact">
                <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
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
                <div class="header-banner owl-carousel owl-theme">
                  <?php
                    foreach($homeBannerheder as $homeBannerhederss)
                    {
                  ?>
                  <div class="item" style="background-image: url(<?php echo $homeBannerhederss['image'] ;?>);">
                    <div class="container">
                      <div class="banner-title">
                        <h5 data-aos="fade-up" data-aos-duration="700"><?php echo $homeBannerhederss['title'] ;?></h5>
                        <h1 data-aos="fade-up" data-aos-duration="1000">THE LEADING <br/>TOUR OPERATOR <br/>IN DUBAI</h1>
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
                            <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/banner-bg-4.jpg"></div>
                            <div class="container">
                              <div class="inner-title">
                                <h1>Overnight<br/>Desert Safari</h1>
                              </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/banner-bg-3.jpg"></div>
                            <div class="container">
                              <div class="inner-title">
                                <h1>Overnight<br/>Desert Safari</h1>
                              </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/banner-bg-2.jpg"></div>
                            <div class="container">
                              <div class="inner-title">
                                <h1>Overnight<br/>Desert Safari</h1>
                              </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="inner-banner-image"><img src="catalog/view/theme/theme_c2c/images/banner-bg-1.jpg"></div>
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