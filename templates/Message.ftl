<#if receivedMessageList??>
<!--<h1 class="messageListTitle">recieved messages</h1> -->
    <#list receivedMessageList as message>

    <div>
        <h1 class="messageSender">
            From: ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}</h1>
        <time>${message.sentDate?string("h:ma, M/d/yy")}</time>
        <h2 class="messageReceivedSubject${message_index} messageSubject">Subject #${message_index + 1}: <a
                href="#">${message.subject}</a></h2><br/>

        <div class="messagePriority">Priority: ${message.priority}</div>
        <p class="messageDescription">
        ${message.body}
        </p>

        <div id="dialogReceivedMessageFullDisplay${message_index}"
             title="message from: ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}">
            <p class="message-details">
                subject: <b>${message.subject}</b><br/>
                from:
                <b>${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}</b><br/>
                sent: <b>${message.sentDate?string("h:ma, M/d/yy")}</b><br/>
                to:
                <b>${userMap.get(message.recipients.get(0).recipientFkid).firstName} ${userMap.get(message.recipients.get(0).recipientFkid).lastName}</b><br/>
                message:<br>

            <p style="border:1px solid #999;text-align: left;">${message.body}</p>
            </p>
            <p id="userId" style="display:none;">${message.sentByFkid}</p>
        </div>

    </div>

    <script>
        $(document).ready(function () {
            function grabRecipientList() {
                //alert('grabRecipientList');
                $.get("User_getListByFrp.action", function (data) {
                            //alert(data);
                            $("#forwardMessageRecipient").append(data);
                            //alert('appended');
                        }
                );
            }

            // define individual message full display as JS Object
            // moved from header for FTL var
            $('#dialogReceivedMessageFullDisplay${message_index}').dialog({
                autoOpen:false,
                width:650,
                modal:true,
                buttons:{
                    "archive":function () {
                        $(this).dialog("close");

                    },
                    "reply":function () {
                        $('#dialogReplyMessage').dialog("open");
                        $('#replyTo').append('${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}');
                        $('#replyMessage').append('<input type="hidden" name="recipientId_0" value="${message.sentByFkid}">');
                        $('#replyMessageSubject').remove();
                        $('#replyMessage').append('<input type="text" placeholder="" id="replyMessageSubject" name="subject" value="${message.subject}"/>');
                        $('#replyMessageBody').remove();
                        $('#replyMessage').append('<textarea name="body" id="replyMessageBody">${message.body}</textarea>');
                        //alert('${message.body}');
                        $(this).dialog("close");

                    },
                    "forward":function () {
                        $('#dialogForwardMessage').dialog("open");

                        $.get("User_getListByFrp.action", function (data) {
                            $('#forwardMessageRecipient').empty().append(data);
                        });


                        //grabRecipientList();
                        //$('#forwardMessage').append();
                        //${message.subject} ${message.body}




                        //alert('${message.body}');
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
                return false;
            });
        });
    </script>
    </#list>
</#if>

<#if sentMessageList??>
<!--<h1 class="messageListTitle">sent messages</h1>-->
    <#list sentMessageList as message>
    <div xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
        <h1 class="messageRecipient">
            To: ${userMap.get(message.recipients.get(0).recipientFkid).firstName} ${userMap.get(message.recipients.get(0).recipientFkid).lastName}</h1>
        <time>${message.sentDate?string("h:ma, M/d/yy")}</time>
        <h2 class="messageSentSubject${message_index} messageSubject">Subject #${message_index + 1}: <a
                href="#">${message.subject}</a></h2><br/>

        <div class="messagePriority">Priority: ${message.priority}</div>
        <p class="messageDescription">
            <#assign messageTrimBody=(message.body!"")>
                    <#if messageTrimBody?length &lt; 41>
        ${messageTrimBody}
        <#else>
        ${messageTrimBody[0..40]}
        </#if>
        </p>

        <div id="dialogSentMessageFullDisplay${message_index}"
             title="sent from: ${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}">
            <form>
                <p class="message-details">
                    subject: <b>${message.subject}</b><br/>
                    from:
                    <b>${userMap.get(message.sentByFkid).firstName} ${userMap.get(message.sentByFkid).lastName}</b><br/>
                    sent: <b>${message.sentDate?string("h:ma, M/d/yy")}</b><br/>
                    to:
                    <b>${userMap.get(message.recipients.get(0).recipientFkid).firstName} ${userMap.get(message.recipients.get(0).recipientFkid).lastName}</b><br/>
                    message:<br>

                <p style="border:1px solid #999;text-align: left;">${message.body}</p>
                </p>
            </form>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            // define individual message full display as JS Object
            $('#dialogSentMessageFullDisplay${message_index}').dialog({
                autoOpen:false,
                width:650,
                modal:true,
                buttons:{
                    "archive":function () {
                        $(this).dialog("close");

                    },
                    "reply":function () {
                        $(this).dialog("close");

                    },
                    "forward":function () {


                    },
                    "cancel":function () {
                        $(this).dialog("close");
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





