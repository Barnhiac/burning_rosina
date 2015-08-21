[{assign var=oBanners value=$oView->getBanners() }]
[{assign var="currency" value=$oView->getActCurrency()}]
[{if $oBanners}]
  <div>
  	<ul id="pikame">
        [{foreach from=$oBanners item=oBanner }]
        <li>
        [{assign var=oArticle value=$oBanner->getBannerArticle() }]
             [{assign var=sBannerLink value=$oBanner->getBannerLink() }]
            [{if $sBannerLink }]
            <a href="[{ $sBannerLink }]">
            [{/if}]
            
            [{assign var=sBannerPictureUrl value=$oBanner->getBannerPictureUrl() }]
            [{if $sBannerPictureUrl }]
            <img src="[{ $sBannerPictureUrl }]" height="479" width="770" alt="[{ $oArticle->oxarticles__oxtitle->value }]">
            [{/if }]
            [{*if $oArticle }]
            <span class="promoBox">
                <strong class="promoPrice">[{ $oArticle->getFPrice() }] [{ $currency->sign}]</strong>
                <strong class="promoTitle">[{ $oArticle->oxarticles__oxtitle->value }]</strong>
            </span>
            [{/if *}]
            [{if $sBannerLink }]
            </a>
            [{/if}]
            </li>
        [{/foreach }]
  </ul>
  </div>
[{/if }] 