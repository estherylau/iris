<h2>manage users</h2>
<!-- grab the current list via ajax SimpleUserList.action, for initial display only -->
<script>
    function addUserList() {
        $.get("SimpleUserList.action", function (data) {
            //alert(data);
            $('#SimpleUserlist').empty().append(data)
        });
    }
    function addGroupList() {
        $.get("Group_getGroupsInFrp.action", function (data) {
            $('#SimpleGrouplist').empty().append(data)
        });
    }
    /* function addGroupList() {
        $.get("SimpleGroupList.action", function (data) {
            //alert(data);
            $('#SimpleGrouplist').empty().append(data)
        });
    } */
    addUserList();
    addGroupList();
    //addGroupList();
    setInterval(adminUserList, 5000);
</script>
<button value="create users" id="createUserToggle">new user</button>
<button value="no 2" id="no2">#2</button>
<button value="no 3" id="no3">#3</button>
<button value="no 4" id="no4">#4</button>
<div class="userListToggle">
    <img src="/irisnote/static/images/misc/closedContainer.gif" class="userListToggleImage"> user list
</div>
<div id="SimpleUserlist"></div>
<br/>
<h2>manage groups</h2>
<button value="create group" id="createGroupToggle">new group</button>
<button value="no 6" id="no6">#2</button>
<button value="no 7" id="no7">#3</button>
<button value="no 8" id="no8">#4</button>
<div class="groupListToggle">
    <img src="/irisnote/static/images/misc/closedContainer.gif" class="groupListToggleImage"> group list
</div>
<div id="SimpleGrouplist">
<#--<#include "../SimpleGroupList.ftl">-->
</div>
<#--<h2>manage groups</h2>-->
<#--<button value="create group" id="createGroupToggle">create group</button>-->
<#--<button value="no 10" id="no10">#2</button>-->
<#--<button value="no 11" id="no11">#3</button>-->
<#--<button value="no 12" id="no12">#4</button>-->
<#--<div id="SimpleGrouplist">-->
<#--<#include "../SimpleGroupList.ftl">-->
<#--</div>-->
<div>
    <!-- <button value="create users" id="createUserToggle">create users</button> -->
    <script>

        $(document).ready(function () {





            // Left Panel, admin tab, create user form opener/closer
            $("#createUserToggle").click(function () {
                $('#changeable-contents-tab').empty().append('create user');
                $('#tabsContent').tabs('select', 1);
                $.get("User_create.action", function (data) {
                    $('#tab-contents').empty().append(data)
                });
                /* $("#tab-contents").toggle(function () {
                }); */
                rightContainerWidthAutoAdjust();    // auto adjust icons container below the right Container tabs

            });
            // Left Panel, admin tab, create group form opener/closer
            $("#createGroupToggle").click(function () {
                $('#changeable-contents-tab').empty().append('create group');
                $('#tabsContent').tabs('select', 1);
                /* $.get("http://localhost:2271/irisnote/templates/CreateGroup.ftl", function (data) {
                    $('#tab-contents').empty().append(data);
                }); */
                $('#tab-contents').load('templates/CreateGroup.ftl');
                /* $.get("Group_create.action", function (data) {
                    $('#tab-contents').empty().append(data)
                }); */
                /* $("#tab-contents").toggle(function () {
                }); */
                rightContainerWidthAutoAdjust();  // auto adjust icons container below the right Container tabs
            });
            // Left Panel, admin tab, create group form opener/closer
            $("#createGroupToggle").click(function () {
                $('#changeable-contents-tab').empty().append('create group');
                $('#tabsContent').tabs('select', 1);
                $('#tab-contents').load('templates/CreateGroup.ftl');
                /* $.get("Group_create.action", function (data) {
                    alert("this is the data:" + data);
                    $('#tab-contents').empty().append(data);
                }); */
                /* $("#tab-contents").toggle(function () {
                }); */
            });
            // Left Panel, admin tab, user list toggle
            $('#SimpleUserlist').hide();
            $('.userListToggle').click(function () {
                if ($('#SimpleUserlist').length == 0) {
                    // Arrow will not animate since container is missing notebookPageList div
                }
                else {
                    // Rotate arrow on notebook arrow select
                    if ($('#SimpleUserlist').is(':hidden')) {
                        $('.userListToggleImage').animate({'transform':'rotate(90deg)'}, 150, 'linear');
                        $('#SimpleUserlist').slideDown('slow');
                    }
                    else {
                        $('.userListToggleImage').animate({'transform':'rotate(0deg)'}, 150, 'linear');
                        $('#SimpleUserlist').slideUp('slow');
                    }
                }
            });
            //Left Panel, admin tab, group list toggle
            $('#SimpleGrouplist').hide();
            $('.groupListToggle').click(function () {
                if ($('#SimpleGrouplist').length == 0) {
                    // Arrow will not animate since container is missing notebookPageList div
                }
                else {
                    // Rotate arrow on notebook arrow select
                    if ($('#SimpleGrouplist').is(':hidden')) {
                        $('.groupListToggleImage').animate({'transform':'rotate(90deg)'}, 150, 'linear');
                        $('#SimpleGrouplist').slideDown('slow');
                    }
                    else {
                        $('.groupListToggleImage').animate({'transform':'rotate(0deg)'}, 150, 'linear');
                        $('#SimpleGrouplist').slideUp('slow');
                    }
                }
            });
        });
    </script>
</div>