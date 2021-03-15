{if $smarty.request.action=='' || $smarty.request.action=='home'}
{literal}
<script type='application/ld+json'> 
{
  "@context": "http://www.schema.org",
  "@type": "AutoPartsStore",
  "name": "{/literal}{$oLanguage->GetConstant('microdata:project_name','Irbis')}{literal}",
  "url": "{/literal}{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}{literal}",
  "logo": "{/literal}{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}{$oLanguage->GetConstant('logo')}{literal}",
  "image": "{/literal}{$oLanguage->GetConstant('microdata:url_image','http://irbis.mstarproject.com/imgbank/Image/banner/banner.png')}{literal}",
  "description": "{/literal}{$oLanguage->GetConstant('microdata:description_main','Ирбис - ДЕМО версия магазина автозапчастей')}{literal}",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "{/literal}{$oLanguage->GetConstant('microdata:address','ул. 1-й Гвардейской армии 21А, оф. 26')}{literal}",
    "addressLocality": "{/literal}{$oLanguage->GetConstant('microdata:city','Чернигов')}{literal}",
    "postalCode": "{/literal}{$oLanguage->GetConstant('microdata:code','14000')}{literal}",
    "addressCountry": "{/literal}{$oLanguage->GetConstant('microdata:country','Украина')}{literal}"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "{/literal}{$oLanguage->GetConstant('microdata:latitude','51.4992')}{literal}",
    "longitude": "{/literal}{$oLanguage->GetConstant('microdata:longitude','31.2817')}{literal}"
  },
  "openingHours": "{/literal}{$oLanguage->GetConstant('microdata:openinghours','Mo, Tu, We, Th, Fr 09:00-17:00 Sa 09:00-15:00')}{literal}",
  "contactPoint": {
    "@type": "ContactPoint",
    "telephone": "{/literal}{$oLanguage->GetConstant('microdata:telephone','+38(093)9999897')}{literal}",
    "contactType": "Телефон"
  }
}
 </script>
{/literal}
{else}
<div style="display:none;" itemscope itemtype="http://schema.org/AutoPartsStore">
    <p itemprop="name">{$oLanguage->GetConstant('microdata:project_name','Irbis')}</p>
    <p itemprop="description">{$oLanguage->GetConstant('microdata:description_main','Ирбис - ДЕМО версия магазина автозапчастей')}</p>
    <meta itemprop="telephone" content="{$oLanguage->GetConstant('microdata:telephone','+38(093)9999897')}">
    <a itemprop="email" href="mailto: {$oLanguage->GetConstant('microdata:email','mikhail.starovoyt@mstarproject.com')}">{$oLanguage->GetConstant('microdata:email','mikhail.starovoyt@mstarproject.com')}</a>
    <link itemprop="url" href="{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}">
    <meta itemprop="priceRange" content="От 50 USD">
    <img itemprop="logo image" alt="Логотип" title="Логотип" src="{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}{$oLanguage->GetConstant('logo')}" style="display:none;"/>
    <time itemprop="openingHours" datetime="{$oLanguage->GetConstant('microdata:openinghours','Mo, Tu, We, Th, Fr 09:00-17:00 Sa 09:00-15:00')}">{$oLanguage->GetConstant('microdata:openinghours','Mo, Tu, We, Th, Fr 09:00-17:00 Sa 09:00-15:00')}</time>
        <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
        <span itemprop="postalCode">{$oLanguage->GetConstant('microdata:code','14000')}</span>
        <span itemprop="addressCountry">{$oLanguage->GetConstant('microdata:country','Украина')}</span>
        <span itemprop="addressLocality">{$oLanguage->GetConstant('microdata:city','Чернигов')}</span>,
        <span itemprop="streetAddress">{$oLanguage->GetConstant('microdata:address','ул. 1-й Гвардейской армии 21А, оф. 26')}</span>
    </div>
 </div>
{/if}


{if $smarty.request.action=='search'}
	{literal}
	<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "WebSite",
"url": "{/literal}{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}{literal}",
"potentialAction": {
"@type": "SearchAction",
"target":
"{/literal}{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}{literal}/search_text/{search_term_string}",
"query-input": "required name=search_term_string"
}
}
	</script>
	{/literal}
{/if}


{if $smarty.request.action!='' && $smarty.request.action!='home'}
{if $aCrumbs}
{literal}
<script type="application/ld+json">
{
"@context": "http://schema.org",
"@type": "BreadcrumbList",
"itemListElement": [
{/literal}{assign var='iIterator' value=1}{foreach from=$aCrumbs item=aItem name=crumb_ar}{literal}
{
"@type":"ListItem",
"position":{/literal}{$iIterator}{literal},
"name": "{/literal}{$aItem.name}{literal}",
"item":"{/literal}{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}{if $smarty.foreach.crumb_ar.last}{$smarty.server.REQUEST_URI}{elseif $smarty.foreach.crumb_ar.first}{else}{$aItem.link}{/if}{literal}"
}{/literal}{if $smarty.foreach.crumb_ar.last}{else},{/if}{assign var='iIterator' value=$iIterator+1}{/foreach}{literal}
]
}
	</script>
{/literal}
{/if}
{/if}


{if $smarty.request.action=='catalog_part_info_view'}
{literal}
<script type="application/ld+json">
{
"@context": "http://schema.org/",
"@type": "Product",
"name": "{/literal}{if $aRowPrice.name_translate}{$aRowPrice.name_translate} {else}{$aPartInfo.name} {/if} {$aPartInfo.brand} - {$aPartInfo.code}{literal}",
"image": [
"{/literal}{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}{literal}{/literal}{$aGraphic.0.img_path|replace:'http://tcd20.mstarproject.com':''}{literal}"
],
"description": "{/literal}{$template.sPageDescription}{literal}",
"mpn": "{/literal}{$aPartInfo.code}{literal}",
"brand": {
"@type": "Thing",
"name": "{/literal}{$aPartInfo.brand}{literal}"
},
"offers": {
"@type": "Offer",
"url": "{/literal}{$oLanguage->GetConstant('microdata:project_url','http://irbis.mstarproject.com')}{$smarty.server.REQUEST_URI}{literal}",
"priceCurrency": "UAH",
"price": "{/literal}{$oCurrency->GetPriceWithoutSymbol($aRowPrice.price)}{literal}",
"availability": "http://schema.org/InStock",
"seller": {
"@type": "Organization",
"name": "{/literal}{$oLanguage->GetConstant('microdata:project_name','Irbis')}{literal}"
}
}
}
</script>
{/literal}
{/if}

