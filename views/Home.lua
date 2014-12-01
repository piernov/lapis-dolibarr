local Widget
do
  local _obj_0 = require("lapis.html")
  Widget = _obj_0.Widget
end
local Home
do
  local _parent_0 = Widget
  local _base_0 = {
    content = function(self)
      div({
        class = "jumbotron"
      }, function()
        return div({
          class = "container"
        }, function()
          h1("Hello, world!")
          p("This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.")
          return p(function()
            return a({
              class = "btn btn-primary btn-lg",
              role = "button"
            }, function()
              return raw("Learn more &raquo;")
            end)
          end)
        end)
      end)
      return div({
        class = "container"
      }, function()
        return div({
          class = "row"
        }, function()
          div({
            class = "col-md-4"
          }, function()
            h2("Heading")
            p("Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.")
            return p(function()
              return a({
                class = "btn btn-default",
                href = "#",
                role = "button"
              }, function()
                return raw("View details &raquo;")
              end)
            end)
          end)
          div({
            class = "col-md-4"
          }, function()
            h2("Heading")
            p("Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.")
            return p(function()
              return a({
                class = "btn btn-default",
                href = "#",
                role = "button"
              }, function()
                return raw("View details &raquo;")
              end)
            end)
          end)
          return div({
            class = "col-md-4"
          }, function()
            h2("Heading")
            p("Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.")
            return p(function()
              return a({
                class = "btn btn-default",
                href = "#",
                role = "button"
              }, function()
                return raw("View details &raquo;")
              end)
            end)
          end)
        end)
      end)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Home",
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
  Home = _class_0
  return _class_0
end
