local api = vim.api;

local function is_file(filename)
	local res = vim.fn.glob(filename)
	if res == "" then
		return false
	end
	if vim.fn.isdirectory(filename) ~= 0 then
		return false
	end
	return true
end

local function cpp_template(name)
	local var = name:lower();

	return {
		'#include "' .. name .. '.hpp"',
		'',
		name ..'::'.. name ..'()',
		'{',
		'	std::cout << "'.. name ..' constructor called" << std::endl;',
		'}',
		'',
		name ..'::'.. name ..'(const '.. name ..' &'..var..')',
		'{',
		'	std::cout << "'.. name ..' copy constructor called" << std::endl;',
		'}',
		'',
		name ..' &'.. name ..'::operator=(const '.. name ..' &'..var..')',
		'{',
		'	std::cout << "'.. name ..' assigned called" << std::endl;',
		'	return *this;',
		'}',
		'',
		name ..'::~'.. name ..'()',
		'{',
		'	std::cout << "'.. name ..' destructor called" << std::endl;',
		'}',

	}
end

local function header_template(name)
	local filename = name:upper():gsub("%.", "_") .. "_HPP"

	return {
		"#ifndef "  .. filename,
        "# define " .. filename,
		"#include <iostream>" ,
		"class " .. name,
		"{",
		"public:",
		"	" ..  name .. "();",
		"	" ..  name .. "(" .. name .. "&);",
		"	" ..  name .. "(const ".. name .." &);",
		"	" ..  name .. "&operator=(const ".. name .."&);",
		"	~" .. name .. "();",
		" ",
		"protected:",
		"private:",
		"",
		"};",
		"#endif",
}
end

function CreateCppClass()
    local dir = vim.fn.input('create in: ', vim.fn.getcwd() .. '/', 'file')

	if not dir or is_file(dir) then
		print(dir .. " is not a dircetory")
		return;
	end

    local file = vim.fn.input('class name: ' .. dir .. '/', '' , 'file')

	local full = dir ..'/' .. file;

	if is_file(full .. '.hpp') or is_file(full .. '.cpp') then
		print("file ".. file .. " already exist")
		return;
	end

	vim.cmd("e " .. dir .. '/' .. file .. ".cpp")
	api.nvim_buf_set_lines(0, 0,1,0, cpp_template(file));

	vim.cmd("e " .. dir .. '/' .. file .. ".hpp")
	api.nvim_buf_set_lines(0, 0,1,0, header_template(file));
end

api.nvim_create_user_command("CppClass", function (_, _, _)
	CreateCppClass()
end, {bang = true, desc = 'Create an ortodox canonical class'})


local base16 =  require('base16')
local theme_names = base16.theme_names()
local base16_position = 100
local hi = vim.api.nvim_set_hl
print(#theme_names)
local function cycle_theme()
  base16_position = (base16_position % #theme_names) + 1
  print(theme_names[base16_position], base16_position % #theme_names)
  base16(base16.themes[theme_names[base16_position]], true)
	hi(0, "Normal", {bg = "#181C25"})
end

api.nvim_create_user_command("Cycle", function (_, _, _)
	cycle_theme()
end, {bang = true, desc = 'Create an ortodox canonical class'})
vim.keymap.set("n", "<leader>h", cycle_theme)