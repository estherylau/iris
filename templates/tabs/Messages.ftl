<section class="message">
    <nav class="breadcrumb">
        <a href="#">Home </a>
        <a href="#"> > messages and calendar</a>
    </nav>

    <section id="messagesLeft">
        <h1>message</h1>
        <button type="button" id="buttonCreateNewMessage">new message</button>
        <!-- right panel, message tab, received & sent message tab -->
        <div id="tabsReceivedSentMessage">
            <ul>
                <li><a href="#tab-MessageReceived">received messages</a></li>
                <li><a href="#tab-MessageSent">sent messages</a></li>
                <li><a href="#tab-MessageArchived">archived messages</a></li>
            </ul>
            <!-- tab message wrapper to store received & sent messages -->
            <div id="tabMessageWrapper">
                <div id="tab-MessageReceived">
                </div>
                <div id="tab-MessageSent">

                </div>
                <div id="tab-MessageArchived">

                </div>
            </div>
            <!-- End of messageScroll -->
        </div>
        <!-- End of tabsReceivedSentMessage -->
        <script>
            function messageReload() {
                $.get("Message_getSentMessages.action", function (data) {
                    $('#tab-MessageSent').empty().append(data);
                });
                $.get("Message_getReceivedMessages.action", function (data) {
                    $('#tab-MessageReceived').empty().append(data);
                });

                $.get("ArchivedMessages.action", function (data) {
                    $('#tab-MessageArchived').empty().append(data);
                });

            }
            messageReload();
            setInterval(messageReload, 5000);
        </script>

    </section>

    <section id="messagesRight">
        <div id="calendar"><h1>calendar</h1></div>
        <section class="task">
            <div>
                <h2>today</h2>

                <p class="task-list"><a href="#">executive demo</a></p>
            </div>
            <div>
                <h2>tomorrow</h2>

                <p class="task-list"><a href="#">compliance meeting</a></p>

                <p class="task-list"><a href="#">experiment X is due</a></p>
            </div>
            <div>
                <h2>Friday, Auguest 17</h2>

                <p class="task-list"><a href="#">vacation day</a></p>
            </div>
            <div>
                <h2>Monday, Auguest 20</h2>

                <p class="task-list"><a href="#">back to the grindstone</a></p>

                <p class="task-list"><a href="#">experiment Z is due</a></p>
            </div>
        </section>
    </section>
</section>
