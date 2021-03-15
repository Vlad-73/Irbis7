<table>
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("FLName")}:{$sZir}</div>
        </td>
        <td>
            <input type="text" name="data[name]" value='{$aUser.name|escape}'>
        </td>
    </tr>
    <tr>
        <td>
    	<div class="field-name">{$oLanguage->getMessage("Phone")}:{$sZir}</div>
        </td>
        <td>
    	<input type="text" name=data[phone] value='{$aUser.phone|escape}' class="js-masked-input" placeholder="(___)___ __ __">
        </td>
    </tr>
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("Email")}:</div>
        </td>
        <td>
            <input type="text" name="data[email]" value='{$aUser.email|escape}'>
        </td>
    </tr>
    <tr id="remark_q">
        <td>
        </td>
        <td>
    	   <a href='javascript:void(0);' onclick="$('#remark_q').hide();$('#remark').show();" >{$oLanguage->getMessage("Add a comment to the order")}</a>
        </td>
    </tr>
    
    <tr id="remark" style="display: none;">
    	<td class="vtop">
    	    <div class="field-name">
    		{$oLanguage->getMessage("Remarks")}:
    	    </div>
    	</td>
    	<td>
    	    <input type="text" name=data[remark]>{$aUser.remark|escape}</input>
    	</td>
    </tr>
</table>

<div class="bordered">
    <div class="order-check">
	<a href="#" id="get_own_auto" onclick="xajax_process_browse_url('/?action=cart_get_ownauto');$('#popup_id').show();return false;" class="at-link-dashed">{$oLanguage->getMessage("Select your auto")}</a>
	<i class="icon"></i>
    </div>

    <div class="small-table">
	<table>
	    <tr>
		<td>
		    <div class="field-name">
			{$oLanguage->getMessage("check order")}:
		    </div>
		</td>
        <input type=hidden name="own_auto_id" value="0">
    	<input type=hidden name="own_auto_empty_txt" value="{$oLanguage->getMessage("Select your auto")}">
		<td>
		    <div class="yes-no">
			<label for='checkout_check_no'>
			    <input type="radio" name="check_order" class="js-radio" id='checkout_check_no' onClick="check_state();" value="0" {if !$smarty.request.check_order}checked{/if}>
			    <strong>{$oLanguage->getMessage("No")}</strong>
			</label>

			<label for='checkout_check_yes'>
			    <input type="radio" name="check_order" class="js-radio" id='checkout_check_yes' value="1">
			    <strong>{$oLanguage->getMessage("yes")}</strong>
			</label>
		    </div>
		</td>
	    </tr>
	</table>
    </div>
</div>

{ include file="cart/cart_onepage_delivery.tpl" }
{ include file="cart/cart_onepage_payment.tpl" }