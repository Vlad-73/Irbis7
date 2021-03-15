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
				        <input type=text name=search[id] class="form-control btn-sm" value="{$aSearch.id|escape}" maxlength=50>
				    </div>
				</div>

				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('pref')}:</label>
				        <input type=text name=search[pref] value="{$aSearch.pref|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				</div>
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('code')}:</label>
				        <input type=text name=search[code] value="{$aSearch.code|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				</div>

				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('pref crs')}:</label>
				        <input type=text name=search[pref_crs] value="{$aSearch.pref_crs|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				</div>
			</div>
				<div class="row">
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('code crs')}:</label>
				        <input type=text name=search[code_crs] value="{$aSearch.code_crs|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				</div>
				
				<div class="col-sm">
				    <div class="form-group">
				        <label>{$oLanguage->GetdMessage('source')}:</label>
				        <input type=text name=search[source] value="{$aSearch.source|escape}" maxlength=50 class="form-control btn-sm">
				    </div>
				</div>
			</div>
				
				<!-- body end -->
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