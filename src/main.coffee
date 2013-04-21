
series = ['xs','s','m','l','xl','xxl', '∞', 'LP']

defer = (f) -> setTimeout(f, 0)

addStyleForReveal = ->
  w = window.innerWidth * 0.8
  h = window.innerHeight * 0.9
  style = "div.reveal {"
  style += "height: #{h}px;"
  style += "width: #{w}px;"
  style += "line-height: #{h}px;"
  style += "margin-left: -#{w/2}px;"
  style += "font-size: #{h*0.8}px;"
  style += "}"
  $("head").append("<style>#{style}</style>")

addStyleForGrid = ->
  w = window.innerWidth * 0.25
  h = w * 1.5
  style = "div.card {"
  style += "min-height: #{h}px;"
  style += "min-width: #{w}px;"
  style += "line-height: #{h}px;"
  style += "font-size: #{h*0.5}px;"
  style += "}"
  $("head").append("<style>#{style}</style>")


$ ->
  addStyleForReveal()
  addStyleForGrid()
  $main = $("#main")
  series.map (value) -> $main.append("<div class='card'>#{value}</div>")
  $main.on "click", ".card", ->
    $this = $(this)
    $(".card").addClass("hidden")
    $this.removeClass("hidden")
    defer () -> $this.addClass("reveal back")
    false
  $main.on "click", ".reveal.back", ->
    defer () => $(this).removeClass("back").addClass("front")
    false
  $main.on "click", ".reveal.front", ->
    $this = $(this)
    $(".card").removeClass("hidden")
    defer () -> $this.removeClass("reveal back front")
    false
