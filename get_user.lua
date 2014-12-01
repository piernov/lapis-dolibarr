return function (login, password)

local client = require "soap.client"
local ns, meth, ent = client.call {
	url = "http://servers.piernov.org/dolibarr/htdocs/webservices/server_user.php",
	soapaction = "http://www.dolibarr.org/ns/#getUser",
	namespace = "http://www.dolibarr.org/ns/",
	method = "getUser",
	entries = {
		{
			tag = "authentication",
			{ tag = "dolibarrkey", "4a85d4781acf1b422ea5ba45db23c8d2" },
			{ tag = "sourceapplication", "Lapis" },
			{ tag = "login", login },
			{ tag = "password", password },
			{ tag = "entity", "" },
		},
		{tag = "id", "0"},
		{tag = "ref", login}
	}
}

local userinfos = {}

local ret, val = pcall(function () return ent[1][1][1] == "OK" end)

if not val then
  userinfos[ent[1][1][1]] = ent[1][1][2]
  return false, userinfos
elseif not ret then
  userinfos["INTERNAL_ERROR"] = val
  return false, userinfos
end

  for i, j in ipairs(ent[2]) do
    if not j[1] then
      j[1] = "NULL"
    end

    userinfos[j["tag"]] = j[1]
  end
  
  return true, userinfos

end
