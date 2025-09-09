Config = {}

Config.Allowed = {
  ["ModelName"] = { 
    "license:",
    "license:"
  }
 -- ["ModelName"] = { 
   -- "license:",
   -- "license:"
  --}
}


Config.BlockIfNotListed = false

Config.Runtime = {
  checkIntervalMs = 700,
  kickIfNoLicense = true,
}

Config.Messages = {
  noDriverAccess = "Nemáš povolení řídit toto vozidlo.",
}
