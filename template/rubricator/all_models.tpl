{* OLD model list <div class="container list" style="">
    <ul class="at-brands-list">
    {foreach from=$aAllModels item=aBrand key=sKey}
		<li>
			<a href="{$aBrand.url}">{$oLanguage->getMessage('parts for')} {$aBrand.title}</a>
		</li>
		{foreach from=$aBrand.models item=aGroup key=iKey}
		<li>
			<a href="{$aGroup.url}">{$aGroup.name}</a>
		</li>
		{/foreach}
	{/foreach}
    </ul>
</div>

<h2 class="at-index-brands-title">Подбор запчастей по автомобилю</h2>
<div class="mi-parts-cats js-parts-cats">
    {foreach from=$aAllModels item=aBrand key=sKey}
    <div class="grid-item grid-sizer">
        <div class="element">
            <div class="name">
                <a href="{$aBrand.url}">{$oLanguage->getMessage('parts for')} {$aBrand.title}</a>
            </div>

            {foreach from=$aBrand.models item=aGroup key=iKey}
            <div class="item"><a href="{$aGroup.url}">{$aGroup.name}</a></div>
            {/foreach}
        </div>
    </div>
    {/foreach}
</div>*}
                   
  <h2>Мы продаем запчасти на следующие автомобили:</h2>    
   <div class="mi-parts-cats js-parts-cats">
     {assign var='iIterator' value=1}
     {foreach from=$aAllModels item=aBrand key=sKey} 
       <div class="grid-item  {if $iIterator=='1'}grid-sizer{/if} grid-{$aBrand.name}">
           <div class="element" onmouseover="$('.grid-item').css('z-index','0');$('.grid-{$aBrand.name}').css('z-index','99');$('.grid-{$aBrand.name}').css('box-shadow','0 0 18px #9E9E9E');$('.{$aBrand.name}').show();" onmouseout="$('.{$aBrand.name}').hide();$('.grid-{$aBrand.name}').css('box-shadow','none');">
               <div class="name">
                   <a href="{$aBrand.url}">{$oLanguage->getMessage('parts for')} {$aBrand.title}</a>
               </div>
        {assign var='iIterator2' value=1}
		{foreach from=$aBrand.models item=aGroup key=iKey}
               <div class="item {if $iIterator2>5}hidden_item {$aBrand.name} {/if}">
               <a style="color: #2f86c2;"href="{$aGroup.url}" title="{$aGroup.name}">
               {$aBrand.title} {$aGroup.name}
               </a>
               </div>
        {assign var='iIterator2' value=$iIterator2+1}
		{/foreach}
		
           </div>
       </div>
       {assign var='iIterator' value=$iIterator+1}
      {/foreach}
   </div>
   {literal}
   <style>
  
.mi-parts-cats .name {
    padding: 10px 0 20px 0;}
.hidden_item {
	display:none;
	    background-color: #fff;
    opacity: 100;
    z-index: 9999999;
}
.mi-parts-cats .element {background-color: #fff;}
.grid-item{background-color: #fff;}
   </style>
   {/literal}
     
    {literal}
   <script>
       // masonry grid
    if($('.js-parts-cats').length){
        $('.js-parts-cats').masonry({
            columnWidth: '.grid-sizer',
           itemSelector: '.grid-item',
            percentPosition: true,
            horizontalOrder: false
        });
    }
   </script>{/literal}
  