<!-- use for in pane display of user list -->
<ol id="groupList">
<#list groupList as group>
    <li><span class="groupListContextMenu${group.id?c}">${group.id?c}: ${group.name}</span></li>
</#list>
    <script>
        $(document).ready(function () {
            $.contextMenu({
                selector:'.groupListContextMenu',
                //global callback required to function; overridden on each item in menu
                callback:function (key, options) {
                    var m = "function not available: " + key;
                    //alert(m);
                },
                items:{
                    "add user to group":{
                        name:"addUser",
                        icon:"addUser"
                    }
                } //closes items
            }); //closes contextMenu > selector userListContextMenu
        });
    </script>
</ol>
