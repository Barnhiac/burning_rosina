[{oxscript include="js/widgets/oxtopmenu.js" priority=10 }]
[{oxscript add="$('#navigation').oxTopMenu();"}]
[{oxstyle include="css/libs/superfish.css"}]
[{assign var="homeSelected" value="false"}]
[{if $oViewConf->getTopActionClassName() == 'start'}]
    [{assign var="homeSelected" value="true"}]
[{/if}]
[{assign var="oxcmp_categories" value=$oxcmp_categories }]
[{assign var="blShowMore" value=false }]
[{assign var="iCatCnt" value=0}]
<ul id="categorylist">
    
    [{foreach from=$oxcmp_categories item=ocat key=catkey name=root}]
      [{if $ocat->getIsVisible() }]
        [{foreach from=$ocat->getContentCats() item=oTopCont name=MoreTopCms}]
            [{assign var="iCatCnt" value=$iCatCnt+1 }]
            [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
                <li><a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
            [{else}]
                [{assign var="blShowMore" value=true }]
                [{capture append="moreLinks"}]
                    <li><a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
                [{/capture}]
            [{/if}]
        [{/foreach}]

        [{assign var="iCatCnt" value=$iCatCnt+1 }]
        [{if $iCatCnt <= $oView->getTopNavigationCatCnt() }]
            <li class = "topmenu" [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}]>
                <a  class = "topmenulink" [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}] href="[{$ocat->getLink()}]"><img src="[{$ocat->getThumbUrl() }]"  /><h1>[{$ocat->oxcategories__oxtitle->value}]</h1></a>
                [{if $ocat->getSubCats()}]
                    <ul class = "subcategory">
                    [{foreach from=$ocat->getSubCats() item=osubcat key=subcatkey name=SubCat }]
                        [{if $osubcat->getIsVisible() }]
                            [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                <li><a class = "underCatLink" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a></li>
                            [{/foreach}]
                            [{if $osubcat->getIsVisible() }]
                                <li [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] ><a class = "underCatLink" [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}]</a></li>
                            [{/if}]
                        [{/if}]
                    [{/foreach}]
                    </ul>
                [{/if}]
            </li>
        [{else}]
            [{capture append="moreLinks"}]
               [{assign var="blShowMore" value=true }]
               <li [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}]>
                    <a class = "underCatLink" href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}]</a>
               </li>
            [{/capture}]
        [{/if}]
      [{/if}]
    [{/foreach}]
    <!--[{if $blShowMore }]
        <li>
            [{assign var="_catMoreUrl" value=$oView->getCatMoreUrl()}]
            <a href="[{oxgetseourl ident="`$_catMoreUrl`&amp;cl=alist" }]">[{oxmultilang ident="MORE" }]</a>
            <ul>
                [{foreach from=$moreLinks item=link}]
                   [{$link}]
                [{/foreach}]
            </ul>
        </li>
    [{/if}] -->
</ul>



[{oxscript widget=$oView->getClassName()}]
[{oxstyle widget=$oView->getClassName()}]