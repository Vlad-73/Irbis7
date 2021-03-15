<div class="filter">
    <span onclick="add_filter(this)" title="{$oLanguage->getDMessage('add filter')}"><i class="fas fa-plus"
                                                                                       aria-hidden="true"></i></span>
    <input style="width: 196px; display: inline-block" type="text" name="data[handbook][{$sNumberFilter}][name]"
           placeholder="{$oLanguage->getDMessage('name filter')}" class="form-control btn-sm"
           {if $sFilterData}value="{$sFilterData.name}"{/if}>
    <span onclick="delete_unsave_filter(this)" title="{$oLanguage->getDMessage('delete')}"><i class="fas fa-minus"
                                                                                              aria-hidden="true"></i></span>
    {if $sFilterData}<input type="hidden" value="{$sFilterData.id}" name="data[id_filter][{$sNumberFilter}]">{/if}
    <div class="row_parameter_all">
        <label>{$oLanguage->getDMessage('Filter Params')}:</label>
        <br>
        {$sRowParam}
        <span class="row_parameter_add" onclick="add_parameter(this)" title="{$oLanguage->getDMessage('add param')}">
                    <i class="fas fa-plus" aria-hidden="true"></i>
                </span>
    </div>
</div>