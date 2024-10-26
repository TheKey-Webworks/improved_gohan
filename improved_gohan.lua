print("Improved V1.2")

local p = game.Players.LocalPlayer
local qg = game.workspace.Others.NPCs["Kid Nohag"]
local events = game.ReplicatedStorage.Package.Events
local pd = game.ReplicatedStorage.Datas[p.UserId]


coroutine.wrap(function() 
    while task.wait() do
        for i = 1, 4 do
            events.p:FireServer("Blacknwhite27", i)
        end
    end
end)()

coroutine.wrap(function()
    while task.wait(5) do
    local clockTime = game.Lighting.ClockTime;
    print("la hora es "..clockTime)
    if (clockTime > 0 and clockTime < 12) then
        events.TP:InvokeServer("Earth")
    end
    end
end)()

while task.wait(0.1) do  -- Reduce la espera para mejorar la responsividad
    
    local clockTime = game.Lighting.ClockTime;
    


    if _G.rebirth then
       events.reb:InvokeServer()
    end

    local _, qq = pcall(function() 
        if pd.Quest.Value == "" then
            -- Mueve el personaje hacia la posición de Kid Nohag
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                p.Character.HumanoidRootPart.CFrame = qg.HumanoidRootPart.CFrame
                print("Moviendo a Kid Nohag") -- Mensaje de depuración
                events.Qaction:InvokeServer(qg)
                task.wait(0.5) -- Esperar un poco para permitir que pd.Quest.Value se actualice
            end
        end

        task.wait()

        return pd.Quest.Value
    end)

    if (qq == "Kid Nohag") then
        pcall(function() 
            p.Character.HumanoidRootPart.CFrame = workspace.Living:FindFirstChild("Kid Nohag").HumanoidRootPart.CFrame
            task.wait()
        end)
    end
end
