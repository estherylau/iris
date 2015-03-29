<#include "global/header.html">
<div class="mainLayout">
    <div class="loginWrapper">
        <h2><@s.property value="messageStore.message" /></h2>

        <form id="loginForm" name="loginForm" action="/irisnote/Login.action" method="post">
            <table class="wwFormTable">
                <tr>
                    <td class="tdLabel"><label for="loginSubmit_userName" class="label">Your name:</label></td>
                    <td>
                        <input type="text" name="userName" value="<@s.property value="userName" />"
                               id="loginSubmit_userName"/>
                    </td>
                </tr>
                <tr>
                    <td class="tdLabel"><label for="loginSubmit_password" class="label">password:</label></td>
                    <td>
                        <input type="password" name="password" value="<@s.property value="password" />"
                               id="loginSubmit_password"/>
                    </td>
                </tr>
                <tr>
                    <td class="tdLabel"><label for="loginSubmit_address" class="label">server address:</label></td>
                    <td>
                        <input type="text" name="address" value="<@s.property value="address" />"
                               id="loginSubmit_address"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div align="right">
                            <input type="button" value=" Log in " name="loginBtn"
                                   onclick="return loginSubmit(document.loginForm)">
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div><a href="Register.action">Register New User</a></div>
    <div class="loginLayoutAnimA">&nbsp;</div>
    <img src="/irisnote/static/images/NewIrisLogos-07.1-ColorFinal.png" alt="iris note logo" id="logo">
</div>
<script>
    $(document).ready(function () {
        $("#loginSubmit_userName").focus();
    });
</script>

<#include "global/footer.html">
