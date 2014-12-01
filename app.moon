lapis = require "lapis"

class extends lapis.Application
  layout: require "views.common_layout"

  "/": =>
    redirect_to: "#{@url_for "index"}Home"

  [index: "/:page_name"]: =>
    if @params.page_name == "Register" and @params.login and @params.password and @params.email
      @create_thirdparty_success, @create_thirdparty = require("create_thirdparty")(@params.login, @params.password, @params.email)
    elseif @params.login and @params.password
      @perform_login, @errmsg = require("perform_login")(@params.login, @params.password)
      if @perform_login
        @session.current_user = @params.login
        @session.password = @params.password
        if @params.page_name == "Login"
          return redirect_to: "#{@url_for "index"}Home"
    elseif @params.logout == "true"
      @session.hello
      for k in pairs getmetatable(@session).__index
        @session[k] = nil
      return redirect_to: "#{@url_for "index"}#{@params.page_name}"
    render: @params.page_name

  [play: "/play/:room/:nickname"]: =>
    @html ->
      text "Hello #{@params.nickname}, welcome to the #{@params.room} room."
      a href: @url_for "index", "Go home"

      div id: "game", ->
        
