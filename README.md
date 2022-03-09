# Gold Mine Community Door Server

Gold Mine (named after a mall-based, [coin-op arcade chain](https://arcadepreservation.fandom.com/wiki/Gold_Mine) near where aLPHA grew up) is a Community Door Server for BBS-based games. Open to all, easy to access.

GoldMine runs on Synchronet (Linux 64) on port 513 at 165.232.153.209.

## JOIN

BBS SysOps can easily join by visiting alphacomplex.us:2323 (with a terminal program like SyncTerm or MagiTerm) and hit [J] JOIN GOLDMINE from the main menu. Just fill out the form, and your BBS IP address will be queued for white-listing on the firewall, so you can connect on port 513 via RLOGIN. 

## SETUP

Setup an outbound RLOGIN connection from a menu item on your BBS (instructions are on Alpha Complex). Note, you must have already signed up on Alpha Complex for this to work):

Where TAG below = a 1-3 character BBS name tag, so your users are uniquely identified. For instance, Alpha Complex BBS is ```[AC]```

### TALISMAN BBS
1. If you're a Talisman sysop, add to a menu (e.g. /bbs/menus/main.toml)
                                                                      
```[[menuitem]]                                                        
command = "RUNSCRIPT"                                               
hotkey = "D"                                                        
data = "goldmine"
```                                                   
                                                                      
2. Create goldmine.lua in your /bbs/scripts directory:                 
                                                                      
```local un = bbs_get_username()                                       
 bbs_clear_screen()                                                  
 bbs_write_string("Loading GOLD MINE arcade...")                     
 bbs_rlogin_ip4("165.232.153.209","513","","[YOUR BBS TAG] "..un,"")
 ``` 
                                                                      
3. Replace YOUR BBS TAG with your unique 1-3 char tag,e.g [ABC]        


### MYSTIC BBS
IR - Outbound RLOGIN Connection

```/addr=3.17.231.162 /port=513 /user=[TAG]@USER@ /PROMPT```


## GAME LIST

You can view the [game list here](https://robbiew.github.io/goldmine/), as well as the direct door codes if you want ot bypass the GoldMine menu.

To do this, add "xtrn=DOORCODE" directly after ```/user``` (Mystic) or ```"..un,"``` (Talisman). 
Replace ```DOORCODE``` with the game code you want to launch directly.
