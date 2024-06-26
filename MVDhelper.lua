script_name 'MVDhelper'
local script_version = '0.9.1v BETA'
local script_author = 'Richard'
  ------------------------------------- ПЕРЕМЕННЫЕ -------------------------------------     
local imgui = require 'mimgui'
local pie = require 'imgui_piemenu'
local new = imgui.new

local sizeX, sizeY = getScreenResolution()

local encoding = require 'encoding'
encoding.default = 'CP1251'
local u8 = encoding.UTF8

local DokladWindow = false
local PatrolWindow = false


local tag = "{00BFFF}[MVDHELPER]:{ffffff}"
local tagg = "{00BFFF}[Патрульный Ассистент]:{ffffff}"

local surfam = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("_(.*)")
local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
local bodyname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed)))
local result, ppid = sampGetPlayerIdByCharHandle(PLAYER_PED)
local result, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
local serverName = sampGetCurrentServerName()

local monetloader = require 'monetloader'
local sampev = require 'lib.samp.events'

local time = tonumber(os.date("%H"))
local faicons = require 'fAwesome6'

local search = imgui.new.char[128]()
local search1 = imgui.new.char[128]()
local pID = -1

local sf = require 'sampfuncs'
local addons = require 'ADDONS'
local ffi = require 'ffi'
local gta = ffi.load 'GTASA'
function OpenOne(link)
    gta._Z12AND_OpenLinkPKc(link)
end


themes = {
	{
	change = function()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
end
         },
    {
     change = function()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    colors[clr.FrameBg]                = ImVec4(0.52, 0.21, 0.18, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.93, 0.45, 0.33, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.93, 0.45, 0.33, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 0.40)
    colors[clr.TitleBgActive]          = ImVec4(0.93, 0.45, 0.33, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.93, 0.45, 0.33, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.92, 0.44, 0.32, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.93, 0.45, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.93, 0.45, 0.33, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.93, 0.45, 0.33, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.93, 0.45, 0.33, 1.00)
    colors[clr.Header]                 = ImVec4(0.83, 0.35, 0.23, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.93, 0.45, 0.33, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.93, 0.45, 0.33, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.93, 0.45, 0.33, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.93, 0.45, 0.33, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.93, 0.45, 0.33, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.93, 0.45, 0.33, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.93, 0.45, 0.33, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.93, 0.45, 0.33, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.93, 0.45, 0.33, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.93, 0.45, 0.33, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.93, 0.45, 0.33, 0.80)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
end
    }
}


local w = {
    first = 40,
    second = 90,
    minyt = 300,
    hour = 900,
    new = 195,
    old =800,
}


local inicfg = require 'inicfg'

local ini = inicfg.load({
   set = {
      nick = "",
      rank = "",
      phone = "",
      org = "",
      mark = "",
      zad = 1200,
      zad2 = 1200,
      autorp = false,
      piemenu = false,
      ymnayaz = false,
      widghet = false,
      combosu = false,
      combosutwo = false,
      combosuthere = false,
      checkboxone = false,
      checkboxtwo = false,
      checkboxnap = false,
      combotheme = 0,
      ComboPol = 0,
      ComboTest = 0,
      combomark = 0,
      combosost = 0,
      ComboNap = 0,
      },
   theme = {
	theme = "blue",
	selected = 0
	},
	wighet = {
	   city = false,
	   street = false,
	   kvadrat = false,
	   channel = false,
	   hp = false,
	   armour = false,
	   ping = false,
	   time = false,
	   menu = false,
	   windowposx = 1694,
	   windowposy = 29,
	   color = 1677721600
	   },
	radio = {
	   tag = "",
	   tagdepartment = "",
	   channel1 = "",
	   channel2 = "",
	   channel3 = "",
	   channel4 = "",
	   channel5 = "",
	   channel6 = "",
	   channel7 = "",
	   channel8 = "",
	   channel9 = "",
	   channel10 = "",
	   channel11 = "",
	   channel12 = "",
	   channel13 = "",
	   channel14 = "",
	   channel15 = "",
	   channel16 = "",
	   channel17 = "",
	   channel18 = "",
	   channel19 = "",
	   channel20 = ""
	   },
	guns = {
	   kastet = "/me надел кастет",
	   bat = "/me взял биту",
	   bomb = "",
	   camera = "/me достал фотоаппарат",
	   cane = "",
	   vibe = "",
	   vibe2 = "",
	   katana = "",
	   irgoggles = "",
	   poolcue = "",
	   pila = "",
	   fireex = "",
	   flowers = "/me развернул букет цветов",
	   golfclub = "",
	   lapata = "",
	   sprayicon = "",
	   knife =="",
	   dildo = "",
	   dildo2 = "",
	   para = "/me надел парашют на плечи",
	   colt = "", 
	   deagle = "/me достал пистолет из кобуры",
	   dub = "/me снял дубинку с поясного держателя",
	   taser = "/me достал тазер с кобуры",
	   shotgun = "/me достал Shotgun из-за спины",
	   shotgspa = "",
	   mp5 = "/me взял MP-5 в руки",
	   uzi = "",
	   tec = "",
	   double = "",
	   m4 = "/me взял карабин М4А1 в руки",
	   ak = "/me взял винтовку AK-47 в руки",
	   sniper = "/me взял снайперскую винтовку в руки",
	   rifle = "/me взял винтовку в руки",
	   flame = "",
	   rocket = "",
	   satchell = "",
	   minigun = "",
	   heatseek = "",
	   grenade = "/me взял гранату в руку",
	   molotov = "",
	   gas = "/me достал светошумовую гранату",
        
   },
   guns2 = {
   	kastet = "/me снял кастет",
         bat = "/me спрятал биту",
         bomb = "",
         camera = "/me убрал фотоаппарат закрыв его крыжкой",
         cane = "",
         vibe = "",
         vibe2 = "",
         katana = "",
         irgoggles = "",
         poolcue = "",
         pila = "",
         fireex = "",
         flowers = "/me завернул букет цветов",
         golfclub = "",
         lapata = "",
         sprayicon = "",
         knife =="",
         dildo = "",
         dildo2 = "",
         para = "/me снял парашют",
         colt = "", 
        deagle = "/me убрал пистолет в кобуру",
        dub = "/me повесил дубинку на пояс",
        taser = "/me убрал тазер в кобуру",
        shotgun = "/me убрал Shotgun за спину",
        shotgspa = "",
        mp5 = "/me убрал MP-5 в кобуру",
        uzi = "",
        tec = "",
        double = "",
        m4 = "/me убрал карабин М4А1 за спину",
        ak = "/me убрал винтовку АК-47 за спину",
        sniper = "/me свернул снайперскую винтовку в чехол",
        rifle = "/me повесил винтовку за спину",
        flame = "",
        rocket = "",
        satchell = "",
        minigun = "",
        heatseek = "",
        grenade = "/me убрал гранату в подсумок",
        molotov = "",
        gas = "/me убрал светошумовую гранату",
   	},
   
       cmd = {
        cmd1 = "cuff",
        cmd2 = "uncuff",
        cmd3 = "incar",
        cmd4 = "inmoto",
        cmd5 = "eject",
        cmd6 = "ticket",
        cmd7 = "mask",
        cmd8 = "clear",
        cmd9 = "take",
        cmd10 = "search",
        cmd11 = "arrest",
        cmd12 = "su",
        cmd13 = "pas",
        cmd14 = "frisk",
        cmd15 = "gotome",
        cmd16 = "ungotome",
        cmd17 = "find",
        cmd18 = "pull",
        cmd19 = "usemed",
        cmd21 = "traf",
        cmd22 = "meg",
        cmd23 = "unsu",
        cmd24 = "body",
        cmd25 = "invite",
        cmd26 = "uninvite",
        cmd27 = "fwarn",
        cmd28 = "unfwarn",
        cmd29 = "giverank",
        cmd30 = "miranda",
        cmd31 = "unmask"
        
    }
}, "MVDHelper.ini")


local guns = setmetatable({"kastet", "golfclub",  "dub", "knife", "bat", "lapata", "poolcue", "katana", "pila", "dildo", "dildo2", "vibe", "vibe2", "flowers", "cane", "grenade", "gas", "molotov", "colt", "taser", "deagle", "shotgun", "double", "shotgspa", "uzi",  "mp5",  "ak", "m4", "tec", "rifle", "sniper", "rocket", "heatseek", "flame", "minigun", "satchell", "bomb", "sprayicon", "fireex", "camera", "irgoggles",  "para"},
{
    __index = function(self, key)
        if not ini.guns[key] then
            ini.guns[key] = ""
        end
        self[key] = imgui.new.char[256](u8(ini.guns[key]))
        return self[key]
    end
})


local guns2 = setmetatable({"kastet", "golfclub",  "dub", "knife", "bat", "lapata", "poolcue", "katana", "pila", "dildo", "dildo2", "vibe", "vibe2", "flowers", "cane", "grenade", "gas", "molotov", "colt", "taser", "deagle", "shotgun", "double", "shotgspa", "uzi",  "mp5",  "ak", "m4", "tec", "rifle", "sniper", "rocket", "heatseek", "flame", "minigun", "satchell", "bomb", "sprayicon", "fireex", "camera", "irgoggles",  "para"},
{
    __index = function(self, key)
        if not ini.guns2[key] then
            ini.guns2[key] = ""
        end
        self[key] = imgui.new.char[256](u8(ini.guns2[key]))
        return self[key]
    end
})


local cmd = setmetatable({"cmd1", "cmd2", "cmd3", "cmd4", "cmd5", "cmd6", "cmd7", "cmd8", "cmd10", "cmd11", "cmd12",  "cmd13",  "cmd14",  "cmd15",   "cmd16",   "cmd17",  "cmd18",   "cmd19",  "cmd21",   "cmd22",  "cmd23",  "cmd24",  "cmd30",  "cmd31"},
{
	__index = function(self, key)
        if not ini.cmd[key] then
            ini.cmd[key] = ""
        end
        self[key] = imgui.new.char[256](u8(ini.cmd[key]))
        return self[key]
    end
})

local editWighet = false
local argbW = ini.wighet.color
local tmp = imgui.ColorConvertU32ToFloat4(ini.wighet.color)
local color = imgui.new.float[4](tmp.x, tmp.y, tmp.z, tmp.w)
local posX, posY = ini.wighet.windowposx, ini.wighet.windowposy

local days = {'Воскресенье.','Понедельник.','Вторник.','Среда.','Четверг.','Пятница.','Суббота.'}
local PoliceVehicle = {490, 525, 560, 601, 4802, 4803, 12717, 15085, 15499, 15500, 16909}

local slider = imgui.new.int(ini.set.zad)
local slider2  = imgui.new.int(ini.set.zad2)

local checkboxone = new.bool(ini.set.checkboxone)
local checkboxtwo = new.bool(ini.set.checkboxtwo)
local checkboxfive = new.bool(ini.set.combosu)
local checkboxthere = new.bool(ini.set.combosutwo)
local checkboxfour = new.bool(ini.set.combosuthere)
local autorp = new.bool(ini.set.autorp)
local Widghet = new.bool(ini.set.widghet)
local toggle = new.bool()
local checkboxnap = new.bool(ini.set.checkboxnap)
local ymnayaz = new.bool(ini.set.ymnayaz)
local piemod = new.bool(ini.set.piemenu)
local wcity = new.bool(ini.wighet.city)
local wstreet = new.bool(ini.wighet.street)
local wkv = new.bool(ini.wighet.kvadrat)
local wchannel = new.bool(ini.wighet.channel)
local whp = new.bool(ini.wighet.hp)
local warmour = new.bool(ini.wighet.armour)
local wping = new.bool(ini.wighet.ping)
local wtime = new.bool(ini.wighet.time)
local wmenu = new.bool(ini.wighet.menu)

local ComboTest = new.int(ini.set.ComboTest)
local item_list = {u8'Не выбрано', u8'LSPD', u8'SFPD', u8'LVPD', u8'RCPD', u8'FBI', u8'SWAT'}
local ImItems = imgui.new['const char*'][#item_list](item_list)

local ComboShow = new.int(ini.set.combomark)
local item = {u8'Не выбрано', 'LINCOLN', 'ADAM', 'MARY', 'EDWARD', 'ASD'}
local items = imgui.new['const char*'][#item](item)

local ComboPatryl = new.int(ini.set.combosost)
local itemm = {u8'Не выбрано', 'CODE 0', 'CODE 1', 'CODE 2', 'CODE 2 HIGH', 'CODE 3', 'CODE 4', 'CODE 4 ADAM', 'CODE 7', 'CODE 30', 'CODE 30 RINGER', 'CODE 37'}
local itemss = imgui.new['const char*'][#itemm](itemm)

local ComboNap = new.int(ini.set.ComboNap)
local naparnick = {u8'Элизабет', u8'Амелия', u8'Эвелин', u8'Элла', u8'Виктория', u8'Хлоя', u8'Лукас', u8'Джосеф', u8'Энтони', u8'Эндрю', u8'Самуэль', u8'Габриэль', u8'Адриан', u8'Чарльз', u8'Эдвард', u8'Игорь'}
local napparnick = imgui.new['const char*'][#naparnick](naparnick)

local ComboPol = new.int(ini.set.ComboPol)
local itempol = {u8'Не выбрано', u8'Мужской', u8'Женский'}
local itempoll = imgui.new['const char*'][#itempol](itempol)

local selected_theme = new.int(ini.theme.selected)
local theme_a = {u8'Синий', u8'Оранжевый'}
local theme_t = {u8'blue', u8'orange'}
local itemtheme = imgui.new['const char*'][#theme_a](theme_a)

local WinStateM = imgui.new.bool()
local showpie = imgui.new.bool()
local YstavFraction = imgui.new.bool()
local Patryl = imgui.new.bool()
local Kodecs = imgui.new.bool()
local Vijets = imgui.new.bool()
local Board = imgui.new.bool()
local Admin = imgui.new.bool()
local Ten = imgui.new.bool()
local WinState = imgui.new.bool()
local MainWindow = imgui.new.bool()
local Tik = imgui.new.bool()
local nap = imgui.new.bool()
local EditColor = imgui.new.bool()
local dopsetting = imgui.new.bool()
local Sobesorg = imgui.new.bool()


local buffer = imgui.new.char[256](u8(ini.set.nick))
local buffer1 = imgui.new.char[256](u8(ini.set.mark))
local buffer2 = imgui.new.char[256](u8(ini.set.rank))
local buffer3 = imgui.new.char[256](u8(ini.set.phone))
local buffer4 = imgui.new.char[256](u8(ini.set.org))
local testbuffer = imgui.new.char[252]()
local sobesball = imgui.new.int()
local sobesballm = imgui.new.int()
local sobesotvet = imgui.new.int()
local sobesproc = imgui.new.int()
local sobesotkaz = imgui.new.char[64]()
local sobesp = imgui.new.int(-1)
local mytag = imgui.new.char[64](u8(ini.radio.tag))
local tagdepat = imgui.new.char[64](u8(ini.radio.tagdepartament))


function imgui.CenterText(text)
    imgui.SetCursorPosX(imgui.GetWindowWidth()/2-imgui.CalcTextSize(u8(text)).x/2)
    imgui.Text(u8(text))
end

function formatTime(unixTime)
    local minutes = math.floor(unixTime / 60) % 60
    local seconds = unixTime % 60
    local formattedTime = string.format("%02d:%02d", minutes, seconds)
    return formattedTime
end

local startTime = os.time() 

local tab = 1 
local setting = 1
local tabsobes = 1

local file = io.open("WinslowWanted.json", "r") 
a = file:read("*a")
file:close() 
WinslowWanted = decodeJson(a) 

local file = io.open("WinslowTicket.json", "r") 
a = file:read("*a")
file:close()
WinslowTicket = decodeJson(a) 

local filew = io.open("WinslowKodecs.json", "r") 
a = filew:read("*a")
filew:close() 
WinslowKodecs = decodeJson(a) 
--------------------------------------------------ТАБЛИЦЫ---------------------------------------------

function kvadrat()
    local KV = {
        [1] = "А",
        [2] = "Б",
        [3] = "В",
        [4] = "Г",
        [5] = "Д",
        [6] = "Ж",
        [7] = "З",
        [8] = "И",
        [9] = "К",
        [10] = "Л",
        [11] = "М",
        [12] = "Н",
        [13] = "О",
        [14] = "П",
        [15] = "Р",
        [16] = "С",
        [17] = "Т",
        [18] = "У",
        [19] = "Ф",
        [20] = "Х",
        [21] = "Ц",
        [22] = "Ч",
        [23] = "Ш",
        [24] = "Я",
    }
    
    local X, Y, Z = getCharCoordinates(playerPed)
    X = math.ceil((X + 3000) / 250)
    Y = math.ceil((Y * - 1 + 3000) / 250)
    Y = KV[Y]
    local KVX = (Y.."-"..X)
    return KVX
end


    local NameCar = {
    --[ID CAR] = 'NAME CAR'
    --STANDART CAR
    [400] = 'Landstalker',
    [401] = 'Bravura',
    [402] = 'Buffalo',
    [403] = 'Linerunner',
    [404] = 'Perenniel',
    [405] = 'Sentinel',
    [406] = 'Dumper',
    [407] = 'Firetruck',
    [408] = 'Trashmaster',
    [409] = 'Stretch',
    [410] = 'Manana',
    [411] = 'Infernus',
    [412] = 'Voodoo',
    [413] = 'Pony',
    [414] = 'Mule',
    [415] = 'Cheetah',
    [416] = 'Ambulance',
    [417] = 'Leviathan',
    [418] = 'Moonbeam',
    [419] = 'Esperanto',
    [420] = 'Taxi',
    [421] = 'Washington',
    [422] = 'Bobcat',
    [423] = 'Mr Whoopee',
    [424] = 'BF Injection',
    [425] = 'Hunter',
    [426] = 'Premier',
    [427] = 'Enforcer',
    [428] = 'Securicar',
    [429] = 'Banshee',
    [430] = 'Predator',
    [431] = 'Bus',
    [432] = 'Rhino',
    [433] = 'Barracks',
    [434] = 'Hotknife',
    [435] = 'Article Trailer',
    [436] = 'Previon',
    [437] = 'Coach',
    [438] = 'Cabbie',
    [439] = 'Stallion',
    [440] = 'Rumpo',
    [441] = 'RC Bandit',
    [442] = 'Romero',
    [443] = 'Packer',
    [444] = 'Monster',
    [445] = 'Admiral',
    [446] = 'Squallo',
    [447] = 'Seasparrow',
    [448] = 'Pizzaboy',
    [449] = 'Tram',
    [450] = 'Article Trailer 2',
    [451] = 'Turismo',
    [452] = 'Speeder',
    [453] = 'Reefer',
    [454] = 'Tropic',
    [455] = 'Flatbed',
    [456] = 'Yankee',
    [457] = 'Caddy',
    [458] = 'Solair',
    [459] = "Berkley's RC",
    [460] = 'Skimmer',
    [461] = 'PCJ-600',
    [462] = 'Faggio',
    [463] = 'Freeway',
    [464] = 'RC Baron',
    [465] = 'RC Raider',
    [466] = 'Glendale',
    [467] = 'Oceanic',
    [468] = 'Sanchez',
    [469] = 'Sparrow',
    [470] = 'Patriot',
    [471] = 'Quad',
    [472] = 'Coastguard',
    [473] = 'Dinghy',
    [474] = 'Hermes',
    [475] = 'Sabre',
    [476] = 'Rustler',
    [477] = 'ZR-350',
    [478] = 'Walton',
    [479] = 'Regina',
    [480] = 'Comet',
    [481] = 'BMX',
    [482] = 'Burrito',
    [483] = 'Camper',
    [484] = 'Marquis',
    [485] = 'Baggage',
    [486] = 'Dozer',
    [487] = 'Maverick',
    [488] = 'SAN News Maverick',
    [489] = 'Rancher',
    [490] = 'FBI Rancher',
    [491] = 'Virgo',
    [492] = 'Greenwood',
    [493] = 'Jetmax',
    [494] = 'Hotring Racer',
    [495] = 'Sandking',
    [496] = 'Blista Compact',
    [497] = 'Police Maverick',
    [498] = 'Boxville',
    [499] = 'Benson',
    [500] = 'Mesa',
    [501] = 'RC Goblin',
    [502] = 'Hotring Racer A',
    [503] = 'Hotring Racer B',
    [504] = 'Bloodring Banger',
    [505] = 'Rancher',
    [506] = 'Super GT',
    [507] = 'Elegant',
    [508] = 'Journey',
    [509] = 'Bike',
    [510] = 'Mountain Bike',
    [511] = 'Beagle',
    [512] = 'Cropduster',
    [513] = 'Stuntplane',
    [514] = 'Tanker',
    [515] = 'Roadtrain',
    [516] = 'Nebula',
    [517] = 'Majestic',
    [518] = 'Buccaneer',
    [519] = 'Shamal',
    [520] = 'Hydra',
    [521] = 'FCR-900',
    [522] = 'NRG-500',
    [523] = 'HPV1000',
    [524] = 'Cement Truck',
    [525] = 'Towtruck',
    [526] = 'Fortune',
    [527] = 'Cadrona',
    [528] = 'FBI Truck',
    [529] = 'Willard',
    [530] = 'Forklift',
    [531] = 'Tractor',
    [532] = 'Combine Harvester',
    [533] = 'Feltzer',
    [534] = 'Remington',
    [535] = 'Slamvan',
    [536] = 'Blade',
    [537] = 'Freight (Train)',
    [538] = 'Brownstreak (Train)',
    [539] = 'Vortex',
    [540] = 'Vincent',
    [541] = 'Bullet',
    [542] = 'Clover',
    [543] = 'Sadler',
    [544] = 'Firetruck LA',
    [545] = 'Hustler',
    [546] = 'Intruder',
    [547] = 'Primo',
    [548] = 'Cargobob',
    [549] = 'Tampa',
    [550] = 'Sunrise',
    [551] = 'Merit',
    [552] = 'Utility Van',
    [553] = 'Nevada',
    [554] = 'Yosemite',
    [555] = 'Windsor',
    [556] = 'Monster A',
    [557] = 'Monster B',
    [558] = 'Uranus',
    [559] = 'Jester',
    [560] = 'Sultan',
    [561] = 'Stratum',
    [562] = 'Elegy',
    [563] = 'Raindance',
    [564] = 'RC Tiger',
    [565] = 'Flash',
    [566] = 'Tahoma',
    [567] = 'Savanna',
    [568] = 'Bandito',
    [569] = 'Freight Flat Trailer',
    [570] = 'Streak Trailer',
    [571] = 'Kart',
    [572] = 'Mower',
    [573] = 'Dune',
    [574] = 'Sweeper',
    [575] = 'Broadway',
    [576] = 'Tornado',
    [577] = 'AT400',
    [578] = 'DFT-30',
    [579] = 'Huntley',
    [580] = 'Stafford',
    [581] = 'BF-400',
    [582] = 'Newsvan',
    [583] = 'Tug',
    [584] = 'Petrol Trailer',
    [585] = 'Emperor',
    [586] = 'Wayfarer',
    [587] = 'Euros',
    [588] = 'Hotdog',
    [589] = 'Club',
    [590] = 'Freight Box Trailer',
    [591] = 'Article Trailer 3',
    [592] = 'Andromada',
    [593] = 'Dodo',
    [594] = 'RC Cam',
    [595] = 'Launch',
    [596] = 'Police Car (LSPD)',
    [597] = 'Police Car (SFPD)',
    [598] = 'Police Car (LVPD)',
    [599] = 'Police Ranger',
    [600] = 'Picador',
    [601] = 'S.W.A.T.',
    [602] = 'Alpha',
    [603] = 'Phoenix',
    [604] = 'Glendale Shit',
    [605] = 'Sadler Shit',
    [606] = 'Baggage Trailer A',
    [607] = 'Baggage Trailer B',
    [608] = 'Tug Stairs Trailer',
    [609] = 'Boxville',
    [610] = 'Farm Trailer',
    [611] = 'Utility Trailer',
    --CUSTOM CARS (ARIZONA)
    [612] = 'Mercedes-Benz GT63 AMG',
    [613] = 'Mercedes-Benz G63 AMG',
    [614] = 'Audi RS6',
    [662] = 'BMW X5',
    [663] = 'Chevrolet Corvette',
    [665] = 'Chevrolet Cruze',
    [666] = 'Lexus LX',
    [667] = 'Porsche 911',
    [668] = 'Porsche Cayenne',
    [699] = 'Bentley',
    [793] = 'BMW M8',
    [794] = 'Mercedes-Benz E63',
    [909] = 'Mercedes-Benz S63',
    [965] = 'Volksvagen Touareg',
    [1194] = 'Lamborghini Urus',
    [1195] = 'Audi Q8',
    [1196] = 'Dodge Challenger SRT',
    [1197] = 'Acura NSX',
    [1198] = 'Volvo V60',
    [1199] = 'Range Rover Evoque',
    [1200] = 'Honda Civic Type-R',
    [1201] = 'Lexus Sport-S',
    [1202] = 'Ford Mustang GT',
    [1203] = 'Volvo XC90',
    [1204] = 'Jaguar F-PACE',
    [1205] = 'Kia Optima',
    [3155] = 'BMW Z4 40i', 
    [3156] = 'Mercedes-Benz S600 W140',
    [3157] = 'BMW X5 e53', 
    [3158] = 'Nissan GTR R34',
    [3194] = 'Ducatti Diavel',
    [3195] = 'Ducatti Panigale',
    [3196] = 'Ducatti Ducnacker',
    [3197] = 'Kawasaki Ninja ZX-10RR',
    [3198] = 'Western',
    [3199] = 'Rolls Royce Cullinan',
    [3200] = 'Volkswagen Beetle',
    [3201] = 'Buggati Divo',
    [3202] = 'Buggati Chiron',
    [3203] = 'Fiat 500',
    [3204] = 'Mercedes-Benz GLS 2020',
    [3205] = 'Mercedes-AMG G65 AMG',
    [3206] = 'Lamborghini SVJ',
    [3207] = 'Range Rover SVA',
    [3208] = 'BMW 530i e39',
    [3209] = 'Mercedes-Benz S600 W220',
    [3210] = 'Tesla Model X',
    [3211] = 'Nissan Leaf',
    [3212] = 'Nissan Silvia S15',
    [3213] = 'Subary Forester XT',
    [3215] = 'Subary Legasy 1989',
    [3216] = 'Hyundai Sonata',
    [3217] = 'BMW 750i e38',
    [3218] = 'Mercedes-Benz E55 AMG',
    [3219] = 'Mercedes-Benz E500',
    [3220] = 'Jackson Storm',
    [3222] = 'Lightning McQueen',
    [3223] = 'Mater',
    [3224] = 'Buckingham',
    [3232] = 'Infinity FX50',
    [3233] = 'Lexus RX 450H',
    [3234] = 'Kia Sportage',
    [3235] = 'Volkswagen Golf R',
    [3236] = 'Audi R8',
    [3237] = 'Tayota Camry XV40',
    [3238] = 'Tayota Camry XV70',
    [3239] = 'BMW M5 e60',
    [3240] = 'BMW M5 F90',
    [3245] = 'Mercedes Maybach S650',
    [3247] = 'Mercedes-Benz AMG GT',
    [3248] = 'Porsche Panamera',
    [3251] = 'Volkswagen Passat',
    [3254] = 'Chevrolet Corvette 1980',
    [3266] = 'Dodge RAM',
    [3348] = 'Ford Mustang GT500',
    [3974] = 'Aston Martin BD5',
    [4542] = 'BMW M3 GTR',
    [4543] = 'Chevroler Camaro SS',
    [4544] = 'Mazda RX7',
    [4545] = 'Mazda RX8',
    [4546] = 'Mitsubishi Eclipse',
    [4547] = 'Ford Mustang 289',
    [4548] = 'Nissan 350Z',
    [4774] = 'BMW 760Li',
    [4775] = 'Aston Martin One-77',
    [4776] = 'Bentley Bacalar',
    [4777] = 'Bentley Bentayga',
    [4778] = 'BMW M4 Competition',
    [4779] = 'BMW i8',
    [4780] = 'Genesis G90',
    [4781] = 'Honda Integra Type-R',
    [4782] = 'BMW M3 G20',
    [4783] = 'Mercedes-Benz S500 W223',
    [4784] = 'Ford Raptor',
    [4785] = 'Ferrari J50',
    [4786] = 'Mercedes-Benz SLR McLaren',
    [4787] = 'Subary BRZ',
    [4788] = 'LADA Vesta SW Cross',
    [4789] = 'Porsche Taycan',
    [4790] = 'Ferrari Enzo',
    [4791] = 'UAZ Patriot',
    [4792] = 'Volga',
    [4793] = 'Mercedes-Benz X-Class',
    [4794] = 'Jaguar XF',
    [4795] = 'rcshutle',
    [4796] = 'Dodge Grand Caravan',
    [4797] = 'Dodge Charger',
    [4798] = 'Ford Explorer',
    [4799] = 'Ford F-150',
    [4800] = 'DeltaPlan',
    [4801] = 'Seashark',
    [4802] = 'Lambarghini Cantenario',
    [4803] = 'Ferrari 812 SuperFast',
    [6604] = 'Audi A6',
    [6605] = 'Audi Q7',
    [6606] = 'BMW M6 2020',
    [6606] = 'BMW M6 1990',
    [6608] = 'Mercedes-Benz CLA 45 AMG',
    [6609] = 'Mercedes-Benz CLS 63 AMG',
    [6610] = 'Haval H6',
    [6611] = 'Toyota Land Cruiser 200',
    [6612] = 'Lincoln Continental',
    [6613] = 'Porsche Macan',
    [6614] = 'Daewoo Matiz',
    [6615] = 'Mercedes-Benz 6x6',
    [6616] = 'Mercedes-Benz E63',
    [6617] = 'Monster Mutt',
    [6618] = 'Monster Indonesia',
    [6619] = 'Monster El Toro',
    [6620] = 'Monster Grave Digger',
    [6621] = 'Toyota Land Cruiser Prado',
    [6611] = 'Toyota Rav4',
    [6623] = 'Toyota Supra A90',
    [6624] = 'UAZ',
    [6625] = 'Volvo XC90 2012',
    [12713] = 'Mercedes-Benz GLE 63',
    [12714] = 'Renault Laguna',
    [12715] = 'Mercedes-Benz CLS 53',
    [12716] = 'Audi RS5',
    [12717] = 'Cadillac Escalade 2020',
    [12718] = 'Tesla CyberTrack',
    [12719] = 'Tesla Model S',
    [12720] = 'Ford GT',
    [12721] = 'Dodge Viper',
    [12722] = 'Volkswagen Polo',
    [12723] = 'Mitsibishi Evolution IX',
    [12724] = 'Audi TT RS',
    [12725] = 'Mercedes-Benz Actros',
    [12726] = 'Audi S4',
    [12727] = 'BMW 4-series',
    [12728] = 'Cadillac Escalade 2007',
    [12729] = 'Tayota Chaser',
    [12730] = 'Dacia 1300',
    [12731] = 'Mitsibishi Evolution X',
    [12732] = 'Chevrolet Impala 64',
    [12733] = 'Chevrolet Impala 67',
    [12734] = 'Kenwooth Track',
    [12735] = 'Kenwooth Trailer',
    [12736] = 'McLaren MP4',
    [12737] = 'Ford Mustang Mach 1',
    [12738] = 'Rolls-Royce Phantom',
    [12739] = 'Picup Track',
    [12740] = 'Volvo Track',
    [12741] = 'Subary WRX STI',
    [12742] = 'Sherp',
    [12743] = 'Sanki',
    [14119] = 'Audi A6',
    [14120] = 'Toyota Camry',
    [14121] = 'Kia',
    [14122] = 'Tesla Model X',
    [14123] = 'Toyota Rav4',
    [14124] = 'Nissan GTR 2017',
    [14767] = 'Mercedes-AMG Project One',
    [14768] = 'Aston Martin Valkyrie',
    [14769] = 'Chevrolet Aveo',
    [14857] = 'Bugatti Bolide',
    [14884] = 'Yacota K5',
    [14899] = 'Renault Duster',
    [14904] = 'Chevrolet Monza',
    [14905] = 'Mercedes-Benz G63 EQG',
    [14906] = 'HotWheels',
    [14907] = 'Hummer HX',
    [14908] = 'Ferrari LaFerrari',
    [14909] = 'BMW M5 CS',
    [14910] = 'LADA Priora',
    [14911] = 'quadra',
    [14912] = 'Mercedes-Benz GLE',
    [14913] = 'Mercedes-Benz Vision AVTR',
    [14914] = 'Specialize Stumpjumper',
    [14915] = 'Santa Cruz Tallboy',
    [14916] = 'Spooky Metalhead',
    [14917] = 'Turner Burner',
    [14918] = 'Holding Bus Company',
    [14919] = 'Los-Santos Inter Bus C.',
    [15085] = 'charger',
    [15098] = 'BMW M1 e26',
    [15099] = 'Lamborghini Countach',
    [15100] = 'Nagasaki',
    [15101] = 'Koenigsegg Gemera',
    [15102] = 'Kia K7',
    [15103] = 'toro',
    [15104] = 'Lexus LX600',
    [15105] = 'Nissan Qashqai',
    [15106] = 'predatorr',
    [15107] = 'Volkswagen Scirocco',
    [15108] = 'Longfin',
    [15109] = 'Toyota Land Cruser 300',
    [15110] = 'Wellcraft',
    [15111] = 'Yacht',
    [15112] = 'Boates',
    [15113] = 'Mercedes-Benz A45',
    [15114] = 'Toyota AE86',
    [15115] = 'Land Rover Defender',
    [15116] = 'mach',
    [15117] = 'Mazda 6',
    [15118] = 'Audi R8s',
    [15119] = 'Hyundai Santa Fe',
    [15295] = 'Range Rover Velar',
}

function getNameVehicleModel(id)
    local name
    if id then 
        name = NameCar[id]
    else
        name = 'Неизвестно'
    end
    return name
end


local streetsCoords = {
    {"Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169},
    {"Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406},
    {"Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700},
    {"Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406},
    {"Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000},
    {"Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000},
    {"East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916},
    {"LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916},
    {"Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916},
    {"Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100},
    {"Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916},
    {"Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508},
    {"LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916},
    {"Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916},
    {"Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916},
    {"Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000},
    {"Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916},
    {"Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000},
    {"Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874},
    {"Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406},
    {"Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000},
    {"Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000},
    {"Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074},
    {"Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916},
    {"Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916},
    {"Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916},
    {"Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000},
    {"Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916},
    {"Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916},
    {"Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916},
    {"Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916},
    {"Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916},
    {"Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000},
    {"Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916},
    {"Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916},
    {"Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916},
    {"Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916},
    {"Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916},
    {"Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511},
    {"Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916},
    {"Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916},
    {"Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916},
    {"The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916},
    {"Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916},
    {"Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916},
    {"Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916},
    {"Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000},
    {"Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000},
    {"Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916},
    {"Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916},
    {"Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916},
    {"Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916},
    {"The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916},
    {"Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916},
    {"Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916},
    {"Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000},
    {"Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916},
    {"Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916},
    {"Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916},
    {"LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916},
    {"Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916},
    {"Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916},
    {"Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916},
    {"Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916},
    {"Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916},
    {"Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000},
    {"Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500},
    {"Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916},
    {"Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916},
    {"East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916},
    {"Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916},
    {"Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916},
    {"Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916},
    {"Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916},
    {"Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916},
    {"Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000},
    {"Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916},
    {"Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916},
    {"Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916},
    {"Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916},
    {"Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916},
    {"Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916},
    {"Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916},
    {"Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916},
    {"Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000},
    {"Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916},
    {"Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916},
    {"Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916},
    {"Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916},
    {"Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916},
    {"Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916},
    {"Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916},
    {"Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916},
    {"Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916},
    {"Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916},
    {"Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916},
    {"Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916},
    {"Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916},
    {"Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916},
    {"Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916},
    {"Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000},
    {"Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000},
    {"The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916},
    {"Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916},
    {"Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916},
    {"Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916},
    {"Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916},
    {"Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000},
    {"Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916},
    {"The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000},
    {"Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916},
    {"Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916},
    {"Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916},
    {"Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000},
    {"Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916},
    {"Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916},
    {"Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916},
    {"Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916},
    {"Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916},
    {"Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916},
    {"Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916},
    {"Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916},
    {"Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916},
    {"Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916},
    {"King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000},
    {"Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916},
    {"Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000},
    {"Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916},
    {"Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916},
    {"Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000},
    {"Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916},
    {"Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916},
    {"LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916},
    {"Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000},
    {"Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916},
    {"East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916},
    {"Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916},
    {"Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916},
    {"Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916},
    {"Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916},
    {"Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000},
    {"Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000},
    {"Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916},
    {"East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916},
    {"Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916},
    {"Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916},
    {"Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916},
    {"East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916},
    {"Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916},
    {"Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000},
    {"Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916},
    {"Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916},
    {"The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916},
    {"Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916},
    {"Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000},
    {"Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916},
    {"Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916},
    {"Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916},
    {"Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916},
    {"Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916},
    {"Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916},
    {"Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916},
    {"Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916},
    {"Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916},
    {"Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916},
    {"Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916},
    {"Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916},
    {"Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916},
    {"Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916},
    {"Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916},
    {"Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916},
    {"East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916},
    {"Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000},
    {"Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916},
    {"Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000},
    {"El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000},
    {"Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916},
    {"Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000},
    {"The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916},
    {"Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000},
    {"Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916},
    {"Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000},
    {"Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916},
    {"Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916},
    {"East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916},
    {"Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916},
    {"Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916},
    {"Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916},
    {"Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385},
    {"Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916},
    {"East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916},
    {"Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916},
    {"Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916},
    {"Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916},
    {"Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916},
    {"East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916},
    {"Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916},
    {"Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000},
    {"Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916},
    {"Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000},
    {"The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916},
    {"Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916},
    {"Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916},
    {"Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000},
    {"King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000},
    {"El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916},
    {"Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916},
    {"The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916},
    {"Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916},
    {"Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916},
    {"The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916},
    {"Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916},
    {"Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916},
    {"Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916},
    {"Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916},
    {"Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916},
    {"Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916},
    {"King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000},
    {"Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916},
    {"Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916},
    {"Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916},
    {"Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000},
    {"The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916},
    {"Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916},
    {"Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916},
    {"Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916},
    {"Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916},
    {"Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916},
    {"Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000},
    {"Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000},
    {"Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000},
    {"Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916},
    {"City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000},
    {"Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000},
    {"The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916},
    {"Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000},
    {"Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916},
    {"Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916},
    {"Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916},
    {"El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916},
    {"Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000},
    {"Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000},
    {"Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000},
    {"Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000},
    {"Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916},
    {"Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916},
    {"Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000},
    {"Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916},
    {"Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385},
    {"Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916},
    {"Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916},
    {"Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916},
    {"Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916},
    {"Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916},
    {"Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000},
    {"Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000},
    {"K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916},
    {"Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916},
    {"Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916},
    {"Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916},
    {"Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916},
    {"Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916},
    {"East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916},
    {"Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916},
    {"Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000},
    {"Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916},
    {"Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916},
    {"Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000},
    {"Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916},
    {"Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916},
    {"Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000},
    {"Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000},
    {"Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916},
    {"Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916},
    {"Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916},
    {"The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916},
    {"El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000},
    {"Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000},
    {"Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916},
    {"Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916},
    {"Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000},
    {"Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916},
    {"Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916},
    {"Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916},
    {"Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916},
    {"'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000},
    {"Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000},
    {"El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000},
    {"Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000},
    {"Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000},
    {"Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000},
    {"Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916},
    {"East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916},
    {"San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000},
    {"Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000},
    {"Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916},
    {"Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916},
    {"Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916},
    {"Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000},
    {"Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000},
    {"LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916},
    {"Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916},
    {"Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000},
    {"El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000},
    {"Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000},
    {"Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916},
    {"San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000},
    {"Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000},
    {"The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916},
    {"Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916},
    {"Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000},
    {"Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000},
    {"Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916},
    {"Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916},
    {"Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916},
    {"Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000},
    {"Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000},
    {"Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000},
    {"The Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981},
    {"The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000},
    {"Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000},
    {"Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000},
    {"Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000},
    {"Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000},
    {"Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916},
    {"Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916},
    {"Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916},
    {"Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916},
    {"Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000},
    {"Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000},
    {"Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000},
    {"Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916},
    {"Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916},
    {"Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916},
    {"Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916},
    {"Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916},
    {"Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000},
    {"Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916},
    {"Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000},
    {"Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916},
    {"Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000},
    {"Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916},
    {"Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000},
    {"Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000},
    {"Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916},
    {"Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000},
    {"Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083},
    {"Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000},
    {"Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000},
    {"Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000},
    {"Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000},
    {"Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000},
    {"Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916},
    {"Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000},
    {"Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000},
    {"North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000},
    {"Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761},
    {"Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916},
    {"Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000},
    {"San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000},
    {"Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000},
    {"Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083},
    {"Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083},
    {"Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000},
    {"The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000},
    {"Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000},
    {"Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000},
    {"Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083},
    {"Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000},
    {"Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000},
    {"Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000},
    {"Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000},
    {"Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000},
    {"San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000},
    {"Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000},
    {"Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000},
    {"Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000}
}

function calculateZone(x, y, z)
    for i, v in ipairs(streetsCoords) do
        if (x >= v[2]) and (y >= v[3]) and (z >= v[4]) and (x <= v[5]) and (y <= v[6]) and (z <= v[7]) then
            return v[1]
        end
    end
    return "Нет"
end


---------------------------------------------------------ОКНА MIMGUI-------------------------------------------------------
local ui_meta = {
    __index = function(self, v)
        if v == "switch" then
            local switch = function()
                if self.process and self.process:status() ~= "dead" then
                    return false -- // Предыдущая анимация ещё не завершилась!
                end
                self.timer = os.clock()
                self.state = not self.state

                self.process = lua_thread.create(function()
                    local bringFloatTo = function(from, to, start_time, duration)
                        local timer = os.clock() - start_time
                        if timer >= 0.00 and timer <= duration then
                            local count = timer / (duration / 100)
                            return count * ((to - from) / 100)
                        end
                        return (timer > duration) and to or from
                    end

                    while true do wait(0)
                        local a = bringFloatTo(0.00, 0.85, self.timer, self.duration)
                        self.alpha = self.state and a or 0.85 - a
                        if a == 0.85 then break end
                    end
                end)
                return true -- // Состояние окна изменено!
            end
            return switch
        end
 
        if v == "alpha" then
            return self.state and 1.00 or 0.00
        end
    end
}


      function DrawImageGun()
         for _, im in ipairs({imhandle34, imhandle38, imhandle13, imhandle55, imhandle35, imhandle62, imhandle58, imhandle54, imhandle43, imhandle48, imhandle49, imhandle50, imhandle51, imhandle42, imhandle45, imhandle44, imhandle14, imhandle57, imhandle39, imhandle10, imhandle8, imhandle9, imhandle15, imhandle61, imhandle17, imhandle12, imhandle11,  imhandle7, imhandle63, imhandle18, imhandle16, imhandle59, imhandle52, imhandle41, imhandle56,  imhandle60, imhandle36, imhandle64, imhandle40, imhandle37, imhandle53, imhandle46}) do
            imgui.Image(im, imgui.ImVec2(36, 36))
            end
       end
       
       
      function DrawNaparnick()
         if ComboNap[0] == 0 then 
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Элизабет'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 1 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Амелия'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 2 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Эвелин'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 3 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Элла'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 4 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Виктория'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 5 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Хлоя'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 6 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Лукас'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 7 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Джосеф'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 8 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Энтони'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 9 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Эндрю'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 10 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Самуэль'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 11 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Габриэль'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 12 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Адриан'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 13 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Чарльз'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 14 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Эдвард'))
            imgui.SetCursorPosY(45)
         elseif ComboNap[0] == 15 then
            imgui.SetCursorPosX(120)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}Напарник Игорь'))
            imgui.SetCursorPosY(45)
         end
         imgui.Spacing()
         imgui.Separator()
         imgui.SetCursorPos(imgui.ImVec2(150, 50))
         if ComboNap[0] == 0 then 
            imgui.Image(imhandle19, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 1 then
            imgui.Image(imhandle20, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 2 then
            imgui.Image(imhandle21, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 3 then
            imgui.Image(imhandle22, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 4 then
            imgui.Image(imhandle24, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 5 then
            imgui.Image(imhandle23, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 6 then
            imgui.Image(imhandle25, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 7 then
            imgui.Image(imhandle26, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 8 then
            imgui.Image(imhandle27, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 9 then
            imgui.Image(imhandle28, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 10 then
            imgui.Image(imhandle29, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 11 then
               imgui.Image(imhandle30, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 12 then
               imgui.Image(imhandle31, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 13 then
               imgui.Image(imhandle32, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 14 then
               imgui.Image(imhandle33, imgui.ImVec2(156, 156))
         elseif ComboNap[0] == 15 then
               imgui.Image(imhandle27, imgui.ImVec2(156, 156))
         end
      end
   

 local damag = { state = false, duration = 0.5 }
 setmetatable(damag, ui_meta)
 local damag_frame = imgui.OnFrame(
    function() return damag.alpha > 0.00 end, -- Указываем здесь данное условие, тем самым рендеря окно только в том случае, если его прозрачность больше нуля
    function(self)
       imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 1, sizeY / 1), imgui.Cond.FirstUseEver, imgui.ImVec2(1.1, 0.8))
       imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, damag.alpha)
       imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(15, 20))
       if sampIsLocalPlayerSpawned(PLAYED_PED) then
          imgui.Begin(u8'Damag', _, imgui.WindowFlags.NoDecoration + imgui.WindowFlags.NoMove + imgui.WindowFlags.AlwaysAutoResize)
          imgui.PopStyleVar()
          local combotext = naparnick[ComboNap[0]+1]
          local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
          DrawNaparnick()
          imgui.TextWrapped(u8('Черт побери, '..surname..'! На нас было совершенно нападение! Нужно вызыать подкрепление! Давай доложим всем постам об этом. Найди укрытие и вызывай подмогу! Чем быстрее - тем лучше.'))
          imgui.NewLine()
          if imgui.Button(u8'Вызвать помощь', imgui.ImVec2(430, 40))  then
             local x, y, z = getCharCoordinates(PLAYER_PED)
             if ComboShow[0] == 0 then
                sampSendChat('/r Нет на CONTROL. Всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
             elseif ComboShow[0] == 1 then 
                sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
             elseif ComboShow[0] == 2 then 
                sampSendChat('/r  A-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
             elseif ComboShow[0] == 3 then
                sampSendChat('/r M-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
             elseif ComboShow[0] == 4 then
                sampSendChat('/r E-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')  
             elseif ComboShow[0] == 5  then 
                sampSendChat('/r ASD-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
             end
             damag.switch(false)
          end
          imgui.Spacing()
          if imgui.Button(u8'Не нужно', imgui.ImVec2(430, 40)) then
             damag.switch(false)
          end
          imgui.End()
       end
       imgui.PopStyleVar()
    end)
  
  
  
   local activenap = { state = false, duration = 1.0 } -- // Duration - это длительность анимации (в секундах)
   setmetatable(activenap, ui_meta) -- // Устанавливаем выше созданную мета-таблицу в таблицу состояния первого окна
   local activenap_frame = imgui.OnFrame(
      function() return activenap.alpha > 0.00 end, -- Указываем здесь данное условие, тем самым рендеря окно только в том случае, если его прозрачность больше нуля
      function(self)
         imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 1, sizeY / 1), imgui.Cond.FirstUseEver, imgui.ImVec2(1.1, 0.8))
         imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, activenap.alpha)
         imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(15, 20))
         imgui.Begin(u8'Active', _, imgui.WindowFlags.NoDecoration + imgui.WindowFlags.NoMove + imgui.WindowFlags.AlwaysAutoResize)
         imgui.PopStyleVar()
         local combotext = naparnick[ComboNap[0]+1]
         DrawNaparnick()
         local combotext = naparnick[ComboNap[0]+1]
         local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
         if ComboNap[0] == 0 then 
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Элизабет. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 1 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Амелия. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 2 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Эвелин. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 3 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Элла. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 4 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Виктория. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 5 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Хлоя. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 6 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Лукас. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 7 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Джосеф. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 8 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Энтони. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 9 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай зеакомиться, меня зовут Эндрю. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 10 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Самуэль. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 11 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Габриэль. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 12 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Адриан. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 13 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Чарльз. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 14 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Эдвард. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         elseif ComboNap[0] == 15 then
            imgui.TextWrapped(u8('Привет '..surname..'. Давай знакомиться, меня зовут Игорь. Теперь я твой напарник по службе. Во время службы я буду помогать тебе. Надеюсь, у нас получиться сработаться.'))
         end
         imgui.NewLine()
         if imgui.Button(u8'Понятно', imgui.ImVec2(430, 40)) then
            activenap.switch()
         end
         imgui.End()
         imgui.PopStyleVar()
      end)
        
           local SpawnMessage = { state = false, duration = 3.0 } -- // Duration - это длительность анимации (в секундах)
           setmetatable(SpawnMessage, ui_meta) -- // Устанавливаем выше созданную мета-таблицу в таблицу состояния первого окна
           local SpawnMessage_frame = imgui.OnFrame(
               function() return SpawnMessage.alpha > 0.00 end, -- Указываем здесь данное условие, тем самым рендеря окно только в том случае, если его прозрачность больше нуля
               function(self)
                  imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 1, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(1.1, 0.7))
                  imgui.SetNextWindowSize(imgui.ImVec2(450, 360), imgui.Cond.Always)
                  imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, SpawnMessage.alpha)
                  imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(15, 5))
                  imgui.Begin(u8'##Spawn', _, imgui.WindowFlags.NoDecoration + imgui.WindowFlags.NoMove)
                  imgui.PopStyleVar()
                  local combotext = naparnick[ComboNap[0]+1]
                  local time = tonumber(os.date("%H"))
                  local surfam = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("_(.*)")
                  DrawNaparnick()
                  if (time >= 12 and time < 18) then
                     imgui.TextWrapped(u8('Добрый день, '..ini.set.rank..' '..surfam..'. Вы успешно идентифицированы в системе MVDhelper SUSPECT. Удачной службы!'))
                     imgui.Spacing()
                  elseif (time >= 18 and time < 24) then
                     imgui.TextWrapped(u8('Добрый вечер, '..ini.set.rank..' '..surfam..'. Вы успешно идентифицированы в системе MVDhelper SUSPECT. Удачной службы!'))
                     imgui.Spacing()
                  elseif (time >= 00 and time < 05) then
                     imgui.TextWrapped(u8('Доброй ночи, '..ini.set.rank..' '..surfam..'. Вы успешно идентифицированы в системе MVDhelper SUSPECT. Удачной службы!'))
                     imgui.Spacing()
                  elseif (time >= 05 and time < 12) then
                     imgui.TextWrapped(u8('Доброе утро, '..ini.set.rank..' '..surfam..'. Вы успешно идентифицированы в системе MVDhelper SUSPECT. Удачной службы!'))
                     imgui.Spacing()
                     imgui.End()
                  end
                  imgui.PopStyleVar()
               end)
               
        
          local DokladStreet = { state = false, duration = 1.0 } 
          setmetatable(DokladStreet, ui_meta) 
          local DokladStreet_frame = imgui.OnFrame(
             function() return DokladStreet.alpha > 0.00 end,
             function(self)
                imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 1, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(1.1, 0.3))
                imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, DokladStreet.alpha)
                imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(15, 20))
                imgui.Begin(u8'##Doklad', _, imgui.WindowFlags.NoDecoration + imgui.WindowFlags.NoMove + imgui.WindowFlags.AlwaysAutoResize)
                imgui.PopStyleVar()
                local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
                DrawNaparnick()
                imgui.TextWrapped(u8('Ну что, '..surname..', прокатимся немного по этим грязным улочкам San Andreas? Нужно доложить по рации, что мы покинули участок и отправились в путь. Решать тебе.'))
                imgui.NewLine()
                if imgui.Button(u8'Сделать доклад', imgui.ImVec2(430, 40)) then
                   sampSendChat('/r Выезжаю из участка, доступен.')
                   DokladStreet.switch(false)
                   DokladWindow = false
                end
                imgui.Spacing()
                if imgui.Button(u8'Закрыть', imgui.ImVec2(430, 40)) then
                   DokladStreet.switch(false)
                   DokladWindow = false
                end
                imgui.End()
                imgui.PopStyleVar()
             end)
        
        
         imgui.OnFrame(function() return Vijets[0] and not isGamePaused() end, function()
            imgui.SetNextWindowPos(imgui.ImVec2(posX, posY), imgui.Cond.FirstUseEver)
            imgui.SetNextWindowSize(imgui.ImVec2(360), imgui.Cond.Always)
            imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(color[0], color[1], color[2], color[3]))
            imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(10, 10))
            imgui.PushStyleVarFloat(imgui.StyleVar.WindowRounding, 6)
            local flags = imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse +
            imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.AlwaysAutoResize
            if not editWighet then flags = flags + imgui.WindowFlags.NoMove end
            imgui.Begin('MVDHELPER Vijets', Vijets, flags)
            imgui.PopStyleVar()
            imgui.PopStyleVar()
            imgui.PopStyleColor()
            imgui.SetCursorPosX(110)
            imgui.CenterText(imgui.TextColoredRGB('{0069f2}MVDHelper'))
            imgui.SetCursorPosY(45)
            imgui.Separator()
            local city = {
               [0] = "Нет",
               [1] = "Los Santos",
               [2] = "San Fierro",
               [3] = "Las Venturas"
               }
       
         local p_city = getCityPlayerIsIn(PLAYER_HANDLE)
         if wcity[0] then
            imgui.Text(u8('Город: ' ..city[p_city]))
         end
         local x,y,z = getCharCoordinates(PLAYER_PED)
         if wstreet[0] then
            imgui.Text(u8('Район: '..calculateZone(x, y, z)))
         end
         if wkv[0] then
            imgui.Text(u8('Квадрат: '..kvadrat()))
         end
         if wtime[0] then
            imgui.Text(os.date('%T'))
         end
         if whp[0] then
            imgui.Text(u8"Здоровье:")
            imgui.SameLine()
            if (getCharHealth(PLAYER_PED) >= 86 and getCharHealth(PLAYER_PED) <10000) then
               imgui.TextColoredRGB('{34C924}'..getCharHealth(PLAYER_PED))
            elseif (getCharHealth(PLAYER_PED) >= 26 and getCharHealth(PLAYER_PED) <86) then
               imgui.TextColoredRGB('{ffff00}'..getCharHealth(PLAYER_PED))
            elseif (getCharHealth(PLAYER_PED) >= 0 and getCharHealth(PLAYER_PED) <26) then
               imgui.TextColoredRGB('{FF0000}'..getCharHealth(PLAYER_PED))
            end
         end
         if warmour[0] then 
            if getCharArmour(PLAYER_PED) >= 1 then
               imgui.Text(u8'Броня: '..getCharArmour(PLAYER_PED))
            end
         end
         if wping[0] then
            imgui.Text(u8'Пинг: '..sampGetPlayerPing(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))))
         end
         local pos = imgui.GetWindowPos()
         if editWighet and imgui.Button(u8'Сохранить', imgui.ImVec2(350, 40)) then
            editWighet = false
            WinStateM[0] = true
            ini.wighet.windowposx, ini.wighet.windowposy = pos.x, pos.y
            inicfg.save(ini, "MVDHelper.ini")
            sampAddChatMessage(tag.. ' Позиция виджета сохранена!', -1)
         end
         imgui.End()
         end)
    
       local PatrolPoliceCar = { state = false, duration = 1.0 } 
       setmetatable(PatrolPoliceCar, ui_meta) 
       local PatrolPoliceCar_frame = imgui.OnFrame(
          function() return PatrolPoliceCar.alpha > 0.00 end,
          function(self)
             imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 1, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(1.1, 0.2))
             imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, PatrolPoliceCar.alpha)
             imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(15, 20))
             imgui.Begin(u8'##CarPatrol', _, imgui.WindowFlags.NoDecoration + imgui.WindowFlags.NoMove + imgui.WindowFlags.AlwaysAutoResize)
             imgui.PopStyleVar()
             local combotext = naparnick[ComboNap[0]+1]
             DrawNaparnick()
             imgui.TextWrapped(u8'Кажется, ты удобно расположился в своём патрульном транспорте и уже ничего не мешает приступить к работе. Готов начать патруль и зарегистрироваться в системе?')
             imgui.NewLine()
             imgui.Separator()
             if imgui.Button(u8'Да', imgui.ImVec2(220, 50)) then
                Board[0] = true
                PatrolPoliceCar.switch(false)
             end
             imgui.SameLine()
             if imgui.Button(u8'Нет', imgui.ImVec2(225, 50)) then
                PatrolPoliceCar.switch(false)
             end
             imgui.End()
             imgui.PopStyleVar()
          end)
    
    
     imgui.OnFrame(function() return Patryl[0] and not isGamePaused() end, function()
        imgui.SetNextWindowPos(imgui.ImVec2(165, 480), imgui.Cond.FirstUseEver, imgui.ImVec2(0.2, 0.2))
        imgui.SetNextWindowSize(imgui.ImVec2(480), imgui.Cond.Always)
        imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0, 0, 0, 0.40))
        imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(10, 20))
        imgui.PushStyleVarFloat(imgui.StyleVar.WindowRounding, 6)
        imgui.Begin(u8'MVDHELPER Patryl', Patryl, imgui.WindowFlags.NoDecoration + imgui.WindowFlags.NoMove + imgui.WindowFlags.AlwaysAutoResize)
        imgui.PopStyleVar()
        imgui.PopStyleVar()
        imgui.PopStyleColor()
        imgui.SetCursorPosX(45)
        imgui.CenterText(imgui.TextColoredRGB('{0069f2}Патрульный ассисент MVDHelper'))
        imgui.SetCursorPosY(50)
        imgui.Spacing()
        imgui.Separator()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Text(u8"В ПАТРУЛЕ")
        imgui.SameLine(170)
        imgui.NoActiveButton(('%s'):format(formatTime(os.time() - startTime)), imgui.ImVec2(290, 35))
        imgui.Spacing()
        imgui.Spacing()
        local combotext = item[ComboShow[0]+1]
        imgui.Text(u8'ЮНИТ')
        imgui.SameLine(170)
        if ComboShow[0] == 1 then 
           imgui.NoActiveButton('L-'..ini.set.mark..' ', imgui.ImVec2(290, 35))
        elseif ComboShow[0] == 2 then 
           imgui.NoActiveButton('A-'..ini.set.mark..' ', imgui.ImVec2(290, 35))
        elseif ComboShow[0] == 3 then
           imgui.NoActiveButton('M-'..ini.set.mark..' ', imgui.ImVec2(290, 35))
        elseif ComboShow[0] == 4 then 
           imgui.NoActiveButton('E-'..ini.set.mark..' ', imgui.ImVec2(290, 35))
        elseif ComboShow[0] == 5 then 
           imgui.NoActiveButton('ASD-'..ini.set.mark..' ', imgui.ImVec2(290, 35))
        end
        imgui.Spacing()
        imgui.Spacing()
        imgui.Text(u8'СОСТОЯНИЕ')
        imgui.SameLine(170)
        imgui.PushItemWidth(290)
        imgui.Combo(u8'', ComboPatryl,itemss, #itemm)
        imgui.PopItemWidth()
        imgui.End()
     end)
  
 imgui.OnFrame(function() return YstavFraction[0] and not isGamePaused() end, function()
    imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(1600, 1000), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'MVDHELPER | Устав организации ', YstavFraction)
    local serverName = sampGetCurrentServerName()
if serverName == "Arizona RP | Winslow | X4 Payday!" or serverName ==  "Arizona Role Play | Winslow" then
    for wystav, ystav in pairs(WinslowKodecs["winslowYstav"]) do
    imgui.Text(u8(ystav))
    end
end
       imgui.End()
  end)

  imgui.OnFrame(function() return Kodecs[0] and not isGamePaused() end, function()
    imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(1600, 1000), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'MVDHELPER | Уголовный Кодекс', Kodecs)
local serverName = sampGetCurrentServerName()
if serverName == "Arizona RP | Winslow | X4 Payday!" or serverName ==  "Arizona Role Play | Winslow" then
    for wYK, YK in pairs(WinslowKodecs["winslowYK"]) do
    imgui.Text(u8(YK))
    end
end
    imgui.End()
  end) 
   
   
   imgui.OnFrame(function() return Admin[0] end, function(player)
    imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(1600, 1000), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'MVDHELPER | Административный Кодекс', Admin)
    local serverName = sampGetCurrentServerName()
if serverName == "Arizona RP | Winslow | X4 Payday!" or serverName ==  "Arizona Role Play | Winslow" then
    for _, AK in pairs(WinslowKodecs["winslowAK"]) do
    imgui.Text(u8(AK))
    end
end
     imgui.End()
     end)
     
     
     imgui.OnFrame(function() return Ten[0] end, function(player)
    imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(700, 400), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'MVDHELPER | Тен-Коды', Ten)
    imgui.CenterText('Список тэн-кодов:')
        for codes, tencode in ipairs({'10-1 Принимаю плохо, неуверенно',
        '10-2 Принимаю уверенно',
        '10-3 Прекратите передачу',
        '10-4 Сообщение принял',
        '10-5 Ретранслируйте сообщение',
        '10-6 Я занят, подождите',
        '10-7 Связь закончил, выключаю станцию',
        '10-8 Готов к работе, можете вызывать меня',
        '10-9 Повторите ваше сообщение',
        '10-10 Нет, отрицание',
        '10-11 Остановка',
        '10-13 Выстрел',
        '10-14 Сопровождаю объект',
        '10-15 Подозреваемый … *Имя*',
        '10-17 Срочное сообщение!',
        '10-18 Срочно. Побыстрее.',
        '10-19 Для вас ничего нет / Возвращайтесь на базу',
        '10-20 Моё местоположение … *Улица*',
        '10-21 Позвоните по телефону …',
        '10-22 Сообщите также <кому-либо>',
        '10-23 На месте',
        '10-24 Последнее задание выполнено',
        '10-25 Вы можете связаться с …?',
        '10-26 Последняя информация (сообщение) отменяется',
        '10-28 Какой ваш позывной?',
        '10-29 Время для связи вышло',
        '10-30 Это не разрешается правилами связи',
        '10-33 Имею сообщение об аварии/бедствии',
        '10-34 Нужна помощь',
        '10-35 Конфиденциальная информация',
        '10-36 Точное время сейчас …',
        '10-37 Нужна техпомощь',
        '10-38 Нужна «скорая помощь»',
        '10-39 Ваше сообщение передано',
        '10-42 Авария на …',
        '10-43 Пробка на …',
        '10-44 У меня есть сообщение для вас',
        '10-45 Все, кто слышит меня, откликнитесь!',
        '10-54 Возможно труп',
        '10-55 Замечен пьяный водитель',
        '10-58 Прямое движение',
        '10-59 Эскорт или сопровождение/Проверка безопасности',
        '10-61 Остановка подозрительного транспорта',
        '10-65 Жду вашего следующего сообщения/задания',
        '10-70 Пожар на …',
        '10-71 Связывайтесь в порядке очереди',
        '10-73 Пешая погоня',
        '10-77 Извините, ошибочный вызов',
        '10-80 Идет преследование - погоня.',
        '10-83 Дополнительный офицер (нужно подкрепление)',
        '10-99 Задание выполнено, всё в порядке',
        '10-100 Мне нужно отойти'}) do
           imgui.Text(u8(tencode))
      end
    imgui.End()
    end)
     
   
    
    function imgui.NoActiveButton(...)
       imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.50, 0.50, 0.50, 1))
       imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.50, 0.50, 0.50, 1))
       imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.50, 0.50, 0.50, 1))
    
        imgui.Button(...)
    
       imgui.PopStyleColor()
       imgui.PopStyleColor()
       imgui.PopStyleColor()
    end
    
   
    
    imgui.OnFrame(function() return Board[0] and not isGamePaused() end, function()
    imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(1630, 800), imgui.Cond.Always)
    imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0, 0, 0, 1))
    imgui.Begin(u8'MVDHELPER | BOARD PERSONAL COMPUTER - PATRYL ASSISTANT SYSTEM TERMINAL', Board, imgui.WindowFlags.NoResize)
    imgui.PopStyleColor()
     imgui.BeginChild('Name', imgui.ImVec2(590, 730), true) 
            imgui.Text(u8'ПОДРАЗДЕЛЕНИЕ')
            imgui.SameLine()
            imgui.SetCursorPosX(270)
            if ComboTest[0] == 1 then 
            imgui.NoActiveButton(u8'1 — LSPD', imgui.ImVec2(310, 40))
            elseif ComboTest[0] == 2 then
            imgui.NoActiveButton(u8'2 — SFPD', imgui.ImVec2(310, 40))
            elseif ComboTest[0] == 3 then 
            imgui.NoActiveButton(u8'3 — LVPD', imgui.ImVec2(310, 40))
            elseif ComboTest[0] == 4 then
            imgui.NoActiveButton(u8'4 — RCPD', imgui.ImVec2(310, 40))
            elseif ComboTest[0] == 5 then 
            imgui.NoActiveButton(u8'5 — FBI', imgui.ImVec2(310, 40))
            elseif ComboTest[0] == 6 then 
            imgui.NoActiveButton(u8'6 — SWAT', imgui.ImVec2(310, 40))
            end
            imgui.Spacing()
            imgui.Text(u8'НОМЕР ЮНИТА')
            imgui.SameLine()
            imgui.SetCursorPosX(270)
            imgui.PushItemWidth(310)
            if imgui.InputText("##5", buffer1, 256) then
            imgui.PopItemWidth()
        ini.set.mark = u8:decode(ffi.string(buffer1))
        inicfg.save(ini, "MVDHelper.ini")
        end
        imgui.Spacing()
            imgui.Text(u8'МАРКИРОВКА')
            imgui.SameLine()
            imgui.SetCursorPosX(270)
            imgui.PushItemWidth(310)
            imgui.Combo(u8' ',ComboShow,items, #item)
            imgui.PopItemWidth()
            imgui.Spacing()
            imgui.Text(u8'СОСТОЯНИЕ')
            imgui.SameLine()
            imgui.SetCursorPosX(270)
            imgui.PushItemWidth(310)
            imgui.Combo(u8'  ', ComboPatryl,itemss, #itemm)
            imgui.PopItemWidth()
            imgui.Spacing()
        imgui.Separator()
        imgui.Spacing()
    if imgui.Button(u8'Начать патруль', imgui.ImVec2(250, 40)) then
           for _, police in ipairs(PoliceVehicle) do
         if isCharInAnyPoliceVehicle(PLAYER_PED) or isCharInModel(PLAYER_PED, police) then
        startTime = os.time()
        if ComboTest[0] == 1 and ComboShow[0] == 1 then 
        sampSendChat('/vdesc 1-L-'..ini.set.mark)
       elseif ComboTest[0] == 1 and ComboShow[0] == 2 then
       sampSendChat('/vdesc 1-A-'..ini.set.mark)
       elseif ComboTest[0] == 1 and ComboShow[0] == 3 then
       sampSendChat('/vdesc 1-M-'..ini.set.mark)
       elseif ComboTest[0] == 1 and ComboShow[0] == 4 then
       sampSendChat('/vdesc 1-E-'..ini.set.mark)
       elseif ComboTest[0] == 1 and ComboShow[0] == 5 then
       sampSendChat('/vdesc 1-ASD-'..ini.set.mark)
       
       elseif ComboTest[0] == 2 and ComboShow[0] == 1 then 
       sampSendChat('/vdesc 2-L-'..ini.set.mark)
       elseif ComboTest[0] == 2 and ComboShow[0] == 2 then
       sampSendChat('/vdesc 2-A-'..ini.set.mark)
       elseif ComboTest[0] == 2 and ComboShow[0] == 3 then
       sampSendChat('/vdesc 2-M-'..ini.set.mark)
       elseif ComboTest[0] == 2 and ComboShow[0] == 4 then
       sampSendChat('/vdesc 1-E-'..ini.set.mark)
       elseif ComboTest[0] == 2 and ComboShow[0] == 5 then
       sampSendChat('/vdesc 2-ASD-'..ini.set.mark)
       
       elseif ComboTest[0] == 3 and ComboShow[0] == 1 then 
       sampSendChat('/vdesc 3-L-'..ini.set.mark)
       elseif ComboTest[0] == 3 and ComboShow[0] == 2 then
       sampSendChat('/vdesc 3-A-'..ini.set.mark)
       elseif ComboTest[0] == 3 and ComboShow[0] == 3 then
       sampSendChat('/vdesc 3-M-'..ini.set.mark)
       elseif ComboTest[0] == 3 and ComboShow[0] == 4 then
       sampSendChat('/vdesc 3-E-'..ini.set.mark)
       elseif ComboTest[0] == 3 and ComboShow[0] == 5 then
       sampSendChat('/vdesc 3-ASD-'..ini.set.mark)
       
       elseif ComboTest[0] == 4 and ComboShow[0] == 1 then 
       sampSendChat('/vdesc 4-L-'..ini.set.mark)
       elseif ComboTest[0] == 4 and ComboShow[0] == 2 then
       sampSendChat('/vdesc 4-A-'..ini.set.mark)
       elseif ComboTest[0] == 4 and ComboShow[0] == 3 then
       sampSendChat('/vdesc 4-M-'..ini.set.mark)
       elseif ComboTest[0] == 4 and ComboShow[0] == 4 then
       sampSendChat('/vdesc 4-E-'..ini.set.mark)
       elseif ComboTest[0] == 4 and ComboShow[0] == 5 then
       sampSendChat('/vdesc 4-ASD-'..ini.set.mark)
       
       elseif ComboTest[0] == 5 and ComboShow[0] == 1 then 
       sampSendChat('/vdesc 5-L-'..ini.set.mark)
       elseif ComboTest[0] == 5 and ComboShow[0] == 2 then
       sampSendChat('/vdesc 5-A-'..ini.set.mark)
       elseif ComboTest[0] == 5 and ComboShow[0] == 3 then
       sampSendChat('/vdesc 5-M-'..ini.set.mark)
       elseif ComboTest[0] == 5 and ComboShow[0] == 4 then
       sampSendChat('/vdesc 5-E-'..ini.set.mark)
       elseif ComboTest[0] == 5 and ComboShow[0] == 5 then
       sampSendChat('/vdesc 5-ASD-'..ini.set.mark)
  end    
  
    if ComboShow[0] == 0 then
    sampAddChatMessage(tagg.. ' Выберите сначала маркировку для начала патруля!!', -1)
    elseif ComboShow[0] == 1 then 
    sampSendChat('/r '..ini.set.nick..' на CONTROL. Заступаю в патруль как L-'..ini.set.mark..', доступен')
    Patryl[0] = true
    elseif ComboShow[0] == 2 then 
    sampSendChat('/r '..ini.set.nick..' на CONTROL. Заступаю в патруль как A-'..ini.set.mark..', доступен')
    Patryl[0] = true
    elseif ComboShow[0] == 3 then 
    sampSendChat('/r '..ini.set.nick..' на CONTROL. Заступаю в патруль как M-'..ini.set.mark..', доступен')
    Patryl[0] = true 
        elseif ComboShow[0] == 4 then 
    sampSendChat('/r '..ini.set.nick..' на CONTROL. Заступаю в патруль как E-'..ini.set.mark..', доступен')
    Patryl[0] = true
    elseif ComboShow[0] == 5 then 
    sampSendChat('/r '..ini.set.nick..' на CONTROL. Заступаю в патруль как ASD-'..ini.set.mark..', доступен')
    Patryl[0] = true
                    end
               end 
          end
     end
        imgui.SameLine()
        imgui.SetCursorPosX(330)
              if imgui.Button(u8'Завершить патруль', imgui.ImVec2(250, 40)) then
              if ComboShow[0] == 0 then
    sampAddChatMessage(tagg.. ' Выберите маркировку!', -1)
    elseif ComboShow[0] == 1 then 
    sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Завершаю патруль, освобождаю маркировку L-'..ini.set.mark..', конец связи')
    Patryl[0] = false
    elseif ComboShow[0] == 2 then 
    sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Завершаю патруль, освобождаю маркировку A-'..ini.set.mark..', конец связи')
    Patryl[0] = not Patryl[0]
    elseif ComboShow[0] == 3 then 
    sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Завершаю патруль, освобождаю маркировку M-'..ini.set.mark..', конец связи')
    Patryl[0] = false
        elseif ComboShow[0] == 4 then 
    sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Завершаю патруль, освобождаю маркировку E-'..ini.set.mark..', конец связи')
    Patryl[0] = false 
    elseif ComboShow[0] == 5 then 
    sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Завершаю патруль, освобождаю маркировку AIR-'..ini.set.mark..', конец связи')
    Patryl[0] = false
        end
        sampSendChat('/delvdesc')
   end
   imgui.Spacing()
           imgui.Separator()
           if imgui.CollapsingHeader(u8'ПОМОЩЬ ПО ПАТРУЛИРУВАНИЮ') then
           imgui.CenterText('ИДЕНТИФИКАТОРЫ ДЕПАРТАМЕНТОВ')
           imgui.Spacing()
           imgui.Text(u8'LOS SANTOS PD - 1')
           imgui.Text(u8'SAN FIERRO PD - 2')
           imgui.Text(u8'LAS VENTURAS PD - 3')
           imgui.Text(u8'RED COUNTRY PD - 4')
           imgui.Text(u8'FBI - 5')
           imgui.Spacing()
           imgui.CenterText('ИНФОРМАЦИЯ О МАРКИРОВКАХ')
           imgui.Spacing()
           imgui.TextWrapped(u8'ADAM - парный патрульный юнит, состоящий из двух офицеров PD (Иногда может состоять из трёх офицеров).')
           imgui.Spacing()
           imgui.TextWrapped(u8'LINCOL - одиночный патрульный юнит, состоящий из одного офицера PD.')
           imgui.Spacing()
           imgui.TextWrapped(u8'MARY - одиночный мото-юнит (Cop Bike).')
           imgui.Spacing()
           imgui.TextWrapped(u8'EDWARD - одиночный эвакуатор-юнит.')
           imgui.Spacing()
           imgui.TextWrapped(u8'AIR - парный патрульный юнит, состоящий из пилота и штурмовика в верталёте.')
           imgui.Spacing()
           imgui.CenterText('ИНФОРМАЦИЯ О СОСТОЯНИЯХ')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 0 - самый приоритетный вызов, обычно объявляется, когда офицер/офицеры на земле (ранены/убиты). Все офицеры на дежурстве обязаны отравится на местоположение, где и был объявлен код. Ложное упоминание данного кода при работе влечет за собой ответственность от выговора до увольнения.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 1 - офицер в бедственном положении, например, под обстрелом, но ещё в состоянии стоять на ногах. Второй по приоритету вызов после CODE 0, но приоритенее вызова по CODE 3.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 2 - требуется подкрепление, тихий режим (без сирен/стробоскопов), считается низко приоритетным.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 2 HIGH - приоритетный вызов, тихий режим (без сирен/стробоскопов), соблюдая ПДД.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 3 - срочно требуется подкрепление/экстренный вызов, необходимо срочно выехать на местоположение, где и был объявлен код, считается высоко приоритетным с включенными сиренами и мигалками.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 4 - помощь не требуется.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 4 ADAM - помощь не требуется в данный момент времени. Офицеры находящиеся по близости должны быть готовы оказать помощь.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 7 - перерыв на обед.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 30 - срабатывание "тихой" сигнализации на месте происшествия.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 30 RINGER - срабатывание "громкой" сигнализации на месте происшествия.')
           imgui.Spacing()
           imgui.TextWrapped(u8'CODE 37 - обнаружение угнанного транспортного средства. Необходимо указать номер, описание автомобиля, направление движения.')
           imgui.Spacing()
           else
           imgui.SetCursorPos(imgui.ImVec2(190, 350))
           imgui.Image(imhandle1, imgui.ImVec2(220, 220))
           end
    imgui.EndChild() 
    imgui.SetCursorPos(imgui.ImVec2(600, 43))
    imgui.BeginChild('##PatrolPanel', imgui.ImVec2(1000, 730), true)
       imgui.EndChild()
end)



imgui.OnFrame(function() return MainWindow[0] and not isGamePaused() end, function()
imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 1, sizeY / 3), imgui.Cond.FirstUseEver, imgui.ImVec2(1.2,  1.9))
imgui.PushStyleVarFloat(imgui.StyleVar.WindowBorderSize, 1)
imgui.PushStyleVarFloat(imgui.StyleVar.WindowRounding, 1)
imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(10, 10))
    imgui.Begin(u8'MVDHELPER', MainWindow, imgui.WindowFlags.NoDecoration + imgui.WindowFlags.AlwaysAutoResize + imgui.WindowFlags.NoMove)
    imgui.PopStyleVar()
    imgui.PopStyleVar()
    imgui.PopStyleVar()
    if imgui.Checkbox(u8'Запрашивать выдачу розыска через рацию', checkboxfive) then
    ini.set.combosu = checkboxfive[0]
    inicfg.save(ini, "MVDHelper.ini")
    end
    imgui.Spacing()
    if checkboxfive[0] then
     if imgui.Checkbox(u8'Писать уровень розыск при запросе', checkboxthere) then
     ini.set.combosutwo = checkboxthere[0]
     inicfg.save(ini, "MVDHelper.ini")
     end
     imgui.Spacing()
    if imgui.Checkbox(u8'Пояснять причину след. сообщением в рацию', checkboxfour) then
         ini.set.combosuthere = checkboxfour[0]
         inicfg.save(ini, "MVDHelper.ini")
     end
 end
     imgui.End()
 end)


     imgui.OnFrame(function() return WinState[0] and not isGamePaused() end, function()
        imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(1200, 910), imgui.Cond.FirstUseEver)
        imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(15, 5))
        imgui.Begin(u8'Умная выдача розыска', WinState)
        imgui.PopStyleVar()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.InputText(u8'Поиск', search,256)
        imgui.SameLine(1100)
        if imgui.Button(faicons('gear'), imgui.ImVec2(50, 50)) then
           MainWindow[0] = not MainWindow[0]
        end
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()

local serverName = sampGetCurrentServerName()
if serverName == "Arizona RP | Winslow | X4 Payday!" or serverName ==  "Arizona Role Play | Winslow" then
   for ic, chapter in ipairs(WinslowWanted) do
      if u8(chapter.chapter):find(ffi.string(search)) then    
         if imgui.CollapsingHeader(u8(chapter.chapter)) then
            for ia, article in ipairs(chapter.articles) do
               if imgui.Selectable(u8(article.content)) then
                  lua_thread.create(function()
                     WinState[0] = false
                     sampSendChat('/me зажал кнопку на опции и сообщил диспетчеру приметы подозреваемого')
                     wait(slider[0])
                     sampSendChat('/su '..pID.. article.stars.. article.reason)
                     wait(100)
                     if ymnayaz[0] then
                        sampSendChat('/z '..pID)
                     end
                     wait(4200)
                     sampSendChat('/do Преступник занесен в базу данных.')
                  end)
               end
            end
    imgui.NewLine()
         end
imgui.Spacing()
      end
   end
end
imgui.End()
end)


    imgui.OnFrame(function() return Tik[0] and not isGamePaused() end, function()
       imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
       imgui.SetNextWindowSize(imgui.ImVec2(1200, 910), imgui.Cond.FirstUseEver)
       imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(15, 5))
       imgui.Begin(u8'Умная выдача штрафа', Tik)
       imgui.PopStyleVar()
       imgui.Spacing()
       imgui.Spacing()
       imgui.Spacing()
       imgui.InputText(u8'Поиск',search1,256)
       imgui.Spacing()
       imgui.Spacing()
       imgui.Spacing()

local serverName = sampGetCurrentServerName()
if serverName == "Arizona RP | Winslow | X4 Payday!" or serverName ==  "Arizona Role Play | Winslow" then
     for icc, chapters in ipairs(WinslowTicket) do
        if u8(chapters.chapter):find(ffi.string(search1)) then    
           if imgui.CollapsingHeader(u8(chapters.chapter)) then
              for iaa, article in ipairs(chapters.tickets) do
                 if imgui.Selectable(u8(article.content)) then
                    lua_thread.create(function()
                       Tik[0] = false
                       sampSendChat('/me достав с нагрудного кармана ручку и бланк для штрафа, вписал в него данные нарушения, ...')
                       wait(slider[0])
                       sampSendChat('/me ... затем передавал бланк нарушителю для дальнейшей оплаты.')
                       wait(slider[0])
                       sampSendChat('/writeticket '..pID.. article.money.. article.reason)
                    end)
                 end
              end
    imgui.NewLine()
           end
imgui.Spacing()
        end
     end
end
  imgui.End()
end)
  

     
     imgui.OnFrame(function() return dopsetting[0] and not isGamePaused() end, function()
        imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(980, 800), imgui.Cond.Always)
        imgui.Begin(u8'MVD Helper | Дополнительная настройка оружия', dopsetting, imgui.WindowFlags.NoResize)
        imgui.PushItemWidth(500) 
        if imgui.SliderInt(u8'Интервал RP - отыгровок оружия', slider2, 1000, 2000) then
           imgui.PopItemWidth()
           ini.set.zad2 = slider2[0]
           inicfg.save(ini, "MVDHelper.ini")
        end
        imgui.SetCursorPos(imgui.ImVec2(10, 80))
        imgui.BeginChild('DopSettingGun', imgui.ImVec2(970, 900), true) 
        imgui.BeginChild('GunSetting', imgui.ImVec2(50, 1950), true) 
        imgui.CenterText('ID')
        imgui.Separator()
        for i = 1, 44 do 
           imgui.CenterText(tostring(i))
           imgui.Spacing()
           imgui.Spacing()
        end
        imgui.CenterText('46')
        imgui.EndChild()
        imgui.SetCursorPos(imgui.ImVec2(60, 5))
        imgui.BeginChild('SettingGunDop', imgui.ImVec2(70, 1950), true) 
        imgui.CenterText('ФОТО')
        DrawImageGun()
        imgui.EndChild()
        imgui.SetCursorPos(imgui.ImVec2(140, 5))
        imgui.BeginChild('Name610', imgui.ImVec2(300, 1950), true) 
        imgui.Text(u8'НАЗВАНИЕ')
        for weapon, weapons in pairs({'Кастет', 'Клюшка для гольфа', 'Полицейская дубинка', 'Нож', 'Бейсбольная бита', 'Лопата', 'Кий', 'Катана', 'Бензопила', 'Двухстороний дилдо', 'Дилдо', 'Вибратор', 'Серебряный вибратор', 'Букет цветов', 'Трость', 'Граната', 'Слезоточивый газ', 'Коктель молотова', 'Пистолет 9мм', 'Пистолет 9мм с глушителем', 'Пистолет Desert Eagle', 'Обычный дробовик', 'Обрез', 'Скорострельный дробовик', 'Узи', 'MP-5', 'Автомат Калашникова', 'Винтовка M4', 'Tec-9', 'Охотничье оружие', 'Снйперская винтовка', 'РПГ', 'Самонаводящиеся ракеты', 'Огнемет', 'Миниган', 'Суммка с тротилом', 'Детонатор к сумке', 'Балончик с краской', 'Огнетушитель', 'Фотоаппарат', 'Прибор ночного видения', 'Парашют'}) do
           imgui.Text(u8(weapons))
           imgui.Spacing()
           imgui.Spacing()
           imgui.Spacing()
        end
        imgui.EndChild()
        imgui.SetCursorPos(imgui.ImVec2(440, 5))
        imgui.BeginChild('Name606', imgui.ImVec2(520, 1950), true) 
        imgui.Text(u8'ОТЫГРОВКА')
        imgui.Separator()
        imgui.PushItemWidth(500)
        for index, value in ipairs(guns2) do
           if imgui.InputText("##gun2" .. index, guns2[value], 255) then
              ini.guns2[value] = u8:decode(ffi.string(guns2[value]))
               inicfg.save(ini, "MVDHelper.ini")
            end
         end
         imgui.EndChild()
         imgui.End()
     end)
    

    
    imgui.OnFrame(function() return showpie[0] and not isGamePaused() end, function()
       imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 1, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(2.0,  0.8))
       imgui.SetNextWindowSize(imgui.ImVec2(165, 165), imgui.Cond.Always)
       imgui.Begin('Piemenu', showpie, imgui.WindowFlags.NoBackground + imgui.WindowFlags.NoDecoration + imgui.WindowFlags.NoMove)
       imgui.Image(piemenu, imgui.ImVec2(160, 160))
       if imgui.IsItemClicked(0) then
          imgui.OpenPopup('PieMenu')
       end
       if pie.BeginPiePopup('PieMenu') then
          if pie.PieMenuItem(u8'Кричалка') then
             local combotext = item_list[ComboTest[0]+1]
             if ComboTest[0] == 0 then
                sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
             elseif ComboTest[0] == 1 then 
                sampSendChat('/s На землю!! Руки за голову!! Работает '..combotext..'')
             elseif ComboTest[0] == 2 then 
                sampSendChat('/s На землю!! Руки за голову!! Работает '..combotext..'')
             elseif ComboTest[0] == 3 then 
                sampSendChat('/s На землю!! Руки за голову!! Работает '..combotext..'')
             elseif ComboTest[0] == 4 then 
                sampSendChat('/s На землю!! Руки за голову!! Работает '..combotext..'')
             elseif ComboTest[0] == 5 then 
                sampSendChat('/s На землю!! Руки за голову!! Работает '..combotext..'')
             elseif ComboTest[0] == 6 then 
                sampSendChat('/s На землю!! Руки за голову!! Работает '..combotext..'')
             end
          end
          if pie.BeginPieMenu(u8'Трафик-стоп') then 
             if pie.PieMenuItem('10-55') then 
                lua_thread.create(function()
                   local x, y, z = getCharCoordinates(PLAYER_PED)
                   if ComboPol[0] == 0 then
                      sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
                   elseif ComboPol[0] == 1 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства!')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r Нет на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 1 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 2 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 3 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 4 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 5 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboPol[0] == 2 then
                      sampSendChat('/me резким движением достала мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства!')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r Нет на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 1 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 2 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 3 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 4 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                      sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   elseif ComboShow[0] == 5 then
                      sampSendChat('/me резким движением достал мегафон')
                      wait(slider[0])
                      sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
                      wait(slider[0])
                      sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
                      wait(slider[0])
                     sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
                   end
                end)
             end
             if pie.PieMenuItem('10-66') then
                cmd_meg()
             end
             pie.EndPieMenu()
          end
          if pie.BeginPieMenu(u8'Рация') then
             if pie.PieMenuItem(u8'Строй') then
                lua_thread.create(function()
                   sampSendChat('/r Уважаемые коллеги, минуточку внимания!')
                   wait(slider[0])
                   sampSendChat('/r Общее построение в департаменте, всем постам прибыть на место.')
                end)
             end
             if pie.PieMenuItem('10-99') then
                if ComboShow[0] == 0 then
                   sampSendChat('/r Нет на CONTROL. `99, возвращаюсь к патрулированию, доступен.')
                elseif ComboShow[0] == 1 then
                   sampSendChat('/r L-'..ini.set.mark..' на CONTROL. `99, возвращаюсь к патрулированию, доступен.')
                elseif ComboShow[0] == 2 then
                   sampSendChat('/r A-'..ini.set.mark..' на CONTROL. `99, возвращаюсь к патрулированию, доступен.')
                elseif ComboShow[0] == 3 then
                   sampSendChat('/r M-'..ini.set.mark..' на CONTROL. `99, возвращаюсь к патрулированию, доступен.')
                elseif ComboShow[0] == 4 then
                   sampSendChat('/r E-'..ini.set.mark..' на CONTROL. `99, возвращаюсь к патрулированию, доступен.')
                elseif ComboShow[0] == 5 then
                   sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. `99, возвращаюсь к патрулированию, доступен.')
                end
             end
      pie.EndPieMenu()
          end
          if pie.BeginPieMenu(u8'Патруль') then 
             if pie.PieMenuItem('CODE 0') then
                local x, y, z = getCharCoordinates(PLAYER_PED)
                sampSendChat('/r Всем постам С’0! Офицер лежит на земле! Требуется помощь в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
             end
             if pie.PieMenuItem ('CODE 1') then
                local x, y, z = getCharCoordinates(PLAYER_PED)
                sampSendChat('/r Всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
             end
             if pie.PieMenuItem('CODE 2') then
                local x, y, z = getCharCoordinates(PLAYER_PED)
                sampSendChat('/r '..ini.set.nick..' на CONTROL! Требуется поддержка по C‘2, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
             end
             if pie.PieMenuItem('CODE 3') then
                local x, y, z = getCharCoordinates(PLAYER_PED)
                sampSendChat('/r '..ini.set.nick..' на CONTROL! Требуется поддержка по C‘3, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
             end
             if pie.PieMenuItem('CODE 4') then
                local x, y, z = getCharCoordinates(PLAYER_PED)
                sampSendChat('/r '..ini.set.nick..' на CONTROL. Район '..calculateZone(x, y, z)..' ('..kvadrat()..'). C‘4, доступен.')
             end
             if pie.PieMenuItem('CODE 4 ADAM') then
                local x, y, z = getCharCoordinates(PLAYER_PED)
                sampSendChat('/r '..ini.set.nick..' на CONTROL! Будьте готовы приехать на подмогу по С’4 ADAM, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), доступен.')
             end
             pie.EndPieMenu()
          end
        
  if pie.BeginPieMenu(u8'Разное') then
     if pie.PieMenuItem(u8'Маска') then
       cmd_mask()
    end
 
 
    if pie.PieMenuItem(u8'Часы') then 
       local surfam = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("_(.*)")
       lua_thread.create(function()
          if ComboPol[0] == 0 then 
             sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
          elseif ComboPol[0] == 1 then
             sampSendChat('/do На руке умные часы Apple Watch Series 4.')
             wait(slider[0])
             sampSendChat('/todo Привет Siri, который час?*поднеся руку с часами к лицу')
             wait(slider[0])
             sampSendChat('/time')
             sampSendChat('/do Мистер '..surfam..', сейчас '..os.date('%H:%M')..' минут, '..days[tonumber(os.date('%w'))+1])
          elseif ComboPol[0] == 2 then
             sampSendChat('/do На руке умные часы Apple Watch Series 4.')
             wait(slider[0])
             sampSendChat('/todo Привет Siri, который час?*поднеся руку с часами к лицу')
             wait(slider[0])
             sampSendChat('/time')
             sampSendChat('/do Мисс '..surfam..', сейчас '..os.date('%H:%M')..' минут, '..days[tonumber(os.date('%w'))+1])
          end
       end)
    end
   
      if pie.BeginPieMenu(u8'Боди-камера') then
         if pie.PieMenuItem(u8'Выключить') then 
            local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
            lua_thread.create(function()
               sampSendChat('/do На груди '..surname..' весит камера «AXON BODY 3».')
               wait(slider[0])
               sampSendChat('/me легким движением руки протянулся к сенсору и нажал один раз для деактивации')
               wait(slider[0])
               sampSendChat('/do Боди камера издала звук и выключилась.')
            end)
         end
  
      if pie.PieMenuItem(u8'Включить') then 
         local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
         lua_thread.create(function()
            sampSendChat('/do На груди '..surname..' весит камера «AXON BODY 3».')
            wait(slider[0])
            sampSendChat('/me легким движением руки протянулся к сенсору и нажал один раз для активации')
            wait(slider[0])
            sampSendChat('/do Боди камера издала звук и включилась.')
         end)
      end
  pie.EndPieMenu()
      end
   pie.EndPieMenu()
  end
  pie.EndPiePopup()
       end
 imgui.End()
    end)
 
 
 imgui.OnFrame(function() return Sobesorg[0] and not isGamePaused() end, function()
    imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 3, sizeY / 1), imgui.Cond.FirstUseEver, imgui.ImVec2(1.2, 0.6))
    imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(15, 10))
    imgui.Begin(u8'Собеседование', Sobesorg, imgui.WindowFlags.NoResize + imgui.WindowFlags.AlwaysAutoResize)
    imgui.PopStyleVar()
    if tabsobes == 1 then
       imgui.TextWrapped(u8'Добро пожаловать в меню управления собеседованиями. Для начала собеседования нажмите на кнопку «Начать собеседование», после Вам будет предложено выбирать, пропускать подготовленные вопросы и задавать их игроку в разном порядке. Настроить данную функцию вы можете в разделе основного меню /mh -> Собеседование. Как только собеседование будет завершено кандидатом, наша аналитическая система выведет процент качества будущего сотрудника Вашей организации.')
       if imgui.Button(u8'Начать собеседование', imgui.ImVec2(590, 40)) then tabsobes = 15 end
       imgui.Spacing()
       imgui.Spacing()
  
    elseif tabsobes == 2 then 
  imgui.Text(u8'Собеседование с кандидатом началось!')
  imgui.Spacing()
  imgui.Text(u8'Вопрос кандидату 1 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: 0 (верных: 0 / неверных: 0)')
  imgui.NewLine()
  imgui.Text(u8'Приветствие')
  local time = tonumber(os.date("%H"))
  local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
  local surfam = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("_(.*)")
  if (time >= 12 and time < 18) then
     imgui.TextWrapped(u8('Добрый день, меня зовут '..surname..' '..surfam..'. Вы пришли на собеседование?'))
  elseif (time >= 18 and time < 24) then
     imgui.TextWrapped(u8('Добрый вечер, меня зовут '..surname..' '..surfam..'. Вы пришли на собеседование?')) 
  elseif (time >= 00 and time < 05) then
     imgui.TextWrapped(u8('Доброй ночи, меня зовут '..surname..' '..surfam..'. Вы пришли на собеседование?'))
  elseif (time >= 05 and time < 12) then
     imgui.TextWrapped(u8('Доброе утро, меня зовут '..surname..' '..surfam..'. Вы пришли на собеседование?'))
  end
  if imgui.Button(u8'Задать вопрос', imgui.ImVec2(590, 40)) then
     tabsobes = 3
     sobesotvet[0] = sobesotvet[0] +1
     if (time >= 12 and time < 18) then
        sampSendChat('Добрый день, меня зовут '..surname..' '..surfam..'. Вы пришли на собеседование?')
     elseif (time >= 18 and time < 24) then
        sampSendChat('Добрый вечер, меня зовут '..surname..' '..surfam..'. Вы пришли на собеседование?')
     elseif (time >= 00 and time < 05) then
        sampSendChat('Доброй ночи, меня зовут '..surname..' '..surfam..'. Вы пришли на собеседование?')
     elseif (time >= 05 and time < 12) then
        sampSendChat('Доброе утро, меня зовут '..surname..' '..surfam..'. Вы пришли на собеседование?')
     end
  end
  imgui.Spacing()
  if imgui.Button(u8'Назад') then
     sobesball[0] = sobesball[0] *0
     sobesballm[0] = sobesballm[0] *0
     sobesotvet[0] = sobesotvet[0] *0
     sobesproc[0] = sobesproc[0]*0 
     tabsobes = 1 end
  imgui.SameLine()
  imgui.Indent(505)
  if imgui.Button(u8'Далее') then tabsobes = 3 end
   
    elseif tabsobes == 3 then
   imgui.Text(u8'Вопрос кандидату 2 из 7 возможных')
   imgui.Spacing()
   imgui.TextWrapped(u8'Количество полученных ответов: %g (верных: 0 / неверных: 0)', sobesotvet[0])
   imgui.NewLine()
   imgui.Text(u8'Знакомство')
   imgui.TextWrapped(u8'Отлично! Как вас зовут? Сколько вам лет? Где проживаете? Расскажите о себе.')
   if imgui.Button(u8'Задать вопрос', imgui.ImVec2(590, 40)) then
      tabsobes = 4
      sobesotvet[0] = sobesotvet[0] +1
      sampSendChat('Отлично! Как вас зовут? Сколько вам лет? Где проживаете? Расскажите о себе.')
   end
   imgui.Spacing()
   if imgui.Button(u8'Назад') then tabsobes = 2 end
   imgui.SameLine()
   imgui.Indent(505)
   if imgui.Button(u8'Далее') then tabsobes = 4 end
  
    elseif tabsobes == 4 then
   imgui.Text(u8'Вопрос кандидату 3 из 7 возможных')
   imgui.Spacing()
   imgui.TextWrapped(u8'Количество полученных ответов: %g (верных: 0 / неверных: 0)', sobesotvet[0])
   imgui.NewLine()
   imgui.Text(u8'Документы')
   local result, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
   imgui.TextWrapped(u8('Приятно Познакомиться, мистер '..sampGetPlayerNickname(sobesp[0]):match("_(.*)")..'. Сейчас мне потребуются ваши документы, а именно паспорт, лицензии и мед.карта. Уведомляю вас, в случае, если с вашими документами будет проблемы - я имею право отказать вам. /b /showpass '..myid..' /showlic '..myid..' /showmc '..myid..'.'))
      if imgui.Button(u8'Задать вопрос', imgui.ImVec2(590, 40)) then
         tabsobes = 5
         sobesotvet[0] = sobesotvet[0] +1
         lua_thread.create(function()
            sampSendChat('Приятно Познакомиться, мистер '..sampGetPlayerNickname(sobesp[0]):match("_(.*)")..'.')
            wait(2000)
            sampSendChat('Сейчас мне потребуются ваши документы, а именно: паспорт, лицензии и мед.карта.')
            wait(2000)
            sampSendChat('Уведомляю вас, в случае, если с вашими документами будет проблемы - я имею право отказать вам.')
            wait(2000)
            sampSendChat('/b /showpass '..myid..' /showlic '..myid..' /showmc '..myid..'.')
         end)
      end
      imgui.Spacing()
      if imgui.Button(u8'Назад') then tabsobes = 3 end
      imgui.SameLine()
      imgui.Indent(505)
      if imgui.Button(u8'Далее') then tabsobes = 6 end
  
  elseif tabsobes == 5 then 
  imgui.Text(u8'Вопрос кандидату 3 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: 0 /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: 0)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Документы')
  local result, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
  imgui.TextWrapped(u8('Приятно Познакомиться, мистер '..sampGetPlayerNickname(sobesp[0]):match("_(.*)")..'. Сейчас мне потребуются ваши документы, а именно паспорт, лицензии и мед.карта. Уведомляю вас, в случае, если с вашими документами будет проблемы - я имею право отказать вам. /b /showpass '..myid..' /showlic '..myid..' /showmc '..myid..'.'))
  if imgui.Button(u8'Правильно', imgui.ImVec2(590, 40)) then
  sobesproc[0] = sobesproc[0] +20
  sobesball[0] = sobesball[0] +1
  tabsobes = 6
  end
  imgui.Spacing()
  if imgui.Button(u8'Не правильно', imgui.ImVec2(590, 40)) then
  sobesballm[0] = sobesballm[0] +1
  tabsobes = 6
  end
  imgui.Spacing()
  if imgui.Button(u8'Вопрос без оценки', imgui.ImVec2(590, 40)) then tabsobes = 6 end
  imgui.Spacing()
  if imgui.Button(u8'Закончить собеседование', imgui.ImVec2(590, 40)) then tabsobes = 14 end 
  
  elseif tabsobes == 6 then
  imgui.Text(u8'Вопрос кандидату 4 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Контрольный вопрос №1')
  imgui.TextWrapped(u8('Мистер '..sampGetPlayerNickname(sobesp[0]):match("_(.*)")..', где вы раньше работали?'))
  if imgui.Button(u8'Задать вопрос', imgui.ImVec2(590, 40)) then
  tabsobes = 7
  sobesotvet[0] = sobesotvet[0] +1
  sampSendChat('Мистер '..sampGetPlayerNickname(sobesp[0]):match("_(.*)")..', где вы раньше работали?')
  end
  imgui.Spacing()
  if imgui.Button(u8'Назад') then tabsobes = 4 end
  imgui.SameLine()
  imgui.Indent(505)
  if imgui.Button(u8'Далее') then tabsobes = 8 end
  
  elseif tabsobes == 7 then 
  imgui.Text(u8'Вопрос кандидату 4 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Контрольный вопрос №1')
  imgui.TextWrapped(u8('Мистер '..sampGetPlayerNickname(sobesp[0]):match("_(.*)")..', где вы раньше работали?'))
  if imgui.Button(u8'Правильно', imgui.ImVec2(590, 40)) then
  sobesproc[0] = sobesproc[0] +20
  sobesball[0] = sobesball[0] +1
  tabsobes = 8
  end
  imgui.Spacing()
  if imgui.Button(u8'Не правильно', imgui.ImVec2(590, 40)) then
  sobesballm[0] = sobesballm[0] +1
  tabsobes = 8
  end
  imgui.Spacing()
  if imgui.Button(u8'Вопрос без оценки', imgui.ImVec2(590, 40)) then tabsobes = 8 end
  imgui.Spacing()
  if imgui.Button(u8'Закончить собеседование', imgui.ImVec2(590, 40)) then tabsobes = 14 end 
  
  elseif tabsobes == 8 then
  imgui.Text(u8'Вопрос кандидату 5 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Контрольный вопрос №2')
  imgui.TextWrapped(u8'Как вы понимаете слово "адекватность"? Расскажите мне коротко. Я вас слушаю.')
  if imgui.Button(u8'Задать вопрос', imgui.ImVec2(590, 40)) then
  tabsobes = 9
  sobesotvet[0] = sobesotvet[0] +1
  sampSendChat('Как вы понимаете слово "адекватность"? Расскажите мне коротко. Я вас слушаю.')
  end
  imgui.Spacing()
  if imgui.Button(u8'Назад') then tabsobes = 6 end
  imgui.SameLine()
  imgui.Indent(505)
  if imgui.Button(u8'Далее') then tabsobes = 10 end
  
  elseif tabsobes == 9 then
  imgui.Text(u8'Вопрос кандидату 5 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Контрольный вопрос №2')
  imgui.TextWrapped(u8'Как вы понимаете слово "адекватность"? Расскажите мне коротко. Я вас слушаю.')
  if imgui.Button(u8'Правильно', imgui.ImVec2(590, 40)) then
  sobesproc[0] = sobesproc[0] +20
  sobesball[0] = sobesball[0] +1
  tabsobes = 10
  end
  imgui.Spacing()
  if imgui.Button(u8'Не правильно', imgui.ImVec2(590, 40)) then
  sobesballm[0] = sobesballm[0] +1
  tabsobes = 10
  end
  imgui.Spacing()
  if imgui.Button(u8'Вопрос без оценки', imgui.ImVec2(590, 40)) then tabsobes = 10 end
  imgui.Spacing()
  if imgui.Button(u8'Закончить собеседование', imgui.ImVec2(590, 40)) then tabsobes = 14 end 
  
  elseif tabsobes == 10 then
  imgui.Text(u8'Вопрос кандидату 6 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Контрольный вопрос №3')
  imgui.Text(u8'Угу.')
  imgui.TextWrapped(u8'Почему хотите работать у нас? Чем вас привлекает данная работа?')
  if imgui.Button(u8'Задать вопрос', imgui.ImVec2(590, 40)) then
  lua_thread.create(function()
  tabsobes = 11
  sobesotvet[0] = sobesotvet[0] +1
  sampSendChat('Угу.')
  wait(slider[0])
  sampSendChat('Почему хотите работать у нас? Чем вас привлекает данная работа?')
  end)
  end
  imgui.Spacing()
  if imgui.Button(u8'Назад') then tabsobes = 8 end
  imgui.SameLine()
  imgui.Indent(505)
  if imgui.Button(u8'Далее') then tabsobes = 12 end
  
  elseif tabsobes == 11 then
  imgui.Text(u8'Вопрос кандидату 6 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Контрольный вопрос №3')
  imgui.TextWrapped(u8'Почему хотите работать у нас? Чем вас привлекает данная работа?')
  if imgui.Button(u8'Правильно', imgui.ImVec2(590, 40)) then
  sobesproc[0] = sobesproc[0] +20
  tabsobes = 12
  sobesball[0] = sobesball[0] +1
  end
  imgui.Spacing()
  if imgui.Button(u8'Не правильно', imgui.ImVec2(590, 40)) then
  tabsobes = 12
  sobesballm[0] = sobesballm[0] +1
  end
  imgui.Spacing()
  if imgui.Button(u8'Вопрос без оценки', imgui.ImVec2(590, 40)) then tabsobes = 12 end
  imgui.Spacing()
  if imgui.Button(u8'Закончить собеседование', imgui.ImVec2(590, 40)) then tabsobes = 14 end 
  
  elseif tabsobes == 12 then
  imgui.Text(u8'Вопрос кандидату 7 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Контрольный вопрос №3')
  imgui.Text(u8'Охарактеризуйте себя тремя словами.')
  if imgui.Button(u8'Задать вопрос', imgui.ImVec2(590, 40)) then
  lua_thread.create(function()
  tabsobes = 13
  sobesotvet[0] = sobesotvet[0] +1
  sampSendChat('Охарактеризуйте себя тремя словами.')
     end)
 end
 imgui.Spacing()
  if imgui.Button(u8'Назад') then tabsobes = 10 end
  
  elseif tabsobes == 13 then 
  imgui.Text(u8'Вопрос кандидату 7 из 7 возможных')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.NewLine()
  imgui.Text(u8'Контрольный вопрос №3')
  imgui.Text(u8'Охарактеризуйте себя тремя словами.')
  if imgui.Button(u8'Правильно', imgui.ImVec2(590, 40)) then
  sobesproc[0] = sobesproc[0] +20
  tabsobes = 14
  sobesball[0] = sobesball[0] +1
  end
  imgui.Spacing()
  if imgui.Button(u8'Не правильно', imgui.ImVec2(590, 40)) then
  tabsobes = 14
  sobesballm[0] = sobesballm[0] +1
  end
  imgui.Spacing()
  if imgui.Button(u8'Вопрос без оценки', imgui.ImVec2(590, 40)) then tabsobes = 14 end
  imgui.Spacing()
  if imgui.Button(u8'Закончить собеседование', imgui.ImVec2(590, 40)) then tabsobes = 14 end 
  
  
  elseif tabsobes == 14 then
  imgui.Text(u8'Собеседование с кандидатами подошло к концу!')
  imgui.Spacing()
  imgui.Text(u8'Итоги собеседования:')
  imgui.Spacing()
  imgui.TextWrapped(u8'Количество полученных ответов: %g', sobesotvet[0])
  imgui.SameLine()
  imgui.Text(u8'(верных: %g /', sobesball[0])
  imgui.SameLine()
  imgui.Spacing()
  imgui.Text(u8'неверных: %g)', sobesballm[0])
  imgui.Spacing()
  imgui.TextWrapped(u8'По данным аналитической системы на основе полученной информации, кандидат справился с собеседование на %g%%', sobesproc[0])
  
  if imgui.Button(u8'Одобрить', imgui.ImVec2(590, 40)) then
  lua_thread.create(function()
  sobesball[0] = sobesball[0] *0
  sobesballm[0] = sobesballm[0] *0
  sobesotvet[0] = sobesotvet[0] *0
  sobesproc[0] = sobesproc[0]*0
  tabsobes = 1
  sampSendChat('Поздравляю! Вы успешно прошли собеседование.')
  wait(2000)
 sampSendChat('Одну минуту, пожалуйста, сейчас мы выдадим вам форму.')
        end)
  end    
  imgui.Spacing()
  if imgui.Button(u8'Отказать', imgui.ImVec2(590, 40)) then
  imgui.OpenPopup(u8'Отказ в собеседовании')
  end
  if imgui.BeginPopupModal(u8'Отказ в собеседовании', _,imgui.WindowFlags.AlwaysAutoResize) then
  imgui.Text(u8'Пожалуйста, напишите причину, по которой кандидату отказано в собеседовании')
  imgui.NewLine()
  imgui.Separator()
  imgui.InputText(u8"Причина отказа", sobesotkaz, 64)
  otkaz = u8:decode(ffi.string(sobesotkaz))
  imgui.NewLine()
  if imgui.Button(u8'Отказать', imgui.ImVec2(1000, 40)) then 
  Sobesorg[0] = not Sobesorg[0]
  imgui.CloseCurrentPopup()
  lua_thread.create(function()
  sobesball[0] = sobesball[0] *0
  sobesballm[0] = sobesballm[0] *0
  sobesotvet[0] = sobesotvet[0] *0
  sobesproc[0] = sobesproc[0]*0
  tabsobes = 1
  sampSendChat('К сожалению, вы к нам не подходите! Вы не прошли собеседование.')
  wait(slider[0])
  sampSendChat('По причине: '..otkaz)
       end)
  end
  imgui.Spacing()
  if imgui.Button(u8'Отмена', imgui.ImVec2(1000, 40)) then 
     imgui.CloseCurrentPopup()
  end
  end
      
      
  elseif tabsobes == 15 then 
      imgui.TextWrapped(u8'Добро пожаловать в меню управления собеседованиями. Для начала собеседования нажмите на кнопку «Начать собеседование», после Вам будет предложено выбирать, пропускать подготовленные вопросы и задавать их игроку в разном порядке. Настроить данную функцию вы можете в разделе основного меню /mh -> Собеседование. Как только собеседование будет завершено кандидатом, наша аналитическая система выведет процент качества будущего сотрудника Вашей организации.')
      imgui.NewLine()
      imgui.TextWrapped(u8'Введите ID кандитата, с которым хотите начать собеседование')
      imgui.PushItemWidth(590)
      imgui.InputInt("##sobes player id", sobesp, 0, 0)				
      imgui.PopItemWidth()                             	
      imgui.NewLine()
      if sobesp[0] >= 0 and sobesp[0] < 1000 then
         if sampIsPlayerConnected(sobesp[0]) then
            if imgui.Button(u8'Начать собеседование', imgui.ImVec2(590, 40)) then tabsobes = 2 end
         end
         else
            if imgui.Button(u8'Начать собеседование', imgui.ImVec2(590, 40)) then tabsobes = 15 end
      end
  end
  imgui.Spacing()
  imgui.Spacing()
  imgui.End()
   end)
   
   
  
  function colored_button_main(r, g, b)
     if selected_theme[0] == 0 then
        if tab == 1 then
           imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.26, 0.59, 0.98, 0.86))
           if imgui.Button(faicons('BARS') .. u8' Панель управления', imgui.ImVec2(400, 100)) then tab = 1 end
           imgui.PopStyleColor(1)
           else
              if imgui.Button(faicons('BARS') .. u8' Панель управления', imgui.ImVec2(400, 100)) then tab = 1 end
        end
        if tab == 2 then 
           imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.26, 0.59, 0.98, 0.86))
           if imgui.Button(faicons('GEAR') .. u8' Настройки', imgui.ImVec2(400, 100)) then tab = 2 end
           imgui.PopStyleColor(1)
           else
              if imgui.Button(faicons('GEAR') .. u8' Настройки', imgui.ImVec2(400, 100)) then tab = 2 end
        end
        if tab == 3 then
           imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.26, 0.59, 0.98, 0.86))
           if imgui.Button(faicons('NEWSPAPER') .. u8' Новости', imgui.ImVec2(400, 100)) then tab = 3 end
           imgui.PopStyleColor(1)
           else
              if imgui.Button(faicons('NEWSPAPER') .. u8' Новости', imgui.ImVec2(400, 100)) then tab = 3 end
        end
        imgui.Spacing()
        if tab == 4 then 
           imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.26, 0.59, 0.98, 0.86))
           if imgui.Button(faicons('USER_HEADSET' ) .. u8' Поддержка', imgui.ImVec2(400, 100)) then tab = 4 end
           imgui.PopStyleColor(1)
           else
              if imgui.Button(faicons('USER_HEADSET' ) .. u8' Поддержка', imgui.ImVec2(400, 100)) then tab = 4 end
        end
     elseif selected_theme[0] == 1 then 
        if tab == 1 then
           imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.93, 0.45, 0.33, 0.86))
           if imgui.Button(faicons('BARS') .. u8' Панель управления', imgui.ImVec2(400, 100)) then tab = 1 end
           imgui.PopStyleColor(1)
           else
              if imgui.Button(faicons('BARS') .. u8' Панель управления', imgui.ImVec2(400, 100)) then tab = 1 end
        end
        if tab == 2 then 
           imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.93, 0.45, 0.33, 0.86))
           if imgui.Button(faicons('GEAR') .. u8' Настройки', imgui.ImVec2(400, 100)) then tab = 2 end
           imgui.PopStyleColor(1)
           else
              if imgui.Button(faicons('GEAR') .. u8' Настройки', imgui.ImVec2(400, 100)) then tab = 2 end
        end
        if tab == 3 then
           imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.93, 0.45, 0.33, 0.86))
           if imgui.Button(faicons('NEWSPAPER') .. u8' Новости', imgui.ImVec2(400, 100)) then tab = 3 end
           imgui.PopStyleColor(1)
           else
              if imgui.Button(faicons('NEWSPAPER') .. u8' Новости', imgui.ImVec2(400, 100)) then tab = 3 end
        end
        imgui.Spacing()
        if tab == 4 then 
           imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.93, 0.45, 0.33, 0.86))
           if imgui.Button(faicons('USER_HEADSET' ) .. u8' Поддержка', imgui.ImVec2(400, 100)) then tab = 4 end
           imgui.PopStyleColor(1)
           else
              if imgui.Button(faicons('USER_HEADSET' ) .. u8' Поддержка', imgui.ImVec2(400, 100)) then tab = 4 end
        end
     end
  end
        
  
     
  function DrawSelectNap()
     if imgui.Combo(u8'',ComboNap, napparnick, #naparnick) then
        ini.set.ComboNap = ComboNap[0]
        inicfg.save(ini, "MVDHelper.ini")
     end
  end
   
      
      
  function ButtonVersionScript()
     if selected_theme[0] == 0 then
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.26, 0.59, 0.98, 0.86))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.26, 0.59, 0.98, 0.86))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.26, 0.59, 0.98, 0.86))
        imgui.Text(u8'ВЕРСИЯ MVDHELPER:')
        imgui.SameLine()
        imgui.Button(script_version)
        imgui.PopStyleColor()
        imgui.PopStyleColor()
        imgui.PopStyleColor()
     elseif selected_theme[0] == 1 then
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.93, 0.45, 0.33, 0.86))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.93, 0.45, 0.33, 0.86))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.93, 0.45, 0.33, 0.86))
        imgui.Text(u8'ВЕРСИЯ MVDHELPER:')
        imgui.SameLine()
        imgui.Button(script_version)
        imgui.PopStyleColor()
        imgui.PopStyleColor()
        imgui.PopStyleColor()
     end
  end
    
    function DrawCheckNap()
       if imgui.Checkbox(u8'Напарник активирован', checkboxnap) then
          ini.set.checkboxnap = checkboxnap[0]
          inicfg.save(ini, "MVDHelper.ini")
          if checkboxnap[0] then
             activenap.switch()
          end
       end
    end
       
    
  
  imgui.OnFrame(function() return WinStateM[0] and not isGamePaused() end, function()
     imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
     imgui.SetNextWindowSize(imgui.ImVec2(1800, 800), imgui.Cond.Always)
     imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(0, 0, 0, 1))
     imgui.Begin(u8'Добро пожаловать в MVDHELPER SUSPECT!', WinStateM, imgui.WindowFlags.NoResize) 
     imgui.PopStyleColor()
     imgui.SetCursorPos(imgui.ImVec2(40, 70))
     imgui.Image(imhandle5, imgui.ImVec2(300, 90))
     colored_button_main(r, g, b)
     if imgui.Button(faicons('POWER_OFF') .. u8' Отключить', imgui.ImVec2(400, 100)) then thisScript():unload() end
     imgui.Spacing()
     ButtonVersionScript()
     imgui.SetCursorPos(imgui.ImVec2(420, 49))
     if imgui.BeginChild('Nameq', imgui.ImVec2(1370, 700)) then
        if tab == 1 then 
           imgui.Image(imhandle65, imgui.ImVec2(407, 107))
           imgui.Image(imhandle2, imgui.ImVec2(220, 203))
           if imgui.IsItemClicked() then
              Kodecs[0] = not Kodecs[0]
           end
           imgui.SameLine(250)
           imgui.Image(imhandle, imgui.ImVec2(220, 203))
           if imgui.IsItemClicked() then
              Admin[0] = not Admin[0]
           end
           imgui.SameLine(500)
           imgui.Image(imhandle3, imgui.ImVec2(220, 203))
           if imgui.IsItemClicked() then
              YstavFraction[0] = not YstavFraction[0]
           end
           imgui.SameLine(750)
           imgui.Image(imhandle4, imgui.ImVec2(220, 203))
           if imgui.IsItemClicked() then
              Ten[0] = not Ten[0]
           end
           imgui.SameLine(1000)
           imgui.Image(imhandle68, imgui.ImVec2(220, 203))
           if imgui.IsItemHovered() then
              imgui.BeginTooltip()
              imgui.Text(u8'Используйте команду /su [ID]. Инструмент\r\n работает, если в настройках активирован пункт\r\n «Режим умной выдачи розыска»')
              imgui.EndTooltip()
           end
           imgui.Spacing()
           imgui.Spacing()
            imgui.Image(imhandle69, imgui.ImVec2(220, 203))
            if imgui.IsItemHovered() then
               imgui.BeginTooltip()
               imgui.Text(u8'Используйте команду /ticket [ID]. Инструмент\r\n работает, если в настройках активирован пункт\r\n «Режим умной выдачи штрафа»')
               imgui.EndTooltip()
            end
            imgui.Image(imhandle66, imgui.ImVec2(370, 92))
            imgui.Image(imhandle67, imgui.ImVec2(220, 203))
            if imgui.IsItemClicked() then
               for _, police in pairs(PoliceVehicle) do
                  if isCharInAnyPoliceVehicle(PLAYER_PED) or isCharInModel(PLAYER_PED, police) then
                     Board[0] = not Board[0]
                     else
                        sampAddChatMessage(tag.. ' Активировать патрульный ассистент можно только в полицейском Крузере!', -1)
                  end
               end
            end
            
            imgui.SetCursorPos(imgui.ImVec2(250, 628))
            imgui.Image(imhandle70, imgui.ImVec2(220, 203))
            imgui.Image(org, imgui.ImVec2(379, 92))
            imgui.Image(hr, imgui.ImVec2(220, 203))
            if imgui.IsItemClicked() then
               Sobesorg[0] = not Sobesorg[0]
            end

        elseif tab == 2 then 
  if imgui.BeginChild('Name67', imgui.ImVec2(300, 690), true) then
     for numberTab, nameTab in pairs({'Основное','Настройки оружия','Настройки команд','Настройки рации', 'Настройки напарника', 'Настройки виджета'}) do
        if imgui.Selectable(u8(nameTab), setting == numberTab) then
           setting = numberTab
        end
     end
     imgui.EndChild()
  end
  
        if setting == 1 then
           imgui.SetCursorPos(imgui.ImVec2(840, 0))
           if imgui.BeginChild('Name3', imgui.ImVec2(520, 690), true) then
              imgui.CenterText('Дополнительные настройки')
              if imgui.Checkbox(u8'Активировать быстрое меню', piemod) then
                 showpie[0] = not showpie[0]
                 ini.set.piemenu = piemod[0]
                 inicfg.save(ini, "MVDHelper.ini")
              end
              imgui.Spacing()
              if imgui.Checkbox(u8'Режим RP - Отыгровки оружия', autorp) then
                 ini.set.autorp = autorp[0]
                 inicfg.save(ini, "MVDHelper.ini")
              end
              if imgui.IsItemHovered() then
                 imgui.BeginTooltip()
                 imgui.Text(u8'Автоматическая RP-отыгровка при использовании оружия.')
                 imgui.EndTooltip()
              end
              imgui.Spacing()
              if imgui.Checkbox(u8'Активировать умную метку /z', ymnayaz) then
                 ini.set.ymnayaz = ymnayaz[0]
                 inicfg.save(ini, "MVDHelper.ini")
              end
              imgui.Spacing()
              if imgui.Checkbox(u8'Режим умной выдачи розыска', checkboxone) then
                 ini.set.checkboxone = checkboxone[0]
                 inicfg.save(ini, "MVDHelper.ini")
              end
              imgui.Spacing()
              if imgui.Checkbox(u8'Режим умной выдачи штрафа', checkboxtwo) then
                 ini.set.checkboxtwo = checkboxtwo[0]
                 inicfg.save(ini, "MVDHelper.ini")
              end
              imgui.EndChild() 
           end
           imgui.SetCursorPos(imgui.ImVec2(312, 0))
           if imgui.BeginChild('Name2', imgui.ImVec2(520, 690), true) then
              
              imgui.CenterText('Ваше короткое имя:')
              if imgui.IsItemHovered() then
                 imgui.BeginTooltip()
                 imgui.Text(u8'Введённый текст будет отображаться в Вашем удостоверении/жетоне.')
                 imgui.EndTooltip()
              end
              imgui.SetCursorPos(imgui.ImVec2(50, 40))
              imgui.PushItemWidth(400)
              if imgui.InputText("##1", buffer, 256) then
                 ini.set.nick = u8:decode(ffi.string(buffer))
                 inicfg.save(ini, "MVDHelper.ini")
                 imgui.Spacing()    
              end
              
              imgui.CenterText('Должность или звание:')
              if imgui.IsItemHovered() then
                 imgui.BeginTooltip()
                 imgui.Text(u8'Введённый текст будет отображаться в Вашем удостоверении/жетоне.')
                 imgui.EndTooltip()
              end
              imgui.SetCursorPos(imgui.ImVec2(50, 110))
              if imgui.InputText("##2", buffer2, 256) then
                 ini.set.rank = u8:decode(ffi.string(buffer2))
                 inicfg.save(ini, "MVDHelper.ini")
              end
              imgui.PopItemWidth()
              
              imgui.CenterText('Номер телефона:')
              imgui.PushItemWidth(400)
              imgui.SetCursorPos(imgui.ImVec2(50, 180))
              if imgui.InputText("##3",  buffer3, 256) then
                 ini.set.phone = u8:decode(ffi.string(buffer3))
                 inicfg.save(ini, "MVDHelper.ini")
              end
              imgui.PopItemWidth()
              
              imgui.CenterText('Название организации:')
              imgui.PushItemWidth(400)
              if imgui.IsItemHovered() then
                 imgui.BeginTooltip()
                 imgui.Text(u8'Введённый текст будет отображаться в Вашем удостоверении/жетоне.')
                 imgui.EndTooltip()
              end
              imgui.SetCursorPos(imgui.ImVec2(50, 250))
              if imgui.InputText("##4",  buffer4, 256) then
                 ini.set.org = u8:decode(ffi.string(buffer4))
                 inicfg.save(ini, "MVDHelper.ini")
              end
              imgui.PopItemWidth()
              imgui.CenterText('Ваша организация:')
              imgui.PushItemWidth(400)
              if imgui.IsItemHovered() then
                 imgui.BeginTooltip()
                 imgui.Text(u8'Введённый текст будет отображаться в Вашем удостоверении/жетоне.')
                 imgui.EndTooltip()
              end
              
              imgui.SetCursorPos(imgui.ImVec2(50, 320))
              if imgui.Combo(u8'',ComboTest,ImItems, #item_list) then
                 ini.set.ComboTest = ComboTest[0]
                 inicfg.save(ini, "MVDHelper.ini")
              end
              
              imgui.CenterText('Ваш пол:')
              imgui.SetCursorPos(imgui.ImVec2(50, 400))
              if imgui.Combo(u8' ',ComboPol,itempoll, #itempol) then
                 ini.set.ComboPol = ComboPol[0]
                 inicfg.save(ini, "MVDHelper.ini")
              end
              
              imgui.SetCursorPos(imgui.ImVec2(50, 560))
              imgui.CenterText('Оформление')
              imgui.SetCursorPos(imgui.ImVec2(50, 600))
              if imgui.Combo(u8'##theme', selected_theme, itemtheme, #theme_a) then
                 themes[selected_theme[0]+1].change()
                 ini.theme.theme = themes
                 ini.theme.selected = selected_theme[0]
                 inicfg.save(ini, "MVDHelper.ini")
              end
              imgui.EndChild() 
           end
        end
    end
    imgui.EndChild()
     end
  
            if setting == 2 then
               imgui.SetCursorPos(imgui.ImVec2(730, 50))
               if imgui.BeginChild('Name666', imgui.ImVec2(1050, 700)) then
                  if imgui.BeginChild('Name616', imgui.ImVec2(50, 1950), true) then
                     imgui.CenterText('ID')
                     imgui.Separator()
                     for i = 1, 44 do 
                        imgui.CenterText(tostring(i))
                        imgui.Spacing()
                        imgui.Spacing()
                     end
                     imgui.CenterText('46')
                     imgui.EndChild()
                     imgui.SetCursorPos(imgui.ImVec2(60, 5))
                     if imgui.BeginChild('Name617', imgui.ImVec2(70, 1950), true) then
                        imgui.CenterText('ФОТО')
                        DrawImageGun()
                        imgui.EndChild()
                     end
                     imgui.SetCursorPos(imgui.ImVec2(140, 5))
                     if imgui.BeginChild('Name626', imgui.ImVec2(300, 1950), true) then
                        imgui.Text(u8'НАЗВАНИЕ')
                        imgui.Separator()
                        for weapon, weapons in pairs({'Кастет', 'Клюшка для гольфа', 'Полицейская дубинка', 'Нож', 'Бейсбольная бита', 'Лопата', 'Кий', 'Катана', 'Бензопила', 'Двухстороний дилдо', 'Дилдо', 'Вибратор', 'Серебряный вибратор', 'Букет цветов', 'Трость', 'Граната', 'Слезоточивый газ', 'Коктель молотова', 'Пистолет 9мм', 'Пистолет 9мм с глушителем', 'Пистолет Desert Eagle', 'Обычный дробовик', 'Обрез', 'Скорострельный дробовик', 'Узи', 'MP-5', 'Автомат Калашникова', 'Винтовка M4', 'Tec-9', 'Охотничье оружие', 'Снйперская винтовка', 'РПГ', 'Самонаводящиеся ракеты', 'Огнемет', 'Миниган', 'Суммка с тротилом', 'Детонатор к сумке', 'Балончик с краской', 'Огнетушитель', 'Фотоаппарат', 'Прибор ночного видения', 'Парашют'}) do
                           imgui.Text(u8(weapons))
                           imgui.Spacing()
                           imgui.Spacing()
                           imgui.Spacing()
                        end
                        imgui.EndChild()
                     end
                     imgui.SetCursorPos(imgui.ImVec2(450, 5))
                     if imgui.BeginChild('Name636', imgui.ImVec2(800, 1950), true) then
                        imgui.Text(u8'ОТЫГРОВКА')
                        imgui.Separator()
                        imgui.PushItemWidth(500)
                        for index, value in ipairs(guns) do
                           if imgui.InputText("##gun" .. index, guns[value], 255) then
                              ini.guns[value] = u8:decode(ffi.string(guns[value]))
                              inicfg.save(ini, "MVDHelper.ini")
                           end
                        end
                        if imgui.Button(faicons('GEAR') .. u8' Доп. настройки', imgui.ImVec2(300, 50)) then
                           dopsetting[0] = not dopsetting[0]
                        end
                        imgui.EndChild()
                     end
                     imgui.EndChild()
                  end
               end
           imgui.EndChild()
            end

      if setting == 6 then
         imgui.SetCursorPos(imgui.ImVec2(730, 49))
         if imgui.BeginChild('Wighet', imgui.ImVec2(1050, 690), true) then
            if imgui.Checkbox(u8'Отображать виджет', Widghet) then
               Vijets[0] = not Vijets[0]
               ini.set.widghet = Widghet[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.SameLine()
            if imgui.Button(u8'Изменить местоположение', imgui.ImVec2(350, 40)) then
               WinStateM[0] = false
               editWighet = true
               sampAddChatMessage(tag.. ' Передвигайте окно в любой части экрана. Нажмите сохранить чтобы запомнить позицию окна.', -1)
            end
            imgui.SameLine()
            if imgui.Button(u8'Изменить оформление', imgui.ImVec2(350, 40)) then
               EditColor[0] = not EditColor[0]
            end
            imgui.Separator()
            imgui.Image(nav, imgui.ImVec2(381, 48)) 
            if imgui.Checkbox(u8'Отображать название города', wcity) then
               ini.wighet.city = wcity[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.Spacing()
            if imgui.Checkbox(u8'Отображать район', wstreet) then
               ini.wighet.street = wstreet[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.Spacing()
            if imgui.Checkbox(u8'Отображать текущий квадрат', wkv) then
               ini.wighet.kvadrat = wkv[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.Spacing()
            if imgui.Checkbox(u8'Отображать канал рации', wchannel) then 
               ini.wighet.channel = wchannel[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.NewLine()
            imgui.Image(obl, imgui.ImVec2(381, 48)) 
            if imgui.Checkbox(u8'Отображать состояние здоровья', whp) then
               ini.wighet.hp = whp[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.Spacing()
            if imgui.Checkbox(u8'Отображать состояние брони', warmour) then
               ini.wighet.armour = warmour[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
         end
         imgui.EndChild()
         imgui.SetCursorPos(imgui.ImVec2(1300, 100))
         if imgui.BeginChild('SettingWighet', imgui.ImVec2(500, 200)) then          
            imgui.Image(oth, imgui.ImVec2(381, 48))                          
            if imgui.Checkbox(u8'Отображать текущий пинг', wping) then
               ini.wighet.ping = wping[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.Spacing()
            if imgui.Checkbox(u8'Отображать текущее время', wtime) then          
               ini.wighet.time = wtime[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.Spacing()
            if imgui.Checkbox(u8'Отображать интерактивное меню', wmenu) then
               ini.wighet.menu = wmenu[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.EndChild()
         end
      end
      
         if setting == 3 then
            imgui.SetCursorPosX(730)
            imgui.SetCursorPosY(50)
            imgui.BeginChild('Name667', imgui.ImVec2(1050, 690), true)
            imgui.PushItemWidth(500) 
            if imgui.SliderInt(u8'Интервал RP - отыгровок', slider, 1000, 5000) then
               imgui.PopItemWidth()
               ini.set.zad = slider[0]
               inicfg.save(ini, "MVDHelper.ini")
            end
            imgui.SameLine()
            if imgui.Button(faicons('FLOPPY_DISK'))then
               inicfg.save(ini, "MVDHelper.ini")
               thisScript():reload()
               end
               imgui.Columns(3) 
               imgui.Text(u8'КОМАНДА') imgui.SetColumnWidth(-1, w.new) 
               imgui.NextColumn()
               imgui.Text(u8'ОПИСАНИЕ') imgui.SetColumnWidth(-1, w.old) 
               imgui.NextColumn()
               imgui.Text(u8'') imgui.SetColumnWidth(-1, w.new) 
               imgui.Columns(1)
               imgui.Separator()
               imgui.Columns(3)
               imgui.PushItemWidth(185)
               for index, value in ipairs(cmd) do
                  if imgui.InputText("##cmd" .. index, cmd[value], 255) then
                     imgui.PopItemWidth()
                     ini.cmd[value] = u8:decode(ffi.string(cmd[value]))
                     inicfg.save(ini, "MVDHelper.ini")
                  end
               end
               imgui.NextColumn()
               imgui.Text(u8'Команда для быстрого использования наручников.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для быстрого снятия наручников.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для быстрой погрузки/извлечения саспекта в/из ТС.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для RP - отыгровки извлечения из мотоцикла.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для того чтобы выкинуть из Т/С.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для выписки штрафа.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для использования маски.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для удаления/снятия розыска из базы данных.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для проведения обыска.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для быстрого ареста саспекта.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для выдачи розыска через ручной режим и умную выдачу розыска.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для предоставления и запроса предъявить документы') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для быстрого проведения обыска.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для быстрого захвата саспекта в наручниках.') imgui.SetColumnWidth(-1, w.old) imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для отмены действия захвата саспектав наручних.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для поиска саспекта по базе данных.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для быстрой RP - отыгровки извлечения из Т/С.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для использования аптечки.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для активации мегафона в режиме трафик-стопа.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для активации мегафона в режиме погони.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для понижения уровня розыска в базе данных.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для активации/дезактивации боди-камеры.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для для зачитания прав человека при аресте.') imgui.SetColumnWidth(-1, w.old)
               imgui.Spacing()
               imgui.Spacing()
               imgui.Separator()
               imgui.Text(u8'Команда для снятия маски с саспекта.') imgui.SetColumnWidth(-1, w.old)
               imgui.NextColumn()
               imgui.Columns(1)
               imgui.Separator()
               imgui.EndChild()
         end
    
        if setting == 4 then
           imgui.SetCursorPosX(730)
           imgui.SetCursorPosY(50)
           imgui.BeginChild('Radio', imgui.ImVec2(1050, 690), true)
           imgui.Text(u8'Тэг подразделения (/r):')
           imgui.PushItemWidth(400)
           if imgui.InputText(' ', mytag, 64) then
              ini.radio.tag = u8:decode(ffi.string(mytag))
              inicfg.save(ini, "MVDHelper.ini")
              imgui.PopItemWidth()
           end
           imgui.SameLine()
           imgui.SetCursorPosX(500)
           imgui.SetCursorPosY(0)
           imgui.Text(u8'Тэг всей организации (/d):')
           imgui.SetCursorPosX(500)
           imgui.SetCursorPosY(40)
           if imgui.InputText('##tagg', tagdepat, 64) then
              ini.radio.tagdepartament = u8:decode(ffi.string(tagdepat))
              inicfg.save(ini, "MVDHelper.ini")
           end
           imgui.NewLine()
           imgui.Separator()
           imgui.Text(u8'Временно не работает (в разработке)')
           imgui.EndChild()
        end
     
          if setting == 5 then
             imgui.SetCursorPos(imgui.ImVec2(730, 45))
             if imgui.BeginChild('Name999', imgui.ImVec2(1050, 700), true) then
                imgui.SetCursorPos(imgui.ImVec2(319, 10))
                if imgui.BeginChild('Name998', imgui.ImVec2(550, 250), true) then
                   imgui.SetCursorPos(imgui.ImVec2(180, 10))
                   DrawCheckNap()
                   imgui.SetCursorPos(imgui.ImVec2(180, 90))
                   DrawSelectNap()
                   imgui.SetCursorPos(imgui.ImVec2(10, 10))
                   if ComboNap[0] == 0 then 
                      imgui.Image(imhandle19, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 1 then
                      imgui.Image(imhandle20, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 2 then
                      imgui.Image(imhandle21, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 3 then
                      imgui.Image(imhandle22, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 4 then
                      imgui.Image(imhandle24, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 5 then
                      imgui.Image(imhandle23, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 6 then
                      imgui.Image(imhandle25, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 7 then
                      imgui.Image(imhandle26, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 8 then
                      imgui.Image(imhandle27, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 9 then
                      imgui.Image(imhandle28, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 10 then
                      imgui.Image(imhandle29, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 11 then
                      imgui.Image(imhandle30, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 12 then
                      imgui.Image(imhandle31, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 13 then
                      imgui.Image(imhandle32, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 14 then
                      imgui.Image(imhandle33, imgui.ImVec2(156, 156))
                   elseif ComboNap[0] == 15 then
                      imgui.Image(imhandle27, imgui.ImVec2(156, 156))
                   end
                end
                imgui.EndChild()
                imgui.EndChild()
             end
          end
  
        if tab == 3 then 
           imgui.SetCursorPosX(420)
           imgui.SetCursorPosY(50)
           imgui.BeginChild('Tab3', imgui.ImVec2(1350, 690))
           imgui.BeginChild('Update0.8', imgui.ImVec2(550, 550), true)
           imgui.Image(upd, imgui.ImVec2(535, 270))
           imgui.Spacing()
           imgui.CenterText('Новый MVDHELPER на вашем телефоне!')
           imgui.CenterText('11.05.2024')
           imgui.NewLine()
           imgui.TextWrapped(u8'Встречайте новый MVDHELPER на ваших мобильных устройствах! Теперь в полиции вам станет намного удобнее работать!')
           imgui.NewLine()
           imgui.Spacing()
           if imgui.Button(faicons('BOLT').. u8' Посмотреть', imgui.ImVec2(540, 40)) then
              imgui.OpenPopup(u8'Обновление 0.8 BETA')
           end
           if imgui.BeginPopupModal(u8'Обновление 0.8 BETA', _, imgui.WindowFlags.NoResize + imgui.WindowFlags.AlwaysAutoResize) then
              imgui.CenterText('Обновление 0.3 - 0.8 BETA')
              local file = io.open("update.json", "r") 
              a = file:read("*a")
              file:close() 
              update = decodeJson(a) 
              for _, update8 in pairs(update["description0.8"]) do
                 imgui.BulletText(u8(update8))
              end
              imgui.Spacing()
              imgui.Spacing()
              if imgui.Button(u8'Закрыть', imgui.ImVec2(2000, 40)) then
                 imgui.CloseCurrentPopup()
              end
           end
           imgui.EndChild()
           imgui.EndChild()
           imgui.SameLine(1200)
           imgui.BeginChild('##update0.9', imgui.ImVec2(550, 550), true)
           imgui.Image(update09, imgui.ImVec2(535, 270))
           imgui.Spacing()
           imgui.CenterText('Новое обновление MVDHelper!')
           imgui.CenterText('20.06.2024')
           imgui.NewLine()
           imgui.TextWrapped(u8'Встречайте новое обновление 0.9v BETA! Приложение стало стабильным и, убраны критические ошибки!')
           imgui.NewLine()
           imgui.Spacing()
           if imgui.Button(faicons('BOLT').. u8' Посмотреть', imgui.ImVec2(540, 40)) then
              imgui.OpenPopup(u8'Обновление 0.9v BETA')
           end
           if imgui.BeginPopupModal(u8'Обновление 0.9v BETA', _, imgui.WindowFlags.NoResize + imgui.WindowFlags.AlwaysAutoResize) then
              imgui.CenterText('Обновление 0.8v - 0.9v BETA')
              local file = io.open("update.json", "r") 
              a = file:read("*a")
              file:close() 
              update = decodeJson(a) 
              for _, update9 in pairs(update["description0.9"]) do
                 imgui.BulletText(u8(update9))
              end
              imgui.Spacing()
              imgui.Spacing()
              if imgui.Button(u8'Закрыть', imgui.ImVec2(2000, 40)) then
                 imgui.CloseCurrentPopup()
              end
           end
           imgui.EndChild()
        end
 
       if tab == 4 then
          imgui.SetCursorPosX(420)
          imgui.SetCursorPosY(50)
          imgui.BeginChild('Tab4', imgui.ImVec2(1350, 690), true)
          imgui.CenterText('СКОРО')
          imgui.EndChild()
       end
       imgui.End()
  end)



    imgui.OnFrame(function() return EditColor[0] and not isGamePaused() end, function()
       imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
       imgui.Begin(u8'Изменение цвета', EditColor, imgui.WindowFlags.AlwaysAutoResize)
       if imgui.ColorPicker4('##EditWindowBg', color, imgui.ColorEditFlags.AlphaBar) then
          argbW = imgui.ColorConvertFloat4ToU32(
             imgui.ImVec4(color[0], color[1], color[2], color[3])
             )
             ini.wighet.color = argbW
             inicfg.save(ini, "MVDHelper.ini")
       end
       if imgui.Button(u8'Закрыть') then
          EditColor[0] = false
       end
       imgui.SameLine()
       if imgui.Button(u8'Сбросить') then
          imgui.StrCopy(color, '#1677721600')
       end
       imgui.Spacing()
       imgui.End()
    end)


    
  function cmd_su(id)
     
 if id == "" then
    if checkboxone[0] then 
       sampAddChatMessage(tag.. 'Введите /su [ID] - для выдачи звёзд с помощью умной выдачи розыска.', -1)
       else
          sampAddChatMessage(tag.. 'Введите /su [ID] [Уровень розыска] [Причина] - для стандратной выдачи розыска.', -1)
          end
          else
    
      lua_thread.create(function()
         pID = id
         if checkboxone[0] then
            WinState[0] = not WinState[0]
            else
               lua_thread.create(function()
                  if ComboPol[0] == 0 then 
                     sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
                  elseif ComboPol[0] == 1 then
                     sampSendChat('/me зажал кнопку на опции и сообщил диспетчеру приметы подозреваемого')
                     wait(slider[0])
                     sampSendChat('/su '..id..' ')
                     wait(100)
                     if ymnayaz[0] then
                        sampSendChat('/z '..id)
                     end
                     wait(4200)
                     sampSendChat('/do Преступник занесен в базу данных.')
                  elseif ComboPol[0] == 1 then
                     sampSendChat('/me зажала кнопку на опции и сообщила диспетчеру приметы подозреваемого')
                     wait(slider[0])
                     sampSendChat('/su '..id..' ')
                     wait(100)
                     if ymnayaz[0] then
                        sampSendChat('/z '..id)
                     end
                     wait(4200)
                     sampSendChat('/do Преступник занесен в базу данных.')
                  end
               end)
         end
      end)
 end
end



function cmd_ticket(id)

    if id == "" then
       sampAddChatMessage(tag.. ' Используйте: /'..ini.cmd.cmd6..' [ID].', -1)
       else
    
       lua_thread.create(function()
          pID = id
          if checkboxtwo[0] then Tik[0] = not Tik[0]
          end
       end)
    end
end



   function cmd_pas(id)
      
      if id == "" then
         sampAddChatMessage(tag .. "Используйте: /"..ini.cmd.cmd13.." [ID].", -1)
         else
    
       lua_thread.create(function()
          local time = tonumber(os.date("%H"))
          local surfam = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("_(.*)")
          if (time >= 12 and time < 18) then
             sampSendChat('Добрый день, управление '..ini.set.org..', офицер '..surfam..'. ')
          elseif (time >= 18 and time < 24) then
             sampSendChat('Добрый вечер, управление '..ini.set.org..', офицер '..surfam..'. ')
          elseif (time >= 00 and time < 05) then
             sampSendChat('Доброй ночи, управление '..ini.set.org..', офицер '..surfam..'. ')
          elseif (time >= 05 and time < 12) then
             sampSendChat('Доброе утро, управление '..ini.set.org..', офицер '..surfam..'. ')
             end
             wait(slider[0])
             sampSendChat('/do Слева на груди жетон полицейского справа - именная нашивка с фамилией.')
             wait(slider[0])
             sampSendChat('/showbadge '..id..' ')
             wait(slider[0])
             sampSendChat('Прошу предъявить документ удостоверяющий вашу личность.')
             wait(slider[0])
       end)
      end
   end
    
          

  function cmd_pull(id)
     
     if id == "" then
        sampAddChatMessage(tag .. " Используйте: /"..ini.cmd.cmd18.." [ID].", -1)
        else

   lua_thread.create(function()
      if ComboPol[0] == 0 then 
         sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
      elseif ComboPol[0] == 1 then 
         sampSendChat('/me схватил дубинку с пояса, резким взмахом ее и начал бить по окну водителя')
         wait(slider[0])
         sampSendChat('/me разбив стекло, открыл дверь изнутри и схватил водителя за одежду ...')
         wait(slider[0])
         sampSendChat('/me ... после чего, выбросил подозреваемого на асфальт и заломал его руки')
         wait(slider[0])
         sampSendChat('/pull '..id..' ')
      elseif ComboPol[0] == 2 then 
         sampSendChat('/me схватила дубинку с пояса, резким взмахом ее и начала бить по окну водителя')
         wait(slider[0])
         sampSendChat('/me разбив стекло, открыла дверь изнутри и схватила водителя за одежду ...')
         wait(slider[0])
         sampSendChat('/me ... после чего, выбросила подозреваемого на асфальт и заломала его руки')
         wait(slider[0])
         sampSendChat('/pull '..id..' ')
      end
   end)
     end
  end



function cmd_frisk(id)

    if id == "" then
        sampAddChatMessage(tag .. " Используйте: /"..ini.cmd.cmd14.." [ID].", -1)
    else
    
        lua_thread.create(function()
        if ComboPol[0] == 0 then 
         sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then 
        sampSendChat('/me надев резиновые перчатки, начал прощупывать гражданина по всему телу ...')
        wait(slider[0])
        sampSendChat('/me ... за тем начал тщательно обыскивать гражданина, выкладывая всё для изучения.')
        wait(slider[0])
        sampSendChat('/frisk '..id..' ')
        elseif ComboPol[0] == 2 then 
        sampSendChat('/me надев резиновые перчатки, начала прощупывать гражданина по всему телу ...')
        wait(slider[0])
        sampSendChat('/me ... за тем начала тщательно обыскивать гражданина, выкладывая всё для изучения.')
        wait(slider[0])
        sampSendChat('/frisk '..id..' ')
             end
        end)
    end
end



function cmd_gotome(id)

    if id == "" then
        sampAddChatMessage(tag .. " Используйте: /"..ini.cmd.cmd15.." [ID].", -1)
    else
    
    lua_thread.create(function()
     if ComboPol[0] == 0 then 
       sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
       elseif ComboPol[0] == 1 then
        sampSendChat('/me держит рукой за левое плечо и силой сжимает запястье человека')
        wait(2000)
        sampSendChat('/gotome '..id..' ')
        wait(slider[0])
        sampSendChat('/todo Без резких движений!*повысив тембр голоса')
        elseif ComboPol[0] == 2 then
        sampSendChat('/me держит рукой за левое плечо и силой сжимает запястье человека')
        wait(2000)
        sampSendChat('/gotome '..id..' ')
        wait(slider[0])
        sampSendChat('/todo Без резких движений!*повысив тембр голоса')
            end 
        end)
    end
end

function cmd_ungotome(id)

    if id == "" then
        sampAddChatMessage(tag .. " Используйте: /"..ini.cmd.cmd16.." [ID].", -1)
    else

    lua_thread.create(function()
    if ComboPol[0] == 0 then 
    sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
    elseif ComboPol[0] == 1 then 
        sampSendChat('/me убрал руку с плеча и отпустил запястье человека')
        wait(slider[0])
        sampSendChat('/ungotome '..id..' ')
        elseif ComboPol[0] == 2 then 
        sampSendChat('/me убрала руку с плеча и отпустила запястье человека')
        wait(slider[0])
        sampSendChat('/ungotome '..id..' ')
              end
        end)
    end
end

function cmd_cuff(id)

    if id == "" then
        sampAddChatMessage(tag .. " Используйте: /"..ini.cmd.cmd1.." [ID].", -1)
    else
       lua_thread.create(function()
          if ComboPol[0] == 0 then 
             sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
          elseif ComboPol[0] == 1 then 
             sampSendChat('/me держит одной рукой подозреваемого, другой достает из подсумка наручники ... ')
             wait(slider[0])
             sampSendChat('/me ... и, скрестив руки подозреваемого нацепил их на него')
             wait(slider[0])
             sampSendChat('/cuff '..id..' ')
          elseif ComboPol[0] == 2 then
             sampSendChat('/me держит одной рукой подозреваемого, другой достает из подсумка наручники ... ')
             wait(slider[0])
             sampSendChat('/me ... и, скрестив руки подозреваемого нацепила их на него')
             wait(slider[0])
             sampSendChat('/cuff '..id..' ')
          end
       end)
    end
end



function cmd_uncuff(id)

    if id == "" then
        sampAddChatMessage(tag .. " Используйте: /"..ini.cmd.cmd2.." [ID].", -1)
    else
       lua_thread.create(function()
          if ComboPol[0] == 0 then 
             sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
          elseif ComboPol[0] == 1 then
             sampSendChat('/me придерживая руки подозреваемого, достает с пояса ключи от наручников ...')
             wait(slider[0])
             sampSendChat('/me ... и снимает с их помощью браслетов с подозреваемого и убирает их в подсумок.')
             wait(slider[0])
             sampSendChat('/uncuff '..id..' ')
             wait(slider[0])
          elseif ComboPol[0] == 2 then
             sampSendChat('/me придерживая руки подозреваемого, достает с пояса ключи от наручников ...')
             wait(slider[0])
             sampSendChat('/me ... и снимает с их помощью браслетов с подозреваемого и убирает их в подсумок.')
             wait(slider[0])
             sampSendChat('/uncuff '..id..' ')
             wait(slider[0])
          end
       end)
    end
end



function cmd_find(id)

    if id == "" then
       sampAddChatMessage(tag .. " Используйте: /"..ini.cmd.cmd17.." [ID].", -1)
    else
       
       lua_thread.create(function()
          if ComboPol[0] == 0 then 
             sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
          elseif ComboPol[0] == 1 then
             sampSendChat('/me положив руки на клавиатуру бортового компьютера, начал поиск по базе данных по имени')
             wait(slider[0])
             sampSendChat('/me найдя имя, проверил номер телефона и включил отслеживания по GPS')
             wait(slider[0])
             sampSendChat('/pursuit '..id..' ')
             wait(slider[0])
          elseif ComboPol[0] == 2 then
             sampSendChat('/me положив руки на клавиатуру бортового компьютера, начала поиск по базе данных по имени')
             wait(slider[0])
             sampSendChat('/me найдя имя, проверила номер телефона и включила отслеживания по GPS')
             wait(slider[0])
             sampSendChat('/pursuit '..id..' ')
             wait(slider[0])
          end
       end)
    end
end



 function cmd_incar(player
    )
    local id, arg = string.match(player, "(%d+)%s(.+)")
    if arg ~= nil and tonumber(id) < 1000 then
       lua_thread.create(function()
          if ComboPol[0] == 0 then 
             sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
          elseif ComboPol[0] == 1 then
             sampSendChat('/me приоткрыл дверь полицейского автомобиля, затем помог подозреваемому сесть ...')
             wait(slider[0])
             sampSendChat('/incar '..id.. ' '..arg)
             wait(slider[0])
             sampSendChat('/me ... на заднее сиденье и закрыл дверь крузера.')
             wait(slider[0])
          elseif ComboPol[0] == 2 then
             sampSendChat('/me приоткрыла дверь полицейского автомобиля, затем помогла подозреваемому сесть ...')
             wait(slider[0])
             sampSendChat('/incar '..id..' '..arg)
             wait(slider[0])
             sampSendChat('/me ... на заднее сиденье и закрыла дверь крузера.')
             wait(slider[0])      
          end
       end)
       else
          sampAddChatMessage(tag .. " Используйте: /"..ini.cmd.cmd3.." [ID] [ID места].", -1)
    end
 end
  


function cmd_tk(id)

    if id == "" then
        sampAddChatMessage(tag .. "Введите айди игрока: /tk [ID] [Сумма] [Причина].", -1)
    else

    lua_thread.create(function()
    if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then
        sampSendChat('/me достав с нагрудного кармана ручку и бланк для штрафа, вписал в него данные нарушения, ...')
         wait(slider[0])
         sampSendChat('/me ... затем передал бланк нарушителю для дальнейшей оплаты.')
         wait(slider[0])
        sampSendChat('/ticket '..id..' ')
        wait(slider[0])
        elseif ComboPol[0] == 2 then
        sampSendChat('/me достав с нагрудного кармана ручку и бланк для штрафа, вписала в него данные нарушения, ...')
         wait(slider[0])
         sampSendChat('/me ... затем передала бланк нарушителю для дальнейшей оплаты.')
         wait(slider[0])
        sampSendChat('/ticket '..id..' ')
        wait(slider[0])
               end
        end)
    end
end


 function cmd_mask()
    sampSendChat('/mask')
    
    function sampev.onServerMessage(color, msg)
       lua_thread.create(function()
          if msg:find('Вы успешно надели маску.') then
             sampSendChat('/me протянул руку к заднему подсумку и вынул из него балаклаву, ...')
             wait(slider[0])
             sampSendChat('/me затем расправил её и натянул на лицо.')
          end
          if msg:find('Вы успешно выкинули маску.') then
             sampSendChat('/me сдёрнул балаклаву с лица убрав её в подсумку.')
          end
          if msg:find('Время действия маски истекло, вам пришлось ее выбросить') then
             sampSendChat('/me сдёрнул балаклаву с лица убрав её в подсумку.')
          end
          if msg:find('Вы сняли маску') then
             sampSendChat('/me сдёрнул балаклаву с лица убрав её в подсумку.')
          end
       end)
    end
 end
    
    
    
  function cmd_invite(id)
     
     if id == "" then
        sampAddChatMessage(tag.. 'Используйте /invite [ID].', -1)
        else
           
           lua_thread.create(function()
              if ComboPol[0] == 0 then 
                 sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
              elseif ComboPol[0] == 1 then 
                 sampSendChat('/me засунул руку в правый карман и достал КПК')
                 wait(slider[0])
                 sampSendChat('/do Открыл в КПК: «Организации», затем нажал на кнопку: «Сотрудники».')
                 wait(slider[0])
                 sampSendChat('/me ввёл имя и фамилию, а затем нажал на кнопку: Добавить')
                 wait(slider[0])
                 sampSendChat('/do Заблокировал КПК и положил КПК в правый карман.')
                 wait(slider[0])
                 sampSendChat('/me держит в руке кейс, в котором лежит чистая форма')
                 wait(slider[0])
                 sampSendChat('/do Открыл кейс, достал чистую форму, а затем закрыл кейс.')
                 wait(slider[0])
                 sampSendChat('/todo Вот, возьмите, это ваша форма.*передавая форму человеку напротив')
                 wait(slider[0])
                 sampSendChat('/invite '..id)
                 wait(slider[0])
              elseif ComboPol[0] == 2 then 
                 sampSendChat('/me засунула руку в правый карман и достала КПК')
                 wait(slider[0])
                 sampSendChat('/do Открыла в КПК: «Организации», затем нажала на кнопку: «Сотрудники».')
                 wait(slider[0])
                 sampSendChat('/me ввела имя и фамилию, а затем нажала на кнопку: Добавить')
                 wait(slider[0])
                 sampSendChat('/do Заблокировала КПК и положила КПК в правый карман.')
                 wait(slider[0])
                 sampSendChat('/me держит в руке кейс, в котором лежит чистая форма')
                 wait(slider[0])
                 sampSendChat('/do Открыла кейс, достала чистую форму, а затем закрыла кейс.')
                 wait(slider[0])
                 sampSendChat('/todo Вот, возьмите, это ваша форма.*передавая форму человеку напротив')
                 wait(slider[0])
                 sampSendChat('/invite '..id)
                 wait(slider[0])
              end
           end)
     end
  end


   
  function cmd_uninvite(player)
     
     local id, arg = string.match(player, "(%d+)%s(.+)")
     if arg ~= nil and tonumber(id) < 1000 then
        lua_thread.create(function()
           if ComboPol[0] == 0 then 
              sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
           elseif ComboPol[0] == 1 then 
              sampSendChat('/do В правом кармане брюк находится КПК.')
              wait(slider[0])
              sampSendChat('/me достал КПК из правого кармана, затем начал пробивать по базе данных сотрудника через лицо, ID карту и жетон')
              wait(slider[0])
              sampSendChat('/do На экране КПК появилась полная информация о сотруднике.')
              wait(slider[0])
              sampSendChat('/me нажал на кнопку Уволить из Гос. Организации')
              wait(slider[0])
              sampSendChat('/do Сотрудник был удален из списка "Гос. Сотрудники".')
              wait(slider[0])
              sampSendChat('/me убрал КПК обратно в правый карман')
              wait(slider[0])
              sampSendChat('/uninvite '..id..' '..arg)
              wait(slider[0])
           elseif ComboPol[0] == 2 then 
              sampSendChat('/do В правом кармане брюк находится КПК.')
              wait(slider[0])
              sampSendChat('/me достала КПК из правого кармана, затем начала пробивать по базе данных сотрудника через лицо, ID карту и жетон')
              wait(slider[0])
              sampSendChat('/do На экране КПК появилась полная информация о сотруднике.')
              wait(slider[0])
              sampSendChat('/me нажала на кнопку Уволить из Гос. Организации')
              wait(slider[0])
              sampSendChat('/do Сотрудник был удален из списка "Гос. Сотрудники".')
              wait(slider[0])
              sampSendChat('/me убрала КПК обратно в правый карман')
              wait(slider[0])
              sampSendChat('/uninvite '..id..' '..arg)
              wait(slider[0])
           end
        end)
        else
           sampAddChatMessage(tag .. "Введите айди игрока: /uninvite [ID] [Причина].", -1)
     end
  end



  function cmd_giverank(player)
     
     local id, arg = string.match(player, "(%d+)%s(.+)")
     if arg ~= nil and tonumber(id) < 1000 then
        lua_thread.create(function()
           if ComboPol[0] == 0 then 
              sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
           elseif ComboPol[0] == 1 then
              sampSendChat('/me засунул руку в правый карман и достал КПК')
              wait(slider[0])
              sampSendChat('/do Открыл приложение: «Организации», затем нажал на кнопку: «Сотрудники».')
              wait(slider[0])
              sampSendChat('/me ввёл имя и фамилию, а затем нажал на кнопку: Изменить должность')
              wait(slider[0])
              sampSendChat('/do Заблокировал экран и положил КПК в правый карман.')
              wait(slider[0])
              sampSendChat('Поздравляю с повышением, продолжайте в том же духе!')
              wait(slider[0])
              sampSendChat('Новый бейджик вы можете взять в раздевалке!')
              wait(slider[0])
              sampSendChat('/giverank '..id.. ' '..arg)
              wait(slider[0])
           elseif ComboPol[0] == 2 then
              sampSendChat('/me засунула руку в правый карман и достала КПК')
              wait(slider[0])
              sampSendChat('/do Открыла приложение: «Организации», затем нажала на кнопку: «Сотрудники».')
              wait(slider[0])
              sampSendChat('/me ввела имя и фамилию, а затем нажала на кнопку: Изменить должность')
              wait(slider[0])
              sampSendChat('/do Заблокировала экран и положила КПК в правый карман.')
              wait(slider[0])
              sampSendChat('Поздравляю с повышением, продолжайте в том же духе!')
              wait(slider[0])
              sampSendChat('Новый бейджик вы можете взять в раздевалке!')
              wait(slider[0])
              sampSendChat('/giverank '..id..' '..arg)
              wait(slider[0])
           end
        end)
        else
           sampAddChatMessage(tag .. "Введите айди игрока: /giverank [ID] [Ранг].", -1)
     end
  end



function cmd_fwarn(player)

    local id, arg = string.match(player, "(%d+)%s(.+)")
	if arg ~= nil and tonumber(id) < 1000 then
    
    lua_thread.create(function()
    if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then 
        sampSendChat('/me засунул руку в правый карман и достал КПК')
        wait(slider[0])
        sampSendChat('/do Открыл КПК: «Организации», затем нажал на кнопку: «Выговоры».')
        wait(slider[0])
        sampSendChat('/me ввёл имя, фамилию и причину, а затем нажал на кнопку: Выдать')
        wait(slider[0])
        sampSendChat('/me заблокировал экран и положил КПК в правый карман.')
        wait(slider[0])
        sampSendChat('/fwarn '..id..' '..arg)
        wait(slider[0])
        elseif ComboPol[0] == 2 then 
        sampSendChat('/me засунула руку в правый карман и достала КПК')
        wait(slider[0])
        sampSendChat('/do Открыла КПК: «Организации», затем нажала на кнопку: «Выговоры».')
        wait(slider[0])
        sampSendChat('/me ввела имя, фамилию и причину, а затем нажала на кнопку: Выдать')
        wait(slider[0])
        sampSendChat('/me заблокировала экран и положил КПК в правый карман.')
        wait(slider[0])
        sampSendChat('/fwarn '..id..' '..arg)
        wait(slider[0])
               end
        end)
        else
        sampAddChatMessage(tag .. "Введите айди игрока: /fwarn [ID] [Причина].", -1)
    end
end



function cmd_unfwarn(player)

    local id, arg = string.match(player, "(%d+)%s(.+)")
	if arg ~= nil and tonumber(id) < 1000 then
        
    lua_thread.create(function()
    if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then
        sampSendChat('/me засунул руку в правый карман и достал КПК')
        wait(slider[0])
        sampSendChat('/do Открыл КПК: «Организации», затем нажал на кнопку: «Выговоры».')
        wait(slider[0])
        sampSendChat('/me ввёл имя, фамилию и причину, а затем нажал на кнопку: Снять')
        wait(slider[0])
        sampSendChat('/me заблокировал экран и положил КПК в правый карман.')
        wait(slider[0])
        sampSendChat('/unfwarn '..id..' '..arg)
        wait(slider[0])
        elseif ComboPol[0] == 2 then
        sampSendChat('/me засунула руку в правый карман и достала КПК')
        wait(slider[0])
        sampSendChat('/do Открыла КПК: «Организации», затем нажала на кнопку: «Выговоры».')
        wait(slider[0])
        sampSendChat('/me ввела имя, фамилию и причину, а затем нажала на кнопку: Снять')
        wait(slider[0])
        sampSendChat('/me заблокировала экран и положила КПК в правый карман.')
        wait(slider[0])
        sampSendChat('/unfwarn '..id..' '..arg)
        wait(slider[0])
              end
        end)
        else
        sampAddChatMessage(tag .. "Введите айди игрока: /unfwarn [ID].", -1)
    end
end



function cmd_dk()

    local x, y, z = getCharCoordinates(PLAYER_PED)
        if ComboPatryl[0] == 0 then 
        sampAddChatMessage(tagg.. 'Выберите код состояния!', -1)
    elseif ComboPatryl[0] == 1 and ComboShow[0] == 1 then 
        sampSendChat('/r L-'..ini.set.mark..' всем постам С’0! Раненый офицер в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
    elseif ComboPatryl[0] == 2  and ComboShow[0] == 2 then 
        sampSendChat('/r  L-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
     elseif ComboPatryl[0] == 3 and ComboShow[0] == 1 then 
         sampSendChat('/r L-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘2, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 4 and ComboShow[0] == 1 then 
        sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Будьте готовы приехать на подмогу по С’2 HIGH, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 5 and ComboShow[0] == 1 then 
          sampSendChat('/r L-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘3, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
        elseif ComboPatryl[0] == 6 and ComboShow[0] == 1 then 
           sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Район '..calculateZone(x, y, z)..' ('..kvadrat()..'). C‘4, доступен.')
        elseif ComboPatryl[0] == 7 and ComboShow[0] == 1 then 
          sampSendChat('/r L-'..ini.set.mark..' на CONTROL! Будьте готовы приехать на подмогу по С’4 ADAM, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), доступен.')
        elseif ComboPatryl[0] == 8 and ComboShow[0] == 1 then 
          sampSendChat('/r L-'..ini.set.mark..' на CONTROL. На перерыве, район '..calculateZone(x, y, z)..', недоступен.')
        elseif ComboPatryl[0] == 11 and ComboShow[0] == 1 then 
          sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Замечен угнанный транспорт в районе '..calculateZone(x, y, z)..', недоступен')
          
          elseif ComboPatryl[0] == 1 and ComboShow[0] == 2 then 
        sampSendChat('/r A-'..ini.set.mark..' всем постам С’0! Раненый офицер в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
        elseif ComboPatryl[0] == 2  and ComboShow[0] == 2 then 
        sampSendChat('/r  A-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
     elseif ComboPatryl[0] == 3 and ComboShow[0] == 2 then 
         sampSendChat('/r A-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘2, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 4 and ComboShow[0] == 2 then 
        sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Будьте готовы приехать на подмогу по С’2 HIGH, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 5 and ComboShow[0] == 2 then 
          sampSendChat('/r A-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘3, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
        elseif ComboPatryl[0] == 6 and ComboShow[0] == 2 then 
           sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Район '..calculateZone(x, y, z)..' ('..kvadrat()..'). C‘4, доступен.')
        elseif ComboPatryl[0] == 7 and ComboShow[0] == 2 then 
          sampSendChat('/r A-'..ini.set.mark..' на CONTROL! Будьте готовы приехать на подмогу по С’4 ADAM, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), доступен.')
        elseif ComboPatryl[0] == 8 and ComboShow[0] == 2 then 
          sampSendChat('/r A-'..ini.set.mark..' на CONTROL. На перерыве, район '..calculateZone(x, y, z)..', недоступен.')
        elseif ComboPatryl[0] == 11 and ComboShow[0] == 2 then 
          sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Замечен угнанный транспорт в районе '..calculateZone(x, y, z)..', недоступен')
          
          elseif ComboPatryl[0] == 1 and ComboShow[0] == 3 then 
        sampSendChat('/r M-'..ini.set.mark..' всем постам С’0! Раненый офицер в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
        elseif ComboPatryl[0] == 2  and ComboShow[0] == 3 then 
        sampSendChat('/r M-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
     elseif ComboPatryl[0] == 3 and ComboShow[0] == 3 then 
         sampSendChat('/r M-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘2, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 4 and ComboShow[0] == 3 then 
        sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Будьте готовы приехать на подмогу по С’2 HIGH, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 5 and ComboShow[0] == 3 then 
          sampSendChat('/r M-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘3, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
        elseif ComboPatryl[0] == 6 and ComboShow[0] == 3 then 
           sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Район '..calculateZone(x, y, z)..' ('..kvadrat()..'). C‘4, доступен.')
        elseif ComboPatryl[0] == 7 and ComboShow[0] == 3 then 
          sampSendChat('/r M-'..ini.set.mark..' на CONTROL! Будьте готовы приехать на подмогу по С’4 ADAM, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), доступен.')
        elseif ComboPatryl[0] == 8 and ComboShow[0] == 3 then 
          sampSendChat('/r M-'..ini.set.mark..' на CONTROL. На перерыве, район '..calculateZone(x, y, z)..', недоступен.')
        elseif ComboPatryl[0] == 11 and ComboShow[0] == 3 then 
          sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Замечен угнанный транспорт в районе '..calculateZone(x, y, z)..', недоступен')
          
          elseif ComboPatryl[0] == 1 and ComboShow[0] == 4 then 
        sampSendChat('/r E-'..ini.set.mark..' всем постам С’0! Раненый офицер в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
        elseif ComboPatryl[0] == 2  and ComboShow[0] == 4 then 
        sampSendChat('/r E-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
     elseif ComboPatryl[0] == 3 and ComboShow[0] == 4 then 
         sampSendChat('/r E-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘2, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 4 and ComboShow[0] == 4 then 
        sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Будьте готовы приехать на подмогу по С’2 HIGH, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 5 and ComboShow[0] == 4 then 
          sampSendChat('/r E-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘3, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
        elseif ComboPatryl[0] == 6 and ComboShow[0] == 4 then 
           sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Район '..calculateZone(x, y, z)..' ('..kvadrat()..'). C‘4, доступен.')
        elseif ComboPatryl[0] == 7 and ComboShow[0] == 4 then 
          sampSendChat('/r E-'..ini.set.mark..' на CONTROL! Будьте готовы приехать на подмогу по С’4 ADAM, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), доступен.')
        elseif ComboPatryl[0] == 8 and ComboShow[0] == 4 then 
          sampSendChat('/r E-'..ini.set.mark..' на CONTROL. На перерыве, район '..calculateZone(x, y, z)..', недоступен.')
        elseif ComboPatryl[0] == 11 and ComboShow[0] == 4 then 
          sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Замечен угнанный транспорт в районе '..calculateZone(x, y, z)..', недоступен')
          
          elseif ComboPatryl[0] == 1 and ComboShow[0] == 5 then 
        sampSendChat('/r ASD-'..ini.set.mark..' всем постам С’0! Раненый офицер в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
        elseif ComboPatryl[0] == 2  and ComboShow[0] == 5 then 
        sampSendChat('/r ASD-'..ini.set.mark..' всем постам C‘1! Нахожусь под огнём в районе '..calculateZone(x, y, z)..' ('..kvadrat()..')!')
     elseif ComboPatryl[0] == 3 and ComboShow[0] == 5 then 
         sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘2, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 4 and ComboShow[0] == 5 then 
        sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Будьте готовы приехать на подмогу по С’2 HIGH, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
     elseif ComboPatryl[0] == 5 and ComboShow[0] == 5 then 
          sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL! Требуется поддержка по C‘3, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), недоступен.')
        elseif ComboPatryl[0] == 6 and ComboShow[0] == 5 then 
           sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Район '..calculateZone(x, y, z)..' ('..kvadrat()..'). C‘4, доступен.')
        elseif ComboPatryl[0] == 7 and ComboShow[0] == 5 then 
          sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL! Будьте готовы приехать на подмогу по С’4 ADAM, район '..calculateZone(x, y, z)..' ('..kvadrat()..'), доступен.')
        elseif ComboPatryl[0] == 8 and ComboShow[0] == 5 then 
          sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. На перерыве, район '..calculateZone(x, y, z)..', недоступен.')
        elseif ComboPatryl[0] == 11 and ComboShow[0] == 5 then 
          sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Замечен угнанный транспорт в районе '..calculateZone(x, y, z)..', недоступен')
      end
   end

function cmd_clear(id)

        if id == "" then
            sampAddChatMessage(tag.. ' Используйте: /'..ini.cmd.cmd8..' [ID]. ', -1)
     else
     
     lua_thread.create(function()
     if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then
         sampSendChat('/me нажав на тангенту, сообщил диспетчеру имя человека, который больше не числится в розыске.')
          wait(slider[0])
          sampSendChat('/clear '..id..' ')
          elseif ComboPol[0] == 2 then
         sampSendChat('/me нажав на тангенту, сообщила диспетчеру имя человека, который больше не числится в розыске.')
          wait(slider[0])
          sampSendChat('/clear '..id..' ')
              end
      end)
   end
end

 
 
function cmd_take(id)

   if id == "" then
       sampAddChatMessage(tag.. ' Используйте: /'..ini.cmd.cmd9..' [ID].', -1)
     else
     
     lua_thread.create(function()
     if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then 
         sampSendChat('/me взяв чёрный пакет из подсумки, сложил в него все найденные вещи')
         wait(slider[0])
         sampSendChat('/take '..id..' ')
         elseif ComboPol[0] == 2 then 
         sampSendChat('/me взяв чёрный пакет из подсумки, сложила в него все найденные вещи')
         wait(slider[0])
         sampSendChat('/take '..id..' ')
                  end
           end)
      end
end



function cmd_arrest(id)

if id == "" then
sampAddChatMessage(tag.. 'Используйте /'..ini.cmd.cmd11..' [ID].', -1)
else

lua_thread.create(function()
if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then
     sampSendChat('/me нажав на тангету, сообщил диспетчеру о провезенном преступники ...')
     wait(slider[0])
     sampSendChat('/me запросил офицеров для сопровождения')
     wait(slider[0])
     sampSendChat('/me во время ожидания офицеров, подготовил в бортовом компьютере данные преступника')
     wait(slider[0])
     sampSendChat('/do Из департамента выходят офицеры и забирают преступника и вещи.')
     wait(slider[0])
     sampSendChat('/arrest '..id)
     elseif ComboPol[0] == 2 then
     sampSendChat('/me нажав на тангету, сообщила диспетчеру о провезенном преступники ...')
     wait(slider[0])
     sampSendChat('/me запросила офицеров для сопровождения')
     wait(slider[0])
     sampSendChat('/me во время ожидания офицеров, подготовила в бортовом компьютере данные преступника')
     wait(slider[0])
     sampSendChat('/do Из департамента выходят офицеры и забирают преступника и вещи.')
     wait(slider[0])
     sampSendChat('/arrest '..id)
                  end
           end)
       end
  end
     
   
   
function cmd_unmask(id)
     
     if id == "" then
        sampAddChatMessage(tag.. ' Используйте: /'..ini.cmd.cmd31..' [ID].', -1)
        else
        
   lua_thread.create(function()
   if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then 
       sampSendChat('/do На граждание находится маска.')
       wait(slider[0])
       sampSendChat('/me придерживая подозреваемого, легким движением руки сорвал балаклаву с гражданина')
       wait(slider[0])
       sampSendChat('/unmask '..id..' ')
       elseif ComboPol[0] == 2 then 
       sampSendChat('/do На граждание находится маска.')
       wait(slider[0])
       sampSendChat('/me придерживая подозреваемого, легким движением руки сорвала балаклаву с гражданина')
       wait(slider[0])
       sampSendChat('/unmask '..id..' ')
              end
         end)
      end
  end
  
   
   
function cmd_traf(id)

    if id == ""then
    sampAddChatMessage(tag.. ' Используйте: /'..ini.cmd.cmd21..' [ID].', -1)
    else
    
local x, y, z = getCharCoordinates(PLAYER_PED)
     lua_thread.create(function()
     if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     
     sampSendChat('/r Нет на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 1 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 2 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 3 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 4 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 5 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboPol[0] == 2 then
     sampSendChat('/me резким движением достала мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     elseif ComboShow[0] == 0 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r Нет на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 1 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 2 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 3 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 4 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')
     elseif ComboShow[0] == 5 then
     sampSendChat('/me резким движением достал мегафон')
     wait(slider[0])
     sampSendChat('/m Водитель транспортного средства с N-'..id..'! ')
     wait(slider[0])
     sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
     wait(slider[0])
     sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Провожу ‘55 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     wait(slider[0])
     sampSendChat('/r Автомобиль с номером N-'..id..'.')     
                end
           end)
      end
 end
 
    
    
function cmd_meg()

  local x, y, z = getCharCoordinates(PLAYER_PED)
  lua_thread.create(function()
     if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
     elseif ComboPol[0] == 1 then
        sampSendChat('/me резким движением достал мегафон')
        wait(slider[0])
        sampSendChat('/m Водитель, остановите ваше транспортное средство!')
        wait(slider[0])
        sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
        wait(slider[0])
        sampSendChat('/m В случае неподчинения законному требованию будет открыт огонь!')
        wait(slider[0])
        sampSendChat('/r Нет на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 1 then
        sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 2 then
        sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 3 then
        sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 4 then
        sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 5 then
        sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboPol[0] == 2 then
        sampSendChat('/me резким движением достала мегафон')
        wait(slider[0])
        sampSendChat('/m Водитель, остановите ваше транспортное средство!')
        wait(slider[0])
        sampSendChat('/m Прижмитесь к обочине, заглушите двигатель и держите руки на руле!')
        wait(slider[0])
        sampSendChat('/m В случае неподчинения законному требованию будет открыт огонь!')
        wait(slider[0])
     elseif ComboShow[0] == 0 then
        sampSendChat('/r Нет на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 1 then
        sampSendChat('/r L-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 2 then
        sampSendChat('/r A-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 3 then
        sampSendChat('/r M-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 4 then
        sampSendChat('/r E-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     elseif ComboShow[0] == 5 then
        sampSendChat('/r ASD-'..ini.set.mark..' на CONTROL. Провожу ‘66 в районе '..calculateZone(x, y, z)..', С‘4, недоступен.')
     end
  end)
end

 

function cmd_miranda()


    lua_thread.create(function()
    if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then 
    sampSendChat('Вы имеете право хранить молчание.')
    wait(slider[0])
    sampSendChat('Всё, что вы скажите, может и будет использовано против вас в Суде.')
    wait(slider[0])
    sampSendChat('Ваш адвокат может присутствовать при допросе.')
    wait(slider[0])
    sampSendChat('Если вы не можете оплатить услуги адвоката, он предоставлен вам государством.')
    wait(slider[0])
    sampSendChat('Вам ясны вашм права?')
    elseif ComboPol[0] == 2 then 
    sampSendChat('Вы имеете право хранить молчание.')
    wait(slider[0])
    sampSendChat('Всё, что вы скажите, может и будет использовано против вас в Суде.')
    wait(slider[0])
    sampSendChat('Ваш адвокат может присутствовать при допросе.')
    wait(slider[0])
    sampSendChat('Если вы не можете оплатить услуги адвоката, он предоставлен вам государством.')
    wait(slider[0])
    sampSendChat('Вам ясны вашм права?')
            end
        end)
     end
  
     
  
  function cmd_patrol() 
     for _, police in ipairs(PoliceVehicle) do  
        if isCharInAnyPoliceVehicle(PLAYER_PED) or isCharInModel(PLAYER_PED, police) then    
           Board[0] = not Board[0]     
           else      
              sampAddChatMessage(tag.. ' Активировать патрульный ассистент можно только в полицейском Крузере!', -1)
        end
     end
  end
     
           
           
function cmd_dok()

   lua_thread.create(function()
      if ComboPol[0] == 0 then 
         sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
      elseif ComboPol[0] == 1 then 
         sampSendChat('/me из внутреннего кармана достал паспорт')
         wait(slider[0])
         sampSendChat ('/me развернул паспорт, показал содержимое человеку напротив')
         wait(slider[0])
         sampSendChat('/do В паспорте прописано: ФИО, место проживания и регистрации...')
         wait(slider[0])
         sampSendChat ('/do ...возраст, семейное положение, трудоустройство.')
         wait(slider[0])
         sampSendChat ('/do Ниже находится печать правительства и подпись.')
         wait(slider[0])
         sampSendChat ('/me закрыл документ, убрал его обратно в карман')
      elseif ComboPol[0] == 2 then 
         sampSendChat('/me из внутреннего кармана достала паспорт')
         wait(slider[0])
         sampSendChat ('/me развернула паспорт, показала содержимое человеку напротив')
         wait(slider[0])
         sampSendChat('/do В паспорте прописано: ФИО, место проживания и регистрации...')
         wait(slider[0])
         sampSendChat ('/do ...возраст, семейное положение, трудоустройство.')
         wait(slider[0])
         sampSendChat ('/do Ниже находится печать правительства и подпись.')
         wait(slider[0])
         sampSendChat ('/me закрыла документ, убрала его обратно в карман')
      end
   end)
end
 
   

  function cmd_unsu(player)
  
  local id, arg = string.match(player, "(%d+)%s(.+)")
  if arg ~= nil and tonumber(id) < 1000 then
     lua_thread.create(function()
        if ComboPol[0] == 0 then 
           sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then 
           sampSendChat('/me нажав на тангенту, сообщил диспетчеру имя человека, которому будет понижен степень розыска')
           wait(slider[0])
           sampSendChat('/unsu '..id.. ' '..arg)
        elseif ComboPol[0] == 2 then 
           sampSendChat('/me нажав на тангенту, сообщила диспетчеру имя человека, которому будет понижен степень розыска')
           wait(slider[0])
           sampSendChat('/unsu '..id.. ' '..arg)
        end
     end)
     else
        sampAddChatMessage(tag.. 'Используйте: /'..ini.cmd.cmd23..' [ID] [Понижение розыска] [Причина].', -1)
  end
  end
  
  
  
  
  
  function cmd_body()
  local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
  body = not body
  if not body then
  lua_thread.create(function()
  sampSendChat('/do На груди '..surname..' весит камера «AXON BODY 3».')
  wait(slider[0])
  sampSendChat('/me легким движением руки протянулся к сенсору и нажал один раз для деактивации')
  wait(slider[0])
  sampSendChat('/do Боди камера издала звук и выключилась.')
  end)
  else
  lua_thread.create(function()
  sampSendChat('/do На груди '..surname..' весит камера «AXON BODY 3».')
  wait(slider[0])
  sampSendChat('/me легким движением руки протянулся к сенсору и нажал один раз для активации')
  wait(slider[0])
  sampSendChat('/do Боди камера издала звук и включилась.')
           end)
       end
   end
   
   
  
  function cmd_usemed()
     
     lua_thread.create(function()
        if ComboPol[0] == 0 then 
           sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then 
           sampSendChat('/me достал из нагрудного кармана пачку обезболивающих и проглотил одну таблетку.')
           wait(slider[0])
           sampSendChat('/usemed')
        elseif ComboPol[0] == 2 then 
           sampSendChat('/me достала из нагрудного кармана пачку обезболивающих и проглотила одну таблетку.')
           wait(slider[0])
           sampSendChat('/usemed')
        end
     end)
  end
    
 
 
 
 function removebomb()
 
 local surname = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(playerPed))):match("(.*)_.*")
 lua_thread.create(function()
 if ComboPol[0] == 0 then 
        sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
        elseif ComboPol[0] == 1 then 
 sampSendChat('/do На поясе '..surname..' прикреплён сапёрный набор.')
 wait(slider[0])
 sampSendChat('/me снял сапёрский набор с бронежилета, положил его перед собой и открыл')
 wait(slider[0])
 sampSendChat('/me достал из чемодана отвёртку и сосуд с жидкий азотом')
 wait(slider[0])
 sampSendChat('/do Перед '..surname..' находится взрывное устройство.')
 wait(slider[0])
 sampSendChat('/me открутил болты с крышки устройства, аккуратно снял крышку с таймером.')
 wait(slider[0])
 sampSendChat('/me положил отвёртку в чемодан, внимательно осмотрел содержимое детонатора')
 wait(slider[0])
 sampSendChat('/do Детонатор состоит из взрывного вещества и большого количества разноцветных проводов.')
 wait(slider[0])
 sampSendChat('/me достал из набора кусачки, перекусил ими красный провод')
 wait(slider[0])
 sampSendChat('/removebomb')
 wait(3000)
 sampSendChat('/do Таймер бомбы остановился, взрывное вещество отключено от детонатора.')
 wait(slider[0])
 sampSendChat('/do Бомба обезврежена.')
 wait(slider[0])
sampSendChat('/me убрал кусачки в чемодан, открыл сосуд, залил азотом на устройство')
elseif ComboPol[0] == 2 then 
 sampSendChat('/do На поясе '..surname..' прикреплён сапёрный набор.')
 wait(slider[0])
 sampSendChat('/me сняла сапёрский набор с бронежилета, положила его перед собой и открыла')
 wait(slider[0])
 sampSendChat('/me достала из чемодана отвёртку и сосуд с жидкий азотом')
 wait(slider[0])
 sampSendChat('/do Перед '..surname..' находится взрывное устройство.')
 wait(slider[0])
 sampSendChat('/me открутила болты с крышки устройства, аккуратно сняла крышку с таймером.')
 wait(slider[0])
 sampSendChat('/me положила отвёртку в чемодан, внимательно осмотрела содержимое детонатора')
 wait(slider[0])
 sampSendChat('/do Детонатор состоит из взрывного вещества и большого количества разноцветных проводов.')
 wait(slider[0])
 sampSendChat('/me достала из набора кусачки, перекусила ими красный провод')
 wait(slider[0])
 sampSendChat('/removebomb')
 wait(3000)
 sampSendChat('/do Таймер бомбы остановился, взрывное вещество отключено от детонатора.')
 wait(slider[0])
 sampSendChat('/do Бомба обезврежена.')
 wait(slider[0])
sampSendChat('/me убрала кусачки в чемодан, открыла сосуд, залила азотом на устройство')
          end
     end)
end


     
    --[[function cmd_gv()
    lua_thread.create(function()
    sampSendChat('/d [ЛСПД] - [Всем]: Занимаю государственную волну вещания.')
    wait(2000)
    sampSendChat('/gov [Полиция ЛС] Уважаемые жители штата!')
    wait(2000)
    sampSendChat('/gov [Полиция ЛС] Проходит собеседование в полицию города Лос - Сантос.')
    wait(2000)
    sampSendChat('/gov [Полиция ЛС] Всем желающим необходимо прибыть в холл ЛСПД')
    wait(2000)
    sampSendChat('/d [ЛСПД] - [Всем]: Освобождаю государственную волну вещания.')
    end)
 end--]]

   
 
function main()
   while not isSampAvailable() do
      wait(100) 
   end
   wait(500)
   sampAddChatMessage(tag.. 'Скрипт успешно загружен!', -1)
   sampRegisterChatCommand(ini.cmd.cmd19,cmd_usemed)
   sampRegisterChatCommand(ini.cmd.cmd12,cmd_su)
   sampRegisterChatCommand('mh', function() WinStateM[0] = not WinStateM[0] end)
   sampRegisterChatCommand('patrol',cmd_patrol)
   sampRegisterChatCommand('устав', function() YstavFraction[0] = not YstavFraction[0] end)
   sampRegisterChatCommand('ук', function() Kodecs[0] = not Kodecs[0] end)
   sampRegisterChatCommand('ак', function() Admin[0] = not Admin[0] end)
   sampRegisterChatCommand(ini.cmd.cmd6,cmd_ticket)
   sampRegisterChatCommand(ini.cmd.cmd13,cmd_pas)
   sampRegisterChatCommand(ini.cmd.cmd14,cmd_frisk)
   sampRegisterChatCommand(ini.cmd.cmd17,cmd_find)
   sampRegisterChatCommand(ini.cmd.cmd3,cmd_incar)
   sampRegisterChatCommand("tk",cmd_tk)
   sampRegisterChatCommand(ini.cmd.cmd18,cmd_pull)
   sampRegisterChatCommand(ini.cmd.cmd15,cmd_gotome)
   sampRegisterChatCommand(ini.cmd.cmd16,cmd_ungotome)
   sampRegisterChatCommand(ini.cmd.cmd1,cmd_cuff)
   sampRegisterChatCommand(ini.cmd.cmd2,cmd_uncuff)
   sampRegisterChatCommand(ini.cmd.cmd7,cmd_mask)
   sampRegisterChatCommand("invite",cmd_invite)
   sampRegisterChatCommand("uninvite",cmd_uninvite)
   sampRegisterChatCommand("giverank",cmd_giverank)
   sampRegisterChatCommand("fwarn",cmd_fwarn)
   sampRegisterChatCommand("unfwarn",cmd_unfwarn)
   sampRegisterChatCommand("dk",cmd_dk)
   sampRegisterChatCommand(ini.cmd.cmd8,cmd_clear)
   sampRegisterChatCommand(ini.cmd.cmd9,cmd_take)
   sampRegisterChatCommand(ini.cmd.cmd11,cmd_arrest)
   sampRegisterChatCommand(ini.cmd.cmd31,cmd_unmask)
   sampRegisterChatCommand(ini.cmd.cmd21,cmd_traf)
   sampRegisterChatCommand(ini.cmd.cmd22,cmd_meg)
   sampRegisterChatCommand(ini.cmd.cmd30,cmd_miranda)
   sampRegisterChatCommand("dok",cmd_dok)
   sampRegisterChatCommand(ini.cmd.cmd23,cmd_unsu)
   sampRegisterChatCommand(ini.cmd.cmd24,cmd_body)
   sampRegisterChatCommand("removebomb",removebomb)
   sampRegisterChatCommand("hr", function() Sobesorg[0] = not Sobesorg[0] end)
   --sampRegisterChatCommand("gv",cmd_gv)
   sampRegisterChatCommand(ini.cmd.cmd4, function (arg)
      local eid = arg:match("(%d+)")
      if eid then
         local nick = sampGetPlayerNickname(eid)
         lua_thread.create(function()
            if ComboPol[0] == 0 then 
               sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
            elseif ComboPol[0] == 1 then 
               sampSendChat(string.format('/me схватив %s',nick..' за руку, скинув с мотоцикла, и заломал руки подозреваемому.'))
               wait(slider[0])
               sampSendChat(string.format('/pull %s',nick))
            elseif ComboPol[0] == 2 then
               sampSendChat(string.format('/me схватив %s',nick..' за руку, скинув с мотоцикла, и заломала руки подозреваемому.'))
               wait(slider[0])
               sampSendChat(string.format('/eject %s',nick))
                end
            end)
        else
            sampAddChatMessage(tag.. ' Используйте: /'..ini.cmd.cmd4..' [ID].', -1)
           end
  end) 
  
    sampRegisterChatCommand(ini.cmd.cmd5,function (arg)
        local eid = arg:match("(%d+)")
        if eid then
            local nick = sampGetPlayerNickname(eid)
            lua_thread.create(function()
               if ComboPol[0] == 0 then 
                  sampAddChatMessage(tag.. ' Для использования RP - отыгровок нужно выбрать пол в главном меню!', -1)
                  elseif ComboPol[0] == 1 then 
                sampSendChat(string.format('/me вышел из автомобиля, открыл дверь, и выкинул %s',nick))
                wait(slider[0])
                sampSendChat(string.format('/eject %s',nick))
                wait(slider[0])
                sampSendChat('/me сел обратно за руль, закрыв дверь.')
                elseif ComboPol[0] == 2 then 
                sampSendChat(string.format('/me вышла из автомобиля, открыла дверь, и выкинула %s',nick))
                wait(slider[0])
                sampSendChat(string.format('/eject %s',nick))
                wait(slider[0])
                sampSendChat('/me села обратно за руль, закрыв дверь.')
                   end
            end)
        else
            sampAddChatMessage(tag.. ' Используйте: /'..ini.cmd.cmd5..' [ID].', -1)
           end
    end) 
repeat wait(0)
until sampIsLocalPlayerSpawned()
    
   if Widghet[0] then
      Vijets[0] = not Vijets[0]
   end
   lua_thread.create(function()
      sampAddChatMessage(tag .. ' Приложение готово к работе. Разработчик: Richard.', -1)
      sampAddChatMessage(tag.. ' Для вызова меню используйте команду - /mh', -1)
      if checkboxnap[0] then
         SpawnMessage.switch()
         wait(5000)
         SpawnMessage.switch()
         wait(1000)
      end
      if piemod[0] then
         showpie[0] = not showpie[0]
      end
   end)
   
      while true do wait(0)
         if checkboxnap[0] then 
            if not DokladWindow then
               for _, police in ipairs(PoliceVehicle) do
                  if isCharInAnyPoliceVehicle(PLAYER_PED) or isCharInModel(PLAYER_PED, police) then
                     if ComboTest[0] == 1 then
                        if isCharInArea3d(PLAYER_PED, 1542, -1623, 12, 1546, -1629, 15, false) then
                           DokladStreet.switch(true)
                           DokladWindow = true 
                        end
                     elseif ComboTest[0] == 2 then
                       if isCharInArea3d(PLAYER_PED, -1699, 684, 24, -1708, 683, 26, false) then
                          DokladStreet.switch(true)
                          DokladWindow = true 
                       end
                     elseif ComboTest[0] == 3 then
                        if isCharInArea3d(PLAYER_PED, 2232, 2457, 10, 2240, 2451, 12, false) then
                           DokladStreet.switch(true)
                           DokladWindow = true 
                        end
                     elseif ComboTest[0] == 4 then
                       if isCharInArea3d(PLAYER_PED, 632, -585, 15, 633, -605, 18,  false) then
                          DokladStreet.switch(true)
                          DokladWindow = true 
                       end
                     elseif ComboTest[0] == 5 then
                       if isCharInArea3d(PLAYER_PED, -2438, 499, 29, -2430, 496, 33, false) then
                          DokladStreet.switch(true)
                          DokladWindow = true 
                       end
                     end
                  end
               end
            end
         end
        
         if checkboxnap[0] then 
            if not PatrolWindow then 
               for _, police in ipairs(PoliceVehicle) do
                  if isCharInAnyPoliceVehicle(PLAYER_PED) or isCharInModel(PLAYER_PED, police) then
                     PatrolPoliceCar.switch(true)
                     PatrolWindow = true
                  end
               end
            end
       end

    local weapons = {
       [1] = {name = 'Кастет', desc = ini.guns.kastet, type = "blade"},
       [2] = {name = 'Клюшка для гольфа', desc = ini.guns.golfclub, type = "blade"},
       [3] = {name = 'Полицейская дубинка', desc = ini.guns.dub, type = "blade"},
       [4] = {name = 'Нож', desc = ini.guns.knife, type = "blade"},
       [5] = {name = 'Бита', desc = ini.guns.bat, type = "blade"},
       [6] = {name = 'Лопата', desc = ini.guns.lapata, type = "blade"},
       [7] = {name = 'Кий', desc = ini.guns.poolcue, type = "blade"},
       [8] = {name = 'Катана', desc = ini.guns.katana, type = "blade"},
       [9] = {name = 'Бензопила', desc = ini.guns.pila, type = "blade"},
       [10] = {name = 'Двухстороний дилдо', desc = ini.guns.dildo, type = "blade"},
       [11] = {name = 'Дилдо', desc = ini.guns.dildo2, type = "blade"},
       [12] = {name = 'Вибратор', desc = ini.guns.vibe, type = "blade"},
       [13] = {name = 'Серебряный Вибратор', desc = ini.guns.vibe2, type = "blade"},
       [14] = {name = 'Букет цветов', desc = ini.guns.flowers, type = "blade"},
       [15] = {name = 'Трость', desc = ini.guns.cane, type = "blade"},
       [16] = {name = 'Граната', desc = ini.guns.grenade, type = "grenade"},
       [17] = {name = 'Слезоточивая граната', desc = ini.guns.gas, type = "grenade"},
       [18] = {name = 'Коктель Молотова', desc = ini.guns.molotov, type = "grenade"},
       [22] = {name = 'Пистолет 9мм', desc = ini.guns.colt, type = "pistol"},
       [23] = {name = 'Пистолет 9мм с глушителем', desc = ini.guns.taser, type = "pistol"},
       [24] = {name = 'Пистолет', desc = ini.guns.deagle, type = "pistol"},
       [25] = {name = 'Дробовик', desc = ini.guns.shotgun, type = "rifle"},
       [26] = {name = 'Обрезы', desc = ini.guns.double, type = "rifle"},
       [27] = {name = 'Боевой дробовик', desc = ini.guns.shotgspa, type = "rifle"},
       [28] = {name = 'Узи', desc = ini.guns.uzi, type = "pistol"},
       [29] = {name = 'MP5', desc = ini.guns.mp5, type = "rifle"},
       [30] = {name = 'AK-47', desc = ini.guns.ak, type = "rifle"},
       [31] = {name = 'M4A1', desc = ini.guns.m4, type = "rifle"},
       [32] = {name = 'Tec-9', desc = ini.guns.tec, type = "pistol"},
       [33] = {name = 'Винтовка', desc = ini.guns.rifle, type = "pistol"},
       [34] = {name = 'Снайперская винтовка', desc = ini.guns.sniper, type = "rifle"},
       [35] = {name = 'РПГ', desc = ini.guns.rocket, type = "bomber"},
       [36] = {name = 'Самонаводящиеся ракеты HS', desc = ini.guns.heatseek, type = "bomber"},
       [37] = {name = 'Огнемет', desc = ini.guns.flame, type = "bomber"},
       [38] = {name = 'Миниган', desc = ini.guns.minigun, type = "bomber"},
       [39] = {name = 'Сумка с тротилом', desc = ini.guns.satchell, type = "bomber"},
       [40] = {name = 'Пульт от бомбы', desc = ini.guns.bomb, type = "bomber"},
       [41] = {name = 'Балончик с краской', desc = ini.guns.sprayicon, type = "blade"},
       [42] = {name = 'Огнетушитель', desc = ini.guns.fireex, type = "blade"},
       [43] = {name = 'Фотоаппарат', desc = ini.guns.camera, type = "blade"},
       [44] = {name = 'Очки ночного видения', desc = ini.guns.irgoggles, type = "blade"},
       [46] = {name = 'Парашут', desc = ini.guns.para, type = "blade"}
	}

local weapons2 = {
	[1] = {name = 'Кастет', desc = ini.guns2.kastet},
	[2] = {name = 'Клюшка для гольфа', desc = ini.guns2.golfclub},
	[3] = {name = 'Полицейская дубинка', desc = ini.guns2.dub},
	[4] = {name = 'Нож', desc = ini.guns2.knife},
	[5] = {name = 'Бита', desc = ini.guns2.bat},
	[6] = {name = 'Лопата', desc = ini.guns2.lapata},
	[7] = {name = 'Кий', desc = ini.guns2.poolcue},
	[8] = {name = 'Катана', desc = ini.guns2.katana},
	[9] = {name = 'Бензопила', desc = ini.guns2.pila},
	[10] = {name = 'Двухстороний дилдо', desc = ini.guns.dildo},
	[11] = {name = 'Дилдо', desc = ini.guns2.dildo2},
	[12] = {name = 'Вибратор', desc = ini.guns2.vibe},
	[13] = {name = 'Серебряный Вибратор', desc = ini.guns2.vibe2},
	[14] = {name = 'Букет цветов', desc = ini.guns2.flowers},
	[15] = {name = 'Трость', desc = ini.guns2.cane}, 
	[16] = {name = 'Граната', desc = ini.guns2.grenade},
	[17] = {name = 'Слезоточивая граната', desc = ini.guns2.gas},
	[18] = {name = 'Коктель Молотова', desc = ini.guns2.molotov},
	[22] = {name = 'Пистолет 9мм', desc = ini.guns2.colt},
	[23] = {name = 'Пистолет 9mm с глушителем', desc = ini.guns2.taser},
	[24] = {name = 'Пистолет', desc = ini.guns2.deagle},
	[25] = {name = 'Дробовик', desc = ini.guns2.shotgun},
	[26] = {name = 'Обрезы', desc = ini.guns2.double},
	[27] = {name = 'Боевой дробовик', desc = ini.guns2.shotgspa},
	[28] = {name = 'Узи', desc = ini.guns2.uzi},
	[29] = {name = 'MP5', desc = ini.guns2.mp5},
	[30] = {name = 'AK-47', desc = ini.guns2.ak},
	[31] = {name = 'M4A1', desc = ini.guns2.m4},
	[32] = {name = 'Tec-9', desc = ini.guns2.tec},
	[33] = {name = 'Винтовка', desc = ini.guns2.rifle},
	[34] = {name = 'Снайперская винтовка', desc = ini.guns2.sniper},
	[35] = {name = 'РПГ', desc = ini.guns2.rocket},
	[36] = {name = 'Самонаводящиеся ракеты HS', desc = ini.guns2.heatseek},
	[37] = {name = 'Огнемет', desc = ini.guns2.flame},
	[38] = {name = 'Миниган', desc = ini.guns2.minigun},
	[39] = {name = 'Сумка с тротилом', desc = ini.guns2.satchell},
	[40] = {name = 'Пульт от бомбы', desc = ini.guns2.bomb},
	[41] = {name = 'Балончик с краской', desc = ini.guns2.sprayicon},
	[42] = {name = 'Огнетушитель', desc = ini.guns2.fireex},
	[43] = {name = 'Фотоаппарат', desc = ini.guns2.camera},
	[44] = {name = 'Очки ночного видения', desc = ini.guns2.irgoggles},
	[46] = {name = 'Парашут', desc = ini.guns2.para}
	}
	if autorp[0] then
	   local currentWeaponId = getCurrentCharWeapon(PLAYER_PED)
	   if currentWeaponId ~= prevWeaponId then
	      if weapons2[prevWeaponId] then
	         sampSendChat(weapons2[prevWeaponId].desc)
	         wait(slider2[0])
	      end
	         if weapons [currentWeaponId] then
	            sampSendChat(weapons[currentWeaponId].desc)
	         end
	            prevWeaponId = currentWeaponId
	   end
	end
      end
end

  
      
      
function doklad()
        while true do
           local x, y, z = getCharCoordinates(PLAYER_PED)
        end
end

    

    function sampev.onSendTakeDamage(playerId, damage, weapon, bodypart)   
       local timer_last_damaged = 60
       local duration_window_damages = 60
       if checkboxnap[0] then
          if not damag.switch() then 
             timer_last_damaged = os.clock()
          end
       end
    end
    
   
 
 imgui.OnInitialize(function()
    decor()
    themes[selected_theme[0]+1].change()
    end)

    function decor()
       imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5) -- отступы окон
       imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5) -- заголовок окна
       imgui.GetStyle().FramePadding = imgui.ImVec2(5, 5)
       imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 4)
       imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(2, 2)
       imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(0, 0)
       imgui.GetStyle().IndentSpacing = 0
       imgui.GetStyle().ScrollbarSize = 23 -- размер скролла (ползунка)
       imgui.GetStyle().GrabMinSize = 15

    --==[ BORDER ]==--
      imgui.GetStyle().WindowBorderSize = 0
      imgui.GetStyle().ChildBorderSize = 2
      imgui.GetStyle().PopupBorderSize = 0
      imgui.GetStyle().FrameBorderSize = 0 --обводка кнопок, импутов, чекбоксов и тп
      imgui.GetStyle().TabBorderSize = 0

    --==[ ROUNDING ]==--
      imgui.GetStyle().WindowRounding = 4 --  края окон
      imgui.GetStyle().ChildRounding = 4 -- края begin child 
      imgui.GetStyle().FrameRounding = 4 -- края кнопок
      imgui.GetStyle().PopupRounding = 0
      imgui.GetStyle().ScrollbarRounding = 1 -- края ползунка
      imgui.GetStyle().GrabRounding = 1
      imgui.GetStyle().TabRounding = 8
    

   if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/ak.png') then 
      imhandle = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/ak.png')
   end
      if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/doj.png') then 
         imhandle1 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/doj.png')
      end
         if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/yk.png') then 
            imhandle2 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/yk.png') 
         end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/ystav.png') then 
               imhandle3 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/ystav.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/ten.png') then 
               imhandle4 = imgui.CreateTextureFromFile(getWorkingDirectory() ..'/resource/MVDHelper/hud/ten.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/biglogo.png') then 
               imhandle5  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/biglogo.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/fist.png') then 
               imhandle6  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/fist.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/M4icon.png') then 
               imhandle7  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/M4icon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/desert_eagleicon.png') then 
               imhandle8  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/desert_eagleicon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/chromegunicon.png') then 
               imhandle9  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/chromegunicon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/silencedicon.png') then 
               imhandle10  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/silencedicon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/ak47icon.png') then 
               imhandle11  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/ak47icon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/mp5lngicon.png') then
               imhandle12  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/mp5lngicon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/nitestickicon.png') then 
               imhandle13  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/nitestickicon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/TearGasicon.png') then 
               imhandle14  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/TearGasicon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/sawnofficon.png') then 
               imhandle15  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/sawnofficon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/SNIPERicon.png') then 
               imhandle16  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/SNIPERicon.png') 
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/micro_uziicon.png') then 
               imhandle17  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/micro_uziicon.png')
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/cuntgunicon.png') then 
               imhandle18  = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/cuntgunicon.png')
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/1.png') then 
               imhandle19 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/1.png')
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/2.png') then 
               imhandle20 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/2.png')
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/3.png') then 
               imhandle21 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/3.png')
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/4.png') then 
               imhandle22 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/4.png')
            end
            if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/5.png') then 
               imhandle23 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/5.png')
            end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/6.png') then 
        imhandle24 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/6.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/7.png') then 
        imhandle25 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/7.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/8.png') then 
        imhandle26 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/8.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/9.png') then 
        imhandle27 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/9.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/10.png') then 
        imhandle28 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/10.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/11.png') then 
        imhandle29 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/11.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/12.png') then 
        imhandle30 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/12.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/13.png') then 
        imhandle31 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/13.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/14.png') then 
        imhandle32 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/14.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/nap/15.png') then 
        imhandle33 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/nap/15.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/BRASSKNUCKLEicon.png') then 
        imhandle34 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/BRASSKNUCKLEicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/baticon.png') then 
        imhandle35 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/baticon.png')
        end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/bombicon.png') then 
        imhandle36 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/bombicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/Cameraicon.png') then 
        imhandle37 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/Cameraicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/golfclubicon.png') then 
        imhandle38 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/golfclubicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/colt45icon.png') then 
        imhandle39 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/colt45icon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/fire_exicon.png') then 
        imhandle40 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/fire_exicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/flameicon.png') then 
        imhandle41 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/flameicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/floweraicon.png') then 
        imhandle42 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/floweraicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/chnsawicon.png') then 
        imhandle43 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/chnsawicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/grenadeicon.png') then 
        imhandle44 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/grenadeicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/gun_caneicon.png') then 
        imhandle45 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/gun_caneicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/gun_paraicon.png') then 
        imhandle46 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/gun_paraicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/gun_paraicon.png') then 
        imhandle47 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/gun_paraicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/gun_dildo1icon.png') then 
        imhandle48 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/gun_dildo1icon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/gun_dildo2icon.png') then 
        imhandle49 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/gun_dildo2icon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/gun_vibe1icon.png') then 
        imhandle50 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/gun_vibe1icon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/gun_vibe2icon.png') then 
        imhandle51 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/gun_vibe2icon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/heatseekicon.png') then 
        imhandle52 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/heatseekicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/irgogglesicon.png') then 
        imhandle53 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/irgogglesicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/katanaicon.png') then 
        imhandle54 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/katanaicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/knifecuricon.png') then 
        imhandle55 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/knifecuricon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/minigunicon.png') then 
        imhandle56 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/minigunicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/molotovicon.png') then 
        imhandle57 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/molotovicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/poolcueicon.png') then 
        imhandle58 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/poolcueicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/rocketlaicon.png') then 
        imhandle59 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/rocketlaicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/satchelicon.png') then 
        imhandle60 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/satchelicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/shotgspaicon.png') then 
        imhandle61 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/shotgspaicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/shovelicon.png') then 
        imhandle62 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/shovelicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/tec9icon.png') then 
        imhandle63 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/tec9icon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/gunicon/SPRAYCANicon.png') then 
        imhandle64 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/gunicon/SPRAYCANicon.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/sprav-info.png') then 
        imhandle65 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/sprav-info.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/rab-instr.png') then 
        imhandle66 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/rab-instr.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/patrol.png') then 
        imhandle67 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/patrol.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/yvr.png') then 
        imhandle68 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/yvr.png')
end
if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/yvsh.png') then 
        imhandle69 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/yvsh.png')
end
       if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/notes.png') then 
        imhandle70 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/notes.png')
        end
        if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/piemenu.png') then 
        piemenu = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/piemenu.png')
        end
        if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/org_setting.png') then 
        org = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/org_setting.png')
        end
        if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/hr.png') then 
        hr = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/hr.png')
        end
        if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/v_nav.png') then 
        nav = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/v_nav.png')
        end
        if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/v_obl.png') then 
        obl = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/v_obl.png')
        end
        if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/hud/v_oth.png') then 
        oth = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/hud/v_oth.png')
        end
        if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/Information/UpdateBeta.png') then 
        upd = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/Information/UpdateBeta.png')
        end
        if doesFileExist(getWorkingDirectory()..'/resource/MVDHelper/Information/updateBETA0.9.png') then 
        update09 = imgui.CreateTextureFromFile(getWorkingDirectory() .. '/resource/MVDHelper/Information/updateBETA0.9.png')
        end
        imgui.GetIO().IniFilename = nil
        local FONTS = imgui.GetIO().Fonts
        local STYLE = imgui.GetStyle()
        local COLOR = STYLE.Colors
        local VEC4, c = imgui.ImVec4, imgui.Col
        font = { B = {}, R = {} }
        local config = imgui.ImFontConfig()
        config.MergeMode = true
        config.PixelSnapH = true
        iconRanges = imgui.new.ImWchar[3](faicons.min_range, faicons.max_range, 0)
        imgui.GetIO().Fonts:AddFontFromMemoryCompressedBase85TTF(faicons.get_font_data_base85('solid'), 30, config, iconRanges)
end


function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4
    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end
    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImVec4(r/255, g/255, b/255, a/255)
    end
    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end
    render_text(text)
end


function onScriptTerminate(script, quitGame)
    if script == thisScript() then
        inicfg.save(config, 'settings')
    end
end


function buttonupdate(json_url, prefix)
	local dlstatus = require('moonloader').download_status
	local json = getWorkingDirectory() .. '/update.json'
	if doesFileExist(json) then os.remove(json) end
	downloadUrlToFile(json_url, json,
	function(id, status, p1, p2)
		if status == dlstatus.STATUSEX_ENDDOWNLOAD then
			if doesFileExist(json) then
				local f = io.open(json, 'r')
				if f then
					local info = decodeJson(f:read('*a'))
					updateversion = info.version
					f:close()
					os.remove(json)
					if updateversion ~= thisScript().version then
						sampAddChatMessage((tag..' Обнаружено обновление. v'..updateversion), -1)
						sampAddChatMessage(tag..' Для обновления приложения, перейдите в главное меню и нажмите ”Обновить“', -1)
					else
						update = false
						sampAddChatMessage(tag.. ' Обновления не найдены.', -1)
						print('v'..thisScript().version..': Обновление не требуется.')
					end
				end
			else
				print('v'..thisScript().version..': Не могу проверить обновление.')
				update = false
			end
		end
	end)
end
 
 
	
