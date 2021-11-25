BetterVoteSystem = {}

include("votesystem_config.lua")

if (SERVER) then
    include('bettervotesystem/sv_helpers.lua')
    include('bettervotesystem/sv_main.lua')
end