
series = ['xs','s','m','l','xl','xxl', '∞', '☕']

defer = (f) -> setTimeout(f, 0)

$ ->
  $main = $("#main")
  series.map(x) -> $main.append("<div class='card'>#{value}</div>")
  $main.on "tap", ".card", ->
    $this = $(this)
    defer () -> $this.addClass("reveal back")
    $this.animate
      height: window.innerHeight + "px"
      width: window.innerWidth + "px",
        "slow"
    false
  $main.on "swipe", ".reveal.back", ->
    defer () => $(this).removeClass("back").addClass("front")
    false
  $main.on "tap", ".reveal.front", ->
    $this = $(this)
    $this.animate
      width: ""
      height:"",
        "slow"
    defer () -> $this.removeClass("reveal back front")
    false
