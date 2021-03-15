<div class="row" id="table_image">
	<div class="col-sm">
	    <div class="form-group">
			<label>{$oLanguage->getDMessage('images')}:</label>
			<table class="table">
				{foreach from=$aGraphic item=aImage}
				<tr>
					<td><img src="{$aImage.img_path}" width="120px"></td>
					<td>
						{if $aImage.id_cat_pic}
						<a class="btn btn-danger" id="find_by_filter" href="?action=cat_part_del_image" onclick="
						        xajax_process_browse_url(this.href
				        		+'&amp;id_cat_part='+document.getElementById('input_id_cat_part').value
				        		+'&amp;input_item_code='+document.getElementById('input_item_code').value
						        +'&amp;id_cat_pic={$aImage.id_cat_pic}'
						        );
						return false;
						"><i class="fa fa-minus" aria-hidden="true"></i></a>
						{/if}
					</td>
				</tr>
				{/foreach}
				<tr>
					<td>
						<img id='image' width=100 border=0 align=absmiddle hspace=5 src='{if $aData.image}{$aData.image}{/if}'>
						<input type={if $bNotHidden}text{else}hidden{/if} name=data[image] id='image_input' value='{$aData.image}'>
						
						<img hspace=1 align=absmiddle src='/libp/mpanel/images/small/inbox.png'>
						<a href="#" onclick="{strip}
						javascript:OpenFileBrowser('/libp/mpanel/imgmanager/browser/default/browser.php
						?Type=Image&Connector=php_connector/connector.php&return_id=image&{$smarty.now}', 600, 400); return false;
						{/strip}"
						style='font-weight:normal'>{$oLanguage->GetDMessage('Change')}</a>
					</td>
					<td><a class="btn btn-success" id="find_by_filter" href="?action=cat_part_add_image" onclick="
					        xajax_process_browse_url(this.href
			        		+'&amp;id_cat_part='+document.getElementById('input_id_cat_part').value
			        		+'&amp;input_item_code='+document.getElementById('input_item_code').value
					        +'&amp;image_input='+document.getElementById('image_input').value
					        );
					return false;
					"><i class="fa fa-plus" aria-hidden="true"></i></a></td>
					
				</tr>
			</table>
		</div>
	</div>
</div>