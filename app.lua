local lapis = require("lapis")
do
  local _parent_0 = lapis.Application
  local _base_0 = {
    layout = require("views.common_layout"),
    ["/"] = function(self)
      return {
        redirect_to = tostring(self:url_for("index")) .. "Home"
      }
    end,
    [{
      index = "/:page_name"
    }] = function(self)
      if self.params.page_name == "Register" and self.params.login and self.params.password and self.params.email then
        self.create_thirdparty_success, self.create_thirdparty = require("create_thirdparty")(self.params.login, self.params.password, self.params.email)
      elseif self.params.login and self.params.password then
        self.perform_login, self.errmsg = require("perform_login")(self.params.login, self.params.password)
        if self.perform_login then
          self.session.current_user = self.params.login
          self.session.password = self.params.password
          if self.params.page_name == "Login" then
            return {
              redirect_to = tostring(self:url_for("index")) .. "Home"
            }
          end
        end
      elseif self.params.logout == "true" then
        local _ = self.session.hello
        for k in pairs(getmetatable(self.session).__index) do
          self.session[k] = nil
        end
        return {
          redirect_to = tostring(self:url_for("index")) .. tostring(self.params.page_name)
        }
      end
      return {
        render = self.params.page_name
      }
    end,
    [{
      play = "/play/:room/:nickname"
    }] = function(self)
      return self:html(function()
        text("Hello " .. tostring(self.params.nickname) .. ", welcome to the " .. tostring(self.params.room) .. " room.")
        a({
          href = self:url_for("index", "Go home")
        })
        return div({
          id = "game"
        }, function() end)
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
    __name = nil,
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
  return _class_0
end
