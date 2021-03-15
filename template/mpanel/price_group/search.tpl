<div class="row">
	<div class="col-md-12">
		<div class="card">
			<div class="card-header">
                <h3 class="card-title">{$oLanguage->getDMessage('search')}</h3>
            </div>
		
			<form id="filter_form" name="filter_form" role="form" action="javascript:void(null)" onsubmit="submit_form(this)">
			<div class="card-body">
			
				<div class="row">
				<!-- body begin -->
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('id')}:</label>
				        <input type=text name=search[id] value="{$aSearch.id|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->getDMessage('code')}:</label>
				        <input type=text name=search[code] value="{$aSearch.code|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('code_name')}:</label>
				        <input type=text name=search[code_name] value="{$aSearch.code_name|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->getDMessage('Name')}:</label>
				        <input type=text name=search[name] value="{$aSearch.name|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('level')}:</label>
				        <input type=text name=search[level] value="{$aSearch.level|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				
				</div>
			</div>
			<div class="row">
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('id_parent')}:</label>
				        <input type=text name=search[id_parent] value="{$aSearch.id_parent|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->getDMessage('is_product_list_visible')}:</label>
				        <select name="search[is_product_list_visible]" class="form-control btn-sm">
				            <option value='1' {if $aSearch.is_product_list_visible=='1' } selected {/if}>{$oLanguage->getDMessage('Yes')}</option>
				            <option value='0' {if $aSearch.is_product_list_visible=='0' } selected {/if}>{$oLanguage->getDMessage('No')}</option>
				            <option value='' {if $aSearch.is_product_list_visible=='' } selected {/if}>{$oLanguage->getDMessage('Ignore')}</option>
				        </select>
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('is_menu')}:</label>
				        <select name="search[is_menu]" class="form-control btn-sm">
				            <option value='1' {if $aSearch.is_menu=='1' } selected {/if}>{$oLanguage->getDMessage('Yes')}</option>
				            <option value='0' {if $aSearch.is_menu=='0' } selected {/if}>{$oLanguage->getDMessage('No')}</option>
				            <option value='' {if $aSearch.is_menu=='' } selected {/if}>{$oLanguage->getDMessage('Ignore')}</option>
				        </select>
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->getDMessage('is_main')}:</label>
				        <select name="search[is_main]" class="form-control btn-sm">
				            <option value='1' {if $aSearch.is_main=='1' } selected {/if}>{$oLanguage->getDMessage('Yes')}</option>
				            <option value='0' {if $aSearch.is_main=='0' } selected {/if}>{$oLanguage->getDMessage('No')}</option>
				            <option value='' {if $aSearch.is_main=='' } selected {/if}>{$oLanguage->getDMessage('Ignore')}</option>
				        </select>
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->getDMessage('visible')}:</label>
				        <select name="search[visible]" class="form-control btn-sm">
				            <option value='1' {if $aSearch.visible=='1' } selected {/if}>{$oLanguage->getDMessage('Yes')}</option>
				            <option value='0' {if $aSearch.visible=='0' } selected {/if}>{$oLanguage->getDMessage('No')}</option>
				            <option value='' {if $aSearch.visible=='' } selected {/if}>{$oLanguage->getDMessage('Ignore')}</option>
				        </select>
				    </div>
				
				</div>
				<div class="col-sm">
				    <div class="form-group">
				
				        <label>{$oLanguage->GetDMessage('language')}:</label>
				        <input type=text name=search[language] value="{$aSearch.language|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				
				</div>
				<!-- body end -->
		        </div>
				
			</div>
			<!-- /.card-body -->
		    <div class="card-footer">
		        <input type=button class="btn btn-danger btn-sm" value="{$oLanguage->getDMessage('Clear')}"
				onclick="xajax_process_browse_url('?{$sSearchReturn|escape}')">
				<input type=submit value='Search' class="btn btn-success btn-sm">
				
				<input type=hidden name=action value={$sBaseAction}_search>
				<input type=hidden name=return value="{$sSearchReturn|escape}">
		   </div>
		   <!-- /.card-footer -->
		   </form>
		   
		</div>
	</div>
</div>