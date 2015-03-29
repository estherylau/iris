<#list userList as user>
<option value="${user.id?c}">${user.lastName}, ${user.firstName} (${user.username})</option>
</#list>
