hook.Add("PostGamemodeLoaded", "BetterVoteSystem_PostGamemodeLoaded", function ()
    if BetterVoteSystem.CheckOnInterval == false then return end

    timer.Create("BetterVoteSystem_CheckVoteInterval", BetterVoteSystem.CheckInterval, 0, function() 
        for k, v in pairs ( player.GetAll() ) do
            http.Fetch('https://gmod-servers.com/api/?object=votes&element=claim&key='..BetterVoteSystem.ServerToken..'&steamid='..v:SteamID64(), function(body, size, headers, code)
                if body != 1 then return end
                http.Fetch('https://gmod-servers.com/api/?action=post&object=votes&element=claim&key='..BetterVoteSystem.ServerToken..'&steamid='..v:SteamID64(), function(body1, size1, headers1, code1)
                    if body1 == 0 then return end
                    
                    BetterVoteSystem.GiveReward(ply)
                end, BetterVoteSystem.httpError)
            end, BetterVoteSystem.httpError)
        end
    end)
end)

hook.Add("PlayerInitialSpawn", "BetterVoteSystem_PlayerInitialSpawn", function(ply, transition)
    http.Fetch('https://gmod-servers.com/api/?object=votes&element=claim&key='..BetterVoteSystem.ServerToken..'&steamid='..ply:SteamID64(), function(body, size, headers, code)
        if body != 1 then return end
        http.Fetch('https://gmod-servers.com/api/?action=post&object=votes&element=claim&key='..BetterVoteSystem.ServerToken..'&steamid='..ply:SteamID64(), function(body1, size1, headers1, code1)
            if body1 == 0 then return end

            BetterVoteSystem.GiveReward(ply)
        end, BetterVoteSystem.httpError)
    end, BetterVoteSystem.httpError)
end)