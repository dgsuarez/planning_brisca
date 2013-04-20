// Generated by CoffeeScript 1.6.1
(function() {
  var build_card, defer, series;

  series = ['xs', 's', 'm', 'l', 'xl', 'xxl', 'oo', 'coffee'];

  build_card = function(value) {
    return $("<div class='card'>").text(value);
  };

  defer = function(f) {
    return setTimeout(f, 0);
  };

  $(function() {
    var $main;
    $main = $("#main");
    series.map(build_card).map(function(x) {
      return $main.append(x);
    });
    $main.on("click", ".card", function() {
      var $this;
      $this = $(this);
      defer(function() {
        return $this.addClass("reveal back");
      });
      $this.height(window.innerHeight).width(window.innerWidth);
      return false;
    });
    $main.on("click", ".reveal.back", function() {
      var _this = this;
      defer(function() {
        return $(_this).removeClass("back").addClass("front");
      });
      return false;
    });
    return $main.on("click", ".reveal.front", function() {
      var $this;
      $this = $(this);
      $this.width("").height("");
      defer(function() {
        return $this.removeClass("reveal back front");
      });
      return false;
    });
  });

}).call(this);
