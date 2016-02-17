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
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready( function() {
	$(".alert").fadeOut(4000);

	$('.nav-tabs [data-toggle="collapse"]').on('click', function () {
		//Prevent the subnav from collapsing
		if ($($(this).attr('href')).hasClass('in')) return false;
			//Make collapse links act like tabs
			$(this).parent().addClass('active').siblings('li').removeClass('active');
			//Activate first subtab
			$($(this).attr('href')).find('[data-toggle="tab"]').first().tab('show');
	});

	$('.nav-tabs > li > div > div > a').on('click', function () {
		//Hide any open subnav only if it's not the collapse link
		//also deactivate any active subtab
			 $(this).closest('.nav-tabs').find('.collapse.in').collapse('hide').find('.active').removeClass('active');
	});

});
