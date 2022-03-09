local msg_area = "local/gmsignup"
local user = bbs_get_username()
local validName = false
local validDomain = false
local validTag = false
local can_add = false

local path = bbs_get_data_path()

function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
  end
  
function lines_from(file)
    if not file_exists(file) then return {} end
    lines = {}
    for line in io.lines(file) do 
      lines[#lines + 1] = line
    end
    return lines
 end

function display_file(filename)
    for line in io.lines(filename) do
        bbs_write_string(line.."\r\n")
    end
end

bbs_write_string("\x1b[?25l") --hide the cursor
bbs_clear_screen()
-- bbs_display_gfile("goldmine")
-- bbs_pause()

while true do

    local lines = lines_from(bbs_get_data_path() .. "/gm_whitelist.dat");
    local domain = bbs_get_user_attribute("script_goldmine_domain", "")
    local bbsname = bbs_get_user_attribute("script_goldmine_bbs", "") 
    local tag = bbs_get_user_attribute("script_goldmine_tag", "") 

    if bbsname == "" then
        bbsname = "|12???|07"
        can_add = true
    end

    bbs_clear_screen()
    
    bbs_write_string(" |14Gold Mine |07game server - add or remove:\r\n")

    bbs_write_string("\r\n")
    bbs_display_gfile("dot")
    bbs_write_string(" |02User|07: |10".. user)
    bbs_write_string("\r\n")
    if not can_add then
        bbs_display_gfile("dot")
        bbs_write_string(" |02BBS|07: |10".. bbsname .."|07")
        bbs_write_string("\r\n")
        bbs_display_gfile("dot")
        bbs_write_string(" |02Domain|07: |10".. domain .."|07\r\n")
        bbs_display_gfile("dot")
        bbs_write_string(" |02Tag|07: |10[".. tag .."]|07\r\n")
    end
   
    if can_add then
        bbs_write_string("\r\n |15[|11A|15]|03 Add Domain to Whitelist\r\n |15[|11Q|15]|03 Quit\r\n\r\n |15Cmd? |07");
    else
        bbs_write_string("\r\n |15[|11R|15]|03 Remove Domain\r\n |15[|11S|15]|03 Setup Instructions\r\n |15[|11Q|15]|03 Quit\r\n\r\n |15Cmd? |07");
    end

    local command = bbs_getchar();
    
    if (command == "q" or command == "Q") then
        return;
    end

    if (command == "s" or command == "S") then
        bbs_clear_screen()
        display_file(path.."/../goldmine/gm_instruct.ans")
        bbs_pause()
    end

    if can_add then
        validDomain = false
        validName = false
        validTag = false
        bbs_write_string("ADD >\r\n")
        if (command == "a" or command == "A") then
            while validTag == false do
                bbs_write_string("\x1b[10;0f")
                bbs_write_string(" |14BBS tag (1-3 characters): |07");
                local tmptag = bbs_read_string(4);
                if (string.len(tmptag) > 0 and string.len(tmptag) < 4) then
                    tmptag = tmptag:upper()
                    bbs_set_user_attribute("script_goldmine_tag",tmptag)
                    validTag = true
                else
                    bbs_write_string("\r\n |12Min 1, max 3 characters...|07 \r\n")
                    bbs_pause()
                    bbs_write_string("\x1b[10;0f")
                    bbs_write_string("                                  \r\n")
                    bbs_write_string("                                  ")
                end
            end
            while validName == false do
                bbs_write_string("\x1b[11;0f")
                bbs_write_string(" |14BBS name: |07");
                local tmpbbs = bbs_read_string(60);
                if (string.len(tmpbbs) > 0) then
                    bbs_set_user_attribute("script_goldmine_bbs",tmpbbs)
                    validName = true
                else
                    bbs_write_string("\r\n Can't be empty... ")
                    bbs_pause()
                    bbs_write_string("\x1b[12;0f")
                    bbs_write_string("                      ")
                end
            end
            while validDomain == false do
                bbs_write_string("\x1b[12;0f")
                bbs_write_string(" |14Domain (e.g. mybbs.com - no port numer!): |07");
                local tmpline = bbs_read_string(60);
                if (string.len(tmpline) > 0) then
                    local file = io.open(bbs_get_data_path() .. "/gm_whitelist.dat", "a");
                    file:write("tcp:513:"..tmpline.."\n");
                    file:close();
                    bbs_set_user_attribute("script_goldmine_domain",tmpline)
                    local messagebody = "\rADDED:\r" .. user .. "\r" .. tmpline .. "\r";
                    bbs_post_message(msg_area, "aLPHA", "goldMineBot", "Gold Mine domain ADDED", messagebody);
                    bbs_write_string("\r\n\r\n |03"..tmpline.." |15added!\r\n GOLD MINE's firewall is updated hourly...\r\n See [S] Setup for instructions.\r\n\r\n|07")
                    bbs_pause()
                    can_add = false
                    validDomain = true
                else
                    bbs_write_string("\r\n Can't be empty... ")
                    bbs_pause()
                    bbs_write_string("\x1b[12;0f")
                    bbs_write_string("                      ")
                    validDomain = false
                end
            end
        end
        -- if (command == "g" or command == "G") then
        --     while true do
        --         bbs_clear_screen()
        --         bbs_display_gfile("gm_xtrn_codes")
        --         local command = bbs_getchar();
    
        --         if (command == "a" or command == "A") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_adult")
        --             bbs_pause()
        --         end
        --         if (command == "b" or command == "B") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_arcade")
        --             bbs_pause()
        --         end
        --         if (command == "c" or command == "C") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_board")
        --             bbs_pause()
        --         end
        --         if (command == "d" or command == "D") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_cards")
        --             bbs_pause()
        --         end
        --         if (command == "e" or command == "E") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_dos")
        --             bbs_pause()
        --         end
        --         if (command == "f" or command == "F") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_leisure")
        --             bbs_pause()
        --         end
        --         if (command == "g" or command == "G") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_other")
        --             bbs_pause()
        --         end
        --         if (command == "h" or command == "H") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_puzzle")
        --             bbs_pause()
        --         end
        --         if (command == "i" or command == "I") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_realtime")
        --             bbs_pause()
        --         end
        --         if (command == "j" or command == "J") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_rpg_1")
        --             bbs_pause()
        --         end
        --         if (command == "k" or command == "K") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_rpg_2")
        --             bbs_pause()
        --         end
        --         if (command == "l" or command == "L") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_solitaire")
        --             bbs_pause()
        --         end
        --         if (command == "m" or command == "M") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_space")
        --             bbs_pause()
        --         end
        --         if (command == "n" or command == "N") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_strategy")
        --             bbs_pause()
        --         end
        --         if (command == "o" or command == "O") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_trivia")
        --             bbs_pause()
        --         end
        --         if (command == "p" or command == "P") then
        --             bbs_clear_screen()
        --             bbs_display_gfile("gm_word")
        --             bbs_pause()
        --         end
        --         if (command == "q" or command == "Q") then
        --             break;
        --         end
        --     end
        -- end
    else    
        if (command == "r" or command == "R") then
            local tmpline = domain
            local inf = io.open(bbs_get_data_path() .. "/gm_whitelist.dat", "r");
	        local lines = ""
	        while(true) do
	            local line = inf:read("*line")
	            if not line then break end
	            if not string.find(line, domain, 1) then --if string not found
		            lines = lines .. line .. "\n"
	            end
	        end  
            inf:close();
            local file = io.open(bbs_get_data_path() .. "/gm_whitelist.dat", "w");
            file:write(lines)
            file:close()
            bbs_set_user_attribute("script_goldmine_domain","")
            bbs_set_user_attribute("script_goldmine_bbs","")
            bbs_set_user_attribute("script_goldmine_tag","")
            can_add = true
            local messagebody = "\rRENOVED\r" .. user .. "\r" .. tmpline .. "\r";
            bbs_post_message(msg_area, "aLPHA", "goldMineBot", "Gold Mine domain REMOVED", messagebody);
            bbs_write_string("\r\n\r\n Domain removed from whitelist!\r\n\r\n")
            bbs_pause()
        end
    end
    bbs_write_string("\x1b[?25h") --show the cursor
end
