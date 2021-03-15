<script language="javascript" type="text/javascript" src="/js/form.js?3285"></script>
<table width="99%">
    <tr>
        <td width=50%><b>Производитель:{$sZir}</b></td>
        <td nowrap>
            <select id=pref name=data[pref] style="width:272px">
                {html_options  options=$aPref selected=$aData.pref}
            </select>
        </td>
    </tr>
    <tr>
        <td><b>Код:{$sZir}</b></td>
        <td nowrap><input id=code type="text" name=data[code] value="{$aData.code}">
        </td>
    </tr>
    <tr>
        <td width=50%><b>Похожий товар:{$sZir}</b></td>
        <td nowrap>
            <select id=pref name=data[pref_related]  style="width:272px">
                {html_options  options=$aPref selected=$aData.pref_related}
            </select>
        </td>
    </tr>
    <tr>
        <td><b>Код похожего товара:{$sZir}</b></td>
        <td nowrap><input id=code type="text" name=data[code_related] value="{$aData.code_related}">
        </td>
    </tr>
</table>
