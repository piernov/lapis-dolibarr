html = require "lapis.html"

class DefaultLayout extends html.Widget
  content: =>
    html_5 ->
      head ->
        meta charset: "utf-8"
        meta ["http-equiv"]: "X-UA-Compatible", content: "IE=edge"
        meta name: "viewport", content: "width=device-width, initial-scale=1"
        title @title or "Lapis Page"
--        link rel: "stylesheet", href: "//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"

        link rel: "stylesheet", href: "/static/bootstrap.min.css"

        style -> raw "
.popover {
    background-color: #ff4136 ;
}
.popover-content {
    background-color: white ;
} 
.popover-title {
    background-color: #ff4136 ;
}
"
      body style: "padding-top: 50px; padding-bottom: 20px;", ->
        render "views.menu"
        @content_for "inner"
--        script src: "https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"
--        script src: "//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"

        script src: "/static/jquery.min.js"
        script src: "/static/bootstrap.min.js"

	if @errmsg or @perform_login
          script type: "text/javascript", -> raw "\n
		$(document).ready(function(){
			$('.popover-dismiss').popover({trigger: 'focus'}); 
			$('.popover-dismiss').focus();
			$('.popover-dismiss').on('hidden.bs.popover', function () {
				$('.popover-dismiss').popover('destroy');
			})
		});\n"
        else
        div class: "container", ->
          element "hr"

          footer ->
            p -> raw "&copy; Company 2014"

