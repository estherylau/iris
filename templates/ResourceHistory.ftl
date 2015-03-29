<div id="resourceHistory">
    <h5>Resource history for:<br>${resourceRevisionList.get(0).name}</h5>
    <table>
    <#list resourceRevisionList as resourceRevision>
        <tr>
            <td class="resourceHistoryTable">${resourceRevision.resource.lastUpdateType.toString()}</td>
            <td class="resourceHistoryTable">${resourceRevision.resource.logMessage}</td>
            <td class="resourceHistoryTable">
                <#if resourceRevision.resource.lastUpdatedDate??>
                    <div id="updateDate">${resourceRevision.resource.lastUpdatedDate?string("hh:mma, MM/dd/yy")}</div>
                </#if>
            </td>
        </tr>
    </#list>
    </table>
</div>