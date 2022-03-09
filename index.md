# Gold Mine Community Door Server

![gOLD mINE screen shot](docs/assets/images/screenshot.png)

Gold Mine (named after a mall-based, [coin-op arcade chain](https://arcadepreservation.fandom.com/wiki/Gold_Mine) near where aLPHA grew up) is a Community Door Server for BBS-based games. Open to all, easy to access.

Gold Mine runs on Synchronet (Linux 64) on port ``513`` at ``165.232.153.209``.

It is not a BBS, despite using BBS software. There are no message baords or file areas, and you can't "login" to it. It does one thing, and one thing only: launch games for users from other BBSs.

## WHAT'S A 'DOOR SERVER'?

If you run an old-school, terminal-based BBS (probably using new-school BBS software like Mystic, Synchronet, Talisman or Enigma) you know that setting up door game programs can be time consuming and a headache. In their heydey of the 1980's and 90s, these games where designed to run under DOS (or Win32) and were pretty finicky. Hunting down regitration keys or cracks can be daunting (much is abandonware these days). 

Oh, and if your BBS runs on Windows 64, well, unless you can figure out experimental NTVDMx64 and legacy FOSSIL drivers to run native 16-Bit DOS programs, your options are limited. And ARM-based systems like rPI can't run dosemu, so you'd need to use programs like QEMU (powerful, but a complex setup) or Dos Box (no multi-node abilities).

Phew.

So, a Door Server takes a lot of the work out of setup and lets you add 100's of these games from a central service, almost immediately, running them over an RLOGIN connection that's practically seamless for your users. And for you: no DOS/DOSEMU shenanigans, no configuring drop files, etc. In fact, Gold Mine can handle just about any kind of console-based game made for DOS, Linux or Windows. It also suport Synchronet Javascript-based games. With direct-door launching, it feels like users never leave yuor BBS!

The other benefit is a potentially larger player base, aggregating them in a centralized manner. 

Also, please check out other door gamer servers like DoorParty, BBSLink, Combatnet, Quazar, Black Country Rock. They're all good choices. Hell, add them all!

## JOIN GOLD MINE

BBS SysOps can join by visiting ``alphacomplex.us:2323`` with a terminal program like SyncTerm or MagiTerm. Hit ``[J] JOIN GOLDMINE`` from the main menu. 
Just fill out the form, and your BBS IP address will be queued for white-listing on the firewall, so you can then connect on port 513 via RLOGIN. 

## SETUP

Setup an outbound RLOGIN connection from a menu item on your BBS. Note, you *must* be signed up on Alpha Complex for this to work.


### TALISMAN BBS
- If you're a Talisman sysop, add to an existing menu (e.g. ``main.toml`` )

```
[[menuitem]]
command = "RUNSCRIPT"
hotkey = "D"
data = "goldmine"
```
- Create ``goldmine.lua`` in your /bbs/scripts directory:

```
local un = bbs_get_username()
bbs_clear_screen()
bbs_write_string("Loading GOLD MINE arcade...")
bbs_rlogin_ip4("165.232.153.209","513","","[YOUR BBS TAG] "..un,"")
``` 
 
Where ```TAG``` = a 1-3 character BBS name tag, so your users are uniquely identified. For instance, Alpha Complex BBS is ```[AC]```
                                                                      
- Replace YOUR BBS TAG with your unique 1-3 character BBS tag, e.g ``[ABC]``.        


### MYSTIC BBS
Add to your menu as ``IR - Outbound RLOGIN Connection``

```
/addr=3.17.231.162 /port=513 /user=[TAG]@USER@ /PROMPT
```

Where ```TAG``` = a 1-3 character BBS name tag, so your users are uniquely identified. For instance, Alpha Complex BBS is ```[AC]```

## GAME LIST

Below is a list of direct door codes. Use these if you want to launch a game directly from your BBS, bypassing the Gold Mine menu.

To do this, add ``"xtrn=DOORCODE"`` directly after ```/user``` (Mystic) or ```"..un,"``` (Talisman). 

Replace ```DOORCODE``` with an xtrn code below that you want to launch directly.


# GoldMine Game Code List


| DOOR NAME                             | GENRE                       | XTRN CODE| 
|---------------------------------------|-----------------------------|----------|
| DrugLord                              | Adult                       | DRUGLORD |
| Bordello                              | Adult                       | BORDELLO |
| Pimp Wars                             | Adult                       | PIMPWARS |
| Bordello                              | Adult                       | BORDELLO |
| Rancho Nevada                         | Adult                       | RN       |
| Piss-o-Rama                           | Action                      | PISSORAM |
| Gooble Gooble                         | Action                      | GOOBLE   |
| Lemons                                | Action                      | LEMONS   |
| Chicken Delivery                      | Action                      | CHICKEN  |
| 4 Coner Checkers                      | Board Game                  | 4CORNERC |
| Bubble Boggle                         | Board Game                  | BOGGLE   |
| Sea Battle                            | Board Game                  | SEABATTL |
| 3-Pair Poker                          | Cards, Dice & Casino        | 3PAIRPOK |
| Acey Deucy                            | Cards, Dice & Casino        | ACEYDEUC |
| Baseball Dice                         | Cards, Dice & Casino        | BBDICE   |
| Blackjack                             | Cards, Dice & Casino        | BLACKJAC | 
| Box Poker                             | Cards, Dice & Casino        | BOXPOKER |
| Dice Warz                             | Cards, Dice & Casino        | DICEWARZ |
| Dice Warz \]\[                        | Cards, Dice & Casino        | DICEAR2  |
| Domain Poker                          | Cards, Dice & Casino        | DPOKER   |
| Milliway's Casino                     | Cards, Dice & Casino        | MILLIWAY |
| Synchronet Blackjack                  | Cards, Dice & Casino        | SBJ      |
| Star Stocks                           | Cards, Dice & Casino        | STARSTOX |
| Tital Slots                           | Cards, Dice & Casino        | TITANSLO |
| Zork I                                | DOS Text-Based              | ZORK1    |
| Zork II                               | DOS Text-Based              | ZORK2    |
| Zork III                              | DOS Text-Based              | ZORK3    |
| Beyond Zork                           | DOS Text-Based              | BEYONDZ  |
| Zork: Undiscovered Underground        | DOS Text-Based              | ZTUU     |
| Arthur: The Quest for Excalibur       | DOS Text-Based              | ARTHUR   |
| A Mind Forever Voyaging               | DOS Text-Based              | AMFV     |
| Ballyhoo                              | DOS Text-Based              | BALLYHOO |
| Border Zone                           | DOS Text-Based              | BORDERZO |
| Bureaucracy                           | DOS Text-Based              | BUREAUCR |
| Cutthroats                            | DOS Text-Based              | CUTTHROA |
| Enchanter                             | DOS Text-Based              | ENCHANTE |
| Hitchiker's Guide to the Galaxy       | DOS Text-Based              | HHGTG    |
| Hollywood Hijinx                      | DOS Text-Based              | HOLLYWOO |
| Infidel                               | DOS Text-Based              | INFIDEL  |
| Journey: The Quest Begins             | DOS Text-Based              | JOURNEY  |
| The Lurkng Horror                     | DOS Text-Based              | LURKING  |
| Leather Goddesses of Phobos           | DOS Text-Based              | LEATHER  |
| Sherlock: Riddle of the Crown Jewels  | DOS Text-Based              | SHERLOCK |
| Sorcerer                              | DOS Text-Based              | SORCERER |
| Starcross                             | DOS Text-Based              | STARCROS |
| Stationfall                           | DOS Text-Based              | STATION  |
| James Calvell's SHOGUN                | DOS Text-Based              | SHOGUN   |
| Moonmist                              | DOS Text-Based              | MOONMIST |
| Nord and Bert                         | DOS Text-Based              | NORDANDB |
| Planetfall                            | DOS Text-Based              | PLANETFA |
| Plundered                             | DOS Text-Based              | PLUNDERE |
| Seastalker                            | DOS Text-Based              | SEASTALK |
| Spellbreaker                          | DOS Text-Based              | SPELLBRE |
| Suspect                               | DOS Text-Based              | SUSPECT  |
| Suspended                             | DOS Text-Based              | SUSPENDE |
| Trinity                               | DOS Text-Based              | TRINITY  |
| Wishbringer                           | DOS Text-Based              | WISHBRIN |
| Witness                               | DOS Text-Based              | WITNESS  |
| Baseball Dice                         | Leisure & Sports            | BBDICE   |
| Fat Fish                              | Leisure & Sports            | FATFISH  |
| Synkroban                             | Other                       | SOKOBAN  |
| Thirstyville                          | Other                       | THIRSTY  |
| Port Victoria                         | Other                       | PORTVIC  |
| Oregon Trail                          | Other                       | OREGONTR |
| Sim BBS                               | Other                       | SIMBBS   |
| Synchronet Minesweeper                | Puzzle                      | MSWEEPER |
| Uber Blox                             | Puzzle                      | UBERBLOX |
| Synchrotetris                         | Puzzle                      | TETRIS   |
| Legend of the Red Dragon              | RPGs: Medieval & Fantasy    | LORD     |
| LORD II: New World                    | RPGs: Medieval & Fantasy    | LORD2    |
| The Beast's Domain                    | RPGs: Medieval & Fantasy    | TBD      |
| For Honour                            | RPGs: Medieval & Fantasy    | FH       |
| Death Masters                         | RPGs: Medieval & Fantasy    | DEATHMAS |
| DoorMUD                               | RPGs: Medieval & Fantasy    | DOORMUD  |
| Dungeon Master                        | RPGs: Medieval & Fantasy    | DM       |
| Kannons and Katapults                 | RPGs: Medieval & Fantasy    | KNK      | 
| Arrowbridge I                         | RPGs: Medieval & Fantasy    | AB1      |
| Arrowbridge II                        | RPGs: Medieval & Fantasy    | AB2      |
| LEGION RPG                            | RPGs: Medieval & Fantasy    | LEGION   |
| Colonies                              | RPGs: War, Present & Future | COLONIES |
| Atlantis                              | RPGs: War, Present & Future | ATLANTIS |
| Operation Overkill II                 | RPGs: War, Present & Future | OOII     |
| Darkness 2                            | RPGs: War, Present & Future | DARK2    |
| Jedi Knight                           | RPGs: War, Present & Future | JEDI     |
| Barren Realms Elite                   | RPGs: War, Present & Future | BRE      |
| Betsy Ross Solitaire                  | Solitaire Card              | BETSYROS |
| Galaxy 5                              | Space                       | GALAXY5  |
| Star Trek                             | Space                       | STARTREK |
| Trade Wars 2 - 500 Sectors            | Space                       | TW2      |
| Galactic Dynasty 2                    | Space                       | GD2      |
| Chain Reaction                        | Word Games                  | CHAINREA |
| Jeopardized!                          | Word Games                  | JEOPARDY |
| Wordem                                | Word Games                  | WORDEM   |
| Sudoku                                | Word Games                  | SUDOKU   |
|                                       |                             |          |
|                                       |                             |          |




