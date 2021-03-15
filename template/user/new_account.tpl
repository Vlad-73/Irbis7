<script type='text/javascript'>
jQuery(document).ready(function($) {ldelim}
	$('#pass1').keyup(oUser.CheckPasswordStrength);
	$('#pass2').keyup(oUser.CheckPasswordStrength);
	$('#pass-strength-result').show();
{rdelim});
</script>

{if $sSecondTime}
<input type="hidden" value="1" name="second_time">
{/if}


<table>
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("Login")}:{$sZir}</div>
        </td>
        <td>
            <input type="text"  {*type="tel" class="js-masked-input" placeholder="(___) ___ __ __"*}
                    name="login" value='{$smarty.request.login}' style='width:250px'
                    onblur="javascript: xajax_process_browse_url('?action=user_check_login&login='+this.value); return false;">
             	  <span id='check_login_image_id'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        </td>
    </tr>
    
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("Password")}:{$sZir}</div>
        </td>
        <td>
            <input type="password" name="password" value='{$smarty.request.password}' id='pass1'>
        </td>
    </tr>
    
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("Retype Password")}:{$sZir}</div>
        </td>
        <td>
            <input type="password" name="verify_password" value='{$smarty.request.verify_password}' id='pass2'>
        </td>
    </tr>
    
    <tr>
        <td>
            <div class="field-name">{$oLanguage->GetMessage('password strength')} <i class="icon"></i></div>
        </td>
        <td>
            <div class="pass-indicator" >
                <div class="inner bad" id="pass-strength-result"></div>
            </div>
        </td>
    </tr>
    
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("FLName")}:{$sZir}</div>
        </td>
        <td>
            <input type="text" name="data[name]" value='{$smarty.request.data.name|escape}'>
        </td>
    </tr>
   
    <tr>
        <td>
    	<div class="field-name">{$oLanguage->getMessage("Phone")}:{$sZir}</div>
        </td>
        <td>
    	<input type="text" name=data[phone] value='{$smarty.request.data.phone|escape}' type="tel" class="js-masked-input" placeholder="(___) ___ __ __">
        </td>
    </tr>
    <tr>
        <td>
    	   <div class="field-name">{$oLanguage->getMessage("email")}:</div>
        </td>
        <td>
            <input type="text" name="email" value='{$smarty.request.email}'>
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
    <table>
        <tr>
            <td>
                <div class="field-name">
                    {$oLanguage->getMessage("Google capcha field ")}: {$sZir}
                </div>

            </td>
            <td>
                {*$sCapcha*}
				<div class="g-recaptcha" data-sitekey="{$oLanguage->getConstant('captcha:public_key','6LdJj9UUAAAAAB2vqztFdLAFTC9UXHquxRVKP4Vm')}"></div>
                <div class="capcha-text">Проверка от спам ботов (капча)</div>
            </td>
        </tr>
    </table>
</div>

<div class="bordered">
    <table>
        <tr>
            <td colspan="2">
                <div class="inline-labels">
                    <label>
                        <input type="checkbox" class="js-checkbox" name=user_agreement value='1' {if $smarty.request.user_agreement} checked{/if}>
                        <span>{$oLanguage->getMessage("I agree to")} <a href="/pages/agreement">{$oLanguage->getMessage("User agreement")}</a></span>
                    </label>
                </div>
            </td>
        </tr>
    </table>
</div>