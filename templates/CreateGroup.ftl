<script>
    function addGroupMember() {
        var groupMemberValue = '';
        var groupMemberField = '<br/><input type="text" name="groupMember" value="' + groupMemberValue + '" id="groupSubmit_groupMember"/>';
        $("#groupSubmit_groupMembers").append(groupMemberField);
    }
</script>

<div id="groupCreateForm">
    <div class="groupCreateWrapper">
        <h2>Group Create Form</h2>

        <form id="groupAdminForm" name="groupAdminForm" action="/irisnote/Group_create.action"
              method="post">
            <p><label for="groupSubmit_name" class="label">Group Name</label>
                <br/><input type="text" name="groupName" value=""
                            id="groupSubmit_name"/>
            </p>
            <br/>

            <p><label for="groupSubmit_parent" class="label">Parent</label>
                <br/><input type="text" name="parent" value=""
                            id="groupSubmit_parent"/>
            </p>
            <br/>

            <p><label for="groupSubmit_member" class="label">Members</label>

            <div id="groupSubmit_groupMembers">
                <input type="text" name="member" value=""
                       id="groupSubmit_member"/>
            </div>
            <div id="addMemberField" onmouseover="$('#addMemberField').css('cursor', 'pointer')"
                 onclick="addGroupMember()">+ Add
            </div>
            </p>
            <br/>

            <p><label for="groupSubmit_description" class="label">Description</label>
                <br/><input type="text" name="description" value=""
                            id="groupSubmit_description"/>
            </p>
            <br/>

            <p><input type="button" value=" Create " name="createGroupBtn"
                      onclick="return groupAdminSubmit(document.groupAdminForm)"/></p>

        </form>
    </div>

</div>