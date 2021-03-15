<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">{$oLanguage->getDMessage('search')}</h3>
            </div>

            <form id="filter_form" name="filter_form" role="form" action="javascript:void(null)" onsubmit="submit_form(this)">
                <div class="card-body">

                    <div class="row">
                        <div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('id')}:</label>
                                <input type=text name=search[id] value="{$aSearch.id|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('IdBuh')}:</label>
                                <input type=text name=search[id_buh] value="{$aSearch.id_buh|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('Office name')}:</label>
                                <input type=text name=search[name] value="{$aSearch.name|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('account_id')}:</label>
                                <input type=text name=search[account_id] value="{$aSearch.account_id|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('holder_name')}:</label>
                                <input type=text name=search[holder_name] value="{$aSearch.holder_name|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div><div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('bank_name')}:</label>
                                <input type=text name=search[bank_name] value="{$aSearch.bank_name|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div><div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('bank_code')}:</label>
                                <input type=text name=search[bank_code] value="{$aSearch.bank_code|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div><div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('holder_code')}:</label>
                                <input type=text name=search[holder_code] value="{$aSearch.holder_code|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('bank_mfo')}:</label>
                                <input type=text name=search[bank_mfo] value="{$aSearch.bank_mfo|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('correspondent_account')}:</label>
                                <input type=text name=search[correspondent_account] value="{$aSearch.correspondent_account|escape}" maxlength=50 class="form-control btn-sm">
                            </div>

                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label>Date from:</label>
                                <input id=date_from name=search[date_from] class="form-control btn-sm" readonly="readonly" value="{$aSearch.date_from|escape}" onclick="popUpCalendar(this, this, 'dd.mm.yyyy');">
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label>Date To:</label>
                                <input id=date_to name=search[date_to] class="form-control btn-sm" readonly="readonly" value="{$aSearch.date_to|escape}" onclick="popUpCalendar(this, this, 'dd.mm.yyyy');">
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label>{$oLanguage->getDMessage('Is Active')}:</label>
                                <select name="search[is_active]" class="form-control btn-sm">
                                    <option value='1' {if $aSearch.is_active=='1' } selected {/if}>{$oLanguage->getDMessage('Yes')}</option>
                                    <option value='0' {if $aSearch.is_active=='0' } selected {/if}>{$oLanguage->getDMessage('No')}</option>
                                    <option value='' {if $aSearch.is_active=='' } selected {/if}>{$oLanguage->getDMessage('Ignore')}</option>
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