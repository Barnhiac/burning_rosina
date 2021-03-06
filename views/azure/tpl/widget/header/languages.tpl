<!--[{oxscript include="js/widgets/oxflyoutbox.js" priority=10 }]
[{oxscript add="$( '#languageTrigger' ).oxFlyOutBox();"}] -->
[{if $oView->isLanguageLoaded()}]
<div class="topPopList">
    [{capture name="languageList"}]
        [{foreach from=$oxcmp_lang item=_lng}]
        
        [{if $_lng->selected}]
        [{assign var="sLangImg" value="lang/"|cat:$_lng->abbr|cat:".a.png"}]
            [{capture name="languageSelected"}]
                <a class="flag [{$_lng->abbr }]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]"><span style="background-image:url('[{$oViewConf->getImageUrl($sLangImg)}]')" >[{$_lng->name}]</span></a>
            [{/capture}]
       
        
        [{else}] 
            [{assign var="sLangImg" value="lang/"|cat:$_lng->abbr|cat:".png"}]
            <li><a class="flag [{$_lng->abbr }] [{if $_lng->selected}]selected[{/if}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr }]"><span style="background-image:url('[{$oViewConf->getImageUrl($sLangImg)}]')">[{$_lng->name}]</span></a></li>
        [{/if}]
        [{/foreach}]
    [{/capture}]
    <!-- <p id="languageTrigger" class="selectedValue">
        [{$smarty.capture.languageSelected}]
    </p> -->
    <!-- <div class="flyoutBox"> -->
    <ul id="languages" class="corners">
        <li class="active">[{$smarty.capture.languageSelected}]</li>
        [{$smarty.capture.languageList}]
    </ul>
    <!-- </div> -->
</div>
[{/if}]
[{oxscript widget=$oView->getClassName()}]