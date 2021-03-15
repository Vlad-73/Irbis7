{literal}
<style>
.upload_hide {
display: none;
position:absolute;
}

.upload_show {
display: block;
position: absolute;
z-index:105;
left: 320px;
top: 285px;
}

.upload_progress{
   display: none;
   position: absolute;
   text-align:center;
   font-size:11px;
}

.upload_message{
   display: none;
   text-align:left;
   font-size:11px;
	
}
input, select, textarea{
	border: 1px solid #e2e1e6;
	background-color: #fff;
	font-family: verdana, arial, helvetica,"sans-serif";
	font-size: 11px;
}
</style>
{/literal}

{assign var="sBaseUpload" value="upload_txt"}
{include file='addon/mpanel/form_upload.tpl' sBaseUpload=$sBaseUpload sFormAction="/single/mpanel_file_upload.php?BaseUpload=$sBaseUpload"}

<div class="row">
	<div class="col-md-7">
		<div class="card">
			<div class="card-header">
                <h3 class="card-title">{$oLanguage->getDMessage('Excel to upload')}</h3>
            </div>
            
<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">

<div class="card-body">
<!-- body begin -->

<div class="row">
	<div class="col-l">
	    <div class="form-group">
			<img id='image{$sBaseUpload}' border=0 align=absmiddle hspace=5 src='/libp/mpanel/images/document.png'>
            <input id='inputHidden{$sBaseUpload}' type=hidden name=data[{$sBaseUpload}] value=''>
            <input id='inputHiddenOriginal{$sBaseUpload}' type=hidden name=data[original_{$sBaseUpload}] value=''>
            <label id='filenameoriginal{$sBaseUpload}'></label>
		</div>
	</div>
	
	<div class="col-sm">
		<div class="form-group">
			
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm">
	    <div class="form-group">
   			<img hspace=1 align=absmiddle src='/libp/mpanel/images/small/inbox.png'>
        	<a href=# onclick="ShowFileUpload('{$sBaseUpload}',true)" style='font-weight:normal'>{$oLanguage->getDMessage('Change')}</a>
        	<img hspace=1 align=absmiddle src='/libp/mpanel/images/small/outbox.png'>
			<a href=# onclick="ShowFileUpload('{$sBaseUpload}',false)" style='font-weight:normal'>{$oLanguage->getDMessage('Clear')}</a>
		</div>
	</div>
</div>


<!-- body end -->
			</div>
<!-- /.card-body -->
		    <div class="card-footer">
		        <input type=hidden name=data[id] value="{$aData.id|escape}">
				{include file='addon/mpanel/base_add_button.tpl' sBaseAction=translate_import_translation}
		   </div>
		   <!-- /.card-footer -->
		   </form>
		   
		</div>
	</div>
</div>
