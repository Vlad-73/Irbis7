<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">
<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('Redirect')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>
<tr>
   <td width=50%>{$oLanguage->getDMessage('LinkFrom')}:{$sZir}</td>
   <td><input type=text name=data[link_from] value="{$aData.link_from|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('LinkTo')}:{$sZir}</td>
   <td><input type=text name=data[link_to] value="{$aData.link_to|escape}"></td>
</tr>
</table>
</td></tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}
</FORM>
