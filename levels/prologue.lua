game.setLayout("narration", {bg = "nil"})
game.play("arpeggios1")

--Anfang
game.say("The year was 1941.")
game.say("The Japanese had arrived: A brutal herd from across the Shum Chun River.")
game.say("They took our formidable bunkers and mighty batteries.")
game.say("We had a heroic fortnight, but now it's over.")
--
game.say("They killed our men and raped our women.")
game.say("Many were jailed in concentration camps.")
game.say("They deported people and took our money away.")
game.say("Tyranny skyrocketed. Hong Kong was ruined.")
--
game.say("People hoped to remove the fascist occupants from Hong Kong, or at least prevent them from living comfortably.")
game.say("That was no easy task.")
game.say("They had no Killer Machines.") --cheeky Hong Kong 97 reference?
game.say("They could not wipe out the thousands of fascists overnight. They lacked weapons and personnel to revolt, even food began to run short.")
game.say("Hope dwindled as tyranny intensified.")
--
game.say("Maybe there were secret projects underway to do so anyway.")
game.say("Covert operations to liberate the citizens from the tyranny!")
--
game.setLayout("narration", {bg = "street001"})
game.play("hk2step")
game.say("It was Spring of 1942.")
game.say("You used to be a messenger delivering telegrams around the city.")
game.say("You naturally lost your job as the city 'welcomed' its new owners.")
--
game.say("One day, you were at a tea house. It was a luxury. The guys sitting behind you seemed to be gangsters. You overheard them speaking:")
game.setLayout("one_speaker", {bg = "teahouse2"})
game.resume()
game.setSpeaker("gangster1", "gangster10", "Gangster 1")
game.say("\"Have you heard that the Brits are looking for collaborators here?\"")
game.setSpeaker("gangster2", "gangster26", "Gangster2")
game.say("\"Here in Hong Kong? Don't know. The fascists are looking for them, it is all I know.\"")
game.setSpeaker("gangster1", "gangster15", "Gangster 1")
game.say("\"Dumb head. We've already signed up for it, cause, y'know, down with the Japanese!\"")
game.setSpeaker("gangster2", "gangster27", "Gangster2")
game.say("\"I will never forgive the Japanese! They took my daughter away and I never see her ever again till now!\"")
game.setSpeaker("gangster1", "gangster16", "Gangster 1")
game.say("\"......Then we better start doing something for the Brits.\"")
game.setSpeaker("gangster2", "gangster25", "Gangster2")
game.say("\"Hold up, someone's sittin' behind you. Don't speak up.\"\n\"Huh?\"")
--
game.setLayout("narration", {bg = "teahouse2"})
game.say("A bad boi tapped your back. You turned around.")
game.setLayout("one_speaker", {bg = "teahouse2"})
game.setSpeaker("gangster1", "gangster15", "Gangster 1")
game.say("\"You didn't hear what we just said, did you?\"\n\"......\"")
game.setLayout("mc", {bg = "teahouse2", choices = {"I did.", "Nothing."}})
option = game.getOption()
game.setLayout("one_speaker", {bg = "teahouse2"})
if option == "I did." then
	game.setSpeaker("gangster1", "gangster10", "Gangster 1")
	game.say("\"You've got some balls, huh.\"")
elseif option == "Nothing." then
	game.setSpeaker("gangster1", "gangster12", "Gangster 1")
	game.say("\"Good. But you heard it, didn't ye?\"\n\"......Fine.\"")
end
game.setSpeaker("gangster1", "gangster12", "Gangster 1")
game.say("\"Then, to get away, you better help us do something. Yes or no?\"")
game.setLayout("mc", {bg = "teahouse2", choices = {"Sure.", "But I refuse."}})
option = game.getOption()
game.setLayout("one_speaker", {bg = "teahouse2"})
--
if option == "But I refuse." then
	game.setSpeaker("gangster1", "gangster15", "Gangster 1")
	game.say("\"Good. Did you know why the Queen became the King?\"")
	game.say("\"Why?\"\n\"Cause she's got the balls.\"")
	game.setLayout("narration", {bg = "street001"})
	game.say("The gangstaz continued to chat as if nothing happened.")
	game.say("After you went out, the gangsters pulled you aside and had you thrown into the sea.")
	game.play("lose")
	game.say("You died.")
	game.done(game.RETURN_TO_TITLE)
elseif option == "Sure." then
	game.setSpeaker("gangster1", "gangster10", "Gangster 1")
	game.say("\"......What's your occupation?\"\n\"I used to deliver telegrams.\"")
	game.say("\".......Brilliant. We need one. Are you free Saturday morning?\"")
	game.setSpeaker("protagonist", "protagonist1", player.name)
	game.say("\"Yes?\"")
	game.setSpeaker("gangster1", "gangster12", "Gangster 1")
	game.say("\"See me at this tea house, at ten sharp.\"")
	game.setSpeaker("protagonist", "protagonist1", player.name)
	game.say("\"Aye aye, captain.\"")	--who lives in the pineapple under the sea?
	game.play("win")
	game.setLayout("narration", {bg = "nil"})
	game.say("~~ Prologue complete. ~~\nReward: Money $100")
	game.setLayout("mc", {bg = "nil", choices = {"Return", "Proceed to Stage 1"}})
	option = game.getOption()
	if (option == "Return") then
		game.done(game.RETURN_GOOD, 100)
	elseif (option == "Proceed to Stage 1") then
		game.done(game.PROCEED, 100)
	end
end