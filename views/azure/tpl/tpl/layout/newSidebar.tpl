[{foreach from=$oxidBlock_sidebar item="_block"}]
    [{$_block}]
[{/foreach}]

[{block name="newSidebar"}]
    <div class = "login-section sidebar-section">
    <a class="head" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]">[{ oxmultilang ident="INC_RIGHTITEM_MYACCOUNT" }]</a>

    [{foreach from=$Errors.dyn_cmp_login_right item=oEr key=key }]
  <p class="err">[{ $oEr->getOxMessage()}]</p>
[{/foreach}]
[{if !$oxcmp_user->oxuser__oxpassword->value}]
  <form name="rlogin" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
    <div class="form">
        [{ $oViewConf->getHiddenSid() }]
        [{$_login_additional_form_parameters}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{ $oViewConf->getTopActiveClassName() }]">
        <input type="hidden" name="pgNr" value="[{$_login_pgnr}]">
        <input type="hidden" name="tpl" value="[{$_login_tpl}]">
        <input type="hidden" name="CustomError" value='dyn_cmp_login_right'>
        [{if $oView->getProduct()}]
          [{assign var="product" value=$oView->getProduct() }]
          <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
        [{/if}]


        <input type="text" name="lgn_usr" value="[{ oxmultilang ident ="EMAIL_ADDRESS" }]" class="txt">


        <input type="password" name="lgn_pwd" value="[{ oxmultilang ident="PASSWORD" }]" class="txt">

        [{if $oView->showRememberMe()}]
        <label for="RightLogin_KeepLogggedIn">
            <input id="RightLogin_KeepLogggedIn" type="checkbox" name="lgn_cook" value="1" class="chk">
            [{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_KEEPLOGGEDIN" }]
        </label>
        [{/if}]

<div class="reg_pwd">
  <div class = "account accountCreate">
<a class="link left" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" params=$oViewConf->getNavUrlParams() }]" rel="nofollow">[{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_OPENACCOUNT" }]</a>
</div>
<div class = "account forgotPassword">
<a class="link right" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd" params=$oViewConf->getNavUrlParams() }]" rel="nofollow">[{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_FORGOTPWD" }]</a>

</div>
</div>

<div class = "btn-container">
        <span class="btn"><input type="submit" name="send" value="[{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_LOGIN" }]&nbsp;&nbsp;&#10148;" class="btn"></span>
      </div>
            </div>
  </form>
[{else}]

      <div id="test_LoginUser">
        [{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_LOGGEDINAS" }]<br>
        [{assign var="fullname" value=$oxcmp_user->oxuser__oxfname->value|cat:" "|cat:$oxcmp_user->oxuser__oxlname->value }]
        <b>&quot;[{ $oxcmp_user->oxuser__oxusername->value|oxtruncate:25:"...":true }]&quot;</b> <br>
        ([{ $fullname|oxtruncate:25:"...":true }])
      </div>

      <form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
        <div class="form">
          [{ $oViewConf->getHiddenSid() }]
          [{$_login_additional_form_parameters}]
          <input type="hidden" name="fnc" value="logout">
          <input type="hidden" name="redirect" value="1">
          <input type="hidden" name="cl" value="[{ $oViewConf->getActionClassName() }]">
          <input type="hidden" name="lang" value="[{ $oViewConf->getActLanguageId() }]">
          <input type="hidden" name="pgNr" value="[{$_login_pgnr-1}]">
          <input type="hidden" name="tpl" value="[{$_login_tpl}]">
          [{if $oView->getProduct()}]
              [{assign var="product" value=$oView->getProduct() }]
              <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
          [{/if}]
          [{if $oViewConf->getShowListmania() && $oView->getActiveRecommList()}]
              [{assign var="actvrecommlist" value=$oView->getActiveRecommList() }]
            <input type="hidden" name="recommid" value="[{ $actvrecommlist->oxrecommlists__oxid->value }]">
          [{/if}]
            <div class = "btn-container">
              <span class="btn"><input id="test_RightLogout" type="submit" name="send" value="[{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_LOGOUT" }]&nbsp;&nbsp;&#10148;" class="btn"></span>
            </div>
        </div>
      </form>
[{/if }]

    </div>

    <div class = "minibasket-container sidebar-section">
    [{block name = "sidebar_minibasket"}]
        [{include file="widget/minibasket/minibasketnew.tpl"}]
    [{/block}]
    </div>

    <div class = "searchbox sidebar-section">
        <span class="head">[{ oxmultilang ident="INC_LEFTITEM_PRODUCTSEARCH" }]</span>
        [{include file="widget/header/search.tpl"}]
    </div>

    [{* <div class = "manufactureList sidebar-section">
        <span class="head">[{ oxmultilang ident="thd_manu" }]</span>
            <form action="[{ $oViewConf->getSelfActionLink() }]" method="get" name="search" class="search" id="f_manu">
                <p>
                    <span class="head"> [{ $oViewConf->getHiddenSid() }] </span>
                    <input type="hidden" name="cl" value="search">
                    <select class="search_input" name="searchmanufacturer">
                        <option value=""> [{ oxmultilang ident="thd_manu_first" }] </option>
                        [{foreach from=$oView->getManufacturerlist() item=oManufacturerlistentry}]
                            <option value="[{$oManufacturerlistentry->oxmanufacturers__oxid->value}]"[{if $oView->getSearchManufacturer() == $oManufacturerlistentry->oxmanufacturers__oxid->value}] selected[{/if}]>[{ $oManufacturerlistentry->oxmanufacturers__oxtitle->value }]</option>
                        [{/foreach}]
                    </select>
                    <div class = "btn-container"><span class="btn"><input type="submit" class="btn" value="[{ oxmultilang ident="thd_search" }]&nbsp;&nbsp;&#10148;"></span></div>
                </p>
            </form>
    </div> *}]

    <div class = "gutschein-container sidebar-section">
        [{assign var="sLanguage" value=$oView->getActiveLangAbbr()}]
[{if $sLanguage == 'de'}]<span class="head">[{ oxmultilang ident="thd_gutschein" }]</span><div class="box"><a href="http://www.rosina-wachtmeister-shop.de/Exklusives-Geschenksets/Gutscheine/Gutschein.html"><img src="[{$oViewConf->getImageUrl() }]rosina_gutscheine.jpg"></a><br/></div>
[{elseif $sLanguage == 'en'}]<span class="head">[{ oxmultilang ident="thd_gutschein" }]</span><div class="box"><a href="http://www.rosina-wachtmeister-shop.de/en/Unique-pieces-gift-sets/Voucher/Voucher.html"><img src="[{$oViewConf->getImageUrl() }]rosina_gutscheine.jpg"><br/></a></div>  
[{elseif $sLanguage == 'fr'}]<span class="head">[{ oxmultilang ident="thd_gutschein" }]</span><div class="box"><a href="http://www.rosina-wachtmeister-shop.de/fr/Pieces-uniques-sets-cadeaux/Cheque-cadeau/Cheque-cadeau.html"><img src="[{$oViewConf->getImageUrl() }]rosina_gutscheine.jpg"></a><br/></div>  [{/if}]

    </div>

    




    <div class = "newsletter-container sidebar-section">
        <span class="head">[{ oxmultilang ident="INC_RIGHTITEM_NEWSLETTER" }]</span>
    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
  <div class="form">
      [{ $oViewConf->getHiddenSid() }]
      <input type="hidden" name="fnc" value="fill">
      <input type="hidden" name="cl" value="newsletter">
      [{if $oView->getProduct()}]
          [{assign var="product" value=$oView->getProduct() }]
          <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
      [{/if}]

      <input type="text" name="editval[oxuser__oxusername]" value="[{ oxmultilang ident="thd_newsletter_mail" }]" class="txt">

      <div class="btn"><input id="test_RightNewsLetterSubmit" type="submit" name="send" value="[{ oxmultilang ident="INC_CMP_NEWSLETTER_SUBSCRIBE" }]&nbsp;&nbsp;&#10148;" class="btn"></div>
   </div>
</form>

    </div>

    
[{/block}]

