local player = game.getPlayer()
local option = nil
local proceed = false
game.play("hk2step")
game.setLayout("narration", {bg = "teahouse2"})

--Anfang
game.say("You arrive at the tea house. The gangster is already there.")
game.setLayout("one_speaker", {bg = "teahouse2"})
game.setSpeaker("gangster1","gangster12", "Gangster")
game.say("\"Oh, you're already here! What's your name?\"")
game.setSpeaker("protagonist","protagonist2", player.name)
game.say(player["name"])
game.setSpeaker("gangster1","gangster12", "Gangster")
game.say("Good. Before I welcome you to the anti-Japanese effort, I advise you join our gang first.")
game.setLayout("mc", {bg = "teahouse2", choices = {"Why not?", "No thanks."}})
option = game.getOption()
if (option == "No thanks.") then
	game.setLayout("narration", {bg = "teahouse2"})
	game.play("lose")
	game.say("You chose not to.\nYou were rejected from the gang.")
	game.done(game.RETURN_FAIL)
elseif (option == "Why not?") then
	game.setLayout("one_speaker", {bg = "teahouse2"})
	game.setSpeaker("gangster1","gangster12", "Gangster")
	game.say("\"Brilliant!\"")
end
game.setLayout("narration", {bg = "street003"})
game.say("Later that day u joined the gang at their secret meeting hall.")
game.say("You received a tattoo. It looked like a dragon.")
--
game.setLayout("one_speaker", {bg = "teahouse2"})
game.setSpeaker("gangster1","gangster12", "Gangster")
game.say("\"Very good. Newcomer! You have a new mission to complete!\"")
game.say("\"Don't worry, there will be help along the way.\"")
game.setSpeaker("protagonist","protagonist1", player.name)
game.say("\"What's that gonna be?\"")
game.setSpeaker("gangster1","gangster12", "Gangster")
game.say("\"You will know, soon.\"")
game.say("\"Pick your equipment now. We won't let you have them all. ONLY ONE!\"")
game.setLayout("mc", {bg = "teahouse2", choices = {"Knife", "Worker clothes", "Crescent Blade"}})
option = game.getOption()
if (option == "Knife") then
	game.setLayout("one_speaker", {bg = "teahouse2"})
	game.setSpeaker("gangster1","gangster12", "Gangster")
	game.say("\"Shiny, tiny. You could have killed a chicken with it!\"")
	game.setSpeaker("protagonist","protagonist4", player.name)
	game.say("\"Oh, chicken? Me?\"")
	game.setLayout("narration", {bg = "teahouse2"})
	game.say("You started playing Five Finger Fillet at a tremendous hihg speed.")
	game.say("So quick that the sound of a wind can be heard.")
	game.say("CLACK CLACK CLACK CLACK CLACK CLACK CLACK CLACK CLACK")
	game.setLayout("one_speaker", {bg = "teahouse2"})
	game.setSpeaker("gangster1","gangster14", "Gangster")
	game.say("(impressed)......")
	game.say("\"Nevermind.\"")
	--[[table.insert(player["equipped"],{  --unimportant
		type = "weapon",
		object = {
			id = "knife",
			type = "weapon",
			range = 1,
			price = 10,
			damage = 10
		}
	})]] 
	game.resume()
elseif option == "Worker clothes" then
	game.setLayout("narration", {bg = "teahouse2"})
	game.say("You chose to wear the worker clothes placed on the desk.")
	game.setLayout("one_speaker", {bg = "teahouse2"})
	game.setSpeaker("gangster1","gangster11", "Gangster")
	game.say("\"Aha! You sneaky genius!\"")
	game.say("\"You can perfectly blend in with the ship mechanics!\"")
	game.setSpeaker("protagonist","protagonist5", player.name)
	game.say("(The size is not quite fit for me, though.)")
	table.insert(player["equipped"],{
		type = "clothing",
		object = {
			id = "worker_clothes",
			type = "clothing",
			price = 20
		}
	})
	game.resume()
elseif (option == "Crescent Blade") then
	game.setLayout("narration", {bg = "teahouse2"})
	game.say("You picked up the Crescent Blade held by the Guan Yu statue in the teahouse.")
	game.say("You swung the blade. It was real damn heavy.")
	game.setLayout("one_speaker", {bg = "teahouse2"})
	game.setSpeaker("gangster1","gangster10", "Gangster")
	game.say("\"Tough guy, huh? *chuckle*\"")
	game.setSpeaker("protagonist","protagonist0", player.name)
	game.say("\"This is good enough for slaying those fascists!\"")
	game.setSpeaker("gangster1","gangster10", "Gangster")
	game.say("\"Good luck with that.\"")
	game.setLayout("narration", {bg = "street004"})
	game.say("You directly walked out of the teahouse.")
	game.say("You were spotted by the military police patrolling on the street in an instant.")
	game.say("You were shoved aside and laughed at immediately.")
	game.say("You wanted to commit suicide so much you had to give up the mission.")
	game.play("lose")
	game.say("~~ You screwed up. ~~\nReward: money -10")
	game.done(game.RETURN_FAIL, -10)
end
--
local obj_get_0 = option
local reward = { money = 0, items = {}, reputation = 0, skills = {}}
local persuasion = 0
if (player.is_equipped("spanner")) then
	persuasion = persuasion + 0.1 -- +10%
end
if (player.is_equipped("worker_clothes")) then
	persuasion = persuasion + 0.1
end
if (player.is_skilled("Gang Speak")) then
	persuasion = persuasion + 0.1
end
--------------------------------------	
game.setLayout("one_speaker", {bg = "teahouse2"})
game.setSpeaker("protagonist","protagonist5", player.name)
game.say("\"I am still not sure what I am going to do.\"")
game.setSpeaker("gangster1","gangster12", "Gangster")
game.say("\"Easy. You know that the best dockyard in Hong Kong is the Taikoo Shipyard, right?\"")
game.setSpeaker("protagonist","protagonist1", player.name)
game.say("\"Yup.\"")
game.setSpeaker("gangster1","gangster12", "Gangster")
game.say("\"Get inside, and tell those workers try to be\nas lazy as possible,so we can delay any Japanese effort.\"")
game.say("\"It is advised that you meet up with our comrades inside first.\"")
game.setSpeaker("protagonist","protagonist2", player.name)
game.say("\"Sounds easy to me.\"")
game.setSpeaker("gangster1","gangster12", "Gangster")
game.say("\"Then go!\"")
--
local function resolve_fail()
	game.setLayout("narration", {bg = "teahouse2"})
	game.play("lose")
	game.say("You slip into the teahouse, hoping that the gangsters don't realise your arrival.")
	game.setLayout("one_speaker", {bg = "teahouse2"})
	game.setSpeaker("gangster1","gangster11", "Gangster")
	game.say("\"How did things go?\"")
	game.setSpeaker("protagonist","protagonist3", player.name)
	game.say("\"......\"")
	game.say("\"I failed.\"")
	game.setSpeaker("gangster1","gangster15", "Gangster")
	game.say("\"......\"")
	game.say("\"Settle our bill and you're fine.\"")
	game.setSpeaker("protagonist","protagonist7", player.name)
	game.say("You therefore lost $10.")
	--RETURN_FAIL
	game.done(game.RETURN_TO_TITLE, reward.money, reward.items, reward.reputation)
end
--------------------------------------------
game.setLayout("narration", {bg = "dockyard"})
game.say("You have arrived at the Taikoo Dockyard.")
game.say("The security guards here seems slightly slighted.")
game.say("What would you do?")
game.setLayout("mc", {bg = "dockyard", choices = {"Sneak", "Give up", "Attack the guard", "Shout"}})
option = game.getOption()
if (option == "Sneak") then
	game.setLayout("narration", {bg = "dockyard"})
	if (obj_get_0 == "Worker clothes") then
		game.say("The guards didn't bother to ask for your identity.")
	else
		game.say("The guards were completely off guard.")
		game.say("You literally walked straight in.")
	end
	game.say("You have successfully blended into the dockyard.")
	game.play("hkblues2")
elseif (option == "Give up") then
	game.setLayout("narration", {bg = "dockyard"})
	game.say("You believe the guards are still too hard to avoid.")
	game.say("You choose to give up the mission.")
	game.say("~~ You screwed up. ~~")
	reward.money = -10
	resolve_fail()
elseif (option == "Attack the guard") then
	game.setLayout("narration", {bg = "dockyard"})
	game.say("You attempt to strangle the guard.")
	game.say("The guard standing in front of the door seems a good target.")
	game.say("He is quite distracted. Alcohol intoxication, perhaps.")
	if (obj_get_0 == "Knife") then
		game.say("You easily get close and stab him in the back")
		game.say("Too bad he still remembers how to scream.")
		game.say("BANG BANG")
		game.say("You are shocked by the sound of gunfire.")
	else 
		game.say("You sneak behind him and choked him with a belt.")
		game.say("Everything seems so successful.")
		game.say("BANG BANG")
		game.say("You are shocked by the sound of gunfire and softened your choke.")
	end
	game.say("Looking behind, there is another guard pointing his pistol at you.")
	game.say("You have been discovered and shot.")
	game.say("You have to abandon this mission as you escape from the scene.")
	game.say("~~ You screwed up. ~~")
	reward.money = -10
	resolve_fail()
elseif (option == "Shout") then
	game.setLayout("narration", {bg = "dockyard"})
	game.say("You shouted loudly in front of the dockyard gate.")
	game.say("\"QUACK QUACK!\"")
	game.say("It is not very effective.")
	game.say("\"MEOW MEOW!\"")
	game.say("Except that you are being seen as a mad man.")
	game.say("~~ You screwed up. ~~")
	reward.money = -10
	resolve_fail()
end
-------------------------
--Set base award
reward.money = 30
reward.items = {
	{
		id = "spanner",
		type = "weapon",
		price = 10,
		range = 1,
		damage = 8
	}
}
if (obj_get_0 == "Knife") then
	--find knife and un-equip 
	table.insert(reward.items, {
		id = "bayonet",
		type = "weapon",
		price = 40,
		range = 2,
		damage = 15
	})
end
reward.reputation = 10
reward.skills = {
	{
		id = "Gang Speak",
		desc = "Speak like a gangster. Frighten people like a gangster."
	}
}
-------------------------------------- functions that below will call
function resolve_success()
	game.setLayout("narration", {bg = "dockyard"})
	game.say("You left the dockyard and went to the teahouse. The gangsters were not aware of you.")
	game.setLayout("one_speaker", {bg = "teahouse2"})
	game.setSpeaker("protagonist","protagonist2", player.name)
	game.say("\"Hey!\"")
	game.setSpeaker("gangster1","gangster14", "Gangster")
	game.say("(Shocked)\n\"What's up? I almost had a heart attack!\"")
	game.setSpeaker("protagonist","protagonist2", player.name)
	game.say("\"It was such an easy task. I thought it would be harder.\"")
	game.say("\"I think even you guys can do it.\"")
	game.setSpeaker("gangster1","gangster15", "Gangster")
	game.say("\"......\"")
	game.setSpeaker("gangster1","gangster12", "Gangster")
	game.say("\"Well done.\"\n\"Go get your reward.\"")
	game.play("win")
	game.setLayout("narration", {bg = nil})
	game.say("~~ Mission successful ~~")
	game.setLayout("mc", {bg = "nil", choices = {"Return", "Proceed to Stage 2"}})
	option = game.getOption()
	if (option == "Return") then
		--game.done(game.RETURN_GOOD, 100)
		game.done(game.RETURN_TO_TITLE, reward.money, reward.items, reward.reputation, reward.skills)
	elseif (option == "Proceed to Stage 2") then
		--game.done(game.PROCEED, 100)
		print("N/A")
	end
end

function look_comrade()
	game.setLayout("narration", {bg = "dockyard"})
	game.say("You remember what the superiors told you.")
	game.say("But how do you find your comrade here?")
	game.setLayout("mc", {bg = "dockyard", choices = {"Shout", "Dance", "Ask manager", "Observe"}})
	option = game.getOption()
	if (option == "Ask manager") then
		game.setLayout("narration", {bg = "dockyard"})
		game.say("Brilliant decision!")
		game.say("The manager is the most relevant person in the dockyard.\nHe should know where your ally is.")
		game.setLayout("one_speaker", {bg = "dockyard"})
		game.setSpeaker("protagonist","protagonist2", player.name)
		game.say("\"Excuse me, manager?\"")
		--game.setSpeaker("manager","???", "Manager")
		game.setSpeaker("engineer","ingenieur3", "Manager")
		game.say("\"Omae Nani wo Shideiru? Hattarake!\"\n(What are you doing? Go back to work!)")
		game.setLayout("narration", {bg = "dockyard"})
		game.say("You can't ask. You just can't.")
	elseif (option == "Dance") then
		game.setLayout("narration", {bg = "dockyard"})
		game.say("You tried to attract the worker's attention by dancing.")
		game.say("Your moves were so astounding that the workers stopped their work.")
		game.setLayout("one_speaker", {bg = "dockyard"})
		--game.setSpeaker("worker","???", "Worker")
		game.setSpeaker("protagonist","protagonist2", player.name)
		game.say("\"His moves must come from hell!\"")
		game.say("(Hellshake! Hellshake! Hellshake!...)")	--AC-bu
		game.setLayout("narration", {bg = "dockyard"})
		game.say("A great success! If you are on a circus tour, you will be the greatest jester!")
		game.say("but......")
		game.say("That's no good way to find your ally. You idiot.")
	elseif (option == "Shout") then
		game.setLayout("narration", {bg = "dockyard"})
		game.say("Outstanding move!")
		game.say(player.name.." used yelling!")
		game.setLayout("one_speaker", {bg = "dockyard"})
		game.setSpeaker("protagonist","protagonist0", player.name)
		game.say("\"QUACK QUACK!\"")
		game.say("\"MIAU MIAU!\"")	--immer wieder, noch einmal!
		game.setLayout("narration", {bg = "dockyard"})
		game.say("It's absolutely ineffective!")
	elseif (option == "Observe") then
		game.setLayout("narration", {bg = "dockyard"})
		game.say("You decided to take a look at the workers and talk with the most special people.")
		game.say("You saw someone putting coals into the furnace.")
		game.say("That guy faked igniting the coal.")
		game.say("Then he picked up the coal and tossed it aside.")
		game.say("Could he be your comrade?")
		game.say("You walked near him and tapped his shoulder three times.")
		game.setLayout("one_speaker", {bg = "dockyard"})
		--game.setSpeaker("comrade","????", "???")
		game.setSpeaker("gangster2","gangster25","???")
		game.say("\"Let's plant the tree together...\"")
		game.setSpeaker("protagonist","protagonist1", player.name)
		game.say("\"for the grave of the Fascists.\"")
		--game.setSpeaker("comrade","????", "Comrade")
		game.setSpeaker("gangster2","gangster22","Comrade")
		game.say("\"Ah, comrade! Good time seeing you!\"")
		game.say("\"Let me tell you about the situations of this dockyard!\"")
		game.say("\"..... ..... .....\"")
		game.setLayout("narration", {bg = "dockyard"})
		game.say("You learnt much useful intelligence regarding the workers.")
		persuasion = persuasion + 0.1
	end
end

function persuade_worker()
	local round = 1
	local NUMBER_OF_ROUNDS = 5
	local NUMBER_OF_OPT = 4
	math.randomseed(1245399200)

	game.setLayout("narration", {bg = "dockyard"})
	game.say("You see a random ship mechanic.\nYou proceed to approach him.")
	game.setLayout("one_speaker", {bg = "dockyard"})
	game.setSpeaker("protagonist","protagonist2", player.name)
	game.say("\"Good day, mate!\"")
	--game.setSpeaker("worker","????", "Worker")
	game.say("\"Good day.\"")
	game.setSpeaker("protagonist","protagonist2", player.name)
	game.say("*whisper* \"Do you like the Japanese?\"")
	--game.setSpeaker("worker","????", "Worker")
	game.say("\"Are you testing me?......of course not.\"")
	game.setSpeaker("protagonist","protagonist4", player.name)
	game.say("\"Have you ever imagined to do something against them?\"")
	--game.setSpeaker("worker","????", "Worker")
	game.say("\"Uhhhhhhhhh\"")
	game.setSpeaker("protagonist","protagonist4", player.name)
	game.say("\"Such as undermining their effort at Tai Koo?\"")
	--game.setSpeaker("worker","????", "Worker")
	game.say("\"UHHHHHHHH\"")
	for round = 1,NUMBER_OF_ROUNDS do
		local responses = {
			"We would Die if we do this.",
			"This act is Useless.",
			"No one is there to Help us.",
			"We are being constantly Monitored.",
			"I will be Fired if I do that!",
			"How can I Trust you?",
			"I don't have a Reason to do so."
		}
		local told = responses[math.random(#responses)]
		--game.setSpeaker("worker","????", "Worker")
		game.say("\""..told.."\"")
		game.setLayout("narration", {bg = "dockyard"})
		game.say("Attempt "..round.." to convince worker.\nYou have "..(NUMBER_OF_ROUNDS-round).." attempts left.")
		--provide mc and retrieve answer
		local sayings = {
			"It is a Patriotic Act.",
			"It is a Revenge.",
			"It will be Effective.",
			"For Justice!",
			"In Secret will we be doing this.",
			"Many have joined and will Help you.",
			"We can give you Reward.",
			"If you refuse, you'll still suffer in tyranny.",
			"If you refuse, I can't guarantee your safety."
		}
		local chosen = {}
		for i = 1,NUMBER_OF_OPT do
			local id = math.random(#sayings)
			table.insert(chosen, sayings[id])
		end
		game.setLayout("mc", {bg = "dockyard", choices = chosen})
		option = game.getOption()
		game.setLayout("one_speaker", {bg = "dockyard"})
		game.setSpeaker("protagonist","protagonist1", player.name)
		game.say("You said: "..option)
		--switch answer
		if option == sayings[9] then	--last one
			--game.setSpeaker("worker","????", "Worker")
			game.say("Are you threatening me? Hell no!")
			game.say("I refuse to work for you!")
			game.setSpeaker("protagonist","protagonist7", player.name)
			game.say("~~ You screwed up. ~~")
			resolve_fail()
		elseif option == sayings[5] then	--secret
			if (told == responses[4]) then
				persuasion = persuasion + 0.25
			else
				persuasion = persuasion + 0.18
			end
		elseif option == sayings[6] then	--help
			if (told == responses[3]) or (told == responses[2]) then
				persuasion = persuasion + 0.25
			else
				persuasion = persuasion + 0.18
			end
		elseif option == sayings[3] then	--effective
			if (told == responses[2]) then
				persuasion = persuasion + 0.25
			else
				persuasion = persuasion + 0.18
			end
		elseif (option == sayings[1])or(option == sayings[2])or(option == sayings[4]) then	--reason:justice/revenge/patriotic/reward
			if (told == responses[7]) then
				persuasion = persuasion + 0.2
			else
				persuasion = persuasion + 0.18
			end
		else
			persuasion = persuasion + 0.18
		end
		--print(persuasion)
		--next round
	end
	--evaluate success
	if (persuasion >= 1) then
		game.setLayout("one_speaker", {bg = "dockyard"})
		--game.setSpeaker("worker","????", "Worker")
		game.say("\"Fine. I will do it for you then.\"")
		game.setSpeaker("protagonist","protagonist2", player.name)
		game.say("\"Thank you very much!\"")
		reward.money = 60
		reward.reputation = 20
		table.insert(reward.items, {
			id = "webley",
			type = "weapon",
			range = 8,
			damage = 50,
			price = 200
		})
	else
		game.setLayout("one_speaker", {bg = "dockyard"})
		--game.setSpeaker("worker","????", "Worker")
		game.say("\"No thanks, better not.\"")
		game.say("\"Maybe next time!\"")
		game.setSpeaker("protagonist","protagonist3", player.name)
		game.say("\"Dammit.\"")
	end
	game.setLayout("narration", {bg = "street002"})
end

function persuade_engineer()
	--player.reputation = 31
	if player.reputation < 30 then
		--wont work 
		game.setLayout("one_speaker", {bg = "dockyard"})
		game.setSpeaker("engineer","ingenieur3", "Engineer")
		game.say("\"Who are you? Go away!\"")
		game.setLayout("narration", {bg = "dockyard"})
		game.say("Seems it doesn't work.\nYou decide to just call it a day.")
	else
		local round = 1
		local NUMBER_OF_ROUNDS = 5
		local NUMBER_OF_OPT = 3
		math.randomseed(868982323)

		game.setLayout("one_speaker", {bg = "dockyard"})
		game.setSpeaker("engineer","ingenieur5", "Engineer")
		game.say("\"Who are you? Go away!\"")
		game.setSpeaker("protagonist","protagonist2", player.name)
		game.say("\"No, no. I'm here to invite you.\"")
		game.setSpeaker("engineer","ingenieur1", "Engineer")
		game.say("\"Nani?\"\n(What?)")
		game.setSpeaker("protagonist","protagonist2", player.name)
		game.say("\"I heard that your superiors are giving you meaningless instructions.\"")
		game.setSpeaker("engineer","ingenieur5", "Engineer")
		game.say("\"......True.\"")
		game.setSpeaker("protagonist","protagonist2", player.name)
		game.say("\"Then, don't you dislike them? Don't you think,\nsomething has to be done to defeat their Fascism?\"")
		game.setSpeaker("engineer","ingenieur5", "Engineer")
		game.say("\".......\"")
		for round = 1,NUMBER_OF_ROUNDS do
			local responses = {
				"Why do I have to help you?",
				"This act is useless.",
				"Isn't it a betrayal of my country?",
				"No one is there to help me.",
				"What if I am exposed?",
				"I could be arrested if I do that!",
				"How can I trust you?",
				"I don't have a reason to do so."
			}
			local told = responses[math.random(#responses)]
			game.setLayout("one_speaker", {bg = "dockyard"})
			game.setSpeaker("engineer","ingenieur5", "Engineer")
			game.say("\""..told.."\"")
			game.setLayout("narration", {bg = "dockyard"})
			game.say("Attempt "..round.." to convince engineer.\nYou have "..(NUMBER_OF_ROUNDS-round).." attempts left.")
			--provide mc and retrieve answer
			local sayings = {
				"Remove fascist! Don’t you love peace?",
				"Don't you dislike the army bakas?",
				"It will be effective.",
				"Patriotism is a social construct. Justice comes first",
				"In secret will we be doing this.",
				"We can help you for instructions and escapes.",
				"We can give you reward.",
				"If you refuse, you'll still suffer in tyranny.",
				"If you refuse, I can't guarantee your safety."
			}
			local chosen = {}
			for i = 1,NUMBER_OF_OPT do
				local id = math.random(#sayings)
				table.insert(chosen, sayings[id])
			end
			game.setLayout("mc", {bg = "dockyard", choices = chosen})
			option = game.getOption()
			game.setLayout("one_speaker", {bg = "dockyard"})
			game.setSpeaker("protagonist","protagonist1", player.name)
			game.say("You said: "..option)
			--switch answer
			if option == sayings[9] then	--last one
				game.setSpeaker("engineer","ingenieur3", "Engineer")
				game.say("Are you threatening me? Hell no!")
				game.say("I refuse to work for you!")
				game.setSpeaker("protagonist","protagonist7", player.name)
				game.say("~~ You screwed up. ~~")
				resolve_fail()
			elseif option == sayings[5] then	--secret
				if (told == responses[4]) or (told == responses[5]) then
					persuasion = persuasion + 0.25
				else
					persuasion = persuasion + 0.15
				end
			elseif option == sayings[6] then	--help
				if (told == responses[3]) or (told == responses[2]) then
					persuasion = persuasion + 0.25
				else
					persuasion = persuasion + 0.15
				end
			elseif option == sayings[3] then	--effective
				if (told == responses[2]) then
					persuasion = persuasion + 0.25
				else
					persuasion = persuasion + 0.15
				end
			elseif (option == sayings[1])or(option == sayings[2])or(option == sayings[4]) then	--reason:justice/revenge/patriotic/reward
				if (told == responses[7]) then
					persuasion = persuasion + 0.2
				else
					persuasion = persuasion + 0.15
				end
			else
				persuasion = persuasion + 0.15
			end
			--print(persuasion)
			--next round
		end
		--evaluate success
		if (persuasion >= 1) then
			game.setLayout("one_speaker", {bg = "dockyard"})
			game.setSpeaker("engineer","ingenieur6", "Engineer")
			game.say("\"Fine. I will do it for you then.\"")
			game.setSpeaker("protagonist","protagonist4", player.name)
			game.say("\"Thank you very much!\"")
			reward.money = 60
			reward.reputation = 20
			table.insert(reward.items, {
				id = "webley",
				type = "weapon",
				range = 8,
				damage = 50,
				price = 200
			})
		else
			game.setLayout("one_speaker", {bg = "dockyard"})
			game.setSpeaker("engineer","ingenieur1", "Engineer")
			game.say("\"No thanks, better not.\"")
			game.say("\"Maybe next time!\"")
			game.setSpeaker("protagonist","protagonist5", player.name)
			game.say("\"Dammit.\"")
		end
		game.setLayout("narration", {bg = "street002"})
	end
end
--------------------------------------
while (not proceed) do
	game.setLayout("narration", {bg = "dockyard"})
	game.say("Your next action is?")
	game.setLayout("mc", {bg = "dockyard", choices = { "Seek workers", "Look for comrade", "Escape" }})
	option = game.getOption()
	if (option == "Look for comrade") then
		look_comrade()
	elseif (option == "Seek workers") then
		proceed = true
		persuade_worker()
	elseif (option == "Escape") then
		proceed = true
		resolve_fail()
	end
end
game.setLayout("narration", {bg = "dockyard"})
game.say("You see a Japanese engineer. Do you attempt to talk to him?")
game.setLayout("mc", {bg = "dockyard", choices = { "Let's try", "Better not"}})
option = game.getOption()
if (option == "Let's try") then
	persuade_engineer()
	resolve_success()
elseif (option == "Better not") then
	resolve_success()
end