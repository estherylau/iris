<!-- use for in pane display of user list -->
<ol id="userList">
<#list userList as user>
    <li><span class="userListContextMenu${user.id?c}">${user.id?c}: ${user.lastName}, ${user.firstName}
        (${user.username})
    </span></li>
    <script>
        $(document).ready(function () {
            $.contextMenu({
                selector:'.userListContextMenu${user.id?c}',
                //global callback required to function; overridden on each item in menu
                callback:function (key, options) {
                    var m = "function not available: " + key;
                    //alert(m);
                },
                items:{
                    "edit user":{
                        name:"editUser",
                        icon:"editUser",
                        callback:function (key, options) {
                            $('#changeable-contents-tab').empty().append('edit user');
                            $('#tabsContent').tabs('select', 1);
                            $.post("User_update.action?userId=${user.id?c}", function (data) {
                                $('#tab-contents').empty().append(data)
                            });
                        }
                    },
                    "user history":{
                        name:"userHistory",
                        icon:"userHistory",
                        callback:function (key, options) {
                            //alert('this is: ${user.id?c}: ${user.lastName}, ${user.firstName}');
                            $('#changeable-contents-tab').empty().append('user history');
                            $('#tabsContent').tabs('select', 1);
                            $.post('User_getHistory.action?userId=${user.id?c}', function (data) {
                                //alert('this is the data: ' + data);
                                var userHistoryArea = "<h3>user history</h3><div id='userHistoryScrollBox'>" + data + "</div>";
                                $("#tab-contents").empty().append(userHistoryArea);
                            });
                        }
                    }
                } //closes items
            }); //closes contextMenu > selector userListContextMenu
        });
    </script>
</#list>
</ol>


