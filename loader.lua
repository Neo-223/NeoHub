if game.GameId == 7264587281 then
	print("Loading Sniper Duels")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Neo-223/NeoHub/refs/heads/main/Sniper%20Duels.lua"))()
elseif game.GameId == 1335695570 then
	print("Loading Ninja Legends")
loadstring(game:HttpGet("https://raw.githubusercontent.com/Neo-223/NeoHub/refs/heads/main/Ninja%20Legends.lua"))()
else
	print("Unknown game")
	print("GameId:", game.GameId)
    print("Loading Universal")
  	print("Universal is not currently implemented")
end
-- TODO:
-- create more scripts for different games to add to this list.
-- create a scripthub gui 
-- maybe add executor support check ( probably not... but maybe )
