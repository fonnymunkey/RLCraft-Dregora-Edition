
Important Notices:

1. DREGORA WILL NOT GENERATE CORRECTLY IF level-name IS NOT DregoraRL & level-type IS NOT OTG.
2. LOADING UP THE PACK THE FIRST TIME WILL APPEAR AS IF IT FROZE BUT IT DID NOT, GIVE IT SOME TIME TO LOAD UP AND DO NOT EXIT.

=========================

Please set the following in your server.properties files when it generates, for stability and compatibility:

allow-flight=true
difficulty=3
max-tick-time=-1
enable-command-block=true
view-distance=10
level-type=OTG
level-name=DregoraRL

=========================

allow flight needs to be true for things like mounts that fly and fairy ring, or the server will kick players using those.

difficulty needs to be 3 for hard difficulty mode and the difficulty RLCraft is balanced around.

max-tick-time need to be -1 for big structures that generate (AND FOR PREGENNING AS WELL) as these structures take take some time to generate, and this prevents forge from thinking the server crashed and auto shutting it down.

enable-command-block MUST be TRUE for villagers to spawn correctly in generated structures.

view-distance should be 10 for full compatibility, if needed for performance you can lower it to 8 or 6 but this will cause bugs with mob spawning and despawning and should be avoided.

level-type= needs to be set to OTG so OpenTerrainGenerator takes over the default generation.

level-name= needs to be set to DregoraRL for OTG to use DregoraRL to generate the world.

=========================

YOU SHOULD PREGEN YOUR WORLD IF YOU PLAN TO RUN A SERVER WITH MORE THAN 4 PLAYERS:

How to Pre-generate a 20k block radius (Square) world:

Download: https://www.curseforge.com/minecraft/mc-mods/chunkpregenerator/files/3490718
Place that jar in your mods folder (Server mods folder if a server) and verify the chunkpregenerator version is 2.5.1

Run these commands (In console if a server, in game if singleplayer):

/pregen utils setPriority pregenerator
/pregen timepertick 250
/pregen gen startradius square 0 0 b20000

Optionally you can also add a worldborder to prevent people from generating additional chunks and still lagging the server with the following command:
Note: works in diameter so 20.000 in all directions from the center makes for 40.000.

/worldborder set 40000

Once finished generating, restart your game or server and remove the pregenerator mod.

You can additionally use this command, to pause pregen automatically when players are online, if you'd like to keep your server active with constant pregen, without interrupting players.

/pregen utils setPlayerLimit 1

=========================
Quick Windows Server Install Guide

1. Move the extracted server pack folder to where you want your server to be installed
2. Download the Forge 2860 server installer: https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2860/forge-1.12.2-14.23.5.2860-installer.jar
3. Double click to run the installer, select "Install Server" and select your extracted server pack folder to install the server there, then run it and wait for it to finish
4. Create a new text file in the same directory, edit it, and paste the below line, this will set the launch args for your server:

java -server -Xmx6G -Xms6G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=50 -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20  -XX:G1HeapRegionSize=32M -jar forge-1.12.2-14.23.5.2860.jar nogui

(Change the number next to -Xmx and -Xms to increase or decrease allocated RAM)
(If you want better performance, check out Aikars server script generator https://docs.papermc.io/misc/tools/start-script-gen)

5. Save the text file, then rename it run.bat (Note: run.bat, not run.bat.txt)
6. Double click the run.bat file to run it, the server will start and then stop with a message that you need to agree to the EULA in the eule.txt
(If it instead crashes, you likely do not have Java 8 installed and need to download and install the Java 8 JDK from a site like Adoptium: https://adoptium.net/temurin/releases/?os=windows&arch=x64&package=jdk&version=8)
(If it still fails with the same error then you need to replace the "java" in the .bat with the location of the installed Java 8 java.exe file)
7. Close the server window, edit the eula.txt file to agree to the EULA, and read the rest of this file and modify the server.properties accordingly
8. After editing the file, save and close it, then run the run.bat file again to launch your server

=========================

IF USING SPONGEFORGE:  You must disable "Entity Tracker Desync" and "Outdated Chunk Data" in the rlmixins.cfg, as SpongeForge already implements the same/similar patches and will crash.

NOTE: As we do not use SpongeForge on the official servers, there may be other issues or crashes unaccounted for in this readme, our official discord will have the most up to date information

=========================

Automatic restarts can be helpful, though RLCraft v2.9+ is MUCH better about cache and garbage collection than 2.8.2 was, and frequent restarts are no longer needed or required
