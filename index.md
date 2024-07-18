# ⛏️ gOLD mINE Community Door Server

![gOLD mINE screen shot](docs/assets/images/screenshot.png)

gOLD mINE (named after a [coin-op arcade](https://arcadepreservation.fandom.com/wiki/Gold_Mine) near where j0hnny a1pha grew up) is a terminal-based Community Door Server for BBS games. Open to all, easy to access with modern BBS terminal software, like [SyncTerm](https://syncterm.bbsdev.net/), [MagiTerm](https://gitlab.com/magickabbs/MagiTerm) or [NetRunner](http://www.mysticbbs.com/downloads.html).

gOLD mINE has [Synchronet](http://wiki.synchro.net/) (Ubuntu 24.04 x64) under the hood, and runs on port ``2513`` at ``143.198.58.173`` (or ``goldminedoors.com``).

It'ss not a BBS. There are no message boards or file download areas, and you can't "login" to it like a traditional BBS. It does one thing, and one thing only: launch games remotely for users from other BBSs using RLOGIN.

## WHAT'S A 'DOOR SERVER'?

If you run an old-school, terminal-based BBS (probably using new-school BBS software like [Mystic](http://www.mysticbbs.com/), [Synchronet](http://wiki.synchro.net/), [Talisman](talismanbbs.com) or [ENiGMA½](https://enigma-bbs.github.io/)) you know that setting up door game programs can be time consuming and sometimes, a headache. In their heydey of the 1980's and 90s, these games where designed to run under DOS (or Win32) and were pretty finicky. Hunting down registration keys or cracks can be daunting (much is abandonware these days). So, a Door Server takes work out of setup and lets you add LOTS of these games from a central service, almost immediately, running them over an RLOGIN connection that's practically seamless for your users.  The other benefit is a potentially larger player base, aggregating them in a centralized manner. 

## JOIN GOLD MINE

gOLD mINE does not require you to apply for membership. Just follow the directions below. Contact ``j0hnny a1pha`` on Space Junk! BBS (spacejunkbbs.com:2323) for more details or to sk a question.

## SETUP ON YOUR BBS

Setup an outbound RLOGIN connection from a menu item on your BBS to ``143.198.58.173``, or ``goldminedoors.com`` port ``2513``, using the settings below.

## CREATE A BBS TAG

Every gOLD mINE BBS needs a tag that identifies it. You can make it up, just use these guidelines:
- Format for the tag is: [TAG], replace "TAG" with 3 characters that represent your BBS
- For instance, Space Junk BBS uses [SJ!]
- Use exactly 3: no more, no less
- No profanity, please

## EXAMPLE: MYSTIC BBS
OK, now add gOLD mINE to your menu as ``IR - Outbound RLOGIN Connection``

```
/addr=143.198.58.173 /user=[TAG]@USER@ /pass=@USER@ /PROMPT
```

- Replace ``TAG`` with your unique 1-3 character BBS tag, e.g ``[ABC]``.    
- Make sure there are no spaces between ``[TAG]`` and ``@USER@``
- FYI: ``/PROMPT`` hides the connection string from the user
- You can replace ``/pass=@USER@`` with whatever you want for the ``@USER@`` part

## DIRECTLY LAUNCH A DOOR

If you want to launch a door game directly from your BBS, bypassing the gOLD mINE main menu:

Mystic (make sure you are using the most recent release):

- add ``/term=xtrn=DOORCODE`` directly after ```/user``` sequence (on Mystic)
- Replace ```DOORCODE``` with a code below that you want to launch directly, e.g. on a Mystic BBS:

```
/addr=143.198.58.173 /user=[XYZ]@USER@ /pass=@USER@ /term=xtrn=WORDLE /PROMPT
```

Heer's what I use (WWIV) on linux - ``goldmine.sh``:
```
#!/bin/bash

export TERM=linux
cd doors/goldmine

# Get the node number and door code from the arguments passed to the script
NODE_NUMBER=$1
BBS=$2
DOOR_CODE=$3

# Define the path to the DOOR32.SYS file
DOOR32_SYS_PATH=/home/bbs/wwiv/e/${NODE_NUMBER}/temp/door32.sys

# Extract the alias from line 7, replace spaces with underscores, and store it in a variable
USER_ALIAS=$(sed -n '7p' "$DOOR32_SYS_PATH" | tr ' ' '-')
PREFIX="["$BBS"]"

# Print the alias and door code for verification
echo "BBS: $PREFIX"
echo "User Alias: $USER_ALIAS"
echo "Door Code: $DOOR_CODE"

# Run the rsh-redone-client command with the extracted user alias and provided door code
if [ -n "$DOOR_CODE" ]; then
    TERM_PARAM="xtrn=$DOOR_CODE"
    TERM=$TERM_PARAM rlogin -p 2513 -l "$PREFIX$USER_ALIAS" goldminedoors.com
else
    rlogin -p 2513 -l "$PREFIX$USER_ALIAS" goldminedoors.com
fi
```


# GoldMine Game Code List

Total Games: 125

I'm trying to make sure all games on gOLD mINE are fully registered. If you have a registered game you'd like to donate, please contact me.

Note that games in "Adult, Sex & Crime" genre are mature (18+), and to be quite frank -- are extremely out-of-touch with modern/civil norms around sexualty, gender, race and able-ness. They are included for historical reasons only. Seriously, they can be crude. You have been warned!

| DOOR NAME                             | GENRE                       | CODE     | ADDED    |
|---------------------------------------|-----------------------------|----------|----------|
| Drug Lord                             | Adult, Sex & Crime          | DRUGLORD | 03/09/22 |
| Bordello                              | Adult, Sex & Crime          | BORDELLO | 03/09/22 |
| Rancho Nevada                         | Adult, Sex & Crime          | RN       | 03/09/22 |
| Piss-o-Rama                           | Adult, Sex & Crime          | PISSORAM | 03/09/22 |
| Pimp Wars                             | Adult, Sex & Crime          | PIMPWARS | 03/09/2  |
| Godfather of Crime                    | Adult, Sex & Crime          | GODFATHE | 03/09/22 |
| Escape Arcade                         | Arcade & Action             | ESCAPE   | 03/14/22 |
| BBS Tris                              | Arcade & Action             | BBSTRIS  | 03/14/22 |
| MystMan                               | Arcade & Action             | MYSTMAN  | 03/13/22 |
| Gooble Gooble                         | Arcade & Action             | GOOBLE   | 03/09/22 |
| Lemons                                | Arcade & Action             | LEMONS   | 03/09/22 |
| Chicken Delivery                      | Arcade & Action             | CHICKEN  | 03/09/22 |
| 4 Coner Checkers                      | Board Games                 | 4CORNERC | 03/09/22 |
| Bubble Boggle                         | Board Games                 | BOGGLE   | 03/09/22 |
| Sea Battle                            | Board Games                 | SEABATTL | 03/09/22 |
| Concentration                         | Board Games                 | CONCENTR | 03/09/22 |
| Las Vegas Blackjack                   | Cards, Dice & Casino        | LVBJACK  | 03/13/22 |
| Las Vegas Keno                        | Cards, Dice & Casino        | LVKENO   | 03/13/22 |
| Las Vegas Video Poker                 | Cards, Dice & Casino        | LVPOKER  | 03/13/22 |
| Las Vegas Casino Manager              | Cards, Dice & Casino        | LVCASINO | 03/13/22 |
| Las Vegas Slots                       | Cards, Dice & Casino        | LVSLOTS  | 03/13/22 |
| Las Vegas Craps                       | Cards, Dice & Casino        | LVCRAPS  | 03/13/22 |
| Five Card Stud                        | Cards, Dice & Casino        | FIVECARD | 03/14/22 |
| Accordian Solitaire                   | Cards, Dice & Casino        | AS       | 03/14/22 |
| 3-Pair Poker                          | Cards, Dice & Casino        | 3PAIRPOK | 03/09/22 |
| Acey Deucy                            | Cards, Dice & Casino        | ACEYDEUC | 03/09/22 |
| Baseball Dice                         | Cards, Dice & Casino        | BBDICE   | 03/09/22 |
| Blackjack                             | Cards, Dice & Casino        | BLACKJAC | 03/09/22 |
| Box Poker                             | Cards, Dice & Casino        | BOXPOKER | 03/09/22 |
| Dice Warz                             | Cards, Dice & Casino        | DICEWARZ | 03/09/22 |
| Dice Warz \]\[                        | Cards, Dice & Casino        | DICEWAR2 | 03/09/22 |
| Domain Poker                          | Cards, Dice & Casino        | DPOKER   | 03/09/22 |
| Milliway's Casino                     | Cards, Dice & Casino        | MILLIWAY | 03/09/22 |
| Synchronet Blackjack                  | Cards, Dice & Casino        | SBJ      | 03/09/22 |
| Star Stocks                           | Cards, Dice & Casino        | STARSTOX | 03/09/22 |
| Tital Slots                           | Cards, Dice & Casino        | TITANSLO | 03/09/22 |
| Zork I                                | DOS Text-Based              | ZORK1    | 03/09/22 |
| Zork II                               | DOS Text-Based              | ZORK2    | 03/09/22 |
| Zork III                              | DOS Text-Based              | ZORK3    | 03/09/22 |
| Beyond Zork                           | DOS Text-Based              | BEYONDZ  | 03/09/22 |
| Zork: Undiscovered Underground        | DOS Text-Based              | ZTUU     | 03/09/22 |
| Arthur: The Quest for Excalibur       | DOS Text-Based              | ARTHUR   | 03/09/22 |
| A Mind Forever Voyaging               | DOS Text-Based              | AMFV     | 03/09/22 |
| Ballyhoo                              | DOS Text-Based              | BALLYHOO | 03/09/22 |
| Border Zone                           | DOS Text-Based              | BORDERZO | 03/09/22 |
| Bureaucracy                           | DOS Text-Based              | BUREAUCR | 03/09/22 |
| Cutthroats                            | DOS Text-Based              | CUTTHROA | 03/09/22 |
| Enchanter                             | DOS Text-Based              | ENCHANTE | 03/09/22 |
| Hitchiker's Guide to the Galaxy       | DOS Text-Based              | HHGTG    | 03/09/22 |
| Hollywood Hijinx                      | DOS Text-Based              | HOLLYWOO | 03/09/22 |
| Infidel                               | DOS Text-Based              | INFIDEL  | 03/09/22 |
| Journey: The Quest Begins             | DOS Text-Based              | JOURNEY  | 03/09/22 |
| The Lurkng Horror                     | DOS Text-Based              | LURKING  | 03/09/22 |
| Leather Goddesses of Phobos           | DOS Text-Based              | LEATHER  | 03/09/22 |
| Sherlock: Riddle of the Crown Jewels  | DOS Text-Based              | SHERLOCK | 03/09/22 |
| Sorcerer                              | DOS Text-Based              | SORCERER | 03/09/22 |
| Starcross                             | DOS Text-Based              | STARCROS | 03/09/22 |
| Stationfall                           | DOS Text-Based              | STATION  | 03/09/22 |
| James Calvell's SHOGUN                | DOS Text-Based              | SHOGUN   | 03/09/22 |
| Moonmist                              | DOS Text-Based              | MOONMIST | 03/09/22 |
| Nord and Bert                         | DOS Text-Based              | NORDANDB | 03/09/22 |
| Planetfall                            | DOS Text-Based              | PLANETFA | 03/09/22 |
| Plundered                             | DOS Text-Based              | PLUNDERE | 03/09/22 |
| Seastalker                            | DOS Text-Based              | SEASTALK | 03/09/22 |
| Spellbreaker                          | DOS Text-Based              | SPELLBRE | 03/09/22 |
| Suspect                               | DOS Text-Based              | SUSPECT  | 03/09/22 |
| Suspended                             | DOS Text-Based              | SUSPENDE | 03/09/22 |
| Trinity                               | DOS Text-Based              | TRINITY  | 03/09/22 |
| Wishbringer                           | DOS Text-Based              | WISHBRIN | 03/09/22 |
| Witness                               | DOS Text-Based              | WITNESS  | 03/09/22 |
| Forbidden Planet                      | DOS Text-Based              | PLANET   | 03/09/22 |
| Camptown Races                        | Leisure & Sports            | CAMPTOWN | 03/14/22 |
| GuTTeRBoWL                            | Leisure & Sports            | GUTBOWL  | 03/12/22 |
| Baseball Dice                         | Leisure & Sports            | BBDICE   | 03/09/22 |
| Fat Fish                              | Leisure & Sports            | FATFISH  | 03/09/22 |
| Synkroban                             | Other                       | SOKOBAN  | 03/09/22 |
| Thirstyville                          | Other                       | THIRSTY  | 03/09/22 |
| Port Victoria                         | Other                       | PORTVIC  | 03/09/22 |
| Oregon Trail                          | Other                       | OREGONTR | 03/09/22 |
| Sim BBS                               | Other                       | SIMBBS   | 03/09/22 |
| Synchronet Minesweeper                | Puzzle                      | MSWEEPER | 03/09/22 |
| Uber Blox                             | Puzzle                      | UBERBLOX | 03/09/22 |
| Synchrotetris                         | Puzzle                      | TETRIS   | 03/09/22 |
| Stacktion                             | Puzzle                      | STACKTIO | 03/12/22 |
| King's Crown                          | RPGs: Medieval & Fantasy    | KC       | 03/11/22 |
| Exitilus                              | RPGs: Medieval & Fantasy    | EXIT     | 03/11/22 |
| Rise To Power                         | RPGs: Medieval & Fantasy    | RTP      | 03/14/22 |
| Adventurer's Maze II                  | RPGs: Medieval & Fantasy    | AM2      | 03/14/22 |
| Usurper                               | RPGs: Medieval & Fantasy    | USURPER  | 03/14/22 |
| Legend of the Red Dragon              | RPGs: Medieval & Fantasy    | LORD     | 03/09/22 |
| LORD II: New World                    | RPGs: Medieval & Fantasy    | LORD2    | 03/09/22 |
| The Beast's Domain                    | RPGs: Medieval & Fantasy    | TBD      | 03/09/22 |
| For Honour                            | RPGs: Medieval & Fantasy    | FH       | 03/09/22 |
| Death Masters                         | RPGs: Medieval & Fantasy    | DEATHMAS | 03/09/22 |
| DoorMUD                               | RPGs: Medieval & Fantasy    | DOORMUD  | 03/09/22 |
| Dungeon Master                        | RPGs: Medieval & Fantasy    | DM       | 03/09/22 |
| Kannons and Katapults                 | RPGs: Medieval & Fantasy    | KNK      | 03/09/22 |
| Arrowbridge I                         | RPGs: Medieval & Fantasy    | AB1      | 03/09/22 |
| Arrowbridge II                        | RPGs: Medieval & Fantasy    | AB2      | 03/09/22 |
| LEGION RPG                            | RPGs: Medieval & Fantasy    | LEGION   | 03/09/22 |
| Grunt Fest                            | RPGs: War, Present & Future | GRUNTF   | 03/14/22 |
| Iron War                              | RPGs: War, Present & Future | IRONWAR  | 03/14/22 |
| Global War                            | RPGs: War, Present & Future | GWAR     | 03/11/22 |
| Forces of Darkness                    | RPGs: War, Present & Future | FOD      | 03/10/22 |
| Colonies                              | RPGs: War, Present & Future | COLONIES | 03/09/22 |
| Atlantis                              | RPGs: War, Present & Future | ATLANTIS | 03/09/22 |
| Operation Overkill II                 | RPGs: War, Present & Future | OOII     | 03/09/22 |
| Darkness 2                            | RPGs: War, Present & Future | DARK2    | 03/09/22 |
| Jedi Knight                           | RPGs: War, Present & Future | JEDI     | 03/09/22 |
| Barren Realms Elite                   | RPGs: War, Present & Future | BRE      | 03/09/22 |
| Betsy Ross Solitaire                  | Solitaire Card              | BETSYROS | 03/09/22 |
| Accordian  Solitaire                  | Solitaire Card              | AS       | 03/09/22 |
| Yankee Trader                         | Space                       | YT       | 03/14/22 |
| Galaxy 5                              | Space                       | GALAXY5  | 03/09/22 |
| Star Trek                             | Space                       | STARTREK | 03/09/22 |
| Trade Wars 2 - 500 Sectors            | Space                       | TW2      | 03/09/22 |
| Galactic Dynasty 2                    | Space                       | GD2      | 03/09/22 |
| Entertainment Awards Trivia           | Trivia                      | AWARDS   | 03/14/22 |
| Showbiz Quiz                          | Trivia                      | SBQUIZ   | 03/13/22 |
| Star Trek Quiz                        | Trivia                      | STQUIZ   | 03/13/22 |
| BBS Wordle                            | Word Games                  | WORDLE   | 03/10/22 |
| Chain Reaction                        | Word Games                  | CHAINREA | 03/09/22 |
| Jeopardized!                          | Word Games                  | JEOPARDY | 03/09/22 |
| Wordem                                | Word Games                  | WORDEM   | 03/09/22 |
| Sudoku                                | Word Games                  | SUDOKU   | 03/09/22 |
|                                       |                             |          |          |

