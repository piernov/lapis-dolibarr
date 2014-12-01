return function (login, password)

local client = require "soap.client"
local ns, meth, ent = client.call {
	url = "http://servers.piernov.org/dolibarr/htdocs/webservices/server_other.php",
	soapaction = "http://www.dolibarr.org/ns/#getVersions",
	namespace = "http://www.dolibarr.org/ns/",
	method = "getVersions",
	entries = { {
			tag = "authentication",
			{ tag = "dolibarrkey", "4a85d4781acf1b422ea5ba45db23c8d2" },
			{ tag = "sourceapplication", "Lapis" },
			{ tag = "login", login },
			{ tag = "password", password },
			{ tag = "entity", "" },
	} }
}

local ret, val = pcall(function () return ent[1][1][1] == "OK" end)

if not val then
  return false, {ent[1][1][1], ent[1][1][2]}
elseif not ret then
  return false, {"INTERNAL_ERROR", val}
else
  return true, nil
end

end
