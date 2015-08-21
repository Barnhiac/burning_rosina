[{if $oxcmp_categories }]
    [{assign var="categories" value=$oxcmp_categories }]
    [{block name="footer_categories"}]
    <dl class="categories" id="footerCategories">
        <!-- <dt>[{oxmultilang ident="CATEGORIES" }]</dt> -->
        <dd>
            [{foreach from=$categories item=_cat}]
                <ul class="list categories">
                
                    [{if $_cat->getIsVisible() }]
                        [{if $_cat->getContentCats() }]
                            [{foreach from=$_cat->getContentCats() item=_oCont}]
                            <li class = "topItem"><a href="[{$_oCont->getLink()}]"><i></i>[{ $_oCont->oxcontents__oxtitle->value }]</a></li>
                            [{/foreach}]
                        [{/if }]
                        <li class = "topItem"><a href="[{$_cat->getLink()}]" [{if $_cat->expanded}]class="exp"[{/if}]>[{$_cat->oxcategories__oxtitle->value}] </a></li>
                    [{/if}]
                    [{if $_cat->getSubCats()}]
                    <ul>
                    [{foreach from=$_cat->getSubCats() item=osubcat key=subcatkey name=SubCat }]
                        [{if $osubcat->getIsVisible() }]
                            [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                <li><a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a></li>
                            [{/foreach}]
                            [{if $osubcat->getIsVisible() }]
                                <li [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] ><a [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}] [{* [{if $oView->showCategoryArticlesCount() && ($osubcat->getNrOfArticles() > 0)}] ([{$osubcat->getNrOfArticles()}])[{/if}] *}]</a></li>
                            [{/if}]
                        [{/if}]
                    [{/foreach}]
                    </ul>
                [{/if}]
                
            </ul>
            [{/foreach}]
        </dd>
    </dl>
    [{/block}]
[{/if}]

