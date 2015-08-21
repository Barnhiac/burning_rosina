[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]

<form class="js-oxValidate" name="login" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
[{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    <ul class="form">
        <li [{if $aErrors}]class="oxInValid"[{/if}]>
            [{ $oViewConf->getHiddenSid() }]
            [{ $oViewConf->getNavFormParams() }]
            <input type="hidden" name="fnc" value="login_noredirect">
            <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
            <!-- <label class="short">[{ oxmultilang ident="EMAIL_ADDRESS" }]</label> -->
            <input type="text" name="lgn_usr" class="textbox js-oxValidate js-oxValidate_notEmpty" data-fieldsize="pair-xsmall" placeholder="[{ oxmultilang ident ="EMAIL_ADDRESS" }]">
            <p class="underInput short oxValidateError">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
            </p>
        </li>
        <li [{if $aErrors}]class="oxInValid"[{/if}]>
            <!-- <label class="short">[{ oxmultilang ident="PASSWORD" }]</label> -->
            <input type="password" name="lgn_pwd" class="js-oxValidate js-oxValidate_notEmpty textbox stepsPasswordbox" data-fieldsize="pair-xsmall" placeholder="[{ oxmultilang ident="PASSWORD" }]">
            &nbsp;
            <div class = "account accountCreate">
                <a id="openAccountLink" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" class="textLink" rel="nofollow">[{ oxmultilang ident="OPEN_ACCOUNT" }]</a>
            </div>
            <div class = "account forgotPassword">
                <a class="forgotPasswordOpener" id="step2PswdOpener" href="#" title="[{ oxmultilang ident="FORGOT_PASSWORD" }]">[{ oxmultilang ident="FORGOT_PASSWORD" }]</a>
            </div>
            <p class="underInput short oxValidateError">
                <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
            </p>
            <div class = "stayLogged btn">
                [{if $oView->showRememberMe()}]
                    <label for="RightLogin_KeepLogggedIn">
                        <input id="RightLogin_KeepLogggedIn" type="checkbox" name="lgn_cook" value="1" class="chk">
                        [{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_KEEPLOGGEDIN" }]
                    </label>
                [{/if}]
            </div>
        </li>
        <li><button type="submit" class="submitButton">[{ oxmultilang ident="LOGIN" }]&nbsp;&nbsp;&#10148;</button></li>
    </ul>
</form>
