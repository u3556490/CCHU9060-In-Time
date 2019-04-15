# In Time (Prototype): Readme
## HKU Common Core CCHU9060 Project Group 11 "Software on Demand"
A game for the Android platform (ultimately) about the city of Hong Kong after December 1941. This is a prototype made with Defold.

## Section 1: Installation Guide
---
  The installation files are located in the source folder at _/test_build_. For the Android version, the APK is located at _/test_build/armv7-android/In Time_. For the Windows version, which is guaranteed to be able to work, is at _/test_build/x86_64-win32/In Time._

### Android
  > Note that it is recommended to uninstall the old version of the app, 
if any, before installing/updating the app.  

  The app is installed via the APK directly. The log files of the game are saved at _/storage/emulated/0/Android/data/com.sodgroup11.debug/files/log.txt_ in the Android file system. To start the game, tap the icon of it in your apps list.
### Windows (64 bit, x86-64)
  The Windows version does not require special installation procedures either. The whole folder should be copied and pasted to your desired location and the game is started by double clicking "In Time.exe". 

## Section 2: Contents, Gameplay and Usage Guide
---
  Due to time constraints, only the following features (an exhaustive list) are completed in this prototype:  
  - A main menu, from which one may navigate to other screens or exit the game.  
  - A prologue and the first stage of the game.  
  - Background music controller.  
  
  The protagonist is assumed to be called "George" and is of the masculine human gender.  
    
#### Main Menu
  On the main menu, the screen one sees when the game finishes loading, there exist:  
  - Three green buttons  
  - A logo of the game and the background.  
  
  The "New" button is (as we had once wished) used to set up a new game. For the time being, this functionality is sacrificed. Clicking the button will only lead you to the prologue, in which the game's background story is introduced to you. The "Load" button does not load a specific save game, either. Clicking it brings you to the first stage of the game, which is an RPG stage. Last but not the least, the "Quit" button terminates the game.    

#### Scenes
  Once you are inside the game (be it the prologue or the 1st stage), you will face one of the following screens:
  * A "narration" type screen.  
    There is a background (may be black or may not be) and a text below. Click on the text/the transparent background of the text to continue, as if you are using a slideshow software.  
  * A "one-speaker" type screen.  
    The layout and controls are identical with the "narration" type. The only difference is that the speaker of the line of text is shown on the left, with his/her name labelled below.  
  * A "MC" type screen, where MC stands for multiple-choice.  
    The screen consists of a background and several buttons. On the buttons are text labels (which might spill out of the button box due to their lengths, but that is no issue). At this point, the player is prompted to pick _ONE_ of the options (buttons) by clicking the desired one.  
  
  The game begins with the **_prologue_**.  
  
  You are offered with the choice to work for a gang. If you choose not to, you lose the game and are returned to the title screen (main menu). If you choose to, you are consider to have "won" (or more precisely, "passed") the stage. You may proceed to stage 1 head on or return (in this case, to main menu).  
  
  In **_stage 1_**, the player is first asked to join the gang. If he refuses, he loses the game and returns to the main menu. Otherwise, he will be enlisted and offered his first equipment. Choosing "Crescent Blade" "loses" (or makes one "fail to pass") the stage. The other choices only differ slightly: having "worker clothes" provide a 10% buff in the ensuing gameplay and "knife" will give the player a bayonet as a part of the reward upon passing the stage.  
  
  Next, the player is told to go to Tai Koo Dockyard and  
  - get in contact with comrades, i.e. gang members, there or  
  - persuade workers to join the effort of delaying works at the dockyard.  
  
  The player will have to choose the way to enter (where only "Sneak" will work) and then his next action inside. Choosing to "Escape" is considered a failure, but a base reward for "having at least sneaked in" would be given. Choosing to seek the comrade will once again offer player with choices of strategies, where only "Observe" will prevail. Having successfully found the comrade provides another 10% buff. No matter the outcome the attempt to find the comrade turns out to be, the player will have the options to "Escape", try again or proceed to find workers, just like when he first managed to sneak in. Persuasion of workers functions in the following steps:  
  1. The player approaches one and he/she states his/her concerns discouraging him/her from joining.  
  2. The player will choose a response from 4 randomly generated ones to refute it.  
  3. Whatever response increases a score "persuasion" (which is invisible to the player) by a small amount. If the response can effectively refute the concern, the increment will be larger. Yet, not all possible pairs of "correct response" and "concerns" are encoded into the game at this point.  
  4. If the player chooses to threaten the safety of the worker, the mission and the persuasion immediately fails.  
  5. The worker puts forward another concern. The loop of these steps iterates five times.  
  
  If the persuasion score is >= 100%, the attempt is a success and the player's reward will be greater. Otherwise, only the base reward is given. The item "worker clothes" and success in finding the comrade increases the score by 0.1 (10%) each.  
  Upon successfully passing the 1st stage, the player may continue (which is not available) or return.  

#### Common QnA

Q: The return button responds slowly/The controls respond slowly.  
A: Be patient and if you are not, try hitting it again.

Q: The background music is disappointing.  
A: I know.

Q: The game does not return to main menu and is stuck at a black screen./The game proceeds to the 1st stage but things from the prologue do not disappear and breaks the game./On Android some dialogue lines and MCs are missing and the game comes to a halt.  
A: We know. Please see Known Issues section.

Q: The lack of quality and low level of completion of this game prototype is a torture to my aesthetics.  
A: We know.

Q: Könnten Sie bitte diesen Spiel auf Deutsch doch herstellen?  
A: Nein, leider nicht.

## Section 3: Technical Details
---
#### Source Code
  All the game's source code could be found at https://github.com/u3556490/CCHU9060-In-Time/. The game scripts and level dialog scripts are all written in lua, despite the potentially non-lua extensions. The following is the hierarchy of the source code folder and the corresponding contents:
  
  * assets        : Game assets  
    * fonts       : The fonts this game uses are here.  
    * gfx         : Graphics
      * backgrounds     : Background images  
      * chars           : Characters images  
        * huebsch       : Original images of the chars.  
        * wunderbar     : Original images but cut into frames with one face each only.  
        - \*.atlas       : Sets of images of characters.
      * common-gui      : Images for the GUI, never used.  
      * defold-logos    : Logos of the game engine. Never used. 
        * PNG           : Actual images.
      * logos and splash: Images intended to use in splash screens. These include the group logo and the game logo.  
    * sfx/music   : The background music (ogg) of the game are here. 
  * input         : Contains the input binding file. 
  * levels        : Contains the files of the stages.  
    * gui            : Contains the files about GUI layouts and their control scripts.  
    - prologue.*     : The files regarding the prologue. The script is the control logic and the lua file is the dialogue lines.  
    - stage01.*      : The files regarding the first stage.  
  * main          : The remainder of the game's files.  
    * title             : Contains GUI layout and control scripts of the title screen (main menu).  
    - alexa.*           : Background music controller which is never fully implemented due to technical limitations of Defold itself.  
    - main.collection   : A container of game materials.  
    - screeninit.script : The script to initialize the screens and their handler.  
    - certificate.pem   : The certificate used to sign the Android bundle.  
    - key.pk8           : See above  
    - CCHU9060.decrepated.zip : a file holding the things we discarded.
    
  One should be fully aware that the game's programming turned into a 
haste in the final two weeks and hence the codes are not 
performance optimized nor commented.

#### Known Issues

1. Slow response on screen changing. Sometimes a second click is needed to have it respond.

2. On Android some lines and MCs are skipped. At some point the game then hangs.

## Section 4: Credits
---
Game engine: Defold  
Defold libraries used: delay (Defold Timer), Monarch, Gooey by britzl and Rendercam by rgrams. 
Fonts and UI graphics by Buch and Pix3M on OpenGameArt.
Background images used:  
- 舊式茶樓檯凳  
http://www.chu66727266.com/index.php?pagePreview=1&p=8_5

- 東區 - 太古船塢  
https://snappy.collaction.hk/op/236

- street  
http://hkhistory.etvonline.hk/2015/ep1.php
https://snappy.collaction.hk/op/473
https://kknews.cc/travel/4qj9kb3.html
https://theinitium.com/article/20151017-culture-feature-photo03/
http://oceandeeop3000.blogspot.com/2015/04/

Sheets of the background music will be available on the following YouTube channel soon:  
EINEP at https://www.youtube.com/channel/UCDB9B6Z7fSib_vdYzVs2HlQ
