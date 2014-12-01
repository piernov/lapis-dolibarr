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
      if self.session.current_user and self.perform_login then
        return div({
          class = "container"
        }, function()
          return h1("You're now logged in as " .. tostring(self.session.current_user))
        end)
      else
        return div({
          class = "container"
        }, function()
          return div({
            class = "row"
          }, function()
            return div({
              class = "col-sm-6 col-md-4 col-md-offset-4"
            }, function()
              h1({
                class = "text-center login-title"
              }, "Sign in to continue to Bootsnipp")
              return div({
                class = "account-wall"
              }, function()
                img({
                  src = "https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                })
                form({
                  class = "form-signin",
                  method = "post"
                }, function()
                  input({
                    type = "text",
                    class = "form-control",
                    placeholder = "Username",
                    name = "login",
                    required = true,
                    autofocus = true
                  })
                  input({
                    type = "password",
                    class = "form-control",
                    placeholder = "Password",
                    name = "password",
                    required = true
                  })
                  label({
                    class = "checkbox pull-left"
                  }, function()
                    input({
                      type = "checkbox",
                      name = "remember",
                      value = "remember-me"
                    })
                    return text("Remember me")
                  end)
                  button({
                    class = "btn btn-lg btn-primary btn-block",
                    type = "submit"
                  }, "Sign in")
                  return a({
                    href = "#",
                    class = "pull-right need-help"
                  }, "Need help?")
                end)
                return a({
                  href = "/Register",
                  class = "text-center new-account"
                }, "Create an account")
              end)
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
