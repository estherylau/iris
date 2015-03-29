<script>
    var i = 0;

    function addEmailField() {
        var emailValue = '<@s.property value="email" />';
        var alternateEmailField = '<label for="loginSubmit_alternateEmail-' + i + '" class="createUserLabel" id="alternateEmailLabel-' + i + '">Alternate Email: </label> <input type="text" name="email" class="createUserWidget" value="' + emailValue + '" id="loginSubmit_alternateEmail-' + i + '" onchange="checkAlternateEmail(' + i + ')"/><div class="emailAlert" id="alternateEmailAlert-' + i + '"></div>';
        $("#loginSubmit_email").append(alternateEmailField);
        i++;
    }

    function checkPrimaryEmail() {
        var emailAddress = $("#loginSubmit_primaryEmail").val();
        var emailLength = emailAddress.length;
        var addressSplit = emailAddress.split(".");
        if (emailAddress.indexOf("@") == -1) {
            $("#primaryEmailLabel").css("color", "#ff0000");
            $("#loginSubmit_primaryEmail").css("border-color", "#ff0000");
            $("#primaryEmailAlert").empty().append("<span style='color:#ff0000'>error: not a valid email address</span>");
        }
        else if (addressSplit[addressSplit.length - 1].length > 3 || addressSplit[addressSplit.length - 1].length < 2) {
            $("#primaryEmailLabel").css("color", "#ff0000");
            $("#loginSubmit_primaryEmail").css("border-color", "#ff0000");
            $("#primaryEmailAlert").empty().append("<span style='color:#ff0000'>error: not a valid email address</span>");
        }
        else if (emailAddress.indexOf("@") == 0 || emailAddress.lastIndexOf(".") - emailAddress.indexOf("@") < 2) {
            $("#primaryEmailLabel").css("color", "#ff0000");
            $("#loginSubmit_primaryEmail").css("border-color", "#ff0000");
            $("#primaryEmailAlert").empty().append("<span style='color:#ff0000'>error: not a valid email address</span>");
        }
        else {
            $("#primaryEmailLabel").css("color", "#000");
            $("#loginSubmit_primaryEmail").css("border-color", "#000");
            $("#primaryEmailAlert").empty();
        }
    }

    function checkAlternateEmail(k) {
        var emailAddress = $("#loginSubmit_alternateEmail-" + k).val();
        var emailLength = emailAddress.length;
        var addressSplit = emailAddress.split(".");
        if (emailAddress.indexOf("@") == -1) {
            $("#alternateEmailLabel-" + k).css("color", "#ff0000");
            $("#loginSubmit_alternateEmail-" + k).css("border-color", "#ff0000");
            $("#alternateEmailAlert-" + k).empty().append("<span style='color:#ff0000'>error: not a valid email address</span>");
        }
        else if (addressSplit[addressSplit.length - 1].length > 3 || addressSplit[addressSplit.length - 1].length < 2) {
            $("#alternateEmailLabel-" + k).css("color", "#ff0000");
            $("#loginSubmit_alternateEmail-" + k).css("border-color", "#ff0000");
            $("#alternateEmailAlert-" + k).empty().append("<span style='color:#ff0000'>error: not a valid email address</span>");
        }
        else if (emailAddress.indexOf("@") == 0 || emailAddress.lastIndexOf(".") - emailAddress.indexOf("@") < 2) {
            $("#alternateEmailLabel-" + k).css("color", "#ff0000");
            $("#loginSubmit_alternateEmail-" + k).css("border-color", "#ff0000");
            $("#alternateEmailAlert-" + k).empty().append("<span style='color:#ff0000'>error: not a valid email address</span>");
        }
        else {
            $("#alternateEmailLabel-" + k).css("color", "#000");
            $("#loginSubmit_alternateEmail-" + k).css("border-color", "#000");
            $("#alternateEmailAlert-" + k).empty();
        }
    }

    function irisnoteQuestion() {
        $('#dialogIrisnoteQuestion').dialog('open');
    }

    function controlledVocabularyQuestion() {
        $('#dialogControlledVocabularyQuestion').dialog('open');
    }

    function templatesQuestion() {
        $('#dialogTemplatesQuestion').dialog('open');
    }

    function collaborationQuestion() {
        $('#dialogCollaborationQuestion').dialog('open');
    }

    $(document).ready(function () {
        $(".moduleWidgetInnerTable tr:odd").css("background-color", "#CCC");
    });
</script>

<div id="userUpdateForm">
    <div class="registerWrapperAdmin">
        <h2>Edit User</h2>

        <form id="updateAdminForm" name="updateAdminForm" action="/irisnote/User_update.action"
              method="post">
            <div id="createUserFormLeft">
                <div class="createUserField"><label for="loginSubmit_userName" class="createUserLabel">Login
                    Name: </label>
                    <input type="text" name="userName" value="${user.username}"
                           id="loginSubmit_userName" class="createUserWidget">
                </div>

                <div class="createUserField"><label for="loginSubmit_password"
                                                    class="createUserLabel">Password: </label>
                    <input type="password" name="password" value=""
                           id="loginSubmit_password" class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_firstName" class="createUserLabel">First
                    Name: </label>
                    <input type="text" name="firstName" value="${user.firstName}"
                           id="loginSubmit_firstName" class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_lastName" class="createUserLabel">Last
                    Name: </label>
                    <input type="text" name="lastName" value="${user.lastName}"
                           id="loginSubmit_lastName" class="createUserWidget"></div>

                <div><input type="hidden" name="signingPassword" value=""
                            id="loginSubmit_signingPassword"></div>

                <div class="createUserField"><label for="loginSubmit_signatureImage" class="createUserLabel"
                                                    id="signatureImageLabel">Digital Signature
                    Image: </label>
                    <input type="file" name="signatureImage" value=""
                           id="loginSubmit_signatureImage"></div>

                <div class="createUserField" id="loginSubmit_email">
                    <label for="loginSubmit_primaryEmail" class="createUserLabel" id="primaryEmailLabel">Primary
                        Email: </label> <input type="text" name="email" value="${user.primaryEmail}"
                                               id="loginSubmit_primaryEmail" onchange="checkPrimaryEmail()"
                                               class="createUserWidget">

                    <div class="emailAlert" id="primaryEmailAlert"></div>
                </div>
                <div id="addEmailField" onmouseover="$('#addEmailField').css('cursor', 'pointer')"
                     onclick="addEmailField()">
                    + Add Email
                </div>

                <div class="createUserField"><label for="loginSubmit_title" class="createUserLabel" id="titleLabel">Job
                    Title: </label>
                    <input type="text" name="title" value="${user.title}" id="loginSubmit_title"
                           class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_orgUnit" class="createUserLabel" id="orgUnitLabel">Organization: </label>
                    <input type="text" name="orgUnit" value="${user.organizationalUnit}"
                           id="loginSubmit_orgUnit" class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_physicalAddress" class="createUserLabel"
                                                    id="physicalAddressLabel">Address
                    (physical): </label>
                    <input type="text" name="physicalAddress" value=""
                           id="loginSubmit_physicalAddress" class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_phone" class="createUserLabel" id="phoneLabel">Phone
                    Number: </label>
                    <input type="text" name="phone" value=""
                           id="loginSubmit_phone" class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_IMaddress" class="createUserLabel"
                                                    id="IMaddressLabel">IM Address: </label>
                    <input type="text" name="IMaddress"
                           id="loginSubmit_IMaddress" class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_twitter" class="createUserLabel" id="twitterLabel">Twitter
                    Page: </label>
                    <input type="text" name="twitter" id="loginSubmit_twitter" class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_facebook" class="createUserLabel"
                                                    id="facebookLabel">Facebook Page: </label>
                    <input type="text" name="facebook" id="loginSubmit_facebook" class="createUserWidget"></div>

                <div class="createUserField"><label for="loginSubmit_notes" class="createUserLabel" id="notesLabel">Notes: </label>
                    <textarea name="notes" value="${user.notes}"
                              id="loginSubmit_notes"></textarea></div>

                <div class="createUserField"><label for="loginSubmit_anonymous" class="createUserLabel"
                                                    id="anonymousLabel">Anonymous in Find Experts?: </label>
                    <input type="checkbox" name="anonymous" value=""
                           id="loginSubmit_anonymous" class="createUserWidget"></div>
                <div class="createUserField"><input type="button" value=" Create " name="registrationBtn"
                                                    style="float:right"
                                                    onclick="return updateAdminSubmit(document.updateAdminForm)">
                </div>
            </div>

        </form>

    </div>

</div>

<!--
<div id="sharedItems">
    <div class="sharedItem"><img src="" class="sharedItemIcon">Shared Notebooks</div>
    <div class="sharedItem"><img src="" class="sharedItemIcon">Shared Notebook Being Viewed</div>
    <div class="sharedItem"><img src="" class="sharedItemIcon">Shared Page</div>
    <div class="sharedItem"><img src="" class="sharedItemIcon">Shared Page</div>
    <div class="sharedItem"><img src="" class="sharedItemIcon">My Shared Groups</div>
    <div class="sharedItem"><img src="" class="sharedItemIcon">My Shared Groups</div>
</div>
-->
<br/>
<div class="moduleWidget">
    <table class="moduleWidgetHeaders">
        <tr>
            <th class="cloudEdition">irisnote Cloud Edition</th>
            <th class="Standard">Standard</th>
            <th class="Premium">Premium</th>
            <th class="Purchase">Purchase</th>
        </tr>
    </table>
    <div class="moduleWidgetInnerTable">
        <table class="moduleWidgetInnerTable">
            <tr>
                <td class="cloudEdition">
                    irisnote <span class="questionMark" id="irisnoteQuestion" onclick="irisnoteQuestion()">?</span>
                </td>
                <td class="Standard">
                    Installed
                </td>
                <td class="Premium">
                    $9.99
                </td>
                <td class="Purchase">
                    <input type="button" value="Purchase">
                </td>
            </tr>
            <tr>
                <td class="cloudEdition">
                    Controlled Vocabulary <span class="questionMark" id="controlledVocabularyQuestion"
                                                onclick="controlledVocabularyQuestion()">?</span>
                </td>
                <td class="Standard">
                    Not installed
                </td>
                <td class="Premium">
                    $29.99
                </td>
                <td class="Purchase">
                    <input type="button" value="Purchase">
                </td>
            </tr>
            <tr>
                <td class="cloudEdition">
                    Templates <span class="questionMark" id="templatesQuestion" onclick="templatesQuestion()">?</span>
                </td>
                <td class="Standard">
                    Installed
                </td>
                <td class="Premium">
                    $15.99
                </td>
                <td class="Purchase">
                    <input type="button" value="Purchase">
                </td>
            </tr>
            <tr>
                <td class="cloudEdition">
                    Collaboration <span class="questionMark" id="collaborationQuestion"
                                        onclick="collaborationQuestion()">?</span>
                </td>
                <td class="Standard">
                    Installed
                </td>
                <td class="Premium">
                    $9.99
                </td>
                <td class="Purchase">
                    <input type="button" value="Purchase">
                </td>
            </tr>
            <tr>
                <td class="cloudEdition">

                </td>
                <td class="Standard">

                </td>
                <td class="Premium">

                </td>
                <td class="Purchase">

                </td>
            </tr>
            <tr>
                <td class="cloudEdition">

                </td>
                <td class="Standard">

                </td>
                <td class="Premium">

                </td>
                <td class="Purchase">

                </td>
            </tr>
            <tr>
                <td class="cloudEdition">

                </td>
                <td class="Standard">

                </td>
                <td class="Premium">

                </td>
                <td class="Purchase">

                </td>
            </tr>
            <tr>
                <td class="cloudEdition">

                </td>
                <td class="Standard">

                </td>
                <td class="Premium">

                </td>
                <td class="Purchase">

                </td>
            </tr>
        </table>
    </div>
</div>