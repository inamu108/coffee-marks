/* tab
----------------------------- */

$(function()  {
  let tabs = $(".menu-item");
  function tabSwitch() {
    $(".active").removeClass("active");
    $(this).addClass("active");
    const index = tabs.index(this);
    $(".content").removeClass("show").eq(index).addClass("show");
  }
  tabs.click(tabSwitch);
});


/* hamburger
----------------------------- */

$(function() {
  $('.hamburger').click(function() {
      $(this).toggleClass('active');
      if ($(this).hasClass('active')) {
          $('.global-nav').addClass('active');
      } else {
          $('.global-nav').removeClass('active');
      }
  });
});