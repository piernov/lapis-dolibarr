local html = require("lapis.html")
local DefaultLayout
do
  local _parent_0 = html.Widget
  local _base_0 = {
    content = function(self)
      html_5(function()
        head(function()
          meta({
            charset = "utf-8"
          })
          meta({
            ["http-equiv"] = "X-UA-Compatible",
            content = "IE=edge"
          })
          meta({
            name = "viewport",
            content = "width=device-width, initial-scale=1"
          })
          title(self.title or "Lapis Page")
          link({
            rel = "stylesheet",
            href = "/static/bootstrap.min.css"
          })
          return style(function()
            return raw("\n.popover {\n    background-color: #ff4136 ;\n}\n.popover-content {\n    background-color: white ;\n} \n.popover-title {\n    background-color: #ff4136 ;\n}\n")
          end)
        end)
        return body({
          style = "padding-top: 50px; padding-bottom: 20px;"
        }, function()
          render("views.menu")
          self:content_for("inner")
          script({
            src = "/static/jquery.min.js"
          })
          return script({
            src = "/static/bootstrap.min.js"
          })
        end)
      end)
      if self.errmsg or self.perform_login then
        return script({
          type = "text/javascript"
        }, function()
          return raw("\n\n		$(document).ready(function(){\n			$('.popover-dismiss').popover({trigger: 'focus'}); \n			$('.popover-dismiss').focus();\n			$('.popover-dismiss').on('hidden.bs.popover', function () {\n				$('.popover-dismiss').popover('destroy');\n			})\n		});\n")
        end)
      else
        return div({
          class = "container"
        }, function()
          element("hr")
          return footer(function()
            return p(function()
              return raw("&copy; Company 2014")
            end)
          end)
        end)
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "DefaultLayout",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  DefaultLayout = _class_0
  return _class_0
end
