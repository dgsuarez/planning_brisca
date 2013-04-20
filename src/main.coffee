
series = ['xs','s','m','l','xl','xxl', '∞', '☕']

defer = (f) -> setTimeout(f, 0)

$ ->
  $main = $("#main")
  series.map (value) -> $main.append("<div class='card'>#{value}</div>")
  $main.on "click", ".card", ->
    $this = $(this)
    defer () -> $this.addClass("reveal back")
    $this.css
      height: window.innerHeight + "px"
      width: window.innerWidth + "px"
      "line-height": window.innerHeight + "px"
      "font-size": (window.innerHeight/2) + "px"
    false
  $main.on "click", ".reveal.back", ->
    defer () => $(this).removeClass("back").addClass("front")
    false
  $main.on "click", ".reveal.front", ->
    $this = $(this)
    $this.css
      width: ""
      height:""
      "font-size": ""
      "line-height": ""
    defer () -> $this.removeClass("reveal back front")
    false
