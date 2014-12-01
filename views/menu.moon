import Widget from require "lapis.html"

class MyHelpers
  menu_items: (items) =>
    for item in *items
      if item == @params.page_name then
        li class: "active", -> a href: "/#{item}", item
      else
        li -> a href: "/#{item}", item

class Menu extends Widget
  @include MyHelpers

  content: =>
    div class: "navbar navbar-inverse navbar-fixed-top", role: "navigation", ->
      div class: "container", ->
        div class: "navbar-header", ->
          button type: "button", class: "navbar-toggle", ["data-toggle"]: "collapse", ["data-target"]: ".navbar-collapse", ->
            span class: "sr-only", "Toggle navigation"
            span class: "icon-bar"
            span class: "icon-bar"
            span class: "icon-bar"
          a class: "navbar-brand", href: "/User", @session.current_user
        div class: "collapse navbar-collapse", ->
          ul class: "nav navbar-nav", ->
            @menu_items {"Home", "About", "Contact"}
            @session.hello
            if @session.current_user 
              form class: "navbar-form navbar-right", role: "form", method: "post", ->
                input type: "hidden", name: "logout", value: "true"
                if @perform_login
                  button type: "submit", class: "btn btn-danger popover-dismiss", ["data-toggle"]: "popover", title: "Logged in", ["data-content"]: "You successfully logged in",  "Logout"
                else
                  button type: "submit", class: "btn btn-danger", "Logout"
            else
              @menu_items {"Register"}
              form class: "navbar-form navbar-right", role: "form", method: "post", ->
                div class: "form-group", ->
                  input type: "text", name: "login", placeholder: "Username", class: "form-control", required: true
                div class: "form-group", ->
                  input type: "password", name: "password", placeholder: "Password", class: "form-control", required: true
                if @errmsg
                  button type: "submit", class: "btn btn-success popover-dismiss", ["data-toggle"]: "popover", title: @errmsg[1], ["data-content"]: @errmsg[2], "Sign in"
                else
                  button type: "submit", class: "btn btn-info", "Sign in"
