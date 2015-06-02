// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(
    $(".favorite").click(function() {
      var star = $(this)
      var post_id = $(this).attr('id')
      var title = $(this).siblings('.info').children('.title').text()
      var thumbnail = $(this).siblings('.thumbnail').children('img').attr('src')
      var link = $(this).siblings('.info').children('.link').text()
      var num_comments = $(this).siblings('.info').children('.num_comments').find('span').text()
      $.ajax({
        url: '/favorites',
        method: "POST",
        data: { post_id: post_id,
                    title: title,
                    thumbnail: thumbnail,
                    link: link,
                    num_comments: num_comments   },
        success: function() {
          $(star).css("opacity", "0.5");
        },
      })
    })
  );
});
