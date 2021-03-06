[{oxscript add="$('a.js-external').attr('target', '_blank');"}]
[{oxscript include="js/widgets/oxarticlebox.js" priority=10 }]
[{oxscript add="$( '#content' ).oxArticleBox();"}]

[{assign var="actCategory" value=$oView->getActiveCategory()}]


[{capture append="oxidBlock_sidebar"}]
    [{assign var="listType" value=$oView->getListType()}]
    [{if $listType=='manufacturer' || $listType=='vendor'}]
        [{if $actCategory && $actCategory->getIconUrl()}]
        <div class="box">
            <h3>
                [{if $listType=='manufacturer'}]
                    [{ oxmultilang ident="BRAND" }]
                [{elseif $listType=='vendor'}]
                    [{ oxmultilang ident="VENDOR" }]
                [{/if}]
            </h3>
            <div class="featured icon">
                <img src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]">
            </div>
        </div>
        [{/if}]
    [{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]

    [{block name="page_list_listhead"}]
        <!-- [{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
            <img src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="categoryPicture">
        [{/if}] -->

        <h1 class = "categoryTitle">[{$actCategory->oxcategories__oxtitle->value }]</h1>

        [{if $listType!='tag' && $actCategory && $actCategory->getShortDescription() }]
            <div class="categoryTopDescription" id="catDesc">[{$actCategory->getShortDescription()}]</div>
        [{/if}]
        [{if $actCategory->oxcategories__oxlongdesc->value }]
            <div class="categoryTopLongDescription" id="catLongDesc">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
        [{/if}]


        [{if $oView->hasVisibleSubCats()}]
            [{assign var="iSubCategoriesCount" value=0}]
            [{oxscript include="js/widgets/oxequalizer.js" priority=10 }]
            [{oxscript add="$(function(){oxEqualizer.equalHeight($( '.subcatList li .content' ));});"}]
            <div class = "categorylist">
            <ul class="subcatList clear" id = "categorylist">
                [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                    [{if $category->getContentCats() }]
                        [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                            <div class="box">
                            <h3>
                                <a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{ $ocont->oxcontents__oxtitle->value }]</a>
                            </h3>
                            <ul class="content"></ul>
                            </div>
                        [{/foreach}]
                    [{/if}]
                    [{if $category->getIsVisible()}]
                        [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                        [{assign var="iconUrl" value=$category->getLink()}] 
                           <!-- <div class="box"> -->
                                <!-- <h1> -->
                                    <!-- <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{ $category->getLink() }]">
                                        [{$category->oxcategories__oxtitle->value }][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0) }] ([{ $category->getNrOfArticles() }])[{/if}]
                                    </a> -->
                                <!-- </h1> -->
                                
                                    <!-- <div class="content catPicOnly"> -->
                                        <!-- <div class="subcatPic topmenu"> -->
                                        [{if $iconUrl}]
                                        <li class = "topmenu">
                                            <a class = "topmenulink" href="[{ $category->getLink() }]"><div class = "imageContainer"><img src="[{$category->getThumbUrl() }]" alt="[{ $category->oxcategories__oxtitle->value }]"></div><div class = "text">[{ $category->oxcategories__oxtitle->value }]</div>
                                                
                                            </a>
                                        </li>
                                         [{/if}]
                                        <!-- </div> -->
                                    <!-- </div> -->
                                
                            <!-- </div> -->
                    [{/if}]
              
                [{/foreach}]
            </li>
            </ul>
        </div>
        [{/if}]
        
    [{/block}]

    [{block name="page_list_listbody"}]
    [{if $oView->getArticleList()|@count > 0}]
        <!-- <h1 class="pageHead">[{$oView->getTitle()}]
            [{assign var='rsslinks' value=$oView->getRssLinks() }]
            [{if $rsslinks.activeCategory}]
                <a class="rss js-external" id="rssActiveCategory" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.activeCategory.title}]"><span class="FXgradOrange corners glowShadow">[{$rsslinks.activeCategory.title}]</span></a>
            [{/if}]
        </h1> -->
        <div class="listRefine clear bottomRound">
        [{* uncomment if want to use descriptions in locator
           [{if $actCategory && $actCategory->getShortDescription() }]
                <div id="catDescLocator" class="categoryDescription">[{$actCategory->getShortDescription()}]</div>
            [{/if}]

            [{if $actCategory->oxcategories__oxlongdesc->value }]
                <div id="catLongDescLocator" class="categoryDescription">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
            [{/if}]
        *}]
            [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true itemsPerPage=true sort=true }] 
        </div>
        [{* List types: grid|line|infogrid *}]
        [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]
        
    [{/if}]
    [{/block}]

[{/capture}]
[{include file="layout/page.tpl" sidebar="Left" tree_path=$oView->getTreePath()}]
