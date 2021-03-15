{literal}
<script>
    function address() {
   	 $('.info').show();
   	 $('.info2').hide();
    }
    function sklad() {
   	 $('.info').hide();
     $('.info2').show();
    }
</script>
{/literal}

{if $smarty.session.current_cart.id_delivery_type}
{assign var=bAlreadySelectedDelivery value=1}
{/if}

<div class="bordered">
    <table>
	<tr>
	    <td class="pad0">
		<div class="field-name">
		    {$oLanguage->getMessage("Delivery methods")}:
		</div>
	    </td>
	    <td>
		<div class="checklist">
		{foreach from=$aDeliveryType item=aItem}
		    <label for='id_delivery_{$aItem.id}{$select_np}' onclick="{strip}
			show_delivery_description('delivery_description_{$aItem.id}{$select_np}');
			xajax_process_browse_url('?action=delivery_set&xajax_request=1
				&id_delivery_type={$aItem.id}
				');
			{/strip}">
			<input type="radio" class="js-radio" id='id_delivery_{$aItem.id}{$select_np}' name="id_delivery_type" value='{$aItem.id}'
                {if !$bAlreadySelectedDelivery}{assign var=bAlreadySelectedDelivery value=1}checked{/if}
                {if $aItem.id==6}checked{/if}>
			<span>{$aItem.name}</span>
		    </label>
        {/foreach}
		</div>
	    </td>
	</tr>
    </table>

	{foreach item=aItem from=$aDeliveryType}
        <div class='delivery_description delivery_description_{$aItem.id}{$select_np}'
        {if !$bAlreadySelected3}
			{assign var=bAlreadySelected3 value=1}
			style="display: block;"
        {else}
			style="display: none;"
		{/if}
        >{if $aItem.description}<div class="form-message">
    		<div class="message-panel"><i>{$aItem.description}</i></div>
    	 </div>{/if}
    	 <div class="at-block-form">
    	 {if $aItem.id=='6'}
	                  {if $aItem.code == 'NovaPoshta'}
	                      
	                     		<div class="checklist" {if !$oContent->isMobile()} style="margin: 10px 0px;"{else}style="padding: 10px 15px;"{/if}>
								    <label {if !$oContent->isMobile()} style='margin: -0px 20px;'{/if}>
									<input type="radio" class="js-radio" id='' name="id_np_type" value='1' onChange="sklad()" checked>
									<span>Доставка в отделение</span>
								    </label>
								    <label {if !$oContent->isMobile()} style='float: right; margin: -16px 20px;'{/if} >
									<input type="radio" class="js-radio" id='' name="id_np_type" value='2' onChange="address()">
									<span>Доставка по адресу</span>
								    </label>
								</div>
	                       <table >
							{*<tr >
						        <td>
						    	   <div class="field-name">{$oLanguage->getMessage("np_oblast")}:{$sZir}</div>
						        </td>
						        <td>
							         <select name="delivery_info[np_oblast]" id="np_oblast{if $select_np }2{/if}" class="smart_select">
		                              {html_options options=$aOblast}
		                            </select>
						        </td>
						    </tr>*}
						    <tr>
								<td>
						    	   <div class="field-name">{$oLanguage->getMessage("np_city")}:{$sZir}</div>
						        </td>
	                            <td>  
	                              {if $select_np }
	                              	{include file='cart/select_np_city.tpl' iPage=2}
	                              {else}
	                              	{include file='cart/select_np_city.tpl'}
	                              {/if}
								</td>
							</tr>
							<tr >		
								<td class="info2">
						    	   <div class="field-name" >{$oLanguage->getMessage("np_sklad")}:{$sZir}</div>
						        </td>
						        <td id="info2" class="info2">
	                              {if $select_np }
	                              	{include file='cart/select_np_sklad.tpl' iPage=2}
	                              {else}
	                              	{include file='cart/select_np_sklad.tpl'}
	                              {/if}
	                             </td>
	                          </tr>
	                        <tr >		
						        <td class="info" style="display:none;">
						    	   <div class="field-name">{$oLanguage->getMessage("address kurer")}:{$sZir}</div>
						        </td>
	                             <td id="info" class="info" style="display:none;">
						            <input type="text" name="delivery_info[np_address]" value=''>
						        </td>
	                          </tr>
	                       </table>
	                  {/if}
	                  
           {/if}
           {*if $aItem.id=='7' || $aItem.id=='8' }
           	<table>
				<tr>
			        <td>
			    	   <div class="field-name">{$oLanguage->getMessage("City")}:</div>
			        </td>
			        <td>
			            <input type="text" name="data[city]" value='{$aUser.city|escape}'>
			        </td>
	   			 </tr>
			    <tr>
			        <td>
			    	   <div class="field-name">{$oLanguage->getMessage("Sklad")}:</div>
			        </td>
			        <td>
			            <input type="text" name="data[address]" value='{$aUser.address|escape}'>
			        </td>
			    </tr> 

           </table>
           
           {/if*}
           
          
           </div>
    	</div>
    {/foreach}

</div>
{literal}
<script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.full.js"></script>
<script type="text/javascript">
function matchStart (term, text) {
	  if (text.toUpperCase().indexOf(term.toUpperCase()) == 0) {
	    return true;
	  }
	  return false;
	}
	$.fn.select2.amd.require(['select2/compat/matcher'], function (oldMatcher) {
	  $("select").select2({
	    matcher: oldMatcher(matchStart),
	    minimumInputLength: 2,
	  })
	});
</script>
{/literal}