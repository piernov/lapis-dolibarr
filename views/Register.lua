local Widget
do
  local _obj_0 = require("lapis.html")
  Widget = _obj_0.Widget
end
local MyHelpers
do
  local _base_0 = {
    userinfos_table = function(self, items)
      return element("table", {
        class = "table table-striped table-bordered table-hover"
      }, function()
        for key, value in pairs(items) do
          tr(function()
            td(key)
            return td(value)
          end)
        end
      end)
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
local Home
do
  local _parent_0 = Widget
  local _base_0 = {
    content = function(self)
      return div({
        class = "container"
      }, function()
        h1("Register")
        if self.create_thirdparty then
          if self.create_thirdparty_success then
            return div({
              class = "panel panel-info"
            }, function()
              div({
                class = "panel-heading"
              }, "Your information")
              return self:userinfos_table(self.create_thirdparty)
            end)
          else
            return div({
              class = "panel panel-danger"
            }, function()
              div({
                class = "panel-heading"
              }, "Error")
              return self:userinfos_table(self.create_thirdparty)
            end)
          end
        else
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
                  input({
                    type = "password",
                    class = "form-control",
                    placeholder = "Password confirmation",
                    name = "password-confirm",
                    required = true
                  })
                  input({
                    type = "text",
                    class = "form-control",
                    placeholder = "Email",
                    name = "email",
                    required = true,
                    autofocus = true
                  })
                  label({
                    class = "checkbox pull-left"
                  }, function()
                    input({
                      type = "checkbox",
                      name = "accept",
                      value = "accept"
                    })
                    return text("Accept")
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
                  href = "/Login",
                  class = "text-center new-account"
                }, "Already have an account?")
              end)
            end)
          end)
        end
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
  local self = _class_0
  self:include(MyHelpers)
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Home = _class_0
  return _class_0
end
