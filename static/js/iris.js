$(document).ready(function () {
    $('#anim1').click(function () {

        $('.loginLayoutAnim').animate(
            {transform:'rotate(180deg) scale(0.01)'},

            {duration:500}
        );
        return false;
    });


    $('#anim2').click(function () {

        $('.loginLayoutAnim').animate(
            {transform:'rotate(180deg) scale(0.5)'},
            {duration:550}
        );

        return false;
    });

    $('#anim3').click(function () {

        $('.loginLayoutAnim').animate(
            {transform:'rotate(-180deg) scale(1)'},
            {duration:500}
        );

        return false;
    });

    $('#anim4').click(function () {

        $('.loginLayoutAnim').animate(
            {opacity:0.2},
            {duration:500}
        );

        return false;
    });

    $('#anim5').click(function () {

        $('.loginLayoutAnim').animate(
            {opacity:0},
            {duration:550}
        );

        return false;
    });
    $('#anim6').click(function () {

        $('.loginLayoutAnim').animate(
            {opacity:0.5},
            {duration:550}
        );

        return false;
    });
    $('#anim7').click(function () {

        $('.loginLayoutAnim').animate(
            {opacity:1},
            {duration:650}
        );

        return false;
    });
    $('#anim8').click(function () {

        $('.loginLayoutAnim').animate(
            {transform:'rotate(2160deg)'},
            {duration:3000}
        );

        return false;
    });
    $('#anim9').click(function () {

        $('.loginLayoutAnim').animate(
            {transform:'rotate(360deg) scale(0.01)'},

            {duration:500}
        );
        return false;
    });
    $('#anim10').click(function () {

        $('.loginLayoutAnim').animate(
            {transform:'rotate(360deg) scale(0.5)'},
            {duration:550}
        );

        return false;
    });
    $('#anim11').click(function () {

        $('.loginLayoutAnim').animate(
            {backgroundColor:'#f0f'},
            {duration:550}
        );

        return false;
    });
    $('#anim12').click(function () {

        $('.loginLayoutAnim').animate(
            {backgroundColor:'transparent'},
            {duration:550}
        );

        return false;
    });
    $('#anim13').click(function () {

        $('.loginLayoutAnim').animate(
            {backgroundColor:'#fff'},
            {duration:550}
        );

        return false;
    });
    $('#anim14').click(function () {

        $('.loginLayoutAnim').animate(
            {transform:'rotate(235deg) scale(1)'},
            {duration:500}
        );

        return false;
    });


    $('#loginSubmit').submit(function () {
        alert('submitting-1');
        $('#logo').animate({
            opacity:0,
            duration:1500
        });
        alert('submitting-2');

        setTimeout(function () {
            document.forms['loginSubmit'].submit();
        }, 10000);

        return true;
    });


    $('.leftContainer').animate({opacity:1}, 600);
    $('.rightContainer').animate({
            opacity:1}, 1050
    );


    setTimeout(function () {
        $('.leftContainerModule1').animate({
                opacity:1}, 500
        );
    }, 1000);


    setTimeout(function () {
        $('.leftContainerModule2').animate({
                opacity:1}, 500
        );
    }, 3000);

    setTimeout(function () {
        $('.leftContainerModule3').animate({
                opacity:1}, 500
        );
    }, 1000);


    setTimeout(function () {
        $('#moduleAnimLogo').css({display:'block'});

        $('#moduleAnimLogo').animate({opacity:1}, 2500);

        $('#moduleAnimLogo').animate({
            opacity:0,
        }, 100, function () {
            $('.moduleContent1').css({display:'block'});
            $('.moduleContent1').animate({opacity:1}, 500);
            $('.rightContainerModule1').animate({opacity:1}, 500);
        });
    }, 1000);

    /*
     $("#block").animate({
     width: "70%",
     opacity: 0.4,
     marginLeft: "0.6in",
     fontSize: "3em",
     borderWidth: "10px"
     }, 1500 );


     */




});//closes doc.ready


function complexAnim1() {
    $('.loginLayoutAnim').animate(
        {transform:'rotate(-360deg) scale(0.01)'},
        {duration:500}
    );
    $('.loginLayoutAnim').animate(
        {opacity:0},
        {duration:50}
    );
    $('.loginLayoutAnim').animate(
        {transform:'scale(1)'},
        {duration:50}
    );
    $('.loginLayoutAnim').animate(
        {opacity:1},
        {duration:500}
    );
    setTimeout(complexAnim1, 200);
}

function complexAnim2() {
    $('.loginLayoutAnim').animate(
        {transform:'scale(0.01)'},
        {duration:1}
    );
    $('.loginLayoutAnim').animate(
        {opacity:1},
        {duration:50}
    );
    $('.loginLayoutAnim').animate(
        {transform:'scale(1) rotate(120deg)'},
        //combining these 2 transforms (when scale goes up) messes with the math of rotation;
        {duration:500}
    );
    $('.loginLayoutAnim').animate(
        {opacity:0},
        {duration:500}
    );
    setTimeout(complexAnim2, 200);
}

function complexAnim3() {
    $('.loginLayoutAnim').animate(
        {transform:'rotate(-360deg) scale(0.65)'},
        {duration:500}
    );

    $('.loginLayoutAnim').animate(
        {transform:'rotate(360deg) scale(0.35)'},
        {duration:500}
    );
    //setTimeout(complexAnim3, 200);
}
function complexAnim4() {
    $('.loginLayoutAnim').animate(
        {transform:'scale(0)'},
        {duration:1}
    );
    $('.loginLayoutAnim').animate(
        {transform:'rotate(-360deg) scale(2)'},
        {duration:500}
    );
    $('.loginLayoutAnim').animate(
        {opacity:0},
        {duration:500}
    );
    $('.loginLayoutAnim').animate(
        {transform:'scale(0)'},
        {duration:5}
    );
    $('.loginLayoutAnim').animate(
        {opacity:1},
        {duration:5}
    );
    setTimeout(complexAnim4, 200);
}

function complexAnim4a() {
    $('.loginLayoutAnim').animate({
        opacity:0
    }, 2000, function () {
        alert('XHRcheck');
    });
    $('.loginLayoutAnim').animate({
        opacity:1
    }, 2);
    setTimeout(complexAnim4a, 200);
}

function complexAnim5() {
    $('.loginLayoutAnim').animate(
        {transform:'translateX(300px) scale(0)'},
        {duration:500}
    );
}


function fadeDisabled() {
}
function fadeEnabled() {
}
function sendData() {
}
function receiveData() {
}
function bgColorProcessing() {
}


function loginAnim1() {

}


/* from singup.jsp */

function loginSubmit(form) {
    //alert('submitting-1');
    //var sendData = function(){
    //alert('submitting');
    $('.loginLayoutAnimA').animate(
        {top:'-150px'}, 1
    );
    $('#logo').animate(
        {top:'-350px'}, 1
    );
    $('.loginLayoutAnimA').animate(
        {opacity:.75}, 10
    );
    $('#logo').animate(
        {opacity:0.9}, 1
    );
    $('#logo').animate(
        {transform:'rotate(240deg) scale(0)'},
        {duration:750}
    );
    $('#logo').animate(
        {opacity:0}, 1
    );
    $('#logo').animate(
        {transform:'scale(1)'},
        {duration:1}
    );
    $('#logo').animate(
        {opacity:0.9}, 1
    );
    $('#logo').animate(
        {transform:'rotate(240deg) scale(0)'},
        {duration:750}
    );
    //} //closes var sendData
    //alert('submitting-2');

    setTimeout(function () {
        document.forms['loginForm'].submit();
    }, 2050);

    return true;

    /*

     var app =
     {
     echo: function(txt)
     {
     alert(txt);
     },

     start: function(func)
     {
     var method = this[func];
     var args = [];
     for (var i = 1; i < arguments.length; i++)
     args.push(arguments[i]);

     method.apply(this, args);
     }
     };

     */


    /*
     document.forms['signUp'].action='https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8';
     document.forms['signUp'].target='frame_result1';
     document.forms['signUp'].submit();

     setTimeout(function(){
     //alert('submitting to us');
     document.forms['signUp'].action='submitSignup.jsp';
     document.forms['signUp'].target='_top';
     document.forms['signUp'].submit();
     },1000);

     //alert('all submitted');
     //setTimeout(function(){},3000);
     */

    //return true;
}


function checkOutSubmit(form) {
    $('.rightContainerModule1').animate({
            opacity:0}, 250
    );
    $('.rightContainerModule2').animate({
            opacity:0}, 550
    );
    $('.rightContainerModule3').animate({
            opacity:0}, 950
    );

    setTimeout(function () {
        $('.rightContainerModule4').animate({
                opacity:1}, 2050
        );
    }, 350);


    //alert('submitting-1');
    //var sendData = function(){
    //alert('submitting');

    //}
    //alert('submitting-2');
    /*
     setTimeout(function(){
     document.forms['loginForm'].submit();
     },2050);
     */
    return false;
}


/* from register.ftl */
function registrationSubmit(form) {
    setTimeout(function () {
        document.forms['registrationForm'].submit();
    }, 0);
    return true;
}

/* for tabs/admin.ftl */
function registrationAdminSubmit(form) {
    //alert('this is an alert');
    $.post('User_create.action', $("#registrationAdminForm").serialize(), function (data) {
        //alert('this is the data: ' + data);
        $("#SimpleUserlist").empty().append(data);
        //alert('data has been written');
    });
    //alert('post finished');
    //$("#userCreateForm").toggle(function () {
    //});
    return true;
}

function groupAdminSubmit(form) {
    $.post('Group_create.action', $("#groupAdminForm").serialize(), function (data) {
        $("#SimpleGrouplist").empty().append(data);
    });
    return true;
}

function updateAdminSubmit(form) {
    $.post('User_update.action', $("#updateAdminForm").serialize(), function (data) {
        $("#SimpleUserlist").empty().append(data);
    });
    return true;
}

/* for notebook/NotebookContents.ftl */
function textEditorSubmit(form) {
    //$.post('Resource_saveTextEntry.action', $(form).serialize());

    alert('posting edit and ' + form);
    $.post('Resource_saveTextEntry.action', $(form).serialize(), function (data) {
        //$("#documentList").empty().append(data);
    });


}

function resizeContent() {
    var viewPortHeight = window.innerHeight;
    alert(viewPortHeight);
    //contentDiv.style.height = Math.max(viewportHeight, contentDiv.clientHeight) + 'px':
}

// Check the width of the right Container UL Tab, adjust width
function rightContainerWidthAutoAdjust() {
    rightContainerWidth = $('#tabsContent ul').width();
    $('.rightContainerIcons').width(rightContainerWidth);
}