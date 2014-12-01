import Widget from require "lapis.html"

class Home extends Widget
  content: =>
    div class: "jumbotron", ->
      div class: "container", ->
        h1 "Hello, world!"
        p "This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique."
        p ->
          a class: "btn btn-primary btn-lg", role: "button", -> raw "Learn more &raquo;"
    div class: "container", ->
      div class: "row", ->
        div class: "col-md-4", ->
          h2 "Heading"
          p "Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui."
          p ->
            a class: "btn btn-default", href: "#", role: "button", -> raw "View details &raquo;"
        div class: "col-md-4", ->
          h2 "Heading"
          p "Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui."
          p ->
            a class: "btn btn-default", href: "#", role: "button", -> raw "View details &raquo;"
        div class: "col-md-4", ->
          h2 "Heading"
          p "Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui."
          p ->
            a class: "btn btn-default", href: "#", role: "button", -> raw "View details &raquo;"
