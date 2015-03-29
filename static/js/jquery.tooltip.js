/*!
 * jQuery Tools v1.2.7 - The missing UI library for the Web
 * 
 * dateinput/dateinput.js
 * overlay/overlay.js
 * rangeinput/rangeinput.js
 * toolbox/toolbox.expose.js
 * toolbox/toolbox.flashembed.js
 * toolbox/toolbox.history.js
 * toolbox/toolbox.mousewheel.js
 * tooltip/tooltip.js
 * tooltip/tooltip.dynamic.js
 * tooltip/tooltip.slide.js
 * validator/validator.js
 * 
 * NO COPYRIGHTS OR LICENSES. DO WHAT YOU LIKE.
 * 
 * http://flowplayer.org/tools/
 * 
 * jquery.event.wheel.js - rev 1 
 * Copyright (c) 2008, Three Dub Media (http://threedubmedia.com)
 * Liscensed under the MIT License (MIT-LICENSE.txt)
 * http://www.opensource.org/licenses/mit-license.php
 * Created: 2008-07-01 | Updated: 2008-07-14
 * 
 * -----
 * 
 */
(function (a, b) {
    a.tools = a.tools || {version:"v1.2.7"};
    var c = [], d = {}, e, f = [75, 76, 38, 39, 74, 72, 40, 37], g = {};
    e = a.tools.dateinput = {conf:{format:"mm/dd/yy", formatter:"default", selectors:!1, yearRange:[-5, 5], lang:"en", offset:[0, 0], speed:0, firstDay:0, min:b, max:b, trigger:0, toggle:0, editable:0, css:{prefix:"cal", input:"date", root:0, head:0, title:0, prev:0, next:0, month:0, year:0, days:0, body:0, weeks:0, today:0, current:0, week:0, off:0, sunday:0, focus:0, disabled:0, trigger:0}}, addFormatter:function (a, b) {
        d[a] = b
    }, localize:function (b, c) {
        a.each(c, function (a, b) {
            c[a] = b.split(",")
        }), g[b] = c
    }}, e.localize("en", {months:"January,February,March,April,May,June,July,August,September,October,November,December", shortMonths:"Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec", days:"Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday", shortDays:"Sun,Mon,Tue,Wed,Thu,Fri,Sat"});
    function h(a, b) {
        return(new Date(a, b + 1, 0)).getDate()
    }

    function i(a, b) {
        a = "" + a, b = b || 2;
        while (a.length < b)a = "0" + a;
        return a
    }

    var j = a("<a/>");

    function k(a, b, c, e) {
        var f = b.getDate(), h = b.getDay(), k = b.getMonth(), l = b.getFullYear(), m = {d:f, dd:i(f), ddd:g[e].shortDays[h], dddd:g[e].days[h], m:k + 1, mm:i(k + 1), mmm:g[e].shortMonths[k], mmmm:g[e].months[k], yy:String(l).slice(2), yyyy:l}, n = d[a](c, b, m, e);
        return j.html(n).html()
    }

    e.addFormatter("default", function (a, b, c, d) {
        return a.replace(/d{1,4}|m{1,4}|yy(?:yy)?|"[^"]*"|'[^']*'/g, function (a) {
            return a in c ? c[a] : a
        })
    }), e.addFormatter("prefixed", function (a, b, c, d) {
        return a.replace(/%(d{1,4}|m{1,4}|yy(?:yy)?|"[^"]*"|'[^']*')/g, function (a, b) {
            return b in c ? c[b] : a
        })
    });
    function l(a) {
        return parseInt(a, 10)
    }

    function m(a, b) {
        return a.getFullYear() === b.getFullYear() && a.getMonth() == b.getMonth() && a.getDate() == b.getDate()
    }

    function n(a) {
        if (a !== b) {
            if (a.constructor == Date)return a;
            if (typeof a == "string") {
                var c = a.split("-");
                if (c.length == 3)return new Date(l(c[0]), l(c[1]) - 1, l(c[2]));
                if (!/^-?\d+$/.test(a))return;
                a = l(a)
            }
            var d = new Date;
            d.setDate(d.getDate() + a);
            return d
        }
    }

    function o(d, e) {
        var i = this, j = new Date, o = j.getFullYear(), p = e.css, q = g[e.lang], r = a("#" + p.root), s = r.find("#" + p.title), t, u, v, w, x, y, z = d.attr("data-value") || e.value || d.val(), A = d.attr("min") || e.min, B = d.attr("max") || e.max, C, D;
        A === 0 && (A = "0"), z = n(z) || j, A = n(A || new Date(o + e.yearRange[0], 1, 1)), B = n(B || new Date(o + e.yearRange[1] + 1, 1, -1));
        if (!q)throw"Dateinput: invalid language: " + e.lang;
        if (d.attr("type") == "date") {
            var D = d.clone(), E = D.wrap("<div/>").parent().html(), F = a(E.replace(/type/i, "type=text data-orig-type"));
            e.value && F.val(e.value), d.replaceWith(F), d = F
        }
        d.addClass(p.input);
        var G = d.add(i);
        if (!r.length) {
            r = a("<div><div><a/><div/><a/></div><div><div/><div/></div></div>").hide().css({position:"absolute"}).attr("id", p.root), r.children().eq(0).attr("id", p.head).end().eq(1).attr("id", p.body).children().eq(0).attr("id", p.days).end().eq(1).attr("id", p.weeks).end().end().end().find("a").eq(0).attr("id", p.prev).end().eq(1).attr("id", p.next), s = r.find("#" + p.head).find("div").attr("id", p.title);
            if (e.selectors) {
                var H = a("<select/>").attr("id", p.month), I = a("<select/>").attr("id", p.year);
                s.html(H.add(I))
            }
            var J = r.find("#" + p.days);
            for (var K = 0; K < 7; K++)J.append(a("<span/>").text(q.shortDays[(K + e.firstDay) % 7]));
            a("body").append(r)
        }
        e.trigger && (t = a("<a/>").attr("href", "#").addClass(p.trigger).click(function (a) {
            e.toggle ? i.toggle() : i.show();
            return a.preventDefault()
        }).insertAfter(d));
        var L = r.find("#" + p.weeks);
        I = r.find("#" + p.year), H = r.find("#" + p.month);
        function M(b, c, e) {
            z = b, w = b.getFullYear(), x = b.getMonth(), y = b.getDate(), e || (e = a.Event("api")), e.type == "click" && !a.browser.msie && d.focus(), e.type = "beforeChange", G.trigger(e, [b]);
            e.isDefaultPrevented() || (d.val(k(c.formatter, b, c.format, c.lang)), e.type = "change", G.trigger(e), d.data("date", b), i.hide(e))
        }

        function N(b) {
            b.type = "onShow", G.trigger(b), a(document).on("keydown.d", function (b) {
                if (b.ctrlKey)return!0;
                var c = b.keyCode;
                if (c == 8 || c == 46) {
                    d.val("");
                    return i.hide(b)
                }
                if (c == 27 || c == 9)return i.hide(b);
                if (a(f).index(c) >= 0) {
                    if (!C) {
                        i.show(b);
                        return b.preventDefault()
                    }
                    var e = a("#" + p.weeks + " a"), g = a("." + p.focus), h = e.index(g);
                    g.removeClass(p.focus);
                    if (c == 74 || c == 40)h += 7; else if (c == 75 || c == 38)h -= 7; else if (c == 76 || c == 39)h += 1; else if (c == 72 || c == 37)h -= 1;
                    h > 41 ? (i.addMonth(), g = a("#" + p.weeks + " a:eq(" + (h - 42) + ")")) : h < 0 ? (i.addMonth(-1), g = a("#" + p.weeks + " a:eq(" + (h + 42) + ")")) : g = e.eq(h), g.addClass(p.focus);
                    return b.preventDefault()
                }
                if (c == 34)return i.addMonth();
                if (c == 33)return i.addMonth(-1);
                if (c == 36)return i.today();
                c == 13 && (a(b.target).is("select") || a("." + p.focus).click());
                return a([16, 17, 18, 9]).index(c) >= 0
            }), a(document).on("click.d", function (b) {
                var c = b.target;
                !a(c).parents("#" + p.root).length && c != d[0] && (!t || c != t[0]) && i.hide(b)
            })
        }

        a.extend(i, {show:function (b) {
            if (!(d.attr("readonly") || d.attr("disabled") || C)) {
                b = b || a.Event(), b.type = "onBeforeShow", G.trigger(b);
                if (b.isDefaultPrevented())return;
                a.each(c, function () {
                    this.hide()
                }), C = !0, H.off("change").change(function () {
                    i.setValue(l(I.val()), l(a(this).val()))
                }), I.off("change").change(function () {
                    i.setValue(l(a(this).val()), l(H.val()))
                }), u = r.find("#" + p.prev).off("click").click(function (a) {
                    u.hasClass(p.disabled) || i.addMonth(-1);
                    return!1
                }), v = r.find("#" + p.next).off("click").click(function (a) {
                    v.hasClass(p.disabled) || i.addMonth();
                    return!1
                }), i.setValue(z);
                var f = d.offset();
                /iPad/i.test(navigator.userAgent) && (f.top -= a(window).scrollTop()), r.css({top:f.top + d.outerHeight({margins:!0}) + e.offset[0], left:f.left + e.offset[1]}), e.speed ? r.show(e.speed, function () {
                    N(b)
                }) : (r.show(), N(b));
                return i
            }
        }, setValue:function (c, d, f) {
            var g = l(d) >= -1 ? new Date(l(c), l(d), l(f == b || isNaN(f) ? 1 : f)) : c || z;
            g < A ? g = A : g > B && (g = B), typeof c == "string" && (g = n(c)), c = g.getFullYear(), d = g.getMonth(), f = g.getDate(), d == -1 ? (d = 11, c--) : d == 12 && (d = 0, c++);
            if (!C) {
                M(g, e);
                return i
            }
            x = d, w = c, y = f;
            var k = new Date(c, d, 1 - e.firstDay), o = k.getDay(), r = h(c, d), t = h(c, d - 1), D;
            if (e.selectors) {
                H.empty(), a.each(q.months, function (b, d) {
                    A < new Date(c, b + 1, 1) && B > new Date(c, b, 0) && H.append(a("<option/>").html(d).attr("value", b))
                }), I.empty();
                var E = j.getFullYear();
                for (var F = E + e.yearRange[0]; F < E + e.yearRange[1]; F++)A < new Date(F + 1, 0, 1) && B > new Date(F, 0, 0) && I.append(a("<option/>").text(F));
                H.val(d), I.val(c)
            } else s.html(q.months[d] + " " + c);
            L.empty(), u.add(v).removeClass(p.disabled);
            for (var G = o ? 0 : -7, J, K; G < (o ? 42 : 35); G++)J = a("<a/>"), G % 7 === 0 && (D = a("<div/>").addClass(p.week), L.append(D)), G < o ? (J.addClass(p.off), K = t - o + G + 1, g = new Date(c, d - 1, K)) : G < o + r ? (K = G - o + 1, g = new Date(c, d, K), m(z, g) ? J.attr("id", p.current).addClass(p.focus) : m(j, g) && J.attr("id", p.today)) : (J.addClass(p.off), K = G - r - o + 1, g = new Date(c, d + 1, K)), A && g < A && J.add(u).addClass(p.disabled), B && g > B && J.add(v).addClass(p.disabled), J.attr("href", "#" + K).text(K).data("date", g), D.append(J);
            L.find("a").click(function (b) {
                var c = a(this);
                c.hasClass(p.disabled) || (a("#" + p.current).removeAttr("id"), c.attr("id", p.current), M(c.data("date"), e, b));
                return!1
            }), p.sunday && L.find("." + p.week).each(function () {
                var b = e.firstDay ? 7 - e.firstDay : 0;
                a(this).children().slice(b, b + 1).addClass(p.sunday)
            });
            return i
        }, setMin:function (a, b) {
            A = n(a), b && z < A && i.setValue(A);
            return i
        }, setMax:function (a, b) {
            B = n(a), b && z > B && i.setValue(B);
            return i
        }, today:function () {
            return i.setValue(j)
        }, addDay:function (a) {
            return this.setValue(w, x, y + (a || 1))
        }, addMonth:function (a) {
            var b = x + (a || 1), c = h(w, b), d = y <= c ? y : c;
            return this.setValue(w, b, d)
        }, addYear:function (a) {
            return this.setValue(w + (a || 1), x, y)
        }, destroy:function () {
            d.add(document).off("click.d keydown.d"), r.add(t).remove(), d.removeData("dateinput").removeClass(p.input), D && d.replaceWith(D)
        }, hide:function (b) {
            if (C) {
                b = a.Event(), b.type = "onHide", G.trigger(b);
                if (b.isDefaultPrevented())return;
                a(document).off("click.d keydown.d"), r.hide(), C = !1
            }
            return i
        }, toggle:function () {
            return i.isOpen() ? i.hide() : i.show()
        }, getConf:function () {
            return e
        }, getInput:function () {
            return d
        }, getCalendar:function () {
            return r
        }, getValue:function (a) {
            return a ? k(e.formatter, z, a, e.lang) : z
        }, isOpen:function () {
            return C
        }}), a.each(["onBeforeShow", "onShow", "change", "onHide"], function (b, c) {
            a.isFunction(e[c]) && a(i).on(c, e[c]), i[c] = function (b) {
                b && a(i).on(c, b);
                return i
            }
        }), e.editable || d.on("focus.d click.d", i.show).keydown(function (b) {
            var c = b.keyCode;
            if (C || a(f).index(c) < 0)(c == 8 || c == 46) && d.val(""); else {
                i.show(b);
                return b.preventDefault()
            }
            return b.shiftKey || b.ctrlKey || b.altKey || c == 9 ? !0 : b.preventDefault()
        }), n(d.val()) && M(z, e)
    }

    a.expr[":"].date = function (b) {
        var c = b.getAttribute("type");
        return c && c == "date" || a(b).data("dateinput")
    }, a.fn.dateinput = function (b) {
        if (this.data("dateinput"))return this;
        b = a.extend(!0, {}, e.conf, b), a.each(b.css, function (a, c) {
            !c && a != "prefix" && (b.css[a] = (b.css.prefix || "") + (c || a))
        });
        var d;
        this.each(function () {
            var e = new o(a(this), b);
            c.push(e);
            var f = e.getInput().data("dateinput", e);
            d = d ? d.add(f) : f
        });
        return d ? d : this
    }
})(jQuery);
(function (a) {
    a.tools = a.tools || {version:"v1.2.7"}, a.tools.overlay = {addEffect:function (a, b, d) {
        c[a] = [b, d]
    }, conf:{close:null, closeOnClick:!0, closeOnEsc:!0, closeSpeed:"fast", effect:"default", fixed:!a.browser.msie || a.browser.version > 6, left:"center", load:!1, mask:null, oneInstance:!0, speed:"normal", target:null, top:"10%"}};
    var b = [], c = {};
    a.tools.overlay.addEffect("default", function (b, c) {
        var d = this.getConf(), e = a(window);
        d.fixed || (b.top += e.scrollTop(), b.left += e.scrollLeft()), b.position = d.fixed ? "fixed" : "absolute", this.getOverlay().css(b).fadeIn(d.speed, c)
    }, function (a) {
        this.getOverlay().fadeOut(this.getConf().closeSpeed, a)
    });
    function d(d, e) {
        var f = this, g = d.add(f), h = a(window), i, j, k, l = a.tools.expose && (e.mask || e.expose), m = Math.random().toString().slice(10);
        l && (typeof l == "string" && (l = {color:l}), l.closeOnClick = l.closeOnEsc = !1);
        var n = e.target || d.attr("rel");
        j = n ? a(n) : null || d;
        if (!j.length)throw"Could not find Overlay: " + n;
        d && d.index(j) == -1 && d.click(function (a) {
            f.load(a);
            return a.preventDefault()
        }), a.extend(f, {load:function (d) {
            if (f.isOpened())return f;
            var i = c[e.effect];
            if (!i)throw"Overlay: cannot find effect : \"" + e.effect + "\"";
            e.oneInstance && a.each(b, function () {
                this.close(d)
            }), d = d || a.Event(), d.type = "onBeforeLoad", g.trigger(d);
            if (d.isDefaultPrevented())return f;
            k = !0, l && a(j).expose(l);
            var n = e.top, o = e.left, p = j.outerWidth({margin:!0}), q = j.outerHeight({margin:!0});
            typeof n == "string" && (n = n == "center" ? Math.max((h.height() - q) / 2, 0) : parseInt(n, 10) / 100 * h.height()), o == "center" && (o = Math.max((h.width() - p) / 2, 0)), i[0].call(f, {top:n, left:o}, function () {
                k && (d.type = "onLoad", g.trigger(d))
            }), l && e.closeOnClick && a.mask.getMask().one("click", f.close), e.closeOnClick && a(document).on("click." + m, function (b) {
                a(b.target).parents(j).length || f.close(b)
            }), e.closeOnEsc && a(document).on("keydown." + m, function (a) {
                a.keyCode == 27 && f.close(a)
            });
            return f
        }, close:function (b) {
            if (!f.isOpened())return f;
            b = b || a.Event(), b.type = "onBeforeClose", g.trigger(b);
            if (!b.isDefaultPrevented()) {
                k = !1, c[e.effect][1].call(f, function () {
                    b.type = "onClose", g.trigger(b)
                }), a(document).off("click." + m + " keydown." + m), l && a.mask.close();
                return f
            }
        }, getOverlay:function () {
            return j
        }, getTrigger:function () {
            return d
        }, getClosers:function () {
            return i
        }, isOpened:function () {
            return k
        }, getConf:function () {
            return e
        }}), a.each("onBeforeLoad,onStart,onLoad,onBeforeClose,onClose".split(","), function (b, c) {
            a.isFunction(e[c]) && a(f).on(c, e[c]), f[c] = function (b) {
                b && a(f).on(c, b);
                return f
            }
        }), i = j.find(e.close || ".close"), !i.length && !e.close && (i = a("<a class=\"close\"></a>"), j.prepend(i)), i.click(function (a) {
            f.close(a)
        }), e.load && f.load()
    }

    a.fn.overlay = function (c) {
        var e = this.data("overlay");
        if (e)return e;
        a.isFunction(c) && (c = {onBeforeLoad:c}), c = a.extend(!0, {}, a.tools.overlay.conf, c), this.each(function () {
            e = new d(a(this), c), b.push(e), a(this).data("overlay", e)
        });
        return c.api ? e : this
    }
})(jQuery);
(function (a) {
    a.tools = a.tools || {version:"v1.2.7"};
    var b;
    b = a.tools.rangeinput = {conf:{min:0, max:100, step:"any", steps:0, value:0, precision:undefined, vertical:0, keyboard:!0, progress:!1, speed:100, css:{input:"range", slider:"slider", progress:"progress", handle:"handle"}}};
    var c, d;
    a.fn.drag = function (b) {
        document.ondragstart = function () {
            return!1
        }, b = a.extend({x:!0, y:!0, drag:!0}, b), c = c || a(document).on("mousedown mouseup", function (e) {
            var f = a(e.target);
            if (e.type == "mousedown" && f.data("drag")) {
                var g = f.position(), h = e.pageX - g.left, i = e.pageY - g.top, j = !0;
                c.on("mousemove.drag", function (a) {
                    var c = a.pageX - h, e = a.pageY - i, g = {};
                    b.x && (g.left = c), b.y && (g.top = e), j && (f.trigger("dragStart"), j = !1), b.drag && f.css(g), f.trigger("drag", [e, c]), d = f
                }), e.preventDefault()
            } else try {
                d && d.trigger("dragEnd")
            } finally {
                c.off("mousemove.drag"), d = null
            }
        });
        return this.data("drag", !0)
    };
    function e(a, b) {
        var c = Math.pow(10, b);
        return Math.round(a * c) / c
    }

    function f(a, b) {
        var c = parseInt(a.css(b), 10);
        if (c)return c;
        var d = a[0].currentStyle;
        return d && d.width && parseInt(d.width, 10)
    }

    function g(a) {
        var b = a.data("events");
        return b && b.onSlide
    }

    function h(b, c) {
        var d = this, h = c.css, i = a("<div><div/><a href='#'/></div>").data("rangeinput", d), j, k, l, m, n;
        b.before(i);
        var o = i.addClass(h.slider).find("a").addClass(h.handle), p = i.find("div").addClass(h.progress);
        a.each("min,max,step,value".split(","), function (a, d) {
            var e = b.attr(d);
            parseFloat(e) && (c[d] = parseFloat(e, 10))
        });
        var q = c.max - c.min, r = c.step == "any" ? 0 : c.step, s = c.precision;
        s === undefined && (s = r.toString().split("."), s = s.length === 2 ? s[1].length : 0);
        if (b.attr("type") == "range") {
            var t = b.clone().wrap("<div/>").parent().html(), u = a(t.replace(/type/i, "type=text data-orig-type"));
            u.val(c.value), b.replaceWith(u), b = u
        }
        b.addClass(h.input);
        var v = a(d).add(b), w = !0;

        function x(a, f, g, h) {
            g === undefined ? g = f / m * q : h && (g -= c.min), r && (g = Math.round(g / r) * r);
            if (f === undefined || r)f = g * m / q;
            if (isNaN(g))return d;
            f = Math.max(0, Math.min(f, m)), g = f / m * q;
            if (h || !j)g += c.min;
            j && (h ? f = m - f : g = c.max - g), g = e(g, s);
            var i = a.type == "click";
            if (w && k !== undefined && !i) {
                a.type = "onSlide", v.trigger(a, [g, f]);
                if (a.isDefaultPrevented())return d
            }
            var l = i ? c.speed : 0, t = i ? function () {
                a.type = "change", v.trigger(a, [g])
            } : null;
            j ? (o.animate({top:f}, l, t), c.progress && p.animate({height:m - f + o.height() / 2}, l)) : (o.animate({left:f}, l, t), c.progress && p.animate({width:f + o.width() / 2}, l)), k = g, n = f, b.val(g);
            return d
        }

        a.extend(d, {getValue:function () {
            return k
        }, setValue:function (b, c) {
            y();
            return x(c || a.Event("api"), undefined, b, !0)
        }, getConf:function () {
            return c
        }, getProgress:function () {
            return p
        }, getHandle:function () {
            return o
        }, getInput:function () {
            return b
        }, step:function (b, e) {
            e = e || a.Event();
            var f = c.step == "any" ? 1 : c.step;
            d.setValue(k + f * (b || 1), e)
        }, stepUp:function (a) {
            return d.step(a || 1)
        }, stepDown:function (a) {
            return d.step(-a || -1)
        }}), a.each("onSlide,change".split(","), function (b, e) {
            a.isFunction(c[e]) && a(d).on(e, c[e]), d[e] = function (b) {
                b && a(d).on(e, b);
                return d
            }
        }), o.drag({drag:!1}).on("dragStart",function () {
            y(), w = g(a(d)) || g(b)
        }).on("drag",function (a, c, d) {
            if (b.is(":disabled"))return!1;
            x(a, j ? c : d)
        }).on("dragEnd",function (a) {
            a.isDefaultPrevented() || (a.type = "change", v.trigger(a, [k]))
        }).click(function (a) {
            return a.preventDefault()
        }), i.click(function (a) {
            if (b.is(":disabled") || a.target == o[0])return a.preventDefault();
            y();
            var c = j ? o.height() / 2 : o.width() / 2;
            x(a, j ? m - l - c + a.pageY : a.pageX - l - c)
        }), c.keyboard && b.keydown(function (c) {
            if (!b.attr("readonly")) {
                var e = c.keyCode, f = a([75, 76, 38, 33, 39]).index(e) != -1, g = a([74, 72, 40, 34, 37]).index(e) != -1;
                if ((f || g) && !(c.shiftKey || c.altKey || c.ctrlKey)) {
                    f ? d.step(e == 33 ? 10 : 1, c) : g && d.step(e == 34 ? -10 : -1, c);
                    return c.preventDefault()
                }
            }
        }), b.blur(function (b) {
            var c = a(this).val();
            c !== k && d.setValue(c, b)
        }), a.extend(b[0], {stepUp:d.stepUp, stepDown:d.stepDown});
        function y() {
            j = c.vertical || f(i, "height") > f(i, "width"), j ? (m = f(i, "height") - f(o, "height"), l = i.offset().top + m) : (m = f(i, "width") - f(o, "width"), l = i.offset().left)
        }

        function z() {
            y(), d.setValue(c.value !== undefined ? c.value : c.min)
        }

        z(), m || a(window).load(z)
    }

    a.expr[":"].range = function (b) {
        var c = b.getAttribute("type");
        return c && c == "range" || a(b).filter("input").data("rangeinput")
    }, a.fn.rangeinput = function (c) {
        if (this.data("rangeinput"))return this;
        c = a.extend(!0, {}, b.conf, c);
        var d;
        this.each(function () {
            var b = new h(a(this), a.extend(!0, {}, c)), e = b.getInput().data("rangeinput", b);
            d = d ? d.add(e) : e
        });
        return d ? d : this
    }
})(jQuery);
(function (a) {
    a.tools = a.tools || {version:"v1.2.7"};
    var b;
    b = a.tools.expose = {conf:{maskId:"exposeMask", loadSpeed:"slow", closeSpeed:"fast", closeOnClick:!0, closeOnEsc:!0, zIndex:9998, opacity:.8, startOpacity:0, color:"#fff", onLoad:null, onClose:null}};
    function c() {
        if (a.browser.msie) {
            var b = a(document).height(), c = a(window).height();
            return[window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth, b - c < 20 ? c : b]
        }
        return[a(document).width(), a(document).height()]
    }

    function d(b) {
        if (b)return b.call(a.mask)
    }

    var e, f, g, h, i;
    a.mask = {load:function (j, k) {
        if (g)return this;
        typeof j == "string" && (j = {color:j}), j = j || h, h = j = a.extend(a.extend({}, b.conf), j), e = a("#" + j.maskId), e.length || (e = a("<div/>").attr("id", j.maskId), a("body").append(e));
        var l = c();
        e.css({position:"absolute", top:0, left:0, width:l[0], height:l[1], display:"none", opacity:j.startOpacity, zIndex:j.zIndex}), j.color && e.css("backgroundColor", j.color);
        if (d(j.onBeforeLoad) === !1)return this;
        j.closeOnEsc && a(document).on("keydown.mask", function (b) {
            b.keyCode == 27 && a.mask.close(b)
        }), j.closeOnClick && e.on("click.mask", function (b) {
            a.mask.close(b)
        }), a(window).on("resize.mask", function () {
            a.mask.fit()
        }), k && k.length && (i = k.eq(0).css("zIndex"), a.each(k, function () {
            var b = a(this);
            /relative|absolute|fixed/i.test(b.css("position")) || b.css("position", "relative")
        }), f = k.css({zIndex:Math.max(j.zIndex + 1, i == "auto" ? 0 : i)})), e.css({display:"block"}).fadeTo(j.loadSpeed, j.opacity, function () {
            a.mask.fit(), d(j.onLoad), g = "full"
        }), g = !0;
        return this
    }, close:function () {
        if (g) {
            if (d(h.onBeforeClose) === !1)return this;
            e.fadeOut(h.closeSpeed, function () {
                d(h.onClose), f && f.css({zIndex:i}), g = !1
            }), a(document).off("keydown.mask"), e.off("click.mask"), a(window).off("resize.mask")
        }
        return this
    }, fit:function () {
        if (g) {
            var a = c();
            e.css({width:a[0], height:a[1]})
        }
    }, getMask:function () {
        return e
    }, isLoaded:function (a) {
        return a ? g == "full" : g
    }, getConf:function () {
        return h
    }, getExposed:function () {
        return f
    }}, a.fn.mask = function (b) {
        a.mask.load(b);
        return this
    }, a.fn.expose = function (b) {
        a.mask.load(b, this);
        return this
    }
})(jQuery);
(function () {
    var a = document.all, b = "http://www.adobe.com/go/getflashplayer", c = typeof jQuery == "function", d = /(\d+)[^\d]+(\d+)[^\d]*(\d*)/, e = {width:"100%", height:"100%", id:"_" + ("" + Math.random()).slice(9), allowfullscreen:!0, allowscriptaccess:"always", quality:"high", version:[3, 0], onFail:null, expressInstall:null, w3c:!1, cachebusting:!1};
    window.attachEvent && window.attachEvent("onbeforeunload", function () {
        __flash_unloadHandler = function () {
        }, __flash_savedUnloadHandler = function () {
        }
    });
    function f(a, b) {
        if (b)for (var c in b)b.hasOwnProperty(c) && (a[c] = b[c]);
        return a
    }

    function g(a, b) {
        var c = [];
        for (var d in a)a.hasOwnProperty(d) && (c[d] = b(a[d]));
        return c
    }

    window.flashembed = function (a, b, c) {
        typeof a == "string" && (a = document.getElementById(a.replace("#", "")));
        if (a) {
            typeof b == "string" && (b = {src:b});
            return new j(a, f(f({}, e), b), c)
        }
    };
    var h = f(window.flashembed, {conf:e, getVersion:function () {
        var a, b;
        try {
            b = navigator.plugins["Shockwave Flash"].description.slice(16)
        } catch (c) {
            try {
                a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7"), b = a && a.GetVariable("$version")
            } catch (e) {
                try {
                    a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6"), b = a && a.GetVariable("$version")
                } catch (f) {
                }
            }
        }
        b = d.exec(b);
        return b ? [b[1], b[3]] : [0, 0]
    }, asString:function (a) {
        if (a === null || a === undefined)return null;
        var b = typeof a;
        b == "object" && a.push && (b = "array");
        switch (b) {
            case"string":
                a = a.replace(new RegExp("([\"\\\\])", "g"), "\\$1"), a = a.replace(/^\s?(\d+\.?\d*)%/, "$1pct");
                return"\"" + a + "\"";
            case"array":
                return"[" + g(a,function (a) {
                    return h.asString(a)
                }).join(",") + "]";
            case"function":
                return"\"function()\"";
            case"object":
                var c = [];
                for (var d in a)a.hasOwnProperty(d) && c.push("\"" + d + "\":" + h.asString(a[d]));
                return"{" + c.join(",") + "}"
        }
        return String(a).replace(/\s/g, " ").replace(/\'/g, "\"")
    }, getHTML:function (b, c) {
        b = f({}, b);
        var d = "<object width=\"" + b.width + "\" height=\"" + b.height + "\" id=\"" + b.id + "\" name=\"" + b.id + "\"";
        b.cachebusting && (b.src += (b.src.indexOf("?") != -1 ? "&" : "?") + Math.random()), b.w3c || !a ? d += " data=\"" + b.src + "\" type=\"application/x-shockwave-flash\"" : d += " classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\"", d += ">";
        if (b.w3c || a)d += "<param name=\"movie\" value=\"" + b.src + "\" />";
        b.width = b.height = b.id = b.w3c = b.src = null, b.onFail = b.version = b.expressInstall = null;
        for (var e in b)b[e] && (d += "<param name=\"" + e + "\" value=\"" + b[e] + "\" />");
        var g = "";
        if (c) {
            for (var i in c)if (c[i]) {
                var j = c[i];
                g += i + "=" + encodeURIComponent(/function|object/.test(typeof j) ? h.asString(j) : j) + "&"
            }
            g = g.slice(0, -1), d += "<param name=\"flashvars\" value='" + g + "' />"
        }
        d += "</object>";
        return d
    }, isSupported:function (a) {
        return i[0] > a[0] || i[0] == a[0] && i[1] >= a[1]
    }}), i = h.getVersion();

    function j(c, d, e) {
        if (h.isSupported(d.version))c.innerHTML = h.getHTML(d, e); else if (d.expressInstall && h.isSupported([6, 65]))c.innerHTML = h.getHTML(f(d, {src:d.expressInstall}), {MMredirectURL:location.href, MMplayerType:"PlugIn", MMdoctitle:document.title}); else {
            c.innerHTML.replace(/\s/g, "") || (c.innerHTML = "<h2>Flash version " + d.version + " or greater is required</h2><h3>" + (i[0] > 0 ? "Your version is " + i : "You have no flash plugin installed") + "</h3>" + (c.tagName == "A" ? "<p>Click here to download latest version</p>" : "<p>Download latest version from <a href='" + b + "'>here</a></p>"), c.tagName == "A" && (c.onclick = function () {
                location.href = b
            }));
            if (d.onFail) {
                var g = d.onFail.call(this);
                typeof g == "string" && (c.innerHTML = g)
            }
        }
        a && (window[d.id] = document.getElementById(d.id)), f(this, {getRoot:function () {
            return c
        }, getOptions:function () {
            return d
        }, getConf:function () {
            return e
        }, getApi:function () {
            return c.firstChild
        }})
    }

    c && (jQuery.tools = jQuery.tools || {version:"v1.2.7"}, jQuery.tools.flashembed = {conf:e}, jQuery.fn.flashembed = function (a, b) {
        return this.each(function () {
            jQuery(this).data("flashembed", flashembed(this, a, b))
        })
    })
})();
(function (a) {
    var b, c, d, e;
    a.tools = a.tools || {version:"v1.2.7"}, a.tools.history = {init:function (g) {
        e || (a.browser.msie && a.browser.version < "8" ? c || (c = a("<iframe/>").attr("src", "javascript:false;").hide().get(0), a("body").append(c), setInterval(function () {
            var d = c.contentWindow.document, e = d.location.hash;
            b !== e && a(window).trigger("hash", e)
        }, 100), f(location.hash || "#")) : setInterval(function () {
            var c = location.hash;
            c !== b && a(window).trigger("hash", c)
        }, 100), d = d ? d.add(g) : g, g.click(function (b) {
            var d = a(this).attr("href");
            c && f(d);
            if (d.slice(0, 1) != "#") {
                location.href = "#" + d;
                return b.preventDefault()
            }
        }), e = !0)
    }};
    function f(a) {
        if (a) {
            var b = c.contentWindow.document;
            b.open().close(), b.location.hash = a
        }
    }

    a(window).on("hash", function (c, e) {
        e ? d.filter(function () {
            var b = a(this).attr("href");
            return b == e || b == e.replace("#", "")
        }).trigger("history", [e]) : d.eq(0).trigger("history", [e]), b = e
    }), a.fn.history = function (b) {
        a.tools.history.init(this);
        return this.on("history", b)
    }
})(jQuery);
(function (a) {
    a.fn.mousewheel = function (a) {
        return this[a ? "on" : "trigger"]("wheel", a)
    }, a.event.special.wheel = {setup:function () {
        a.event.add(this, b, c, {})
    }, teardown:function () {
        a.event.remove(this, b, c)
    }};
    var b = a.browser.mozilla ? "DOMMouseScroll" + (a.browser.version < "1.9" ? " mousemove" : "") : "mousewheel";

    function c(b) {
        switch (b.type) {
            case"mousemove":
                return a.extend(b.data, {clientX:b.clientX, clientY:b.clientY, pageX:b.pageX, pageY:b.pageY});
            case"DOMMouseScroll":
                a.extend(b, b.data), b.delta = -b.detail / 3;
                break;
            case"mousewheel":
                b.delta = b.wheelDelta / 120
        }
        b.type = "wheel";
        return a.event.handle.call(this, b, b.delta)
    }
})(jQuery);
(function (a) {
    a.tools = a.tools || {version:"v1.2.7"}, a.tools.tooltip = {conf:{effect:"toggle", fadeOutSpeed:"fast", predelay:0, delay:30, opacity:1, tip:0, fadeIE:!1, position:["top", "center"], offset:[0, 0], relative:!1, cancelDefault:!0, events:{def:"mouseenter,mouseleave", input:"focus,blur", widget:"focus mouseenter,blur mouseleave", tooltip:"mouseenter,mouseleave"}, layout:"<div/>", tipClass:"tooltip"}, addEffect:function (a, c, d) {
        b[a] = [c, d]
    }};
    var b = {toggle:[function (a) {
        var b = this.getConf(), c = this.getTip(), d = b.opacity;
        d < 1 && c.css({opacity:d}), c.show(), a.call()
    }, function (a) {
        this.getTip().hide(), a.call()
    }], fade:[function (b) {
        var c = this.getConf();
        !a.browser.msie || c.fadeIE ? this.getTip().fadeTo(c.fadeInSpeed, c.opacity, b) : (this.getTip().show(), b())
    }, function (b) {
        var c = this.getConf();
        !a.browser.msie || c.fadeIE ? this.getTip().fadeOut(c.fadeOutSpeed, b) : (this.getTip().hide(), b())
    }]};

    function c(b, c, d) {
        var e = d.relative ? b.position().top : b.offset().top, f = d.relative ? b.position().left : b.offset().left, g = d.position[0];
        e -= c.outerHeight() - d.offset[0], f += b.outerWidth() + d.offset[1], /iPad/i.test(navigator.userAgent) && (e -= a(window).scrollTop());
        var h = c.outerHeight() + b.outerHeight();
        g == "center" && (e += h / 2), g == "bottom" && (e += h), g = d.position[1];
        var i = c.outerWidth() + b.outerWidth();
        g == "center" && (f -= i / 2), g == "left" && (f -= i);
        return{top:e, left:f}
    }

    function d(d, e) {
        var f = this, g = d.add(f), h, i = 0, j = 0, k = d.attr("title"), l = d.attr("data-tooltip"), m = b[e.effect], n, o = d.is(":input"), p = o && d.is(":checkbox, :radio, select, :button, :submit"), q = d.attr("type"), r = e.events[q] || e.events[o ? p ? "widget" : "input" : "def"];
        if (!m)throw"Nonexistent effect \"" + e.effect + "\"";
        r = r.split(/,\s*/);
        if (r.length != 2)throw"Tooltip: bad events configuration for " + q;
        d.on(r[0],function (a) {
            clearTimeout(i), e.predelay ? j = setTimeout(function () {
                f.show(a)
            }, e.predelay) : f.show(a)
        }).on(r[1], function (a) {
            clearTimeout(j), e.delay ? i = setTimeout(function () {
                f.hide(a)
            }, e.delay) : f.hide(a)
        }), k && e.cancelDefault && (d.removeAttr("title"), d.data("title", k)), a.extend(f, {show:function (b) {
            if (!h) {
                l ? h = a(l) : e.tip ? h = a(e.tip).eq(0) : k ? h = a(e.layout).addClass(e.tipClass).appendTo(document.body).hide().append(k) : (h = d.next(), h.length || (h = d.parent().next()));
                if (!h.length)throw"Cannot find tooltip for " + d
            }
            if (f.isShown())return f;
            h.stop(!0, !0);
            var o = c(d, h, e);
            e.tip && h.html(d.data("title")), b = a.Event(), b.type = "onBeforeShow", g.trigger(b, [o]);
            if (b.isDefaultPrevented())return f;
            o = c(d, h, e), h.css({position:"absolute", top:o.top, left:o.left}), n = !0, m[0].call(f, function () {
                b.type = "onShow", n = "full", g.trigger(b)
            });
            var p = e.events.tooltip.split(/,\s*/);
            h.data("__set") || (h.off(p[0]).on(p[0], function () {
                clearTimeout(i), clearTimeout(j)
            }), p[1] && !d.is("input:not(:checkbox, :radio), textarea") && h.off(p[1]).on(p[1], function (a) {
                a.relatedTarget != d[0] && d.trigger(r[1].split(" ")[0])
            }), e.tip || h.data("__set", !0));
            return f
        }, hide:function (c) {
            if (!h || !f.isShown())return f;
            c = a.Event(), c.type = "onBeforeHide", g.trigger(c);
            if (!c.isDefaultPrevented()) {
                n = !1, b[e.effect][1].call(f, function () {
                    c.type = "onHide", g.trigger(c)
                });
                return f
            }
        }, isShown:function (a) {
            return a ? n == "full" : n
        }, getConf:function () {
            return e
        }, getTip:function () {
            return h
        }, getTrigger:function () {
            return d
        }}), a.each("onHide,onBeforeShow,onShow,onBeforeHide".split(","), function (b, c) {
            a.isFunction(e[c]) && a(f).on(c, e[c]), f[c] = function (b) {
                b && a(f).on(c, b);
                return f
            }
        })
    }

    a.fn.tooltip = function (b) {
        var c = this.data("tooltip");
        if (c)return c;
        b = a.extend(!0, {}, a.tools.tooltip.conf, b), typeof b.position == "string" && (b.position = b.position.split(/,?\s/)), this.each(function () {
            c = new d(a(this), b), a(this).data("tooltip", c)
        });
        return b.api ? c : this
    }
})(jQuery);
(function (a) {
    var b = a.tools.tooltip;
    b.dynamic = {conf:{classNames:"top right bottom left"}};
    function c(b) {
        var c = a(window), d = c.width() + c.scrollLeft(), e = c.height() + c.scrollTop();
        return[b.offset().top <= c.scrollTop(), d <= b.offset().left + b.width(), e <= b.offset().top + b.height(), c.scrollLeft() >= b.offset().left]
    }

    function d(a) {
        var b = a.length;
        while (b--)if (a[b])return!1;
        return!0
    }

    a.fn.dynamic = function (e) {
        typeof e == "number" && (e = {speed:e}), e = a.extend({}, b.dynamic.conf, e);
        var f = a.extend(!0, {}, e), g = e.classNames.split(/\s/), h;
        this.each(function () {
            var b = a(this).tooltip().onBeforeShow(function (b, e) {
                var i = this.getTip(), j = this.getConf();
                h || (h = [j.position[0], j.position[1], j.offset[0], j.offset[1], a.extend({}, j)]), a.extend(j, h[4]), j.position = [h[0], h[1]], j.offset = [h[2], h[3]], i.css({visibility:"hidden", position:"absolute", top:e.top, left:e.left}).show();
                var k = a.extend(!0, {}, f), l = c(i);
                if (!d(l)) {
                    l[2] && (a.extend(j, k.top), j.position[0] = "top", i.addClass(g[0])), l[3] && (a.extend(j, k.right), j.position[1] = "right", i.addClass(g[1])), l[0] && (a.extend(j, k.bottom), j.position[0] = "bottom", i.addClass(g[2])), l[1] && (a.extend(j, k.left), j.position[1] = "left", i.addClass(g[3]));
                    if (l[0] || l[2])j.offset[0] *= -1;
                    if (l[1] || l[3])j.offset[1] *= -1
                }
                i.css({visibility:"visible"}).hide()
            });
            b.onBeforeShow(function () {
                var a = this.getConf(), b = this.getTip();
                setTimeout(function () {
                    a.position = [h[0], h[1]], a.offset = [h[2], h[3]]
                }, 0)
            }), b.onHide(function () {
                var a = this.getTip();
                a.removeClass(e.classNames)
            }), ret = b
        });
        return e.api ? ret : this
    }
})(jQuery);
(function (a) {
    var b = a.tools.tooltip;
    a.extend(b.conf, {direction:"up", bounce:!1, slideOffset:10, slideInSpeed:200, slideOutSpeed:200, slideFade:!a.browser.msie});
    var c = {up:["-", "top"], down:["+", "top"], left:["-", "left"], right:["+", "left"]};
    b.addEffect("slide", function (a) {
        var b = this.getConf(), d = this.getTip(), e = b.slideFade ? {opacity:b.opacity} : {}, f = c[b.direction] || c.up;
        e[f[1]] = f[0] + "=" + b.slideOffset, b.slideFade && d.css({opacity:0}), d.show().animate(e, b.slideInSpeed, a)
    }, function (b) {
        var d = this.getConf(), e = d.slideOffset, f = d.slideFade ? {opacity:0} : {}, g = c[d.direction] || c.up, h = "" + g[0];
        d.bounce && (h = h == "+" ? "-" : "+"), f[g[1]] = h + "=" + e, this.getTip().animate(f, d.slideOutSpeed, function () {
            a(this).hide(), b.call()
        })
    })
})(jQuery);
(function (a) {
    a.tools = a.tools || {version:"v1.2.7"};
    var b = /\[type=([a-z]+)\]/, c = /^-?[0-9]*(\.[0-9]+)?$/, d = a.tools.dateinput, e = /^([a-z0-9_\.\-\+]+)@([\da-z\.\-]+)\.([a-z\.]{2,6})$/i, f = /^(https?:\/\/)?[\da-z\.\-]+\.[a-z\.]{2,6}[#&+_\?\/\w \.\-=]*$/i, g;
    g = a.tools.validator = {conf:{grouped:!1, effect:"default", errorClass:"invalid", inputEvent:null, errorInputEvent:"keyup", formEvent:"submit", lang:"en", message:"<div/>", messageAttr:"data-message", messageClass:"error", offset:[0, 0], position:"center right", singleError:!1, speed:"normal"}, messages:{"*":{en:"Please correct this value"}}, localize:function (b, c) {
        a.each(c, function (a, c) {
            g.messages[a] = g.messages[a] || {}, g.messages[a][b] = c
        })
    }, localizeFn:function (b, c) {
        g.messages[b] = g.messages[b] || {}, a.extend(g.messages[b], c)
    }, fn:function (c, d, e) {
        a.isFunction(d) ? e = d : (typeof d == "string" && (d = {en:d}), this.messages[c.key || c] = d);
        var f = b.exec(c);
        f && (c = i(f[1])), j.push([c, e])
    }, addEffect:function (a, b, c) {
        k[a] = [b, c]
    }};
    function h(b, c, d) {
        c = a(c).first() || c;
        var e = b.offset().top, f = b.offset().left, g = d.position.split(/,?\s+/), h = g[0], i = g[1];
        e -= c.outerHeight() - d.offset[0], f += b.outerWidth() + d.offset[1], /iPad/i.test(navigator.userAgent) && (e -= a(window).scrollTop());
        var j = c.outerHeight() + b.outerHeight();
        h == "center" && (e += j / 2), h == "bottom" && (e += j);
        var k = b.outerWidth();
        i == "center" && (f -= (k + c.outerWidth()) / 2), i == "left" && (f -= k);
        return{top:e, left:f}
    }

    function i(a) {
        function b() {
            return this.getAttribute("type") == a
        }

        b.key = "[type=\"" + a + "\"]";
        return b
    }

    var j = [], k = {"default":[function (b) {
        var c = this.getConf();
        a.each(b, function (b, d) {
            var e = d.input;
            e.addClass(c.errorClass);
            var f = e.data("msg.el");
            f || (f = a(c.message).addClass(c.messageClass).appendTo(document.body), e.data("msg.el", f)), f.css({visibility:"hidden"}).find("p").remove(), a.each(d.messages, function (b, c) {
                a("<p/>").html(c).appendTo(f)
            }), f.outerWidth() == f.parent().width() && f.add(f.find("p")).css({display:"inline"});
            var g = h(e, f, c);
            f.css({visibility:"visible", position:"absolute", top:g.top, left:g.left}).fadeIn(c.speed)
        })
    }, function (b) {
        var c = this.getConf();
        b.removeClass(c.errorClass).each(function () {
            var b = a(this).data("msg.el");
            b && b.css({visibility:"hidden"})
        })
    }]};
    a.each("email,url,number".split(","), function (b, c) {
        a.expr[":"][c] = function (a) {
            return a.getAttribute("type") === c
        }
    }), a.fn.oninvalid = function (a) {
        return this[a ? "on" : "trigger"]("OI", a)
    }, g.fn(":email", "Please enter a valid email address", function (a, b) {
        return!b || e.test(b)
    }), g.fn(":url", "Please enter a valid URL", function (a, b) {
        return!b || f.test(b)
    }), g.fn(":number", "Please enter a numeric value.", function (a, b) {
        return c.test(b)
    }), g.fn("[max]", "Please enter a value no larger than $1", function (a, b) {
        if (b === "" || d && a.is(":date"))return!0;
        var c = a.attr("max");
        return parseFloat(b) <= parseFloat(c) ? !0 : [c]
    }), g.fn("[min]", "Please enter a value of at least $1", function (a, b) {
        if (b === "" || d && a.is(":date"))return!0;
        var c = a.attr("min");
        return parseFloat(b) >= parseFloat(c) ? !0 : [c]
    }), g.fn("[required]", "Please complete this mandatory field.", function (a, b) {
        if (a.is(":checkbox"))return a.is(":checked");
        return b
    }), g.fn("[pattern]", function (a, b) {
        return b === "" || (new RegExp("^" + a.attr("pattern") + "$")).test(b)
    }), g.fn(":radio", "Please select an option.", function (b) {
        var c = !1, d = a("[name='" + b.attr("name") + "']").each(function (b, d) {
            a(d).is(":checked") && (c = !0)
        });
        return c ? !0 : !1
    });
    function l(b, c, e) {
        var f = this, i = c.add(f);
        b = b.not(":button, :image, :reset, :submit"), c.attr("novalidate", "novalidate");
        function l(b, c, d) {
            if (e.grouped || !b.length) {
                var f;
                if (d === !1 || a.isArray(d)) {
                    f = g.messages[c.key || c] || g.messages["*"], f = f[e.lang] || g.messages["*"].en;
                    var h = f.match(/\$\d/g);
                    h && a.isArray(d) && a.each(h, function (a) {
                        f = f.replace(this, d[a])
                    })
                } else f = d[e.lang] || d;
                b.push(f)
            }
        }

        a.extend(f, {getConf:function () {
            return e
        }, getForm:function () {
            return c
        }, getInputs:function () {
            return b
        }, reflow:function () {
            b.each(function () {
                var b = a(this), c = b.data("msg.el");
                if (c) {
                    var d = h(b, c, e);
                    c.css({top:d.top, left:d.left})
                }
            });
            return f
        }, invalidate:function (c, d) {
            if (!d) {
                var g = [];
                a.each(c, function (a, c) {
                    var d = b.filter("[name='" + a + "']");
                    d.length && (d.trigger("OI", [c]), g.push({input:d, messages:[c]}))
                }), c = g, d = a.Event()
            }
            d.type = "onFail", i.trigger(d, [c]), d.isDefaultPrevented() || k[e.effect][0].call(f, c, d);
            return f
        }, reset:function (c) {
            c = c || b, c.removeClass(e.errorClass).each(function () {
                var b = a(this).data("msg.el");
                b && (b.remove(), a(this).data("msg.el", null))
            }).off(e.errorInputEvent + ".v");
            return f
        }, destroy:function () {
            c.off(e.formEvent + ".V reset.V"), b.off(e.inputEvent + ".V change.V");
            return f.reset()
        }, checkValidity:function (c, g) {
            c = c || b, c = c.not(":disabled");
            var h = {};
            c = c.filter(function () {
                var b = a(this).attr("name");
                if (!h[b]) {
                    h[b] = !0;
                    return a(this)
                }
            });
            if (!c.length)return!0;
            g = g || a.Event(), g.type = "onBeforeValidate", i.trigger(g, [c]);
            if (g.isDefaultPrevented())return g.result;
            var m = [];
            c.each(function () {
                var b = [], c = a(this).data("messages", b), h = d && c.is(":date") ? "onHide.v" : e.errorInputEvent + ".v";
                c.off(h), a.each(j, function () {
                    var a = this, d = a[0];
                    if (c.filter(d).length) {
                        var h = a[1].call(f, c, c.val());
                        if (h !== !0) {
                            g.type = "onBeforeFail", i.trigger(g, [c, d]);
                            if (g.isDefaultPrevented())return!1;
                            var j = c.attr(e.messageAttr);
                            if (j) {
                                b = [j];
                                return!1
                            }
                            l(b, d, h)
                        }
                    }
                }), b.length && (m.push({input:c, messages:b}), c.trigger("OI", [b]), e.errorInputEvent && c.on(h, function (a) {
                    f.checkValidity(c, a)
                }));
                if (e.singleError && m.length)return!1
            });
            var n = k[e.effect];
            if (!n)throw"Validator: cannot find effect \"" + e.effect + "\"";
            if (m.length) {
                f.invalidate(m, g);
                return!1
            }
            n[1].call(f, c, g), g.type = "onSuccess", i.trigger(g, [c]), c.off(e.errorInputEvent + ".v");
            return!0
        }}), a.each("onBeforeValidate,onBeforeFail,onFail,onSuccess".split(","), function (b, c) {
            a.isFunction(e[c]) && a(f).on(c, e[c]), f[c] = function (b) {
                b && a(f).on(c, b);
                return f
            }
        }), e.formEvent && c.on(e.formEvent + ".V", function (a) {
            if (!f.checkValidity(null, a))return a.preventDefault();
            a.target = c, a.type = e.formEvent
        }), c.on("reset.V", function () {
            f.reset()
        }), b[0] && b[0].validity && b.each(function () {
            this.oninvalid = function () {
                return!1
            }
        }), c[0] && (c[0].checkValidity = f.checkValidity), e.inputEvent && b.on(e.inputEvent + ".V", function (b) {
            f.checkValidity(a(this), b)
        }), b.filter(":checkbox, select").filter("[required]").on("change.V", function (b) {
            var c = a(this);
            (this.checked || c.is("select") && a(this).val()) && k[e.effect][1].call(f, c, b)
        }), b.filter(":radio[required]").on("change.V", function (b) {
            var c = a("[name='" + a(b.srcElement).attr("name") + "']");
            c != null && c.length != 0 && f.checkValidity(c, b)
        }), a(window).resize(function () {
            f.reflow()
        })
    }

    a.fn.validator = function (b) {
        var c = this.data("validator");
        c && (c.destroy(), this.removeData("validator")), b = a.extend(!0, {}, g.conf, b);
        if (this.is("form"))return this.each(function () {
            var d = a(this);
            c = new l(d.find(":input"), d, b), d.data("validator", c)
        });
        c = new l(this, this.eq(0).closest("form"), b);
        return this.data("validator", c)
    }
})(jQuery);
