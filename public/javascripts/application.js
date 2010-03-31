// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function($){
        
        $("#invoice_issued_on").date_input();
        $("#invoice_due_by").date_input();
        $("#invoice_due_by").hide();
        
        $("#show_due").change(function(){
                if($("#invoice_due_by:hidden"))
                    $("#invoice_due_by").val("");
                $("#invoice_due_by").toggle();
            });

        $("#invoice_currency").change(function(){
                $(".currency_symbol").html($(this).val());
            });

        $('.qmenu .qselected').live('click', function(){
                $(".qmenu .qitems").toggle();
            });

        $(".qmenu .qitems .qitem").bind('click', function(){
                $(".qmenu .qselected").html($(this).html()+'<div class="down_arr">Template</div>');
                $("#invoice_template").val($(this).children().eq(0).attr('alt'));
                $(".qmenu .down_arr").animate({ backgroundColor: "#FF3D3D"}, 'slow');
                $(".qmenu .down_arr").animate({ backgroundColor: "#996699"}, 'slow');
                $(".qmenu .qitems").hide();
            });

        $(".qmenu .qitems").hide();
        $(".qmenu .qselected").html($(".qmenu .qitems .qitem:first").html()+'<div class="down_arr">Template</div>');

        $(".delete_item").bind('click', function(){
                
            });
});
