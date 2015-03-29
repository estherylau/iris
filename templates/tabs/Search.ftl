<script>
    /* for Search.ftl */
    function getSearchResults() {
        $("#searchResults").slideDown("fast");
    }
</script>

<div class="containerContents">
    <div id="searchTab">
        <h3>quick search</h3>

        <form>
            I am looking for:
            <input type="text" name="searchBox" id="searchBox">
            <input type="button" value="search" id="searchButton" onclick="getSearchResults()">
        </form>
        <div id="searchResults">
            <h3>search results</h3>

            <p class="resultTitle"><a href="#">Search Result #1</a></p>

            <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex
                ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt
                mollit anim id est laborum.
            </p>

            <p class="resultTitle"><a href="#">Search Result #2</a></p>

            <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex
                ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt
                mollit anim id est laborum.
            </p>

            <p class="resultTitle"><a href="#">Search Result #3</a></p>

            <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex
                ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt
                mollit anim id est laborum.
            </p>

            <p class="resultTitle"><a href="#">Search Result #4</a></p>

            <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                ex
                ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt
                mollit anim id est laborum.
            </p>
        </div>
        <h3>saved searches</h3>

        <p class="resultTitle"><a href="#">biometric search #1</a></p>

        <p class="resultTitle"><a href="#">gene sequence #2</a></p>

        <p class="resultTitle"><a href="#">some other search #3</a></p>
    </div>
</div>