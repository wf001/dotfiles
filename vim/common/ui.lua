


local function env()
  return os.getenv("VIRTUAL_ENV_BASENAME")
end




-- ########
-- Lualine
-- ########



local function iterlines(s)
        if s:sub(-1)~="\n" then s=s.."\n" end
        return s:gmatch("(.-)\n")
end

-- find directory
function find_dir(d)
    -- return if root
    if d == '/' then
        return d
    end
    -- check renaming
    local ok, err, code = os.rename(d, d)
    if not ok then
        if code ~= 2 then
            -- all other than not existing
            return d
        end
        -- not existing
        local newd = d:gsub("(.*/)[%w._-]+/?$", "%1")
        return find_dir(newd)
    end
    -- d ok write 'ok_dir' variable & return d
    vim.b["ok_dir"] = d
    return d
end

-- get git status
local function git_status()
    -- get & check file directory
    local file_dir = vim.b["ok_dir"] 
    if file_dir == nil then 
        file_dir = find_dir(vim.fn.expand("%:p:h"))
    end
    -- capture git status call
    local cmd = "git -C " .. file_dir .. " status --porcelain -b 2> /dev/null"
    local handle = assert(io.popen(cmd, 'r'), '')
    -- output contains empty line at end (removed by iterlines)
    local output = assert(handle:read('*a'))
    -- close io
    handle:close()

    -- git_state is array with entries branch/staged/modified/untracked
    local git_state = {'', '', '', ''}
    -- branch coloring: 'o': up to date with origin; 'd': head detached; 'm': not up to date with origin
    local branch_col = 'o'

    -- check if git repo
    if output == '' then
        -- not a git repo
        -- save to variable
        vim.g.git_state = git_state
        -- exit
        return branch_col
    end

    -- iterate over lines
    -- get line iterator
    local line_iter = iterlines(output)

    -- process first line (HEAD)
    local line = line_iter()
    if line:find("%(no branch%)") ~= nil then
        -- detached head
        branch_col = 'd'
    else
        -- on branch
        local ahead = line:gsub(".*ahead (%d+).*", "%1")
        local behind = line:gsub(".*behind (%d+).*", "%1")
        -- convert non-numeric to nil
        ahead = tonumber(ahead)
        behind = tonumber(behind)
        if behind ~= nil then
            git_state[1] = '↓ ' .. tostring(behind) .. ' '
        end
        if ahead ~= nil then
            git_state[1] = git_state[1] .. '↑ ' .. tostring(ahead) .. ' '
        end
    end

    -- loop over residual lines (files) &
    -- store number of files
    local git_num = {0, 0, 0}
    for line in line_iter do
        branch_col = 'm'
        -- get first char
        local first = line:gsub("^(.).*", "%1")
        if first ~= ' ' then
            if first == '?' then
                -- untracked
                git_num[3] = git_num[3] + 1
            else
                -- staged
                git_num[1] = git_num[1] + 1
            end
        else
            -- modified
            git_num[2] = git_num[2] + 1
        end
    end

    -- build output string
    if git_num[1] ~= 0 then
        git_state[2] = '● ' .. git_num[1]
    end
    if git_num[2] ~= 0 then
        git_state[3] = '+ ' .. git_num[2]
    end
    if git_num[3] ~= 0 then
        git_state[4] = '… ' .. git_num[3]
    end
    
    -- save to variable
    vim.b.git_state = git_state
    
    -- return color for branch
    return branch_col
end



require("lualine").setup({
    options = {
        theme = "dia",
        icons_enabled = true
    },
    sections = {
        lualine_a = {
            { 'mode',
                fmt = function(str) return str:sub(1, 1) end
            }
        },
				lualine_b = {
					{
						'branch',
						color = 
						function(section)
							local gs = git_status()
							if gs == 'd' then
								return { fg = '#916BDD' }
							elseif gs ~= 'm' then
								return { fg = '#769945' }
							end
						end
					}, 
					{
						-- head status
						"vim.b.git_state[1]",
						padding = { left = 0, right = 0 }
					},
					{ 
						-- staged files
						"vim.b.git_state[2]",
						color = { fg = '#769945' },
						padding = { left = 0, right = 1 }
					},
					{
						-- modified files
						"vim.b.git_state[3]",
						color = { fg = '#D75F00' },
						padding = { left = 0, right = 1 }
					},
					{
						-- untracked files
						"vim.b.git_state[4]",
						color = { fg = '#D99809' },
						padding = { left = 0, right = 1 }
					},
				},
        lualine_c = { "filename" },
        lualine_x = { "diagnostics" },
        lualine_y = { env },
        lualine_z = { "%3l/%L:%v" },
    },
})

-- ########
-- NightFox
-- ########
-- If Change below, provide NightfoxCompile cmd to affect that.
require("nightfox").setup({
  palettes = {
    nordfox = {
      comment = "#ff8888",
    },
    nightfox = {
      comment = "#ff8888",
			-- sel0 = "#416ca6",
    },
  },
})

-- ########
-- tabby
-- ########

local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  -- current_tab = 'TabLineSel',
  current_tab = { fg = '#F8FBF6', bg = '#896aa8', style = 'italic' },
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}

require('tabby.tabline').set(function(line)
  return {
    {
      { '  ', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.is_current() and '' or '',
        tab.number(),
        tab.name(),
				tab.current_win().buf().is_changed() and '' or '',
        -- tab.close_btn(''), -- show a close button
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    -- shows list of windows in tab
    -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
    --   return {
    --     line.sep('', theme.win, theme.fill),
    --     win.is_current() and '' or '',
    --     win.buf_name(),
    --     line.sep('', theme.win, theme.fill),
    --     hl = theme.win,
    --     margin = ' ',
    --   }
    -- end),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)



-- ########
-- nvim-colorizer
-- ########
require 'colorizer'.setup()


-- ########
-- hlargs
-- ########
require('hlargs').setup()
