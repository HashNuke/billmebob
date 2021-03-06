jQuery(document).ready(function($){
        $("#invoice_issued_on").date_input();
        $("#invoice_due_by").date_input();
        $("#invoice_due_by").hide();
        
        $(".delete_item").live("click", function(){
                $(this).prev().val("1");
                $(this).parent().parent().empty();
                calculate_total();
            });

        $("#show_due").change(function(){
                if($("#invoice_due_by:hidden"))
                    $("#invoice_due_by").val("");
                $("#invoice_due_by").toggle();
            });

        $("#invoice_currency").change(function(){
                $(".currency_symbol").html($(this).val());
            });

        $(".qmenu .qselected").live('click', function(){
                $(".qmenu .qitems").toggle();
            });
               
        $("#invoice_item_title").change(function(){
            if($(this).val()=="Products" || $(this).val()=="Articles")
            {
                $("#invoice_quantity_title").val("Quantity");
                $("#invoice_cost_title").val("Per Unit");
            }
            if($(this).val()=="Services")
            {
                $("#invoice_quantity_title").val("Hours");
                $("#invoice_cost_title").val("Per Hour");
            }
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
        
    $(".icost input").live('change', function(){
            if($(this).val()=="")
                $(this).val("0");
            calculate_total();
        });
        
    $(".iquantity input").live('change', function(){
            if($(this).val()=="")
                $(this).val("0");
            calculate_total();
        });
        
    $(".itax input").live('change', function(){
            if($(this).val()=="")
                $(this).val("0");
            calculate_total();
        });
        calculate_total();
});

function add_item(association,content)
{   
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_"+association,"g");
    $(".prodserv").append(content.replace(regexp, new_id));
}

function calculate_total()
{
    var taxtotal = 0;
    var subtotal = 0;
    var formtotal = 0;
    var withtax = 0;
    var nowSubTotal = 0.0;
    $('.icost input').each(function(){
        nowSubtotal = parseFloat($(this).val()) *
            parseInt($(this).parent().prev().children().eq(0).val());
        subtotal=subtotal+(parseFloat($(this).val()) *
            parseInt($(this).parent().prev().children().eq(0).val()));
        if ( isNaN(parseFloat($(this).parent().next().children().eq(0).val())) )
           nowTax=0;
        else
           nowTax=(parseFloat($(this).val()) *
            parseInt($(this).parent().prev().children().eq(0).val())/100)*parseFloat($(this).parent().next().children().eq(0).val());
        
        withtax=parseFloat($(this).val()) *
            parseInt($(this).parent().prev().children().eq(0).val())+nowTax;
        taxtotal=taxtotal+nowTax;
        formtotal=formtotal+withtax;
    });
    $(".subtotalval").html(roundNum(subtotal,2));
    $(".taxval").html(roundNum(taxtotal,2));
    $(".formtotal").html(roundNum(formtotal,2));
}

function roundNum(num, dec) {
	var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
	return result;
}
