
<div id="header" class="clear">
    [{block name="layout_header_top"}]
        [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
       [{* [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}] -->

        [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
            [{assign var="blAnon" value=0}]
            [{assign var="force_sid" value=$oView->getSidForWidget()}]
        [{else}]
            [{assign var="blAnon" value=1}]
        [{/if}] 

        [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}] *}]
    [{/block}]

    <div class = "logo">
    [{block name="layout_header_logo"}]
        [{assign var="sLogoImg" value=$oViewConf->getShopLogo()}]
        <a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"><img
                    src="[{$oViewConf->getImageUrl($sLogoImg)}]"
                    alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"></a>
    [{/block}]
    </div>
    [{block name="layout_header_bottom"}]
        [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]

        [{*  [{if $oxcmp_basket->getProductsCount()}]
            [{assign var="blAnon" value=0}]
            [{assign var="force_sid" value=$oView->getSidForWidget()}]
        [{else}]
            [{assign var="blAnon" value=1}]
        [{/if}]
        <div id="minibasket_container">
            [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
        </div>
    *}]
        
    [{/block}]
</div>

