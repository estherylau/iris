<div id="dialogAddedFile" title="add to notebook">
    File successfully added to notebook.
</div>

<div id="dialogIrisnoteQuestion" title="irisnote">
    <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum.
    </p>
</div>

<div id="dialogControlledVocabularyQuestion" title="Controlled Vocabulary">
    <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum.
    </p>
</div>

<div id="dialogTemplatesQuestion" title="Templates">
    <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum.
    </p>
</div>

<div id="dialogCollaborationQuestion" title="Collaboration">
    <p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum.
    </p>
</div>

<div id="dialogCreateNotebook" title="create a notebook" class="notebookList">
    <form name="createNotebook" action="Container_create.action" id="createNotebook">
        <label for="containerTitleNotebook">title</label><input type="text" name="containerTitle"
                                                                id="containerTitleNotebook"
                                                                placeholder="Notebook Title"><br>
        <label for="containerDescNotebook">description</label><textarea name="containerDesc" id="containerDescNotebook">notebook
        description</textarea><br>
        <label for="notebookType">type</label>
        <select name="notebookType" id="notebookType">
            <option>type 1</option>
            <option>type 2</option>
        </select>
        <input type="hidden" value="NOTEBOOK" id="containerTypeNotebook" name="containerType">
    </form>
</div>

<div id="dialogCreateFolder" title="create a folder" class="folderList">
    <form name="createFolder" action="Container_create.action" id="createFolder">
        <label for="containerTitleFolder">title</label><input type="text" name="containerTitle"
                                                              id="containerTitleFolder"
                                                              placeholder="Container Title"><br>
        <label for="containerDescFolder">description</label><textarea name="containerDesc" id="containerDescFolder">folder
        description</textarea>
        <input type="hidden" value="FOLDER" id="containerTypeFolder" name="containerType">
    </form>
</div>

<div id="dialogAddFile" title="add a file to notebook:  " class="notebookList">
    <form action="Resource_create.action" method="post" enctype="multipart/form-data" id="formAddFile">
        <input type="file" name="upload" label="File" id="upload"/>
        <input type="hidden" name="containerId" value="containerId" id="containerId"/>
        <input type="hidden" value="parentResourceId" id="parentResourceId" name="parentResourceId">
    </form>
</div>
<!-- iframe that is used by formAddFile -->
<iframe name='frameAddFile' width='0px' height='0px' frameborder='0'></iframe>

<div id="dialogShare" title="create a message" class="messageList">
    <form action="Share_shareInvite.action" id="shareItemForm">
        <label>To:</label>
        <select name="recipientId_0" id="dialogShareRecipient"></select><br/>
        <label>Message:</label><textarea name="body" id="shareMsg"></textarea>
        <input type="hidden" value="containerId" id="containerIdForShare" name="containerIdForShare">
    </form>
    <script>
        $.get("User_getListByFrp.action", function (data) {
            $('#dialogShareRecipient').empty().append(data);
        });
    </script>
</div>

<div id="dialogAddPage" title="add a page to notebook:  " class="notebookList">
    <form action="Resource_create.action" method="post" enctype="multipart/form-data" id="formAddPage">
        <input type="text" name="pageTitle" id="pageTitle">

        <input type="hidden" name="containerId" value="pageContainerId" id="pageContainerId"/>
    </form>
</div>
<!-- iframe that is used by formAddFile -->
<iframe name="frameAddPage" width="0px" height="0px" frameborder="0"></iframe>

<!-- dialog that is used by dialogCreateNewMessage -->
<div id="dialogCreateNewMessage" class="dialogMessage" title="send a message" class="messageList">
    <form action="Message_send.action" id="createNewMessage">
        <label>To:</label>
        <select name="recipientId_0" id="createNewMessageRecipient">
        </select><br/>
        <label>Subject:</label>

        <p id="createNewMessagePriority"><label>Priority:</label>
            <select name="priority">
                <option value="NORMAL">normal</option>
                <option value="HIGH">high</option>
            </select></p>
        <input type="text" placeholder="" id="createNewMessageSubject" name="subject"/><br/>
        <label>Message:</label>
        <textarea name="body" id="createNewMessageBody"></textarea>
    </form>
</div>

<!-- dialog that is used by dialogReplyMessage -->
<div id="dialogReplyMessage" class="dialogMessage" title="replying to message from">
    <form action="Message_send.action" id="replyMessage">
        <p id="replyTo"></p>

        <p id="replyHidden" style="display:none;"></p>
        <label for="replyMessageSubject">Subject: </label>

        <p id="replyMessagePriority"><label>Priority:</label>
            <select name="priority">
                <option value="NORMAL">normal</option>
                <option value="HIGH">high</option>
            </select></p>
        <br/><b>
        <input type="text" placeholder="" id="replyMessageSubject" name="subject"/></b>
        <br/>
        <label>Message:</label><br/>
        <textarea name="body" id="replyMessageBody" class="messageBody"></textarea>
    </form>
</div>

<script>
    $('#dialogForwardMessage').dialog({
        autoOpen:false,
        width:600,
        modal:true,
        buttons:{
            "send":function () {

                $(this).dialog("close");
                $.post('Message_send.action', $("#forwardMessage").serialize(), function (data) {
                    //alert('this is the data: ' + data);
                });
            },
            "cancel":function () {
                $(this).dialog("close");
            }
        }
    });
</script>

<!-- dialog that is used by dialogForwardMessage -->
<div id="dialogForwardMessage" class="dialogMessage" title="forwarding message">
    <form action="Message_send.action" id="forwardMessage">
        <label for="forwardMessageRecipient">To:</label>
        <select name="recipientId_0" id="forwardMessageRecipient"></select><br/>
        <label>Subject:</label>

        <p id="forwardMessagePriority"><label>Priority:</label>
            <select name="priority">
                <option value="NORMAL">normal</option>
                <option value="HIGH">high</option>
            </select></p>
        <input type="text" placeholder="" id="forwardMessageSubject" name="subject"/><br/>
        <label>Message:</label><br/>
        <textarea name="body" id="forwardMessageBody"></textarea>
        <script>
            $.get("User_getListByFrp.action", function (data) {
                //alert('this is the recipient data: '+data);
                $('#forwardMessageRecipient').empty().append(data);
            });
        </script>
    </form>
</div>
