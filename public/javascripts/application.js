// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function($){



    $('.qmenu .qselected').live('click', function(){
        $(".qmenu .qitems").toggle();
    });

    $(".qmenu .qitems .qitem").bind('click', function(){
        $(".qmenu .qselected").html($(this).html()+'<div class="down_arr">Template</div>');

        $(".qmenu .down_arr").animate({ backgroundColor: "#FF3D3D"}, 'slow');
        $(".qmenu .down_arr").animate({ backgroundColor: "#996699"}, 'slow');
        $(".qmenu .qitems").hide();
    });

    $(".qmenu .qitems").hide();
    $(".qmenu .qselected").html($(".qmenu .qitems .qitem:first").html()+'<div class="down_arr">Template</div>');
});
