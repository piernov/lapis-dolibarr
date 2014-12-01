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
      h1 "User info"
--      @userinfos_table!
      success, items = require("get_user")(@session.current_user, @session.password)
      if success
        div class: "panel panel-info", ->
          div class: "panel-heading", "Your information"
          @userinfos_table items
      else
        div class: "panel panel-danger", ->
          div class: "panel-heading", "Error"
          @userinfos_table items
