
series = ['xs','s','m','l','xl','xxl', 'oo', 'coffee']

build_card = (value) ->
  $("<div class='card inactive'>").text(value)

$ ->
  $main = $("#main")
  series.map(build_card).map (x) -> $main.append(x)
  $main.on "click", ".card", ->
    $reveal = $("<div class='reveal back'>").text($(this).text())
    $reveal.height(window.innerHeight).width(window.innerWidth)
    $main.append($reveal)
    false
  $main.on "click", ".reveal.back", ->
    setTimeout (() => $(this).removeClass("back").addClass("front")), 0
    false
  $main.on "click", ".reveal.front", ->
    console.log "que si que no"
    $(this).remove()
    false
