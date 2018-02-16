<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>

    <div class="row about-header">
        <div class="col-sm-12">
            <div class="about-tab">
                <ul class="clearfix">
                    <li><span><img src="catalog/view/theme/theme_c2c/images/about/building.svg"/> About us</span></li>
                    <li id="aboutTab">
                        <span><img src="catalog/view/theme/theme_c2c/images/about/box.svg"/> Our Products & Services</span>
                    </li>
                    <!--<li><span><img src="catalog/view/theme/theme_c2c/images/about/team.svg"/> Our Team</span></li>-->
                </ul>
            </div>

            <div class="about-us-main" id="about-us">
                <img src="catalog/view/theme/theme_c2c/images/about/about-img.jpg">

                <p>Coast to Coast (CTC) Tourism operates under multiple business models as a ‘Destination Management
                    Company (DMC)’, ‘Tour Operator’ and a ‘Travel Agency’ head quartered in the vibrant city of Dubai,
                    UAE.</p>

                <p>CTC currently operates under the following brand names:</p>
                <ul>
                    <li>Coast to Coast Tourism – Fully equipped ‘DMC’ business model operating from Dubai, UAE</li>
                    <li>Coast to Coast Holidays – Dynamic ‘Tour Operator’ business model operating worldwide</li>
                    <li>Coast to Coast Travel – ‘Travel Agency’ business model which is a Ticketing
                        arm of Coast to Coast and is a partner for all your Ticketing needs
                    </li>
                </ul>
                <p>CTC fosters a culture of innovation and dynamic packaging to our stakeholders, partners and
                    customers. We create competitive products and services for a premium customer experience within the
                    designated cities. CTC is head quartered in Dubai, United Arab Emirates (UAE) with presence across
                    Asia, Middle East and Africa (AMEA), either through strategic alliances or through physical presence
                    of our offices to offer our customers a world class service with tactful experience – our 15 years
                    of experience within the business and industry in AMEA equips us to do so immaculately.</p>

                <p>We offer our guests something unusually different from the first time we meet ensuring the utmost
                    attention to individual catering and preferences.</p>

                <p>Our team comprises of qualified Travel & Tourism professionals (across Contracting, Reservations,
                    Business Development, Strategy, Marketing functions etc.) who carry several years of experience
                    within the Tourism industry and are able to offer a combination of both static and dynamic content
                    comprising a portfolio of endless products and services to ensure 100% satisfaction</p>
            </div>
            <div class="about-us-main" id="about-product">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="about-enquiry">
                            <h3>For any inquiries on our products/services or any booking requirements, please reach
                                out to us on the following:</h3>
                            <ul>
                                <li><a href="mailto:reservations@ctctourism.ae"><img
                                                src="catalog/view/theme/theme_c2c/images/about/msg.svg"/>
                                        reservations@ctctourism.ae</a></li>
                                <li><a href="tel:0097143979979"><img
                                                src="catalog/view/theme/theme_c2c/images/about/phone.svg"/> + 971 (0) 43
                                        979 979 </a></li>
                                <li><a href="www.ctctourism.com"><img
                                                src="catalog/view/theme/theme_c2c/images/about/globle.svg"/>
                                        www.ctctourism.com </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <h2>Our Products & Services:</h2>

                        <p>We are specialists in Inbound trips to United Arab Emirates (UAE) and are instantly able to
                            support Individuals, Tour Operators and Destination Management Companies on the following
                            UAE related services:</p>
                        <ul>
                            <li>Holiday Packages to UAE (Standard & Dynamic Packages)</li>
                            <li>Visa related services for UAE</li>
                            <li>Hotels & Accommodation in UAE</li>
                            <li>Tours & Excursions in UAE</li>
                            <li>Parks in UAE</li>
                            <li>Transfers, Transportation & Limousine Services in UAE</li>
                            <li>Groups & MICE related services</li>
                            <li>Flights & Air Ticketing</li>
                        </ul>

                    </div>
                    <div class="col-sm-12">
                        <p>We are always looking out for dynamic individuals to join our ever growing team (especially
                            in the Sales & Business Development function), hence should you experience in the Travel &
                            Tourism arena in the UAE then please send your profiles to recruitment@ctctourism.ae</p>
                    </div>
                </div>
            </div>
            <div class="about-us-main" id="about-team"></div>
        </div>
    </div>

</div>
<?php echo $footer; ?>
<script type="text/javascript">
    $("#aboutTab").click(function() {
        $('html, body').animate({
            scrollTop: $("#about-product").offset().top
        }, 2000);
    });
</script>