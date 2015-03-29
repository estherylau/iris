<#include "global/header.html">
	<div class="mainLayout">
		<div class="registerWrapper">
			<h2><@s.property value="messageStore.message" /></h2>
			<form id="registrationForm" name="registrationForm" action="/irisnote/Register.action" method="post">
				<table class="wwFormTable">
					<tr>
						<td class="tdLabel"><label for="loginSubmit_userName" class="label">Your name:</label></td>
						<td>
						<input type="text" name="userName" value="<@s.property value="userName" />" id="loginSubmit_userName"/>
						</td>
					</tr>
					<tr>
						<td class="tdLabel"><label for="loginSubmit_password" class="label">password:</label></td>
						<td>
						<input type="password" name="password" value="<@s.property value="password" />" id="loginSubmit_password"/>
						</td>
					</tr>
					<tr>
                    	<td class="tdLabel"><label for="loginSubmit_firstName" class="label">First Name:</label></td>
                    	<td>
                    	<input type="text" name="firstName" value="<@s.property value="firstName" />" id="loginSubmit_firstName"/>
                    	</td>
                    </tr>
					<tr>
                    	<td class="tdLabel"><label for="loginSubmit_lastName" class="label">Last Name:</label></td>
                    	<td>
                    	<input type="text" name="lastName" value="<@s.property value="lastName" />" id="loginSubmit_lastName"/>
                    	</td>
                    </tr>
					<tr>
                    	<td class="tdLabel"><label for="loginSubmit_frpName" class="label">Organization:</label></td>
                    	<td>
                    	<input type="text" name="frpName" value="<@s.property value="frpName" />" id="loginSubmit_frpName"/>
                    	</td>
                    </tr>
                    <tr>
                        <td class="tdLabel"><label for="loginSubmit_address" class="label">server address:</label></td>
                        <td>
                            <input type="text" name="address" value="<@s.property value="address" />" id="loginSubmit_address"/>
                        </td>
                    </tr>
					<tr>
						<td colspan="2">
						<div align="right">
							<input type="button" value=" Register " name="registrationBtn" onclick="return registrationSubmit(document.registrationForm)">
						</div></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="loginLayoutAnimA">&nbsp;</div>
		<img src="/irisnote/static/images/NewIrisLogos-07.1-ColorFinal.png" alt="iris note logo" id="logo">
	</div>

<#include "global/footer.html">
