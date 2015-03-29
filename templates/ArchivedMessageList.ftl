<#-- display lists of received messages -->
<#if receivedMessageList??>
    <#list receivedMessageList as message>
        <#if message.recipients.get(0).status = "deleted">
            <#if message.recipients.get(0).readByRecipient = true>
            <div class="receivedMessageList readByRecipientMessage">
            <#else>
            <div class="receivedMessageList unreadByRecipientMessage">
            </#if>
            <h1 class="messageSender">
                From: ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}</h1>
            <time>${message.sentDate?string("h:ma, M/d/yy")}</time>
            <h2 class="messageArchivedSubject${message_index} messageSubject">Subject #${message_index + 1}: <a
                    href="#">${message.subject}</a></h2><br/>
            <div class="messagePriority">Priority: ${message.priority}</div>
            <p class="messageDescription">
                <#assign messageTrimBody=(message.body!"")>
                <#if message.body?contains("##containerId=")>
                    <#assign containerIdTxt = message.body?substring(message.body?index_of("##containerId=")) />
                    <#assign containerId= message.body?substring(message.body?index_of("##containerId=")+14) />
                    <#assign stripContainerId = messageTrimBody?replace('${containerIdTxt}', '') />
                    <#if messageTrimBody?length &lt; 41>
                    ${message.body?replace('${containerIdTxt}', '')} <input type="button" value="Accept"
                                                                            onclick="acceptShare(${containerId})">
                    <#else>
                        <#if stripContainerId?length &lt; 41>
                        ${stripContainerId}  <input type="button" value="Accept" onclick="acceptShare(${containerId})">
                        <#else>
                        ${stripContainerId[0..40]} ... <input type="button" value="Accept"
                                                              onclick="acceptShare(${containerId})">
                        </#if>
                    </#if>
                <#else>
                    <#if messageTrimBody?length &lt; 41>
                    ${messageTrimBody}
                    <#else>
                    ${messageTrimBody[0..40]} ...
                    </#if>
                </#if>
                <span class="messageType">Type: ${message.type}</span>
            </p>
        </div>
        </#if>


    <#-- dialog for archived message full display
         This needs to stay inside receivedMessageList in order to render the MessageAction.java file correctly
    -->
        <div id="dialogArchivedMessageFullDisplay${message_index}"
             title="message from: ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}">
            <p class="message-details dialogMessage">
                <span class="dialogMessageSubject"><b>${message.subject}</b></span><span class="dialogMessagePriority">priority: <b>${message.priority}</b></span><br/>
                from:
                <b>${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}</b><br/>
                sent: <b>${message.sentDate?string("h:ma, M/d/yy")}</b><br/>
                to:
                <b>${userMap.get(message.recipients.get(0).recipientFkid).firstName} ${userMap.get(message.recipients.get(0).recipientFkid).lastName}</b><br/>

            <p class="messageBody" style="border-top:1px solid #999;text-align: left;">${message.body}</p>

            <p id="userId" style="display:none;">${message.sentByFkid}</p>
            </p>
        </div>




        <script>
            $(document).ready(function () {

                // define dialog archived message full display as JS Object
                $('#dialogArchivedMessageFullDisplay${message_index}').dialog({
                    autoOpen:false,
                    width:650,
                    modal:true,
                    buttons:{
                        "unarchive":function () {
                            $.post("Message_updateRecipient.action", {recipientFkid:"${message.recipients.get(0).recipientFkid}", recipientId:"${message.recipients.get(0).id}", status:"ACTIVE", readByRecipient:"true", messageId:"${message.id}"}, function (data) {
                                //   alert("archive status message" + data);
                            });
                            $(this).dialog("close");
                        },
                        "reply":function () {
                            $('#dialogReplyMessage').dialog("open");
                            $('#replyTo').append('Reply To: ' + '${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}');
                            $('#replyHidden').append('<input type="hidden" name="recipientId_0" value="${message.sentByFkid}">');
                            $('#replyMessageSubject').replaceWith('<input type="text" placeholder="" id="replyMessageSubject" name="subject" value="${message.subject}"/>');
                            $('#replyMessagePriority').replaceWith('<p id="replyMessagePriority">Priority: <select name="priority"><#assign replyMessagePriority = ["normal", "high"]><#list replyMessagePriority as x><#if message.priority?contains("${x}")><option value="${x?upper_case}" selected="selected">${x}</option><#else><option value="${x?upper_case}">${x}</option></#if></#list></select></p>');
                            $('#replyMessageBody').replaceWith('<textarea name="body" id="replyMessageBody">${message.body}</textarea>');
                            $(this).dialog("close");
                        },
                        "forward":function () {
                            $('#dialogForwardMessage').dialog("open");

                            $.get("User_getListByFrp.action", function (data) {
                                $('#forwardMessageRecipient').empty().append(data);
                            });

                            $('#forwardMessageSubject').replaceWith('<input type="text" placeholder="" id="forwardMessageSubject" name="subject" value="${message.subject}"/>');
                            $('#forwardMessagePriority').replaceWith('<p id="forwardMessagePriority">Priority: <select name="priority"><#assign forwardMessagePriority = ["normal", "high"]><#list forwardMessagePriority as x><#if message.priority?contains("${x}")><option value="${x?upper_case}" selected="selected">${x}</option><#else><option value="${x?upper_case}">${x}</option></#if></#list></select></p>');
                            $('#forwardMessageBody').replaceWith('<textarea name="body" id="forwardMessageBody">${message.body}</textarea>');
                            $(this).dialog("close");

                        },
                        "cancel":function () {
                            $(this).dialog("close");
                            $('#dialogReplyMessage');
                        }
                    }
                });

                // right panel, message tab, individual message full display
                $('.messageArchivedSubject${message_index}').click(function () {
                    $('#dialogArchivedMessageFullDisplay${message_index}').dialog('open');
                    return false;
                });
            });
        </script>


    </#list>
</#if>