
[{capture append="oxidBlock_pageBody"}]
    [{assign var="template_title" value=$oView->getTitle() }]
    [{if $oView->showRDFa()}]
        [{ include file="rdfa/rdfa.tpl" }]
    [{/if}]
    <div id="page" class="[{if $sidebar}] sidebar[{$sidebar}][{/if}]">
        <div class = "top">
        [{block name="layout_header"}]
            [{include file="layout/header.tpl"}]
        [{/block}]

        <!--  [{if $oView->getClassName() ne "start" && !$blHideBreadcrumb}]
        [{block name="layout_breadcrumb"}]
           [{ include file="widget/breadcrumb.tpl"}]
        [{/block}]
        [{/if}] -->
        
        <div id="content">
           [{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0 }]
        <div class="oxSlider">
        [{include file="widget/promoslider.tpl" }]
        </div>
        [{/if}]
        [{block name="content_main"}]
            [{include file="message/errors.tpl"}]
            [{foreach from=$oxidBlock_content item="_block"}]
                [{$_block}]
            [{/foreach}]
        [{/block}]
        </div>
        
            <div id="sidebar">
                [{include file="layout/newSidebar.tpl"}]
            </div>
        
    [{include file="widget/breadcrumb.tpl"}]
    [{if $oView->isPriceCalculated() }]
        [{block name="layout_page_vatinclude"}]
        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
            [{assign var="tsBadge" value=""}]
            [{if $oView->getTrustedShopId()}]
                [{assign var="tsBadge" value="TsBadge"}]
            [{/if}]
            <div id="incVatMessage[{$tsBadge}]">
                [{if $oView->isVatIncluded()}]
                    * <span class="deliveryInfo">[{oxmultilang ident="PLUS_SHIPPING"}]<a href="[{$oCont->getLink()}]" rel="nofollow">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
                [{else}]
                    * <span class="deliveryInfo">[{oxmultilang ident="PLUS"}]<a href="[{$oCont->getLink()}]" rel="nofollow">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
                [{/if}]
            </div>
        [{/oxifcontent}]
        [{/block}]
    [{/if}]
    </div>
      <div id="bottom">
    <div class ="bottom_wide">
        <div class ="bottom_content_container">
        <div class ="bottom_content bottom_left">
            [{oxcontent ident = "footer_left_3"}]
        </div>
        <div class="bottom_content bottom_right">
            [{oxcontent ident = "footer_right_3"}] 
        </div>
        </div>
    </div>


    [{include file="widget/facebook/init.tpl"}]
    
    

     [{include file="layout/footer.tpl"}]
    [{if $oView->getClassName() != "details"}]
        [{insert name="oxid_tracker" title=$template_title }]
    [{/if}]
[{/capture}]
[{include file="layout/base.tpl"}]