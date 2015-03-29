<!--
<div class="documentIcons">
    <img src="/irisnote/static/images/misc/notebookCreateFile.png" id="openDialogCreateNotebook"
         class="ui-state-default ui-corner-all"
         title="create notebook">
    <img src="/irisnote/static/images/misc/notebookCreateFolder.png" id="openDialogCreateFolder"
         class="ui-state-default ui-corner-all"
         title="create folder">
</div>
-->
<div id="documentList"></div>

<!-- grab the current list via ajax Container_getList.action, for initial display only -->
<script>
    $.get("Container_getList.action", function (data) {
        $('#documentList').append(data)
    });
</script>