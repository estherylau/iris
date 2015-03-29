<div id="loginHistory">
    Login history for ${userList.get(0).lastName}, ${userList.get(0).firstName} (${userList.get(0).username})
<#list userList as user>
    <#if user.lastLoginDate??>
        <div id="loginDate">${user.lastLoginDate?string("hh:mma, MM/dd/yy")}</div>
    </#if>
</#list>
</div>