<#-- display lists of received messages -->
<#if receivedMessageList??>
    <#list receivedMessageList as message>
        <#if message.recipients.get(0).status = "active">
            <#if message.recipients.get(0).readByRecipient = true>
            <div class="receivedMessageList readByRecipientMessage">
            <#else>
            <div class="receivedMessageList unreadByRecipientMessage">
            </#if>
            <h1 class="messageSender">
                From: ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}</h1>
            <time>${message.sentDate?string("h:ma, M/d/yy")}</time>
            <h2 class="messageReceivedSubject${message_index} messageSubject">Subject #${message_index + 1}: <a
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
        </div><!-- end receivedMessageList -->
        </#if>

    <#-- dialog for received message full display
         This needs to stay inside receivedMessageList ftl in order to render the MessageAction.java file correctly
    -->
    <div id="dialogReceivedMessageFullDisplay${message_index}" class="dialogMessageDisplay"
         title="message from: ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}">
        <p class="message-details dialogMessage">
            <span class="dialogMessageSubject">${message.subject}</span><span
                class="dialogMessagePriority">priority: <span
                id="messagePriority">${message.priority}</span></span><br/>
            from:
        ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}<br/>
            sent: ${message.sentDate?string("h:ma, M/d/yy")}<br/>
            to:
        ${userMap.get(message.recipients.get(0).recipientFkid).firstName} ${userMap.get(message.recipients.get(0).recipientFkid).lastName}

        <p class="messageBody">${message.body}</p>

        <p id="userId" style="display:none;">${message.sentByFkid}</p>
        </p>
    </div>


    <script>
        $(document).ready(function () {

            // define dialog received message full display as JS Object
            $('#dialogReceivedMessageFullDisplay${message_index}').dialog({
                autoOpen:false,
                width:650,
                modal:true,
                buttons:{
                    "archive":function () {
                        $.post("Message_updateRecipient.action", {recipientFkid:"${message.recipients.get(0).recipientFkid}", recipientId:"${message.recipients.get(0).id}", status:"DELETED", readByRecipient:"true", messageId:"${message.id}"}, function (data) {
                            //   alert("archive status message" + data);
                        });
                        $(this).dialog("close");
                    },
                    "reply":function () {
                        $('#dialogReplyMessage').dialog("open");
                        $('#replyTo').append('Reply To: ' + '${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}');
                        $('#replyHidden').append('<input type="hidden" name="recipientId_0" value="${message.sentByFkid}">');
                        $('#replyMessageSubject').replaceWith('<input type="text" placeholder="" id="replyMessageSubject" name="subject" value="Re: ${message.subject}"/>');
                        $('#replyMessagePriority').replaceWith('<p id="replyMessagePriority">Priority: <select name="priority"><#assign replyMessagePriority = ["normal", "high"]><#list replyMessagePriority as x><#if message.priority?contains("${x}")><option value="${x?upper_case}" selected="selected">${x}</option><#else><option value="${x?upper_case}">${x}</option></#if></#list></select></p>');
                        $('#replyMessageBody').replaceWith('<textarea name="body" id="replyMessageBody" class="messageBody">${message.body}</textarea>');
                        $(this).dialog("close");
                    },
                    "forward":function () {
                        $('#dialogForwardMessage').dialog("open");

                        $.get("User_getListByFrp.action", function (data) {
                            $('#forwardMessageRecipient').empty().append(data);
                        });

                        $('#forwardMessageSubject').replaceWith('<input type="text" placeholder="" id="forwardMessageSubject" name="subject" value="Fw: ${message.subject}"/>');
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
            $('.messageReceivedSubject${message_index}').click(function () {
                $('#dialogReceivedMessageFullDisplay${message_index}').dialog('open');
                $.post("Message_updateRecipient.action", {recipientFkid:"${message.recipients.get(0).recipientFkid}", recipientId:"${message.recipients.get(0).id}", status:"ACTIVE", readByRecipient:"true", messageId:"${message.id}"}, function (data) {
                    //   alert("You've read this message" + data);
                });
                return false;
            });
        });
    </script>
    </#list>
</#if>

<#-- display lists of sent messages -->
<#if sentMessageList??>
    <#list sentMessageList as message>
    <div class="sentMessageList">
        <h1 class="messageRecipient">
            To: ${userMap.get(message.recipients.get(0).recipientFkid).firstName} ${userMap.get(message.recipients.get(0).recipientFkid).lastName}</h1>
        <time>${message.sentDate?string("h:ma, M/d/yy")}</time>
        <h2 class="messageSentSubject${message_index} messageSubject">Subject #${message_index + 1}: <a
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

    <#-- dialog for sent message full display
     This needs to stay inside sentMessageList ftl in order to render the MessageAction.java file correctly
    -->
        <div id="dialogSentMessageFullDisplay${message_index}"
             title="sent from: ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}">
            <p class="message-details dialogMessage">
                <span class="dialogMessageSubject">${message.subject}</span><span class="dialogMessagePriority">priority: <span
                    id="messagePriorityValue">${message.priority}</span></span><br/>
                from:<b>${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}</b><br/>
                sent: <b>${message.sentDate?string("h:ma, M/d/yy")}</b><br/>
                to:<b>${userMap.get(message.recipients.get(0).recipientFkid).firstName} ${userMap.get(message.recipients.get(0).recipientFkid).lastName}</b><br/>

            <p class="messageBody">${message.body}</p>
            </p>
        </div>
    </div><!-- end sentMessageList -->
    <script>
        $(document).ready(function () {
            // define dialog sent message full display as JS Object
            $('#dialogSentMessageFullDisplay${message_index}').dialog({
                autoOpen:false,
                width:650,
                modal:true,
                buttons:{
                    "reply":function () {
                        $('#dialogReplyMessage').dialog("open");
                        $('#replyTo').append('Reply To: ' + '${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}');
                        $('#replyHidden').append('<input type="hidden" name="recipientId_0" value="${message.sentByFkid}">');
                        $('#replyMessageSubject').replaceWith('<input type="text" placeholder="" id="replyMessageSubject" name="subject" value="Re: ${message.subject}"/>');
                        $('#replyMessagePriority').replaceWith('<p id="replyMessagePriority">Priority: <select name="priority"><#assign replyMessagePriority = ["normal", "high"]><#list replyMessagePriority as x><#if message.priority?contains("${x}")><option value="${x?upper_case}" selected="selected">${x}</option><#else><option value="${x?upper_case}">${x}</option></#if></#list></select></p>');

                        $('#replyMessageBody').replaceWith('<textarea name="body" id="replyMessageBody">${message.body}</textarea>');
                        $(this).dialog("close");

                    },
                    "forward":function () {
                        $('#dialogForwardMessage').dialog("open");

                        $.get("User_getListByFrp.action", function (data) {
                            $('#forwardMessageRecipient').empty().append(data);
                        });

                        $('#forwardMessageSubject').replaceWith('<input type="text" placeholder="" id="forwardMessageSubject" name="subject" value="Fw: ${message.subject}"/>');
                        $('#forwardMessagePriority').replaceWith('<p id="forwardMessagePriority">Priority: <select name="priority"><#assign forwardMessagePriority = ["normal", "high"]><#list forwardMessagePriority as x><#if message.priority?contains("${x}")><option value="${x?upper_case}" selected="selected">${x}</option><#else><option value="${x?upper_case}">${x}</option></#if></#list></select></p>');
                        $('#forwardMessageBody').replaceWith('<textarea name="body" id="forwardMessageBody">${message.body}</textarea>');
                        $(this).dialog("close");

                    },
                    "cancel":function () {
                        $(this).dialog("close");
                    }
                }
            });

            // define dialogReplyMessage as JS object
            $('#dialogReplyMessage').dialog({
                autoOpen:false,
                width:600,
                modal:true,
                buttons:{
                    "send":function () {

                        //alert('sending message');

                        $.post('Message_send.action', $("#replyMessage").serialize(), function (data) {
                            //alert('this is the data: ' + data);
                        });
                        $(this).dialog("close");
                        //$('#replyTo').empty();
                        //$('#replyHidden').empty();
                    },
                    "cancel":function () {
                        $(this).dialog("close");
                        $('#replyTo').empty();
                        $('#replyHidden').empty();
                    }
                },
                close:function () {
                    if ($('#replyTo').html()) {
                        $('#replyTo').empty();
                        $('#replyHidden').empty();
                    }
                }

            });

            // right panel, message tab, individual message full display
            $('.messageSentSubject${message_index}').click(function () {
                $('#dialogSentMessageFullDisplay${message_index}').dialog('open');
                return false;
            });
        });
    </script>
    </#list>
</#if>
