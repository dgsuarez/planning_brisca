
series = ['XS','S','M','L','XL','XXL', '∞', 'LP']

defer = (f) -> setTimeout(f, 0)

addStyleForReveal = ->
  h = window.innerHeight * 0.9
  w = h * 0.75
  style = "div.card.reveal {"
  style += "height: #{h}px;"
  style += "width: #{w}px;"
  style += "line-height: #{h}px;"
  style += "font-size: #{h*0.4}px;"
  style += "}"
  $("head").append("<style>#{style}</style>")

addStyleForGrid = ->
  w = window.innerWidth * 0.20
  h = w * 1.5
  style = "div.card {"
  style += "min-height: #{h}px;"
  style += "line-height: #{h}px;"
  style += "font-size: #{h*0.35}px;"
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
