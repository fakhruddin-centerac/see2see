// Home Carousel 
var elementOffset;
$('.header-banner').owlCarousel({
    autoplay:true,
    autoplayTimeout:4000,
    margin:0,
    nav:false,
    dots:true,
    animateOut: 'fadeOut',
    touchDrag  : true,
    mouseDrag  : true,  
    loop:true,
    items: 1,
});

$('.related-items').owlCarousel({
    margin:50,
    nav:false,
    items:3,
    autoplay:true,
    autoplayTimeout:5000,
    dots:true,
    animateOut: 'fadeOut',
    // autoplay:true,
    // autoplayTimeout:5000
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:3
        }
    }
});
// toggle menu 

$('.banner-slide').owlCarousel({
    margin:0,
    nav:false,
    items:1,
    autoplay:false,
    autoplayTimeout:5000,
    dots:true,
    animateOut: 'fadeOut'
    // autoplay:true,
    // autoplayTimeout:5000
});


$(".toggle-mnu").click(function() {
  $(this).toggleClass("on");
  $('body').toggleClass("active-menu");
  $(".main-mnu").slideToggle();
  return false;
});
$("ul#menus li").click(function(){
    $('body').removeClass("active-menu");
       
});
// $.fn.fullpage.destroy('all');
/*
$("a").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 1000, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
*/

$(window).scroll(function() {    
    var scroll = $(window).scrollTop();

    if (scroll >= 100) {
        $('body').addClass("search-scroll-down-active");
    } else {
        $('body').removeClass("search-scroll-down-active");
    }
});

$('.amenity-icon').on('click', function(){

    var clickIndex = $(this).data('value');

    $('.amenity-head').text($('.hotel-info h2').text());
    console.log(clickIndex);
    $('.amenity-contianer').addClass('active');


});
$('.overly-click, .amenity-pop-main .close').on('click', function(){

    $('.amenity-contianer').removeClass('active');

});

$('.hotel-heart i').on('click', function(){
    $(this).toggleClass('active');
});


function newReadURL(input) {
    console.log('attachment');
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $(input).parent('.attach-copy').find('img').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

//$(".attach-copy input[type='file']").change(function(){
$(document).on('change',".attach-copy input[type='file']",function() {
    var inputVal = $(this).val();
    console.log(inputVal);
    if(inputVal){
        $(this).parent('.attach-copy').children('.view-attachement').fadeIn();
    }
    else {
        $(this).parent('.attach-copy').children('.view-attachement').fadeOut();
    }


    newReadURL(this);

    var files = $(this).prop('files');
    var flist = "";

    for(var i=0; i < files.length; i++)
    {
        if(flist!="")
            flist+=", ";
        flist+=files[i]['name'];
    }
    $(this).next().val( flist );

});
$(document).on('click',".view-attachement",function() {
    $(this).find('.attachment-view').fadeIn();
    $('.view-attachement').addClass('open-attach');
});
$(document).on('click',".attach-close",function(e) {
    e.stopPropagation();
    $('.attachment-view').fadeOut();
    $('.view-attachement').removeClass('open-attach');
});

$('.tours-band.tour-band ul li').on('click',function() {
    var theIndex = $(this).index();
    $('.tours-band.tour-band ul li, .tour-band-container .tours-band-content').removeClass('active');
    $(this).addClass('active');
    $('.tour-band-container .tours-band-content').eq(theIndex).addClass('active');
});

$('.tours-band.park-band ul li').on('click',function() {
    var theIndex = $(this).index();
    $('.tours-band.park-band ul li, .park-band-container .tours-band-content').removeClass('active');
    $(this).addClass('active');
    $('.park-band-container .tours-band-content').eq(theIndex).addClass('active');
});

$('.accord-list > h2').on('click', function(){
    if($(this).parent().hasClass('active')){
        $('.package-tours-accordian ul li.accord-list.active').removeClass('active');
    }
    else{
        $('.package-tours-accordian ul li.accord-list').removeClass('active');
        $(this).parent().addClass('active');
    }
});





$('.parks-band.park-band ul li').on('click',function() {
    var theIndex = $(this).index();
    $('.parks-band.park-band ul li, .park-band-container .parks-band-content').removeClass('active');
    $(this).addClass('active');
    $('.park-band-container .parks-band-content').eq(theIndex).addClass('active');
});

$('.parks-band.park-band ul li').on('click',function() {
    var theIndex = $(this).index();
    $('.parks-band.park-band ul li, .park-band-container .parks-band-content').removeClass('active');
    $(this).addClass('active');
    $('.park-band-container .parks-band-content').eq(theIndex).addClass('active');
});



$('.side-panel-box h2').on('click', function(){
    $(this).parents('.side-panel-box').toggleClass('active');
});

$('.footer-item h2 a').on('click',function(e){
    e.preventDefault();
    console.log('clicked');
    if($(this).hasClass('drop-menu')){
        $(this).toggleClass('active').parents('.footer-item').find('h4').fadeToggle();
    }

});

$(window).load(function(){
    setTimeout(function(){
        $('.main-loader').fadeOut();
    },500);
});




$('.hotel-tab-head ul').on('click', function(){
   $(this).toggleClass('active');
});





$(document).on('click','.view-image', function(){
    var imgSrc = $(this).parents('td').prev().find('input').val();
    console.log(imgSrc);
    if(imgSrc){
        var key = $(this).attr('data-key');
        var img1 = $('input[name="visa_appication['+key+'][travellerspassportfront]"]').val();
        var img2 = $('input[name="visa_appication['+key+'][travellerspassportback]"]').val();
        var img3 = $('input[name="visa_appication['+key+'][passportphoto]"]').val();
    }
    else{
        console.log('error');
    }

});


$(document).on('click','.row-delete', function(){

    $(this).parents('tr').remove();
    elementOffset = $('.next-button-table').offset().top;
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
/*
(function($) {
    $.fn.shorten = function (settings) {

        var config = {
            showChars: 100,
            ellipsesText: "...",
            moreText: "more",
            lessText: "less"
        };

        if (settings) {
            $.extend(config, settings);
        }

        $(document).off("click", '.morelink');

        $(document).on({click: function () {

            var $this = $(this);
            if ($this.hasClass('less')) {
                $this.removeClass('less');
                $this.html(config.moreText);
            } else {
                $this.addClass('less');
                $this.html(config.lessText);
            }
            $this.parent().prev().toggle();
            $this.prev().toggle();
            return false;
        }
        }, '.morelink');

        return this.each(function () {
            var $this = $(this);
            if($this.hasClass("shortened")) return;

            $this.addClass("shortened");
            var content = $this.html();
            if (content.length > config.showChars) {
                var c = content.substr(0, config.showChars);
                var h = content.substr(config.showChars, content.length - config.showChars);
                var html = c + '<span class="moreellipses">' + config.ellipsesText + ' </span><span class="morecontent"><span>' + h + '</span> <a href="#" class="morelink">' + config.moreText + '</a></span>';
                $this.html(html);
                $(".morecontent span").hide();
            }
        });

    };

})(jQuery);



$(".comment").shorten({
    "showChars" : 450,
    "moreText" : "See More",
    "lessText" : "Less",
});*/


$(window).on('load', function(){
    /*var bodyH = $('.top-val').offset().top;*/
    elementOffset = $('.next-button-table').offset().top;
});

/*$(window).on('scroll',function () {
    var scroll = $('body').scrollTop();
    var bodyH = $('.next-button-table').outerHeight();
    var bodyHNew = $('.hotel-single-table .table-bordered').outerHeight();

    var scrollTop     = $('body').scrollTop(),
        distance      = (elementOffset - scrollTop);

    distance = distance + bodyHNew;
    console.log(distance, scroll, bodyH);
    if (scroll >= 560 && scroll < distance ) {
        $(".next-button-table").addClass("fixed");
    }

    else {
        $(".next-button-table").removeClass("fixed");
    }
})*/

$( ".social-sticky li" ).hover(
    function() {
        $( this ).find('.social-sub').addClass('active');
    }, function() {
        $( this ).find('.social-sub').removeClass('active');
    }
);

$('.social-click').on('click', function (e) {
    e.preventDefault();
    $(this).next('.slide-left-top').addClass('active');
});
$('.slide-left-close').on('click', function () {
    $('.slide-left-top').removeClass('active');
});

$('')

$(document).ready(function(){
    $('.choose-textbox input[type="file"]').change(function(e){
        $(this).siblings('input[type="text"]').val(e.target.files[0].name);
    });

    $( ".hotel-form-section input, .hotel-form-section select" ).focus(function() {
        $( this ).parent().find('.field-name').addClass('active');
    });
});


var logID = 'log',
    log = $('<div id="'+logID+'"></div>');
$('body').append(log);
$('[type*="radio"]').change(function () {
    var me = $(this);
    log.html(me.attr('value'));
});