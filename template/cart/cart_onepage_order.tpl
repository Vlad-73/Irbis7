<h1>{$oLanguage->getMessage("Order process")}</h1>

<div class="at-makeorder-plist">
    <div class="inner-part" id="text_order">
	    {include file="cart/text_order.tpl"}
    </div>

    <div class="delivery">
        <a class="at-link-dashed" href='/?action=additional_delivery' target='_blank'>{$oLanguage->GetMessage('Delivery and Garanties')}</a>
    </div>
</div>

<div class="at-makeorder-form">
   
{if !isset($aUser)}
	{ include file="cart/cart_onepage_user_tabs.tpl" }
{/if}

    <div class="js-client-change" {if isset($bFromCheckLogged)}style="display: none"{/if}>
		{$sCheckNewAccountForm}			  
	</div>
	<div class="js-client-change" {if !isset($bFromCheckLogged)}style="display: none"{/if}>
		{$sCheckLoggedForm}
	</div>

</div>
<div class="clear"></div>


<div class="at-block-popup js-popup-ownauto" style="display: none;" id="popup_id">
   <div class="dark" onclick="popupClose('.js-popup-ownauto');"></div>
   <div class="block-popup">
       <div class="popup-head">
           <a href="javascript: void(0);" class="close" onclick="popupClose('.js-popup-ownauto');">&nbsp;</a>
            <span id="popup_caption_id">{if $sPopupCaption}{$sPopupCaption}{else}Popup{/if}</span>
       </div>

       <div class="popup-body">
           <div class="at-popup-basket" id="popup_content_id">
               {$sPopupContent}
          </div>
       </div>
   </div>
</div>

{* {literal}
	<script type="text/javascript">
		$(function() {
			$('.js-client-tabs a').click(function(){
			if (!$(this).hasClass('selected')) {
			$('.js-client-tabs a').removeClass('selected');
			$(this).addClass('selected');
			$('.js-client-change').toggle();
			}
			return false;
			});
		});
	</script>
{/literal} *}
{literal}
<script type="text/javascript">
  $(document).ready(function(){
    
    $('#np_city2').on('change', function() {
    xajax_process_browse_url('./?action=cart_change_city&page=2&city='+this.options[this.selectedIndex].value);
    });

    $('#np_city').on('change', function() {
    xajax_process_browse_url('./?action=cart_change_city&city='+this.options[this.selectedIndex].value);
    });
    
    $("#invisible").css("display","none");
  });
</script>
{/literal} 