[{block name="footer_main"}]
    [{oxscript include="js/widgets/oxequalizer.js" priority=10 }]
    [{oxscript add="$(function(){oxEqualizer.equalHeight($( '#panel dl' ));});"}]
    <div id="footer">
        <div id="panel" class="corners">
                <div class="bar">
                    <!--[{block name="footer_fblike"}]
                        [{if $oView->isActive('FbLike') && $oViewConf->getFbAppId()}]
                            <div class="facebook" id="footerFbLike">
                                [{include file="widget/facebook/enable.tpl" source="widget/facebook/like.tpl" ident="#footerFbLike" parent="footer"}]
                            </div>
                        [{/if}]
                    [{/block}]
                    [{if $oView->showNewsletter()}]
                        [{include file="widget/footer/newsletter.tpl"}]
                    [{/if}]

                    -->
                    <!-- [{block name="footer_deliveryinfo"}]
                        <div class="deliveryinfo law">
                            [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                                [{if $oView->isVatIncluded()}]
                                    <a href="[{ $oCont->getLink() }]" rel="nofollow">* [{ oxmultilang ident="PLUS_SHIPPING" }] [{ oxmultilang ident="PLUS_SHIPPING2" }]</a>
                                [{else}]
                                    <a href="[{ $oCont->getLink() }]" rel="nofollow">* [{ oxmultilang ident="PLUS" }] [{ oxmultilang ident="PLUS_SHIPPING2" }]</a>
                                [{/if}]
                            [{/oxifcontent}]
                        </div>
                    [{/block}]
                     -->
                    <ul class = "law-bar">
                        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                        <li class = "deliveryInfo law">
                            <a href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a>
                        </li>
                        [{/oxifcontent}]
                        <li class = "termsAndRights law"> 
                            <ul>
                                [{oxifcontent ident="oxagb" object="oCont"}]
                                <li class = "termsAndConditions law-sub">
                                    <a href="[{ $oCont->getLink() }]" rel="nofollow" >[{ $oCont->oxcontents__oxtitle->value }]</a>
                                </li>
                                [{/oxifcontent}]
                                [{oxifcontent ident="oxrightofwithdrawal" object="oCont"}]
                                <li class = "rightOfWithdraw law-sub">
                                    <a href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a>
                                </li>
                                [{/oxifcontent}]
                            </ul>
                        </li>
                        <li class = "home logo">
                            <a href="[{$oViewConf->getHomeLink()}]">
                                <img src="[{ $oViewConf->getImageUrl() }]logo.png" alt="rosina wachtmeister">
                            </a>
                        </li>


                        <li class = "contactImpressum law">
                            <ul>
                                [{assign var="ovconfig" value=$oView->getViewConfig()}] 
                                [{if $ovconfig->getActLanguageId() == 0}] 
                                <li class = "contact law-sub">
                                    <a href="http://www.rosina-wachtmeister-shop.de/kontakt/">Kontakt</a>
                                </li>
                        
                                [{/if}] 
                        
                                [{assign var="ovconfig" value=$oView->getViewConfig()}] 
                                [{if $ovconfig->getActLanguageId() == 1}] 
                                <li class = "contact law-sub">
                                    <a href="http://www.rosina-wachtmeister-shop.de/index.php?lang=2&cl=contact">Contact</a>
                                </li>

                                [{/if}] 
                    
                    
                                [{assign var="ovconfig" value=$oView->getViewConfig()}] 
                                [{if $ovconfig->getActLanguageId() == 2}] 
                                <li class = "contact law-sub">
                                    <a href="http://www.rosina-wachtmeister-shop.de/en/contact/">Contact</a>
                                </li>
                                [{/if}]
                            
                                
                            
                            
                                [{oxifcontent ident="oximpressum" object="oCont"}]
                                <li class = "home law-sub">
                                    <a href="[{ $oCont->getLink() }]">[{ $oCont->oxcontents__oxtitle->value }]</a>
                                </li>
                                [{/oxifcontent}]
                            </ul>
                        </li>
                        <li class = "home law">
                            <a href="http://www.wachtmeister-lifestyle.de/" target="_blank">[{ oxmultilang ident="thd_rw_website" }]</a>
                        </li>
                    
                    </ul>
            </div>
            <div class = "clear"></div>
                    [{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]
                    
                    

        </div>
        <!-- <div class="copyright">
            <img src="[{$oViewConf->getImageUrl('logo_small.png')}]" alt="[{oxmultilang ident="OXID_ESALES_URL_TITLE"}]">
        </div>
        <div class="text">
            [{oxifcontent ident="oxstdfooter" object="oCont"}]
                [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]
        </div> -->
    </div>
[{/block}]
[{if $oView->isRootCatChanged()}]
    [{oxscript include="js/widgets/oxmodalpopup.js" priority=10 }]
    [{oxscript add="$( '#scRootCatChanged' ).oxModalPopup({ target: '#scRootCatChanged', openDialog: true});"}]
    <div id="scRootCatChanged" class="popupBox corners FXgradGreyLight glowShadow">
        [{include file="form/privatesales/basketexcl.tpl"}]
    </div>
[{/if}]