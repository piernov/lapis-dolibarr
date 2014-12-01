local Widget
do
  local _obj_0 = require("lapis.html")
  Widget = _obj_0.Widget
end
local MyHelpers
do
  local _base_0 = {
    menu_items = function(self, items)
      for _index_0 = 1, #items do
        local item = items[_index_0]
        if item == self.params.page_name then
          li({
            class = "active"
          }, function()
            return a({
              href = "/" .. tostring(item)
            }, item)
          end)
        else
          li(function()
            return a({
              href = "/" .. tostring(item)
            }, item)
          end)
        end
      end
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "MyHelpers"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  MyHelpers = _class_0
end
local Menu
do
  local _parent_0 = Widget
  local _base_0 = {
    content = function(self)
      return div({
        class = "navbar navbar-inverse navbar-fixed-top",
        role = "navigation"
      }, function()
        return div({
          class = "container"
        }, function()
          div({
            class = "navbar-header"
          }, function()
            button({
              type = "button",
              class = "navbar-toggle",
              ["data-toggle"] = "collapse",
              ["data-target"] = ".navbar-collapse"
            }, function()
              span({
                class = "sr-only"
              }, "Toggle navigation")
              span({
                class = "icon-bar"
              })
              span({
                class = "icon-bar"
              })
              return span({
                class = "icon-bar"
              })
            end)
            return a({
              class = "navbar-brand",
              href = "/User"
            }, self.session.current_user)
          end)
          return div({
            class = "collapse navbar-collapse"
          }, function()
            return ul({
              class = "nav navbar-nav"
            }, function()
              self:menu_items({
                "Home",
                "About",
                "Contact"
              })
              local _ = self.session.hello
              if self.session.current_user then
                return form({
                  class = "navbar-form navbar-right",
                  role = "form",
                  method = "post"
                }, function()
                  input({
                    type = "hidden",
                    name = "logout",
                    value = "true"
                  })
                  if self.perform_login then
                    return button({
                      type = "submit",
                      class = "btn btn-danger popover-dismiss",
                      ["data-toggle"] = "popover",
                      title = "Logged in",
                      ["data-content"] = "You successfully logged in"
                    }, "Logout")
                  else
                    return button({
                      type = "submit",
                      class = "btn btn-danger"
                    }, "Logout")
                  end
                end)
              else
                self:menu_items({
                  "Register"
                })
                return form({
                  class = "navbar-form navbar-right",
                  role = "form",
                  method = "post"
                }, function()
                  div({
                    class = "form-group"
                  }, function()
                    return input({
                      type = "text",
                      name = "login",
                      placeholder = "Username",
                      class = "form-control",
                      required = true
                    })
                  end)
                  div({
                    class = "form-group"
                  }, function()
                    return input({
                      type = "password",
                      name = "password",
                      placeholder = "Password",
                      class = "form-control",
                      required = true
                    })
                  end)
                  if self.errmsg then
                    return button({
                      type = "submit",
                      class = "btn btn-success popover-dismiss",
                      ["data-toggle"] = "popover",
                      title = self.errmsg[1],
                      ["data-content"] = self.errmsg[2]
                    }, "Sign in")
                  else
                    return button({
                      type = "submit",
                      class = "btn btn-info"
                    }, "Sign in")
                  end
                end)
              end
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
    __name = "Menu",
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
  local self = _class_0
  self:include(MyHelpers)
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Menu = _class_0
  return _class_0
end
