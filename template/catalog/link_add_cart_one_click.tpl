{capture name=add_link_href}./{strip}
?action=cart_add_cart_item&id_provider={$aRow.id_provider}&item_code={$aRow.item_code}
{if $smarty.get.manager_login}
&manager_login={$smarty.get.manager_login}
{/if}
{if $smarty.request.data.id_part}
&id_part={$smarty.request.data.id_part}
{/if}
{/strip}{/capture}
<div class="at-block-popup js-popup-one-click " style="display: none;">
   <div class="dark" onclick="popupClose('.js-popup-one-click');$('#check_phone').hide();"></div>
   <div class="block-popup block-popup-call-me">
      <div class="popup-head">
         <a href="javascript: void(0);" class="close" onclick="popupClose('.js-popup-one-click');$('#check_phone').hide();">&nbsp;</a>
         {$oLanguage->getMessage('fast order')}
      </div>
      <div class="popup-body">
         <span style="color:red;" id='check_phone'></span>
         <form method="POST">
            <div>
               <div id="id_wrong_number_{$aRow.item_code}_{$aRow.id_provider}"></div>
               <strong>{$oLanguage->getMessage("your name")}:</strong><br>
               <input type="text" style="line-height: 32px;" name='name1' value="{$aAuthUser.name}" id="user_name1" class="" placeholder="{$oLanguage->getMessage('place_name')}" required><br><br>
               <strong>{$oLanguage->getMessage("your phone")}:</strong><br>
               <input type="text" style="line-height: 32px;" value="{$aAuthUser.phone}" id="user_phone1" class="js-masked-input" placeholder="{$oLanguage->getMessage('place_phone')}" required><br><br>
               <a style="margin: 15px 0;width:100%;" href="javascript:;" {if !$bNoActive}onclick="{strip}
               xajax_process_browse_url('{$smarty.capture.add_link_href}&xajax_request=1&hilight_code={$aRow.code}
               &link_id=add_link_{$aRow.item_code}_{$aRow.id_provider}&fast_order[phone]='+$('#user_phone1').val()+'
               &fast_order[email]='+$('#user_email1').val()+'&fast_order[name]='+$('#user_name1').val()+'
               &number='+document.getElementById('number_{$aRow.item_code}_{$aRow.id_provider}').value+'
               &reference='+document.getElementById('reference_{$aRow.item_code}_{$aRow.id_provider}').value);
               return false;{/strip}"{/if} class="at-btn{if $bNoActive} not-exist{/if}">{$oLanguage->getMessage('buy to one click')}</a>
            </div>
         </form>
         {*$oLanguage->getMessage("total")}: <b style="color:#da5931;">{$oCurrency->PrintPrice($aRow.price)}</b> *}
      </div>
   </div>
</div>