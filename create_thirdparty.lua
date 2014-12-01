return function (login, password, email)

local client = require "soap.client"
local ns, meth, ent = client.call {
	url = "http://servers.piernov.org/dolibarr/htdocs/webservices/server_thirdparty.php",
	soapaction = "http://www.dolibarr.org/ns/#createThirdParty",
	namespace = "http://www.dolibarr.org/ns/",
	method = "createThirdParty",
	entries = {
		{
			tag = "authentication",
			{ tag = "dolibarrkey", "4a85d4781acf1b422ea5ba45db23c8d2" },
			{ tag = "sourceapplication", "Lapis" },
			{ tag = "login", "Lapis" },
			{ tag = "password", "tm43zrxs" },

			{ tag = "entity", "" },
		},
		{
			tag = "thirdparty",
			{ tag = "ref", login},
			{ tag = "status", "1"},
			{ tag = "email", email}
		}
	}
}

local userinfos = {}

local ret, val = pcall(function () return ent[1][1] == "OK" end)

if not val then
  userinfos[ent[1][1]] = ent[1][2]
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
