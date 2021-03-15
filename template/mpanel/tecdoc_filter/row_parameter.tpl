<div class="row_parameter" row_number='{$sNumberRow}'>
    <input type="checkbox" name="data[param][{$sNumberFilter}][{$sNumberRow}][is_parsed]"
           title="{$oLanguage->getDMessage('use tecdoc parameter')}"
           class="form-control btn-sm row_parameter_checkbox">
    <input type="text"
           name="data[param][{$sNumberFilter}][{$sNumberRow}][param_name]"
           placeholder="{$oLanguage->getDMessage('name parameter')}" class="form-control btn-sm row_parameter_input"
           {if $aDataRow}value="{$aDataRow.name}"{/if}>
    {if $aDataRow}  <input type="hidden" name="data[param][{$sNumberFilter}][{$sNumberRow}][id_param]" value="{$aDataRow.id}">{/if}
    <input type="text"
           name="data[param][{$sNumberFilter}][{$sNumberRow}][parsing_template]" placeholder="{$oLanguage->getDMessage('parser template')}"
           class="form-control btn-sm row_parameter_input">
    <input type="checkbox" name="data[param][{$sNumberFilter}][{$sNumberRow}][is_regexp]"
           title="{$oLanguage->getDMessage('is regexp')}"
           class="form-control btn-sm row_parameter_checkbox">
    <span class="row_parameter_delete" onclick="delete_parameter(this)" title="{$oLanguage->getDMessage('delete param')}">
        <i class="fa fa-minus" aria-hidden="true"></i>
    </span>
</div>
