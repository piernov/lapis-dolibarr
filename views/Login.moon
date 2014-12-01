import Widget from require "lapis.html"

class Home extends Widget

  content: =>
    if @session.current_user and @perform_login
      div class: "container", ->
        h1 "You're now logged in as #{@session.current_user}"
    else
      div class: "container", ->
        div class: "row", ->
          div class: "col-sm-6 col-md-4 col-md-offset-4", ->
            h1 class: "text-center login-title", "Sign in to continue to Bootsnipp"
            div class: "account-wall", ->
              img src: "https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
              form class: "form-signin", method: "post",  ->
                input type: "text", class: "form-control", placeholder: "Username", name: "login", required: true, autofocus: true
                input type: "password", class: "form-control", placeholder: "Password",name: "password", required: true
                label class: "checkbox pull-left", ->
                  input type: "checkbox", name: "remember", value: "remember-me"
                  text "Remember me"
                button class: "btn btn-lg btn-primary btn-block", type: "submit", "Sign in"
                a href: "#", class: "pull-right need-help", "Need help?"
              a href: "/Register", class: "text-center new-account", "Create an account"
