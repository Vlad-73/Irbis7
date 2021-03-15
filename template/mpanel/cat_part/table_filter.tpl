<div class="row" id="table_filter">
	<div class="col-sm">
	    <div class="form-group">
			<label>{$oLanguage->getDMessage('filters')}:</label>
			<table class="table">
				{foreach from=$aFilter item=aFilterItem}
				<tr>
					<td>{$aFilterItem.krit_name}</td>
					<td>
						<select name="param[{$aRow.id}]" class="form-control btn-sm"
						onchange="xajax_process_browse_url('?action=cat_part_change_filter&param_id=id_{$aFilterItem.table_}&param_value='+this.options[this.selectedIndex].value+'&amp;item_code='+document.getElementById('input_item_code').value);">
						{html_options options=$aFilterItem.params selected=$aFilterItem.krit_selected}
						</select>
					</td>
				</tr>
				{/foreach}
			</table>
		</div>
	</div>
</div>