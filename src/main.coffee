
series = ['xs','s','m','l','xl','xxl', 'oo', 'coffee']

build_card = (value) ->
  $("<div class='card'>").text(value)

defer = (f) -> setTimeout(f, 0)

$ ->
  $main = $("#main")
  series.map(build_card).map (x) -> $main.append(x)
  $main.on "click", ".card", ->
    $this = $(this)
    defer () -> $this.addClass("reveal back")
    $this.height(window.innerHeight).width(window.innerWidth)
    false
  $main.on "click", ".reveal.back", ->
    defer () => $(this).removeClass("back").addClass("front")
    false
  $main.on "click", ".reveal.front", ->
    $this = $(this)
    $this.width("").height("")
    defer () -> $this.removeClass("reveal back front")
    false
