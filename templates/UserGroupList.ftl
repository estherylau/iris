<#list userGroupList as userGroup>
<option value="${userGroup.group.id?c}">${userGroup.group.name}, ${userGroup.canShare})
</option>
</#list>
