<ul id="documentListUL">
<#list containerList as container>
    <#if container.containerType=="NOTEBOOK">
    <li>
    <img src="/irisnote/static/images/misc/closedContainer.gif" class="notebookImageToggle${container.id?c} containerArrow"/>
    <span class="notebookRightClick${container.id?c}">
        <img src="/irisnote/static/images/icons/icon-notebook-24x24.png" class="iconNotebook">
        <a class="clickDblClick${container.id?c}">notebook- ${container.id?c}: ${container.name}</a>
    </span>
    <!-- begin expand/collapse notebook page -->
    <script>
        $(document).ready(function () {
            $('.notebookPageListToggle${container.id?c}').hide();
            $('.notebookImageToggle${container.id?c}').click(function () {
                if ($('.notebookPageListToggle${container.id?c} > .notebookPageList').length == 0) {
                    // Arrow will not animate since container is missing notebookPageList div
                }
                else {
                    // Rotate arrow on notebook arrow select
                    if ($('.notebookPageListToggle${container.id?c}').is(':hidden')) {
                        $('.notebookImageToggle${container.id?c}').animate({'transform':'rotate(90deg)'}, 150, 'linear');
                        $('.notebookPageListToggle${container.id?c}').slideDown('slow');
                    }
                    else {
                        $('.notebookImageToggle${container.id?c}').animate({'transform':'rotate(0deg)'}, 150, 'linear');
                        $('.notebookPageListToggle${container.id?c}').slideUp('slow');
                    }
                }
            });
        });
    </script>
    <!-- end expand/collapse notebook page -->
    <div class="notebookPageListToggle${container.id?c}">
        <#assign containerMetadataObject=containerMetadataMap.get(container.id)>
        <#list containerMetadataObject.children as child>
        <ul class="notebookPageList">
            <li>
                <#assign resource = resourceMap.get(child.id) >
                <#if resource.contentType.fileExtension = "inpx">
                    <img src="/irisnote/static/images/misc/closedContainer.gif" class="notebookPageListImageToggle${resource.id?c} containerArrow"/>
                    <span class="pageRightClick${resource.id?c}">
                        <img src="/irisnote/static/images/icons/icon-notebook-page-16x16.png">
                        <a class="clickDblClick${resource.id?c}">page- ${resource.id?c}: ${resource.name}</a>
                    </span>
                    <!-- begin expand/collapse page entry -->
                    <script>
                        $(document).ready(function () {
                            $('.pageEntryListToggle${resource.id?c}').hide();
                            $('.notebookPageListImageToggle${resource.id?c}').click(function () {
                                if ($('.pageEntryListToggle${resource.id?c} > .pageEntryList').length == 0) {
                                    // Arrow will not animate since container is missing pageEntryList div
                                }
                                else {
                                    // Rotate arrow on page arrow select
                                    if ($('.pageEntryListToggle${resource.id?c}').is(':hidden')) {
                                        $('.notebookPageListImageToggle${resource.id?c}').animate({'transform':'rotate(90deg)'}, 150, 'linear');
                                        $('.pageEntryListToggle${resource.id?c}').slideDown('slow');
                                    }
                                    else {
                                        $('.notebookPageListImageToggle${resource.id?c}').animate({'transform':'rotate(0deg)'}, 150, 'linear');
                                        $('.pageEntryListToggle${resource.id?c}').slideUp('slow');
                                    }
                                }
                            });
                        });
                    </script>
                    <!-- end expand/collapse page entry -->

                    <div class="pageEntryListToggle${resource.id?c}">
                        <#list child.children as grandchild>
                            <ul class="pageEntryList">
                                <#assign childResource = resourceMap.get(grandchild.id)>
                                <li>
                                    <span class="entryRightClick${childResource.id?c}"><a class="clickDblClick${childResource.id?c}">entry- ${childResource.id?c}
                                        : ${childResource.name} Size: ${childResource.fileSize}</a></span>
                                </li>

                            </ul>

                            <!-- begin right context menus for entries -->
                            <script>
                                $(document).ready(function () {
                                    // initialize the right click menus
                                    $.contextMenu({
                                        selector:'.entryRightClick${childResource.id?c}',
                                        // global callback required to function; overridden on each item in menu
                                        callback:function (key, options) {
                                            var m = "function not available: " + key;
                                            //alert(m);
                                        },
                                        items:{
                                            "addFile":{
                                                name:"Add File",
                                                icon:"number2",
                                                callback:function (key, options) {
                                                    $('#dialogAddFile').dialog('open');

                                                    /*
                                                    $.post('Resource_create.action?containerId=${container.id?c}&parentResourceId=${resource.id?c}', function (data) {
                                    //alert('this is the data: '+data);
                                    //$("#navInfo").empty().append(data);
                                });
                                  */

                                                    //alert('this is the containerId: ${container.id?c}');
                                                    $('#dialogAddFile').dialog('open');
                                                    // set which container file gets added to
                                                    $('#containerId').remove();
                                                    $('#parentResourceId').remove();
                                                    $('#formAddFile').append('<input type="hidden" value="${container.id?c}" id="containerId" name="containerId">');
                                                    $('#formAddFile').append('<input type="hidden" value="${resource.id?c}" id="parentResourceId" name="parentResourceId">');
                                                }
                                            },
                                            "addTextEntry":{
                                                name:"Add Text Entry",
                                                icon:"number2",
                                                callback:function (key, options) {
                                                    $.post('Resource_createNotebookEntry.action?containerId=${container.id?c}&parentResourceId=${resource.id?c}', function (data) {
                                                        //alert('this is the data: ' + data);
                                                        $("#documentList").empty().append(data);
                                                        //$("#navInfo").empty().append(data);
                                                    });
                                                }
                                            },
                                            "delete":{
                                                name:"Delete",
                                                icon:"delete",
                                                callback:function (key, options) {

                                                }
                                            },
                                            "addBookmark":{
                                                name:"Add Bookmark",
                                                icon:"add bookmark",
                                                callback:function (key, options) {
                                                    //alert('add bookmark');
                                                }
                                            }
                                        } //closes items
                                    });
                                });
                            </script>
                            <!-- end right context menus for entries --><!-- begin single and double clicks set up for entries -->
                            <script>
                                var DELAY = 300, clicks = 0, timer = null;
                                $(document).ready(function () {
                                    $("a.clickDblClick${childResource.id?c}").on("click", function (e) {
                                        clicks++;  //count clicks
                                        if (clicks === 1) {
                                            timer = setTimeout(function () {
                                                //alert("Single Click on Entry ${childResource.id?c}");  //perform single-click action on a Page

                                                // remove css class from page lists and notebook lists, add css class to entry list
                                                $('#documentListUL > li > span > a').removeClass('containerNotebook');
                                                $('.notebookPageList > li > span > a').removeClass('containerPage');
                                                $('.pageEntryList > li > span > a').removeClass('containerEntry');
                                                $('.entryRightClick${childResource.id?c} > a').addClass('containerEntry');

                                                clicks = 0;             //after action performed, reset counter
                                            }, DELAY);
                                        } else {
                                            clearTimeout(timer);    //prevent single-click action
                                            //alert("Double Click on ${childResource.id?c}");
                                            //perform double-click action

                                            $('#changeable-contents-tab').empty().append('${container.name}');
                                            $('#tabsContent').tabs('select', 1);
                                            $.get('Container_getContainerMetadata.action?containerId=${container.id?c}', function (data) {
                                                //alert('this is the data: '+data);
                                                $("#tab-contents").empty().append(data);
                                            });

                                            clicks = 0;             //after action performed, reset counter
                                        }
                                    })
                                            .on("dblclick", function (e) {
                                                e.preventDefault();  //cancel system double-click event
                                            });

                                });
                            </script>
                            <!-- end single and double clicks set up for entries -->



                        </#list><!-- closes child.children as grandchild - pageEntryList -->
                    </div>
                    <!-- end of pageEntryListToggle${resource.id?c} -->
                <#else>
                    <span> ${resource.name} Size: ${resource.fileSize}</span>
                </#if>
            </li>
        </ul>
        <!-- begin right context menus for pages -->
        <script>
            $(document).ready(function () {
                // initialize the right click menus
                $.contextMenu({
                    selector:'.pageRightClick${resource.id?c}',
                    // global callback required to function; overridden on each item in menu
                    callback:function (key, options) {
                        var m = "function not available: " + key;
                        //alert(m);
                    },
                    items:{
                        "addFile":{
                            name:"Add File",
                            icon:"number2",
                            callback:function (key, options) {
                                $('#dialogAddFile').dialog('open');

                                /*
                                $.post('Resource_create.action?containerId=${container.id?c}&parentResourceId=${resource.id?c}', function (data) {
                                    //alert('this is the data: '+data);
                                    //$("#navInfo").empty().append(data);
                                });
                                  */

                                //alert('this is the containerId: ${container.id?c}');
                                $('#dialogAddFile').dialog('open');
                                // set which container file gets added to
                                $('#containerId').remove();
                                $('#parentResourceId').remove();
                                $('#formAddFile').append('<input type="hidden" value="${container.id?c}" id="containerId" name="containerId">');
                                $('#formAddFile').append('<input type="hidden" value="${resource.id?c}" id="parentResourceId" name="parentResourceId">');
                            }
                        },
                        "addTextEntry":{
                            name:"Add Text Entry",
                            icon:"number2",
                            callback:function (key, options) {
                                $.post('Resource_createNotebookEntry.action?containerId=${container.id?c}&parentResourceId=${resource.id?c}', function (data) {
                                    //alert('this is the data: ' + data);
                                    $("#documentList").empty().append(data);
                                    //$("#navInfo").empty().append(data);
                                });
                            }
                        },
                        "delete":{
                            name:"Delete",
                            icon:"delete",
                            callback:function (key, options) {

                            }
                        },
                        "addBookmark":{
                            name:"Add Bookmark",
                            icon:"add bookmark",
                            callback:function (key, options) {
                                //alert('add bookmark');
                            }
                        }
                    } //closes items
                });
            });
        </script>
        <!-- end right context menus for pages --><!-- begin single and double clicks set up for pages -->
        <script>
            var DELAY = 300, clicks = 0, timer = null;
            $(document).ready(function () {
                $("a.clickDblClick${resource.id?c}").on("click", function (e) {
                    clicks++;  //count clicks
                    if (clicks === 1) {
                        timer = setTimeout(function () {
                            //alert("Single Click on Page ${resource.id?c}");  //perform single-click action on a Page

                            // remove css class from entry lists and notebook lists, add css class to page list
                            $('.pageEntryList > li > span > a').removeClass('containerEntry');
                            $('#documentListUL > li > span > a').removeClass('containerNotebook');
                            $('.notebookPageList > li > span > a').removeClass('containerPage');
                            $('.pageRightClick${resource.id?c} > a').addClass('containerPage');

                            clicks = 0;             //after action performed, reset counter
                        }, DELAY);
                    } else {
                        clearTimeout(timer);    //prevent single-click action
                        //alert("Double Click on ${resource.id?c}");
                        //perform double-click action

                        $('#changeable-contents-tab').empty().append('${container.name}');
                        $('#tabsContent').tabs('select', 1);
                        $.get('Container_getContainerMetadata.action?containerId=${container.id?c}', function (data) {
                            //alert('this is the data: '+data);
                            $("#tab-contents").empty().append(data);
                        });

                        clicks = 0;             //after action performed, reset counter
                    }
                })
                        .on("dblclick", function (e) {
                            e.preventDefault();  //cancel system double-click event
                        });

            });
        </script>
        <!-- end single and double clicks set up for pages -->
        </#list><!-- closes containerMetadataObject.children as child - notebookPageList -->
    </div>
    </li>
    <!-- begin right context menus for notebooks -->
    <script>
        $(document).ready(function () {
            // initialize the right click menus
            $.contextMenu({
                selector:'.notebookRightClick${container.id?c}',
                // global callback required to function; overridden on each item in menu
                callback:function (key, options) {
                    var m = "function not available: " + key;
                    //alert(m);
                },
                items:{
                    "view":{
                        name:"View",
                        icon:"view",
                        callback:function (key, options) {
                            //alert('view');
                        }
                    },
                    "addPage":{
                        name:"Add Page",
                        icon:"add page",
                        callback:function (key, options) {
                            //alert('this is the containerId: ${container.id?c}');
                            $('#dialogAddPage').dialog('open');
                            // set which container file gets added to
                            $('#pageContainerId').remove();
                            $('#formAddPage').append('<input type="hidden" value="${container.id?c}" id="pageContainerId" name="containerId">');
                        }
                    },
                    "addBookmark":{
                        name:"Add Bookmark",
                        icon:"add bookmark",
                        callback:function (key, options) {
                            //alert('add bookmark');
                        }
                    },
                    "edit":{
                        name:"Edit",
                        icon:"edit",
                        callback:function (key, options) {
                            //alert('edit');
                        }
                    },
                    "delete":{
                        name:"Delete",
                        icon:"delete",
                        callback:function (key, options) {
                            //alert('notebook');
                        }
                    },
                    "printToPDF":{
                        name:"Print to PDF",
                        icon:"printToPDF",
                        callback:function (key, options) {
                            //alert('printToPDF');
                        }
                    },
                    "tools":{
                        name:"Tools",
                        icon:"Tools"
                    },
                    "digitalSigning":{
                        name:"{digital signing}",
                        icon:"{digital signing}"
                    },
                    "showLinks":{
                        name:"Show Links",
                        icon:"show links"
                    },
                    "sendNotification":{
                        name:"Send Notification",
                        icon:"send notification"
                    },
                    "hideCollection":{
                        name:"Hide Collection",
                        icon:"hide collection"
                    },
                    "share":{
                        name:"Share Item",
                        icon:"shareItem",
                        callback:function (key, options) {
                            //alert('this is the containerId: ${container.id?c}');
                            $('#dialogShare').dialog('open');
                            // set which container file gets added to
                            $('#containerIdForShare').remove();
                            $('#shareItemForm').append('<input type="hidden" value="${container.id?c}" id="containerIdForShare" name="containerIdForShare">');
                        }
                    }
                } //closes items
            });
        });
    </script>
    <!-- end right context menus for notebooks --><!-- begin single and double clicks set up for notebooks -->
    <script>
        var DELAY = 300, clicks = 0, timer = null;
        $(document).ready(function () {
            $("a.clickDblClick${container.id?c}").on("click", function (e) {
                clicks++;  //count clicks
                if (clicks === 1) {
                    timer = setTimeout(function () {
                        //alert("Single Click on notebook ${container.id?c}");  //perform single-click action on a notebook

                        // remove css class from entry lists and page lists, add css class to notebook list
                        $('.pageEntryList > li > span > a').removeClass('containerEntry');
                        $('.notebookPageList > li > span > a').removeClass('containerPage');
                        $('#documentListUL > li > span > a').removeClass('containerNotebook');
                        $('.notebookRightClick${container.id?c} > a').addClass('containerNotebook');

                        clicks = 0;             //after action performed, reset counter
                    }, DELAY);
                } else {
                    clearTimeout(timer);    //prevent single-click action
                    //alert("Double Click on ${container.id?c}");
                    //perform double-click action
                    $('#changeable-contents-tab').empty().append('${container.name}');
                    $('#tabsContent').tabs('select', 1);
                    $.post('Container_getContainerMetadata.action?containerId=${container.id?c}', function (data) {
                        //alert('this is the data: '+data);
                        $("#tab-contents").empty().append(data);
                    });
                    rightContainerWidthAutoAdjust();  // auto adjust icons container below the right Container tabs
                    clicks = 0;             //after action performed, reset counter
                }
            })
                    .on("dblclick", function (e) {
                        e.preventDefault();  //cancel system double-click event
                    });

        });
    </script>
    <!-- end single and double clicks set up for notebooks -->





    <#else>
    <!-- closes if containerType==NOTEBOOK --><!-- opens if containerType==FOLDER -->
    <li>
        <span class="folderRightClick${container.id?c} folderListClick"><a class="folderClickDblClick${container.id?c}">folder- ${container.id?c}: ${container.name}</a></span>
        <#if resourceListMap.get(container.id)??>
            <#assign resourceList = resourceListMap.get(container.id)>
            <#if resourceList?size&gt;0>
                <#list resourceList as resource>
                    <#if resource??>
                        <ul class="folderList">
                            <li>
                            <#--
                            <#if resource.contentType.fileExtension = "inpx">
                                <span class="folderEntryRightClick${resource.id?c}"><a class="folderClickDblClick${resource.id?c}">page- ${resource.id?c}: ${resource.name}</a></span>

                                <#list child.children as grandchild>
                                    <ul class="pagefolderEntryList">
                                        <#assign childResource = resourceMap.get(grandchild.id)>
                                        <li>
                                            <span class="folderEntryRightClick${childResource.id?c}"><a class="clickDblClick${childResource.id?c}">folderEntry- ${childResource.id?c}: ${childResource.name} Size: ${childResource.fileSize}</a></span></li>
                                    </ul>
                                </#list>

                            <#else>
                                <span> ${resource.name} Size: ${resource.fileSize}</span> <br/>
                                (In Root Level Of folder)
                            </#if>
                            -->
                                <span> ${resource.name} Size: ${resource.fileSize}</span>
                            </li>
                        </ul>
                        <!-- begin right context menus for folders -->
                        <script>
                            $(document).ready(function () {
                                // initialize the right click menus
                                $.contextMenu({
                                    selector:'.folderEntryRightClick${resource.id?c}',
                                    // global callback required to function; overridden on each item in menu
                                    callback:function (key, options) {
                                        var m = "function not available: " + key;
                                        //alert(m);
                                    },
                                    items:{
                                        "addFile":{
                                            name:"Add File",
                                            icon:"number2",
                                            callback:function (key, options) {
                                                $('#dialogAddFile').dialog('open');

                                                /*
                                                $.post('Resource_create.action?containerId=${container.id?c}&parentResourceId=${resource.id?c}', function (data) {
                                    //alert('this is the data: '+data);
                                    //$("#navInfo").empty().append(data);
                                });
                                  */

                                                //alert('this is the containerId: ${container.id?c}');
                                                $('#dialogAddFile').dialog('open');
                                                // set which container file gets added to
                                                $('#containerId').remove();
                                                $('#formAddFile').append('<input type="hidden" value="${container.id?c}" id="containerId" name="containerId">');
                                                $('#formAddFile').append('<input type="hidden" value="${resource.id?c}" id="parentResourceId" name="parentResourceId">');
                                            }
                                        },
                                        "addBookmark":{
                                            name:"Add Bookmark",
                                            icon:"add bookmark",
                                            callback:function (key, options) {
                                                //alert('add bookmark');
                                            }
                                        }
                                    } //closes items
                                });
                            });
                        </script>
                        <!-- end right context menus for folders --><!-- begin single and double clicks set up for folders -->
                        <script>
                            var DELAY = 300, clicks = 0, timer = null;
                            $(document).ready(function () {
                                $("a.folderClickDblClick${resource.id?c}").on("click", function (e) {
                                    clicks++;  //count clicks
                                    if (clicks === 1) {
                                        timer = setTimeout(function () {
                                            alert("Single Click on ${resource.id?c}");  //perform single-click action

                                            // remove css class from entry lists and notebook lists, add css class to page list
                                            //$('.pageEntryList > li > span > a').removeClass('containerEntry');
                                            //$('#documentListUL > li > span > a').removeClass('containerNotebook');
                                            //$('.notebookPageList > li > span > a').removeClass('containerPage');
                                            //$('.folderListClick > a').removeClass('containerFolder');
                                            //$('.folderRightClick${resource.id?c} > a').addClass('containerFolder');

                                            clicks = 0;             //after action performed, reset counter
                                        }, DELAY);
                                    } else {
                                        clearTimeout(timer);    //prevent single-click action
                                        alert("Double Click on ${resource.id?c}");
                                        //perform double-click action
                                        /*
                                        $('#tabsContent').tabs('select', 1);
                                        $.post('Container_getContainerMetadata.action?containerId=${container.id?c}', function (data) {
                            //alert('this is the data: '+data);
                            $("#tab-contents").empty().append(data);
                        });
                        */
                                        clicks = 0;             //after action performed, reset counter
                                    }
                                })
                                        .on("dblclick", function (e) {
                                            e.preventDefault();  //cancel system double-click event
                                        });

                            });
                        </script>
                        <!-- end single and double clicks set up for folders -->
                    </#if>
                </#list><!-- closes containerMetadataObject.children as child - folderPageList -->

            </li>
            <!-- begin right context menus for folders -->
            <script>
                $(document).ready(function () {
                    // initialize the right click menus
                    $.contextMenu({
                        selector:'.folderRightClick${container.id?c}',
                        // global callback required to function; overridden on each item in menu
                        callback:function (key, options) {
                            var m = "function not available: " + key;
                            //alert(m);
                        },
                        items:{
                            "view":{
                                name:"View",
                                icon:"view",
                                callback:function (key, options) {
                                    //alert('view');
                                }
                            },
                            "addFile":{
                                name:"Add File",
                                icon:"number2",
                                callback:function (key, options) {
                                    $('#dialogAddFile').dialog('open');

                                    /*
                                    $.post('Resource_create.action?containerId=${container.id?c}&parentResourceId=${resource.id?c}', function (data) {
                                    //alert('this is the data: '+data);
                                    //$("#navInfo").empty().append(data);
                                });
                                  */

                                    //alert('this is the containerId: ${container.id?c}');
                                    $('#dialogAddFile').dialog('open');
                                    // set which container file gets added to
                                    $('#containerId').remove();
                                    $('#parentResourceId').remove();
                                    $('#formAddFile').append('<input type="hidden" value="${container.id?c}" id="containerId" name="containerId">');
                                    $('#formAddFile').append('<input type="hidden" value="${resource.id?c}" id="parentResourceId" name="parentResourceId">');
                                }
                            },
                            "addFolder":{
                                name:"Add Folder",
                                icon:"add folder",
                                callback:function (key, options) {
                                    //alert('this is the containerId: ${container.id?c}');
                                    $('#dialogCreateFolder').dialog('open');
                                    // set which container file gets added to
                                    //$('#pageContainerId').remove();
                                    //$('#formAddPage').append('<input type="hidden" value="${container.id?c}" id="pageContainerId" name="containerId">');
                                }
                            },
                            "delete":{
                                name:"Delete",
                                icon:"delete",
                                callback:function (key, options) {

                                }
                            },
                            "addBookmark":{
                                name:"Add Bookmark",
                                icon:"add bookmark",
                                callback:function (key, options) {
                                    //alert('add bookmark');
                                }
                            },
                            "sendNotification":{
                                name:"Send Notification",
                                icon:"send notification"
                            },
                            "share":{
                                name:"Share Item",
                                icon:"shareItem",
                                callback:function (key, options) {
                                    //alert('this is the containerId: ${container.id?c}');
                                    $('#dialogShare').dialog('open');
                                    // set which container file gets added to
                                    $('#containerIdForShare').remove();
                                    $('#shareItemForm').append('<input type="hidden" value="${container.id?c}" id="containerIdForShare" name="containerIdForShare">');
                                }
                            }
                        } //closes items
                    });
                });
            </script>
            <!-- end right context menus for folders --><!-- begin single and double clicks set up for folders -->
            <script>
                var DELAY = 300, clicks = 0, timer = null;
                $(document).ready(function () {
                    $("a.folderClickDblClick${container.id?c}").on("click", function (e) {
                        clicks++;  //count clicks
                        if (clicks === 1) {
                            timer = setTimeout(function () {
                                alert("Single Click on ${container.id?c}");  //perform single-click action

                                // remove css class from entry lists and notebook lists, add css class to page list
                                //$('.pageEntryList > li > span > a').removeClass('containerEntry');
                                //$('#documentListUL > li > span > a').removeClass('containerNotebook');
                                //$('.notebookPageList > li > span > a').removeClass('containerPage');
                                //$('.folderListClick > a').removeClass('containerFolder');
                                $('.folderRightClick${container.id?c} > a').addClass('containerFolder');
                                clicks = 0;             //after action performed, reset counter
                            }, DELAY);
                        } else {
                            clearTimeout(timer);    //prevent single-click action
                            //alert("Double Click on ${container.id?c}");
                            //perform double-click action
                            $('#changeable-contents-tab').empty().append('${container.name}');
                            $('#tabsContent').tabs('select', 1);
                            $.post('Container_getContainerMetadata.action?containerId=${container.id?c}', function (data) {
                                //alert('this is the data: '+data);
                                $("#tab-contents").empty().append(data);
                            });
                            clicks = 0;             //after action performed, reset counter
                        }
                    })
                            .on("dblclick", function (e) {
                                e.preventDefault();  //cancel system double-click event
                            });

                });
            </script>
            <!-- end single and double clicks set up for folders -->

            </#if>  </#if>
    </#if> <!-- closes if/else containerType==FOLDER -->
</#list><!-- closes containerList as container - documentListUL -->
</ul>


<div id="navInfo"></div>
