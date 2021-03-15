{if ($oLanguage->getConstant('use_price_control',0))}
	<td>{$aRow.id}</td>
	<td>{$aRow.pref}</td>
	<td>{$aRow.brand}</td>
	<td>{$aRow.code}</td>
	<td>{if $aRow.name}{$aRow.name}{/if}</td>
	<td>{$aRow.name_rus}</td>
	<td>{$aRow.weight}</td>
	<td>{include file='addon/mpanel/yes_no.tpl' bData=$aRow.is_checked_code_ok}</td>
	<td>{if $aRow.is_checked_code_ok_date!='0000-00-00 00:00:00'}{$oLanguage->getPostDateTime($aRow.is_checked_code_ok_date)}{/if}</td>
	<td>{if $aRow.cco_manager}{$aRow.cco_manager}{/if}
	{if $aRow.cco_manager_name}<br><span style="color:lightgrey;">{$aRow.cco_manager_name}</span>{/if}</td>
	<td>{if $aRow.cco_admin}{$aRow.cco_admin}{/if}
	{if $aRow.cco_admin_name}<br><span style="color:lightgrey;">{$aRow.cco_admin_name}</span>{/if}</td>
	<!--td>{$aRow.size_name}</td-->
	<td nowrap>
	{include file='addon/mpanel/base_row_action.tpl' sBaseAction=$sBaseAction}
	</td>
{else}
	<td>{$aRow.id}</td>
	<td>{$aRow.brand}</td>
	<td>{$aRow.pref}</td>
	<td>{$aRow.code}</td>
	<td>{$aRow.item_code}</td>
	<td>{$aRow.name_rus}</td>
	<td>{$aRow.weight}</td>
	<td nowrap>
	{include file='addon/mpanel/base_row_action.tpl' sBaseAction=$sBaseAction}
	</td>
{/if}