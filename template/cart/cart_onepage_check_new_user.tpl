<table>
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("Login")}:{$sZir}</div>
        </td>
        <td>
            <input type="text" name="data[login]" value='{$smarty.request.data.login}' style='width:250px'
                onblur="javascript: xajax_process_browse_url('?action=cart_check_login&login='+this.value); return false;">
                 <span id='check_login_image_id'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        </td>
    </tr>
    
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("Password")}:{$sZir}</div>
        </td>
        <td>
            <input type="password" name="data[password]" value='{$smarty.request.data.password}'>
        </td>
    </tr>
    
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("Retype Password")}:{$sZir}</div>
        </td>
        <td>
            <input type="password" name="data[verify_password]" value='{$smarty.request.data.verify_password}'>
        </td>
    </tr>
    
    
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
    	   <div class="field-name">{$oLanguage->getMessage("email")}:</div>
        </td>
        <td>
            <input type="text" name="data[email]" value='{$smarty.request.data.email}'>
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
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("I agree to")}:{$sZir}</div>
        </td>
        <td>
    	   <input type=checkbox class="js-checkbox" name=data[user_agreement] value='1' {if $smarty.request.data.user_agreement} checked{/if}><span style="padding-left: 10px;"><a href='/pages/agreement' target=_blank>{$oLanguage->getMessage("User agreement")}</a></span>
        </td>
    </tr>
</table>

{ include file="cart/cart_onepage_delivery.tpl" }
{ include file="cart/cart_onepage_payment.tpl" }
<div class="bordered">
<table>
	<tr>
		<td>
			<div class="g-recaptcha" data-sitekey="{$oLanguage->getConstant('captcha:public_key','6LdJj9UUAAAAAB2vqztFdLAFTC9UXHquxRVKP4Vm')}"></div>
		</td>
	</tr>
</table>
</div>
