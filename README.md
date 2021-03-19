# cadvanced_integration
A repository containing example code for integrating with the CADvanced resource.

## Accessing CADvanced state
The MDT in CADvanced uses a lot of state, below is a list of all the state it knows about:
| State property name | Description |
|---------------------|-------------|
| call_grades | All the defined call grades |
| call_incidents | All the defined call incidents |
| call_types | All the defined call types |
| calls | All the defined calls |
| charges | All the defined charges |
| citizen_markers | All the defined citizen markers |
| citizens | All the defined citizens | for all users |
| locations | All the defined locations |
| unit_states | All the defined unit states |
| unit_types | All the defined unit types |
| units | All the defined units | active and inactive | 
| user_locations | All the locations of current users |
| user_ranks | All the defined user ranks |
| user_units | User -> unit assignments |
| users | All active users |
| vehicle_markers | All the defined vehicle markers |
| vehicle_models | All the defined vehicles |
| whitelist | All the whitelisted users |

It is possible for your resource to read this state. If, for example, you wanted to use the list of officers in your resource, you could access that by getting the table of all active users, then filter by those with a `__typename` of `Officer`, e.g.
```lua
local officers = {}
local users = exports.cadvanced_mdt:state_get("users") --Get a table containing all active users
for i, user in ipairs(users) do --Loop through the table of users
  if (user.character and user.character.__typename == 'Officer') then --If the current user has an Officer character
    table.insert(officers, user.character) ---Add them to the "officers" table
  end
end
```

## Example code

### fxmanifest.lua

This is standard, with the exception of one line:
```
dependency "cadvanced_mdt"
```
This states that this resource is dependent on the `cadvanced_mdt` resource ([Documented here](https://docs.fivem.net/docs/scripting-reference/resource-manifest/resource-manifest/#dependency))

### main.lua
The example in `server/main.lua` accesses the `users` state table, then uses a utility function in `server/utils.lua` to dump it to the console. The only relevant code is in `main.lua`, the functions in `utils.lua` are only to allow us to print the output in a readable form.

