{html_options options=$aRubric class="form-control btn-sm" name='data[rubric]' onchange='select_rubric(this.options[this.selectedIndex].value);' selected=$iRubricSelected}
{if $sMessage}
    <div class="alert alert-success empty_crit notice_p" role="alert" style="margin-top: 10px;">
        {$sMessage}
    </div>
{/if}
<div class="tecdoc_filter_inner">
{if $aCritNames}
    <div class="tree_crit">
        {foreach from=$aCritNames item=aCrit}
            <div class="tree_crit block_param">
                <span>[{$aCrit.crit}]</span>
                <div class="tree_crit_param collasped">
                    {foreach from=$aCrit.childs item=sChild}
                        - {$sChild}
                        <br>
                    {/foreach}
                </div>
            </div>
        {/foreach}
    </div>
{elseif !$iRubricSelected}
    <div class="tree_crit empty_crit">
        <div class="alert alert-success" role="alert">
            {$oLanguage->getDMessage('select rubric for a start you work')}
        </div>
    </div>
{else}
    <div class="tree_crit empty_crit">
        <div class="alert alert-danger" role="alert">
            {$oLanguage->getDMessage('crit parameters not available for selected rubric')}
        </div>
    </div>
{/if}
<div class="constructor_inner">
    <div class="col-sm">
        <div class="form-group">
            <label>{$oLanguage->getDMessage('Rubcricator for filter')}:</label>

            <div class="form-group">
                <select id="rubric_filter" name="data[handbook][]" multiple='multiple' size="6" class="form-control btn-sm filter-changer">
                    <option value="">{$oLanguage->getDMessage('Select param')}</option>
                    {foreach from=$aHandbook key=iKey item=aValue}
                        <option value="{$aValue.id}"
                                {if $aValue.id==$aSelectedHandbook[$aValue.id]}
                                    selected
                                {/if}
                        >{$aValue.name}</option>
                    {/foreach}
                </select>
            </div>
            <div class="form-group empty_crit">
                <button type="button"
                        onclick="unbind_filter($('.filter-changer').val())"
                        class="btn btn-dark">{$oLanguage->getDMessage('unbind')}</button>
                <button type="button"
                        onclick="edit_filter($('.filter-changer').val())"
                        class="btn btn-dark">{$oLanguage->getDMessage('edit')}</button>
                <button type="button"
                        class="btn btn-dark"
                        onclick="delete_filter($('.filter-changer').val())"
                >{$oLanguage->getDMessage('delete')}</button>
            </div>

            <div class="form-group">
                <label>{$oLanguage->getDMessage('Binded Filter')}:</label>
                    {foreach from=$aHandbook key=iKey item=aValue name=hanbook_list}
                        {if $aValue.id==$aSelectedHandbook[$aValue.id]}
                            {assign var=bBindedFilter value="1"}
                            {$aValue.name}{if !$smarty.foreach.hanbook_list.last},{/if}
                        {/if}
                    {/foreach}
                {if !$bBindedFilter}
                    {$oLanguage->getDMessage('no binded filter')}
                {/if}
            </div>
        </div>
    </div>
    <form action='javascript:void(null);' onsubmit="submit_form(this)">
        <div class="col-sm">
            <div class="form-group">
            <label>{$oLanguage->getDMessage('Filter constructor')}:</label>
            <a target="_blank" href="http://manual.mstarproject.com/index.php/%D0%94%D0%B5%D0%BC%D0%BE_%D1%81%D0%B0%D0%B9%D1%82_%D0%B0%D0%B2%D1%82%D0%BE%D0%B7%D0%B0%D0%BF%D1%87%D0%B0%D1%81%D1%82%D0%B5%D0%B9_%D1%80%D0%B5%D0%B4%D0%B8%D0%B7%D0%B0%D0%B9%D0%BD_-_%D0%9F%D0%B0%D0%BA%D0%B5%D1%82_%D0%A1%D1%82%D0%B0%D0%BD%D0%B4%D0%B0%D1%80%D1%82#.D0.A4.D0.B8.D0.BB.D1.8C.D1.82.D1.80.D1.8B_.D1.80.D1.83.D0.B1.D1.80.D0.B8.D0.BA.D0.B0.D1.82.D0.BE.D1.80.D0.B0">
                <i class="fa fa-question-circle fa-lg" aria-hidden="true"
                  title="{$oLanguage->getDMessage('how to use')}"></i></a>
            <br>
{*                фильтр*}
                <div id="constructor_filter">
                    {$sFilter}
                </div>
{*                конец фильтра*}
            <br>
            <input type="hidden" value="tecdoc_filter" name="action">
            <input type="hidden" value="save" name="subaction">
                {$sEdit}
            <input type="hidden" value="{$iRubricSelected}" name="data[id_rubric]">
            <input type="submit" class="btn btn-success" value="{$oLanguage->getDMessage('save filter')}" onclick="overlay();">
        </div>
        </div>
    </form>
</div>
</div>
