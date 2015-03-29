<p>this is ControlledDocuments.ftl</p>
<p>this is controlled documents</p>
<div class="rollBack">
    <img class="blueDot blueDot1" title="created by Esther Lau on 10/1/2012 at 10:00am"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="yellowDot yellowDot1" title="created by Esther Lau on 1/1/2012 at 3:00pm"
         src="/irisnote/static/images/misc/yellowDot.png"/>
    <img class="purpleDot purpleDot1" title="created by Esther Lau on 8/1/2012 at 12:00pm"
         src="/irisnote/static/images/misc/purpleDot.png"/>
    <img class="blueDot blueDot2" title="created by Esther Lau on 6/15/2012 at 8:00am"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="blueDot blueDot3" title="created by Esther Lau on 7/14/2012 at 2:00pm"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="blueDot blueDotTry" title="created by Esther Lau on 7/14/2012 at 2:00pm"
         src="/irisnote/static/images/misc/blueDot.png"/>
</div>

<div class="rollBack3">
    <img class="blueDotC blueDot1" title="created by Esther Lau on 10/1/2012 at 10:00am"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="yellowDotC yellowDot1" title="created by Esther Lau on 1/1/2012 at 3:00pm"
         src="/irisnote/static/images/misc/yellowDot.png"/>
    <img class="purpleDotC purpleDot1" title="created by Esther Lau on 8/1/2012 at 12:00pm"
         src="/irisnote/static/images/misc/purpleDot.png"/>
    <img class="blueDotC blueDot2" title="created by Esther Lau on 6/15/2012 at 8:00am"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="blueDotC blueDot3" title="created by Esther Lau on 7/14/2012 at 2:00pm"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="blueDotC blueDotTry" title="created by Esther Lau on 7/14/2012 at 2:00pm"
         src="/irisnote/static/images/misc/blueDot.png"/>
</div>

<div class="rollBack2">
    <img class="blueDotB blueDot1" title="created by Esther Lau on 10/1/2012 at 10:00am"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="yellowDotB yellowDot1" title="created by Esther Lau on 1/1/2012 at 3:00pm"
         src="/irisnote/static/images/misc/yellowDot.png"/>
    <img class="purpleDotB purpleDot1" title="created by Esther Lau on 8/1/2012 at 12:00pm"
         src="/irisnote/static/images/misc/purpleDot.png"/>
    <img class="blueDotB blueDot2" title="created by Esther Lau on 6/15/2012 at 8:00am"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="blueDotB blueDot3" title="created by Esther Lau on 7/14/2012 at 2:00pm"
         src="/irisnote/static/images/misc/blueDot.png"/>
    <img class="blueDotB blueDotTry" title="created by Esther Lau on 7/14/2012 at 2:00pm"
         src="/irisnote/static/images/misc/blueDot.png"/>
</div>

<script>
    $('.blueDot1').css('marginLeft', '20px');
    $('.yellowDot').css('marginLeft', '15px');
    $('.purpleDot1').css('marginLeft', '50px');
    $('.blueDot2').css('marginLeft', '10px');
    $('.blueDot3').css('marginLeft', '5px');
    /* working version
    $('.blueDotTry').css({marginLeft: function(index) {
        return index + 15;
    }
    });
    */
    $('.blueDot').each(function (index) {
        $(this).css({marginLeft:function (value) {
            return parseFloat(value) + 12;
        }
        });
    });
</script>