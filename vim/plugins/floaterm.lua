vim.keymap.set('n', '<leader>tt', ':FloatermToggle<CR>')
-- vim.cmd("let g:floaterm_autoinsert=0")

local VHSIZE = "1.0"
local VWSIZE = "0.3"
local HHSIZE = "0.4"
local HWSIZE = "1.0"


function get_cmd(alter)
   local f=io.open("run.sh","r")
   if f~=nil then io.close(f)
		 return "./run.sh %"
	 else
		 return alter end
end

local tbl = {
    ["py-ts"] = {
        ["filetype"] = "py",
        ["key"] = "ts",
        ["hsize"] = HHSIZE,
        ["wsize"] = HWSIZE,
        ["dir"] = "bottom",
        ["cmd"] = get_cmd("python %")
    },
    ["py-td"] = {
        ["filetype"] = "py",
        ["key"] = "td",
        ["hsize"] = VHSIZE,
        ["wsize"] = VWSIZE,
        ["dir"] = "right",
        ["cmd"] = get_cmd("python %")
    },
    ["cpp-ts"] = {
        ["filetype"] = "cpp",
        ["key"] = "ts",
        ["hsize"] = HHSIZE,
        ["wsize"] = HWSIZE,
        ["dir"] = "bottom",
        ["cmd"] = "make %:r"
    },
    ["cpp-td"] = {
        ["filetype"] = "cpp",
        ["key"] = "td",
        ["hsize"] = VHSIZE,
        ["wsize"] = VWSIZE,
        ["dir"] = "right",
        ["cmd"] = "make %:r"
    },
    ["go-ts"] = {
        ["filetype"] = "go",
        ["key"] = "ts",
        ["hsize"] = HHSIZE,
        ["wsize"] = HWSIZE,
        ["dir"] = "bottom",
        ["cmd"] = get_cmd("go run %")
    },
    ["go-td"] = {
        ["filetype"] = "go",
        ["key"] = "td",
        ["hsize"] = VHSIZE,
        ["wsize"] = VWSIZE,
        ["dir"] = "right",
        ["cmd"] = get_cmd("go run %")
    },
    ["hs-ts"] = {
        ["filetype"] = "hs",
        ["key"] = "ts",
        ["hsize"] = HHSIZE,
        ["wsize"] = HWSIZE,
        ["dir"] = "bottom",
        ["cmd"] = "runghc %"
    },
    ["hs-td"] = {
        ["filetype"] = "hs",
        ["key"] = "td",
        ["hsize"] = VHSIZE,
        ["wsize"] = VWSIZE,
        ["dir"] = "right",
        ["cmd"] = "runghc %"
    },
    ["sh-ts"] = {
        ["filetype"] = "sh",
        ["key"] = "ts",
        ["hsize"] = HHSIZE,
        ["wsize"] = HWSIZE,
        ["dir"] = "bottom",
        ["cmd"] = "./%"
    },
    ["sh-td"] = {
        ["filetype"] = "sh",
        ["key"] = "td",
        ["hsize"] = VHSIZE,
        ["wsize"] = VWSIZE,
        ["dir"] = "right",
        ["cmd"] = "./%"
    },
    ["clj-ts"] = {
        ["filetype"] = "clj",
        ["key"] = "ts",
        ["hsize"] = HHSIZE,
        ["wsize"] = HWSIZE,
        ["dir"] = "bottom",
        ["cmd"] = "clojure -M ./%"
    },
    ["clj-td"] = {
        ["filetype"] = "clj",
        ["key"] = "td",
        ["hsize"] = VHSIZE,
        ["wsize"] = VWSIZE,
        ["dir"] = "right",
        ["cmd"] = "clojure -M ./%"
    },
    ["ts-ts"] = {
        ["filetype"] = "ts",
        ["key"] = "ts",
        ["hsize"] = HHSIZE,
        ["wsize"] = HWSIZE,
        ["dir"] = "top",
        ["cmd"] = "ts-node ./%"
    },
    ["ts-td"] = {
        ["filetype"] = "ts",
        ["key"] = "td",
        ["hsize"] = VHSIZE,
        ["wsize"] = VWSIZE,
        ["dir"] = "right",
        ["cmd"] = "ts-node ./%"
    },
    ["php-ts"] = {
        ["filetype"] = "php",
        ["key"] = "ts",
        ["hsize"] = HHSIZE,
        ["wsize"] = HWSIZE,
        ["dir"] = "top",
        ["cmd"] = "./vendor/bin/phpunit % --color --testdox"
    },
    ["php-td"] = {
        ["filetype"] = "php",
        ["key"] = "td",
        ["hsize"] = VHSIZE,
        ["wsize"] = VWSIZE,
        ["dir"] = "right",
        ["cmd"] = "./vendor/bin/phpunit % --color --testdox"
    },

}


for _, v in pairs(tbl) do
    local c = string.format(
        "autocmd BufRead *.%s nnoremap %s :FloatermNew --autoclose=0 --position=%s --height=%s --width=%s %s<CR>",
        v["filetype"],
        v["key"],
        v["dir"],
        v["hsize"],
        v["wsize"],
        v["cmd"]
        )

    vim.cmd(c)
end
