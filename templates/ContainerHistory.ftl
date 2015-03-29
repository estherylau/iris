<div id="containerHistory">
    Container history for ${containerList.get(0).name}
    <table>
    <#list containerList as container>
        <tr>
            <td>${container.lastUpdateType.toString()}</td>
            <td>${container.logMessage}</td>
            <td>
                <#if container.lastUpdatedDate??>
                    <div id="updateDate">${container.lastUpdatedDate?string("hh:mma, MM/dd/yy")}</div>
                </#if>
            </td>
        </tr>
    </#list>
    </table>
</div>