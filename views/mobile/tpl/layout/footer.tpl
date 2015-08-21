[{block name="footer_main"}]
    <div id="footer">
        <div class="container">
            <div id="panel">
                <div class = "logo-container">
                    <img src="[{$oViewConf->getImageUrl('logo.png')}]" alt="[{oxmultilang ident="OXID_ESALES_URL_TITLE"}]">
                </div>

                [{* <ul class="nav nav-pills nav-justified footer-nav">
                    [{if $oxcmp_user->oxuser__oxpassword->value}]
                        <li><a href="[{$oViewConf->getLogoutLink()}]">[{oxmultilang ident="LOGOUT"}]</a></li>
                    [{else}]
                        <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="LOGIN"}]</a></li>
                    [{/if}]
                    <li [{if $oView->getClassName() == "account"}]class="active"[{/if}]><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="MY_ACCOUNT"}]</a></li>
                    <li><a href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a></li>
                </ul> *}]

                <ul class="nav nav-list footer-nav">
                    <li>
                        <form action="[{oxgetseourl ident=$oViewConf->getSelfLink()}]" method="post">
                            <input type="hidden" name="themeType" value="desktop" />
                            <button class="btn">[{oxmultilang ident="STANDARD_WEBSITE"}]</button>
                        </form>
                    </li>

                    [{if $oxcmp_user->oxuser__oxpassword->value}]
                        <li><a href="[{$oViewConf->getLogoutLink()}]">[{oxmultilang ident="LOGOUT"}]</a></li>
                    [{else}]
                        <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="LOGIN"}]</a></li>
                    [{/if}]
                    <li [{if $oView->getClassName() == "account"}]class="active"[{/if}]><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="MY_ACCOUNT"}]</a></li>
                    <li><a href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a></li>
                    [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
            <li><a href="[{$oCont->getLink()}]" rel="nofollow">[{$oCont->oxcontents__oxtitle->value}]</a></li>
        [{/oxifcontent}]
                </ul>

                <ul class = "nav nav-list footer-nav">
                        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                        <li class = "deliveryInfo law">
                            <a href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a>
                        </li>
                        [{/oxifcontent}]
                        
                            
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
                            
                        

                        
                                [{assign var="ovconfig" value=$oView->getViewConfig()}] 
                                [{if $ovconfig->getActLanguageId() == 0}] 
                                <li class = "contact">
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

                    <ul class = "normalSite nav footer-nav">
                        <li class = "home law">
                            <a href="http://www.wachtmeister-lifestyle.de/" target="_blank">[{ oxmultilang ident="thd_rw_website" }]</a>
                        </li>
                    </div>
            </div>

                [{* [{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1}]

                [{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1}] *}]

            </div>
            [{* <div id="copyright">
                <img src="[{$oViewConf->getImageUrl('logo.png')}]" alt="[{oxmultilang ident="OXID_ESALES_URL_TITLE"}]">
            </div> *}]
            [{oxid_include_widget cl="oeThemeSwitcherWPaymentList" noscript=1 nocookie=1}]
        </div>
    </div>
[{/block}]
