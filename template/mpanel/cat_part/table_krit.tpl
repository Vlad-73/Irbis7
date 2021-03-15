<div class="row" id="table_krit">
	<div class="col-sm">
	    <div class="form-group">
			<label>{$oLanguage->getDMessage('criterias')}:</label>
			<table class="table">
				{foreach from=$aCriterias item=aCrit}
				<tr>
					<td>{$aCrit.krit_name}</td>
					<td>{$aCrit.krit_value}</td>
					<td>
						{if $aCrit.id_cat_info}
						<a class="btn btn-danger" id="find_by_filter" href="?action=cat_part_del_krit" onclick="
						        xajax_process_browse_url(this.href
				        		+'&amp;id_cat_part='+document.getElementById('input_id_cat_part').value
				        		+'&amp;input_item_code='+document.getElementById('input_item_code').value
						        +'&amp;id_cat_info={$aCrit.id_cat_info}'
						        );
						return false;
						"><i class="fa fa-minus" aria-hidden="true"></i></a>
						{/if}
					</td>
				</tr>
				{/foreach}
				<tr>
					<td><input type='text' name='krit_name' id="input_krit_name" value="" class="form-control btn-sm"></td>
					<td><input type='text' name='krit_value' id="input_krit_value" value="" class="form-control btn-sm"></td>
					<td><a class="btn btn-success" id="find_by_filter" href="?action=cat_part_add_krit" onclick="
					        xajax_process_browse_url(this.href
			        		+'&amp;id_cat_part='+document.getElementById('input_id_cat_part').value
			        		+'&amp;input_item_code='+document.getElementById('input_item_code').value
					        +'&amp;input_krit_name='+document.getElementById('input_krit_name').value
					        +'&amp;input_krit_value='+document.getElementById('input_krit_value').value
					        );
					return false;
					"><i class="fa fa-plus" aria-hidden="true"></i></a></td>
				</tr>
			</table>
		</div>
	</div>
</div>