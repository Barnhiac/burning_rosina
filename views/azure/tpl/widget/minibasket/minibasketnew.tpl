
  [{oxhasrights ident="TOBASKET"}]
    [{assign var="currency" value=$oView->getActCurrency() }]
        <div class="minibasket_container">
          
            <a class="head" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket" }]">[{ oxmultilang ident="INC_RIGHTITEM_BASKET" }]</a>
          

          <div class="box minibasket">
[{ if $oxcmp_basket->getProductsCount()}]  <!-- $bl_perfShowRightBasket &&  -->
            
            <hr class='first'>
            [{foreach from=$oxcmp_basket->getContents() name=rightlist item=_product}]
            <div id="test_[{$_basket_testid}]Title_[{$_product->getProductId()}]_[{$smarty.foreach.rightlist.iteration}]" class="listitem">
              [{ assign var="sRightListArtTitle" value=$_product->getTitle() }]
              <a href="[{$_product->getLink()}]">[{ $sRightListArtTitle|strip_tags }]</a>
              <span>[{$_product->getAmount()}] [{ oxmultilang ident="INC_CMP_BASKET_QTY" }]</span>
             </div>
             <hr>
             [{/foreach}]
            
[{else}]
<hr class="first"><div class="listitem">[{ oxmultilang ident="BASKET_EMPTY" }]</div><hr>
[{/if}]

          </div>

            <form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
              <div class="ta_right">
                  [{ $oViewConf->getHiddenSid() }]
                  <input type="hidden" name="cl" value="basket">
                  <div class="tocart"><input id="test_[{$_basket_testid}]Open" type="submit" class="btn" value="[{ oxmultilang ident="INC_RIGHTITEM_DISPLAYBASKET" }]&nbsp;&nbsp;"></div>
              </div>
            </form>

        </div>
  [{/oxhasrights}]


