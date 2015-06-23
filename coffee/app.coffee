ace = require('brace')
require('brace/mode/javascript')
require('brace/theme/monokai')

{getItemAt} = require('./parse.coffee')

test = """
{
  "my": "data",
  "is": [
    {
      "awesome": "right?"
    }
  ]
}
"""

console.log getItemAt(test, 5, 12)

editor = ace.edit('editor')
editor.setTheme 'ace/theme/monokai'
editor.setShowPrintMargin false
editor.getSession().setMode 'ace/mode/json'
editor.getSession().setTabSize 2
editor.getSession().setUseSoftTabs true

document.getElementById('editor').addEventListener 'keyup', ->
  selectionRange = undefined
  startLine = undefined
  endLine = undefined
  content = undefined
  selectionRange = editor.getSelectionRange()
  startLine = selectionRange.start.row
  endLine = selectionRange.end.row
  content = editor.session.getTextRange(selectionRange)
  console.log selectionRange, startLine, endLine, content
