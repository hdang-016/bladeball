getgenv().god = true
while getgenv().god and task.wait() do
    for _,ball in next, workspace.Balls:GetChildren() do
        if ball then
            if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, ball.Position)
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Highlight") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame * CFrame.new(0, 0, (ball.Velocity).Magnitude * -0.5)
                    game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
                end
            end
        end
    end
end

local player = game.Players.LocalPlayer

player.leaderstats.Kills.Changed:Connect(function(ws)
    player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed + 1
    print(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed)
end)



local function onHealthChanged()
    local rand = math.random(1, 2)

    if rand == 1 then
        print("missed due to resolver")
    elseif rand == 2 then
        print("issed due to backtrack failure")
    end
end

if player.Character then
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.HealthChanged:Connect(onHealthChanged)
    end
end

player.CharacterAdded:Connect(function(ch)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.HealthChanged:Connect(onHealthChanged)
    end
end)