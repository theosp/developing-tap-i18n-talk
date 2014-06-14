fs = require "fs"

slides = fs.readFileSync "slides", "utf8"

slides = slides.replace /^\/-------\s*(.*)$/gm, "<section><h2>$1</h2>"
slides = slides.replace /^\/-------\s*$/gm, "<section>"
slides = slides.replace /^-------\/\s*$/gm, "</section>"

slides = slides.replace /^\/\*\s*$/gm, "<ul>"
slides = slides.replace /^\*\/\s*$/gm, "</ul>"

slides = slides.replace /^\* (.*)$/gm, "<li>$1</li>"

slides = slides.replace /^\>\>\>\s+(\S+)\s+(\S+)\s+(\S+)/gm, '<img width="$2" height="$3" src="./images/$1">'

slides = slides.replace /^\/#######\s(\S+)$/gm, "$1 <pre><code data-trim contenteditable>"
slides = slides.replace /\/#######\s*$/gm, "<pre><code data-trim contenteditable>"
slides = slides.replace /#######\/\s*$/gm, "</code></pre>"

template = fs.readFileSync "template.html", "utf8"

template = template.replace("|HERE|", slides)

fs.writeFileSync "index.html", template
