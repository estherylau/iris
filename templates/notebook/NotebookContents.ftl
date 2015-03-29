<div id="notebookContents" class="notebookContents">
    <h1><span><img src="/irisnote/static/images/icons/icon-notebook-32x32.png"
                   alt="notebook icon"></span>${container.name}</h1>
<#list containerMetadataObject.children as child>
    <#assign resource = resourceMap.get(child.id) >
    <div id="resourceContainer" class="resourceContainer resourceContainer${resource.id?c}">
        <#if resource.contentType.fileExtension = "inpx">
            <div id="pageContainer" class="pageContainer">
                <h2><span><img src="/irisnote/static/images/icons/icon-notebook-page-24x24.png"
                               alt="notebook page icon"></span>${resource.name}</h2>
                <#list child.children as grandchild>
                    <#assign childResource = resourceMap.get(grandchild.id)>
                    <#if childResource.contentType.fileExtension = "html">
                        <div class="notebookEntry">
                            <div class="iconEntryInfo"><img src="/irisnote/static/images/icons/icon-entry-info.png"
                                                            alt="${contentMap.get(childResource.id)}" height="16"
                                                            width="16"></div>
                            <div class="entryHTML">
                                <form name="textEntry" id="notebookTextForm-${childResource.id?c}">
                                    <textarea name="body" id="body" cols="100"
                                              rows="16">${contentMap.get(childResource.id)}</textarea>
                                    <input type="hidden" name="resourceId" value="${childResource.id?c}"/>
                                    <br><input type="button" name="save" value="save"
                                               onclick="return textEditorSubmit('#notebookTextForm-${childResource.id?c}')"/>
                                </form>
                            </div>
                        </div>
                        <!-- closes notebook entry -->

                    <#elseif childResource.name?ends_with("jpg")>
                        <div class="notebookEntry">
                            <div class="iconEntryInfo"><img src="/irisnote/static/images/icons/icon-entry-info.png"
                                                            alt="${contentMap.get(childResource.id)}" height="16"
                                                            width="16"></div>
                            <div class="entryOther">
                                <a name="clickDblClick${childResource.id?c}"></a><img
                                    src="/irisnote/ResourceContent.action?resourceId=${childResource.id?c}"/>
                            </div>
                            <!-- closes entryOther -->
                        </div>
                        <!-- closes notebook entry -->
                    <#elseif childResource.name?ends_with("png")>
                        <div class="notebookEntry">
                            <div class="iconEntryInfo"><img src="/irisnote/static/images/icons/icon-entry-info.png"
                                                            alt="${contentMap.get(childResource.id)}" height="16"
                                                            width="16"></div>
                            <div class="entryOther">
                                <a name="clickDblClick${childResource.id?c}"></a><img
                                    src="/irisnote/ResourceContent.action?resourceId=${childResource.id?c}"/>
                            </div>
                            <!-- closes entryOther -->
                        </div>
                        <!-- closes notebook entry -->
                    <#else>
                        <hr>
                        <a name="clickDblClick${childResource.id?c}"></a><h4>${childResource.name}
                        Size: ${childResource.fileSize}</h4><br/>

                    </#if>
                </#list>
            </div>
        <#else>
            <h4> ${resource.name} Size: ${resource.fileSize}</h4> <br/>
            (In Root Level Of Notebook)
        </#if>
    </div>
</#list>
</div>
