{if $aRelatedProducts}
    <h2>{$oLanguage->GetMessage('related products')}</h2>

<div class="at-product-carousel js-related-product-carousel">
        <div class="line" >
            {foreach from=$aRelatedProducts item=aRow}
                <div>
                    <div class="at-thumb-element ready">
                        <div class="inner-wrap" >
                            <a href="/buy/{$aRow.cat_name}_{$aRow.code}" class="image">
                                <img class="fake" src="/image/plist-thumb-mask.png" alt="{$aRow.name}" title="{$aRow.name}">
                                {if $aRow.image}
                                    <img class="real" src="{$aRow.image}" alt="{$aRow.name}" title="{$aRow.name}">
                                {else}
                                    <img class="real" src="/image/media/no-photo-thumbs.png" alt="{$aRow.name}" title="{$aRow.name}">
                                {/if}
                            </a>

                            <div class="name x3-overflow"><a href="/buy/{$aRow.cat_name}_{$aRow.code}">{$aRow.name}</a></div>

                            <div class="brand"><a href="/buy/{$aRow.cat_name}_{$aRow.code}">{$aRow.brand}</a></div>
                            <div class="code">{$aRow.code_}</div>

                            <div class="price">
                                <span>{$oCurrency->PrintPrice($aRow.price,0,0,'strong')}</span> {*<span class="cur">грн</span>*}
                            </div>
                        </div>

                        <div class="extend">
                            <div class="buy">
                                <a href="{$aRow.url}" class="at-btn">Купить</a>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
{/if}