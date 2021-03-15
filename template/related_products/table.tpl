<td align="center">{$aRow.id}</td>
<td align="center">{$aRow.brand}</td>
<td align="center">{$aRow.code}</td>
<td align="center">{$aRow.related_brand}</td>
<td align="center">{$aRow.code_related}</td>
<td align="center">{$aRow.post_date}</td>

<td style="white-space:nowrap;">
    <a href="/?action=related_products_edit&id={$aRow.id}&return={$sReturn|escape:"url"}"
    ><img src="/image/edit.png" border=0 align=absmiddle />{$oLanguage->getMessage("Edit")}</a>

    <a href="/?action=related_products_del&id={$aRow.id}"
       onclick="if (!confirm('{$oLanguage->getMessage("Are you sure you want to delete this item?")}')) return false;"
    ><img src="/image/delete.png" border=0  align=absmiddle />{$oLanguage->getMessage("Delete")}</a>
</td>
