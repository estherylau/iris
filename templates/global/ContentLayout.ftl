<section Class="userBar">
    <img src="/irisnote/static/images/NewIrisLogos-07.1-ColorFinal-sml.png" alt="irisnote">

    <div class="irisnoteText">irisnote</div>
    <nav class="userBarNav">
        <ul>
            <li>bookmarks</li>
            <li><a href="Logout.action" id="logoutLink">logout</a></li>
        </ul>
    </nav>
</section>
<section class="mainWrapper">
    <section class="leftContainer">
        <div class="tabsBackgroundLeft"></div>
        <div id="tabsFile">
            <div class="leftContainerIcons">
                <img src="/irisnote/static/images/misc/notebookCreateFile.png" id="openDialogCreateNotebook"
                     class="ui-state-default ui-corner-all"
                     title="create notebook">
                <img src="/irisnote/static/images/misc/notebookCreateFolder.png" id="openDialogCreateFolder"
                     class="ui-state-default ui-corner-all"
                     title="create folder">
            </div>
            <ul id="tabsFileList">

                <li class="tabsFileButton"><a href="#tab-documents">documents</a></li>
                <li class="tabsFileButtonCurrent"><a href="#tab-localFiles">local files</a></li>
                <li class="tabsFileButton"><a href="#tab-checkedoutDocs">checked out documents</a></li>
                <li class="tabsFileButton"><a href="#tab-admin">admin</a></li>

            </ul>

            <div id="tab-documents">
            <#include "../tabs/Documents.ftl">
            </div>
            <div id="tab-localFiles">
            <#include "../tabs/LocalFiles.ftl">
            </div>
            <div id="tab-checkedoutDocs">
            <#include "../tabs/CheckedoutDocuments.ftl">
            </div>
            <div id="tab-admin">
            <#include "../tabs/Admin.ftl">
            </div>
        </div>
    </section>
    <section class="rightContainer">
        <div class="tabsBackgroundRight"></div>
        <div id="tabsContent">
            <div class="rightContainerIcons">
                <img src="/irisnote/static/images/misc/notebookCreateFile.png" id="openDialogCreateNotebook"
                     class="ui-state-default ui-corner-all"
                     title="create notebook">
            </div>
            <ul>
                <li><a href="#tab-home">home</a></li>
                <li><a id="changeable-contents-tab" href="#tab-contents">contents</a></li>
                <li><a href="#tab-controlledDocuments">controlled documents</a></li>
                <li><a href="#tab-formsData">forms and data</a></li>
                <li><a href="#tab-search">search</a></li>
                <li><a href="#tab-messages">messages</a></li>
            </ul>
            <div id="tab-home">
            <#include "../tabs/Home.ftl">
            </div>
            <div id="tab-contents">
            <#include "../tabs/Contents.ftl">
            </div>
            <div id="tab-controlledDocuments">
            <#include "../tabs/ControlledDocuments.ftl">
            </div>
            <div id="tab-formsData">
            <#include "../tabs/FormsData.ftl">
            </div>
            <div id="tab-search">
            <#include "../tabs/Search.ftl">
            </div>
            <div id="tab-messages">
            <#include "../tabs/Messages.ftl">
            </div>
        </div>
    </section>
    <div style="clear: both;"></div>
</section>
<#include "Dialogs.ftl">

<script>
    $(document).ready(function() {
        // change icon bars based on width of ui-tabs-nav
        $('.leftContainerIcons').click(function() {
            alert($('#tabsFile ul').width());
        });

        /*
        $('#createUserToggle').click(function() {
          //  alert($('#tabsContent ul').width());
            w = $('#tabsContent ul').width();
            $('.rightContainerIcons').width(w);
        });
        */

        //alert(w);
        // $('.leftContainerIcons').width(w);

        //$('.leftContainerIcons').click(function() {
        //    $('.leftContainerIcons').css('width', w);
        //});

        //   var x = $('#tabsContent > ul').width(500);
        //   $('.rightContainerIcons').width(x);

        /*
        $('.rightContainerIcons').click(function() {
            $('.rightContainerIcons').css('width', 500);
        });
        */

    });
</script>