/*
The MIT License (MIT)

Copyright (c) 2013 Honza Javorek

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
$(function(){for(var n=[],t=1;t<=6;t++)n.push("h"+t+"[id]");$(n.join(", "),".page-content").each(function(){var n=$(this),t=$("<a/>",{href:"#"+n.attr("id"),"class":"permalink",title:"Permanent Link",text:"#"}),a=$("<span/>",{"class":"permalink-container"});n.append(a),a.append(t)})}),$(function(){$(document).on("click",".tool",function(){var n=$(this).find("a").attr("href");window.location=n})});