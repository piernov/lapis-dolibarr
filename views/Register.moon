import Widget from require "lapis.html"

class MyHelpers
  userinfos_table: (items) =>

--    div class: "panel-body", ->
--      p ->

      element "table",  class: "table table-striped table-bordered table-hover", ->
        for key, value in pairs items
          tr ->
            td key
            td value

class Home extends Widget
  @include MyHelpers
  content: =>
    div class: "container", ->
      h1 "Register"
      if @create_thirdparty
        if @create_thirdparty_success
          div class: "panel panel-info", ->
            div class: "panel-heading", "Your information"
            @userinfos_table @create_thirdparty
        else
          div class: "panel panel-danger", ->
            div class: "panel-heading", "Error"
            @userinfos_table @create_thirdparty
      else
        div class: "row", ->
          div class: "col-sm-6 col-md-4 col-md-offset-4", ->
            h1 class: "text-center login-title", "Sign in to continue to Bootsnipp"
            div class: "account-wall", ->
              img src: "https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
              form class: "form-signin", method: "post",  ->
                input type: "text", class: "form-control", placeholder: "Username", name: "login", required: true, autofocus: true
                input type: "password", class: "form-control", placeholder: "Password", name: "password", required: true
                input type: "password", class: "form-control", placeholder: "Password confirmation", name: "password-confirm", required: true
                input type: "text", class: "form-control", placeholder: "Email", name: "email", required: true, autofocus: true
                label class: "checkbox pull-left", ->
                  input type: "checkbox", name: "accept", value: "accept"
                  text "Accept"
                button class: "btn btn-lg btn-primary btn-block", type: "submit", "Sign in"
                a href: "#", class: "pull-right need-help", "Need help?"
              a href: "/Login", class: "text-center new-account", "Already have an account?"
