BetterVoteSystem.Print = function (msg)
    print(os.date("%H:%M:%S", os.time()).." - [Better Vote System] "..msg)
end

BetterVoteSystem.httpError = function (error)
    BetterVoteSystem.Print("Web request failed")
    BetterVoteSystem.Print("Error details: " .. error)
end

BetterVoteSystem.GiveReward = function (ply)
    if BetterVoteSystem.RewardOption == "darkrp" then
        ply:addMoney(BetterVoteSystem.RewardAmount)
        local message = string.Replace(BetterVoteSystem.RewardMessage, "%amount%", BetterVoteSystem.RewardAmount)
        ply:ChatPrint(BetterVoteSystem.Prefix .. message)
    elseif BetterVoteSystem.RewardOption == "pointshop" then
        ply:PS_GivePoints(BetterVoteSystem.RewardAmount)
        local message = string.Replace(BetterVoteSystem.RewardMessage, "%amount%", BetterVoteSystem.RewardAmount)
        ply:ChatPrint(BetterVoteSystem.Prefix .. message)
    elseif BetterVoteSystem.RewardOption == "pointshop2" then
        local message = string.Replace(BetterVoteSystem.RewardMessage, "%amount%", BetterVoteSystem.RewardAmount)
        ply:PS2_AddStandardPoints(BetterVoteSystem.RewardAmount, message)
    else
        BetterVoteSystem.Print('The message option '..BetterVoteSystem.RewardOption..' is currently not supported.')
    end
end