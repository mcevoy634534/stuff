getfenv().LPH_NO_VIRTUALIZE = function(f) return f end;
-- Fonts
if isfile("menu_font.font") then
    delfile("menu_font.font");
end;

-- Setup
do
    do -- Macros
        if not LPH_OBFUSCATED then
            LPH_JIT = function(...) 
                return ...;
            end;
            LPH_JIT_MAX = function(...) 
                return ...;
            end;
            LPH_NO_VIRTUALIZE = function(...) 
                return ...;
            end;
            LPH_NO_UPVALUES = function(f) 
                return(function(...) 
                    return f(...);
                end);
            end;
            LPH_ENCSTR = function(...) 
                return ...; 
            end;
            LPH_ENCNUM = function(...) 
                return ...; 
            end;
            LPH_CRASH = function() 
                return print(Traceback());
            end;
            --
            LRM_LinkedDiscordID = "1041164903332974682";
            LRM_TotalExecutions = 0;
            LRM_SecondsLeft = 0;
            LRM_IsUserPremium = false;
            LRM_Scripttext = "Universal";
        end;
    end;
    --
    do -- Files
        if not isfolder("Panichook") then
            makefolder("Panichook")
        end;
        --
        if not isfolder("Panichook/Configs") then
            makefolder("Panichook/Configs");
        end;
        --
        if not isfolder("Panichook/Luas") then
            makefolder("Panichook/Luas");
        end;
        --
        if not isfolder("Panichook/Debug") then
            makefolder("Panichook/Debug");
            writefile("Panichook/Debug/Errors.txt", "");
        end;
    end;
    --
    do -- Enviorment Setup
        local function SetupEnviorment(Table)
            local Environment = getgenv();
            for Index, Value in pairs(Table) do
                Environment[Index] = Value;
            end;
            --
            return Environment;
        end;
        --
        SetupEnviorment({
            ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage")),
            UserInputService = cloneref(game:GetService("UserInputService")),
            TeleportService = cloneref(game:GetService("TeleportService")),
            HttpService = cloneref(game:GetService("HttpService")),
            RunService = cloneref(game:GetService("RunService")),
            Workspace = cloneref(game:GetService("Workspace")),
            Lighting = cloneref(game:GetService("Lighting")),
            CoreGui = cloneref(game:GetService("CoreGui")),
            Players = cloneref(game:GetService("Players")),
            Stats = cloneref(game:GetService("Stats")),
            ContentProvider = cloneref(game:GetService("ContentProvider")),
            TweenService = cloneref(game:GetService("TweenService")),
            VirtualInputManager = cloneref(game:GetService("VirtualInputManager")),
            LogService = cloneref(game:GetService("LogService")),
            Stats = cloneref(game:GetService("Stats")),

            -- Custom Functions
            Floor = function(Num) return Num - Num % 1; end,
            Concat = function(t, sep, i, j) sep = sep or ""; i = i or 1; j = j or #t; local ConcatReturn = ""; for _i = i, #t do  if _i == #t then ConcatReturn = ConcatReturn .. t[_i] else ConcatReturn = ConcatReturn .. t[_i] .. sep; end; end; return ConcatReturn; end,
            Insert = function(t, v) t[#t + 1] = v; end,
            
            -- Debug Menu
            GetConstants = debug.getconstants,
            GetRegistry = debug.getregistry,
            GetUpvalues = debug.getupvalues,
            GetConstant = debug.getconstant,
            SetConstant = debug.setconstant,
            GetUpvalue = debug.getupvalue,
            ValidLevel = debug.validlevel,
            LoadModule = debug.loadmodule,
            SetUpvalue = debug.setupvalue,
            GetProtos = debug.getprotos,
            GetLocals = debug.getlocals,
            Traceback = debug.traceback,
            SetStack = debug.setstack,
            GetLocal = debug.getlocal,
            DumpHeap = debug.dumpheap,
            GetProto = debug.getproto,
            SetLocal = debug.setlocal,
            GetStack = debug.getstack,
            GetFenv = debug.getfenv,
            GetInfo = debug.getinfo,
            Info = debug.info,

            -- Math Menu
            RandomSeed = math.randomseed,
            Random = math.random,
            Frexp = math.frexp,
            Atan2 = math.atan2,
            Log10 = math.log10,
            Noise = math.noise,
            Round = math.round,
            Ldexp = math.ldexp,
            Clamp = math.clamp,
            Sinh = math.sinh,
            Sign = math.sign,
            Asin = math.asin,
            Acos = math.acos,
            Fmod = math.fmod,
            Huge = math.huge,
            Tanh = math.tanh,
            Sqrt = math.sqrt,
            Atan = math.atan,
            Modf = math.modf,
            Ceil = math.ceil,
            Cosh = math.cosh,
            Deg = math.deg,
            Min = math.min,
            Log = math.log,
            Cos = math.cos,
            Exp = math.exp,
            Max = math.max,
            Rad = math.rad,
            Abs = math.abs,
            Pow = math.pow,
            Sin = math.sin,
            Tan = math.tan,
            Pi = math.pi,  
            
            -- String Menu
            PackSize = string.packsize,
            Reverse = string.reverse,
            Unpack = string.unpack,
            Gmatch = string.gmatch,
            Format = string.format,
            Lower = string.lower,
            Split = string.split,
            Match = string.match,
            Upper = string.upper,
            Byte = string.byte,
            Char = string.char,
            Pack = string.pack,
            Gsub = string.gsub,
            Find = string.find,
            Rep = string.rep,
            Sub = string.sub,
            Len = string.len,

            -- Table Menu
            Unpack = table.unpack,
            Move = table.move,
            Pack = table.pack,
            Sort = table.sort,
            Find = table.find,
            Maxn = table.maxn,
            Remove = table.remove,
            Sort = table.sort,
            
            -- Coroutines Menu
            Resume = coroutine.resume,
            Running = coroutine.running,
            Status = coroutine.status,
            Wrap = coroutine.wrap,
            Yield = coroutine.yield,
            Create = coroutine.create,
            Isyieldable = coroutine.isyieldable,

            -- Task Menu
            Delay = task.delay,
            Wait = task.wait,
            Spawn = task.spawn,
            Defer = task.defer,
            Sleep = task.sleep,

            -- Render
            CreateRenderObject = function(Obj) return Drawing.new(Obj) end,
            DestroyRenderObject = function(Obj) if Obj then Obj:Remove() end; end,
            GetRenderProperty = function(Obj, Prop) return Obj[Prop] end,
            SetRenderProperty = function(Obj, Prop, Value) Obj[Prop] = Value; end,
        });
    end;
    --
    do -- Loader
        local SecureRequest = function(URI)
            local Url = URI.Url
            URI.Url = nil
            local Method = URI.Method
            URI.Method = nil
            local Headers = URI.Headers
            URI.Headers = nil
            local Cookies = URI.Cookies
            URI.Cookies = nil
            local Body = URI.Body
            URI.Body = nil
            
            -- Variables
            local RequestUrlInitialized = false;
            local RequestMethodInitialized = false;
            local RequestHeadersInitialized = false;
            local RequestCookiesInitialized = false;
            local RequestBodyInitialized = false;
            local RequestShouldBeTerminated = false;

            local SecureData = setmetatable({}, {
                __index = function(Table, Index)
                    if RequestShouldBeTerminated == true then
                        return;
                    end;
                    --
                    if Index == "Url" then
                        if RequestUrlInitialized == false then
                            RequestUrlInitialized = true;
                            return Url;
                        end;
                        RequestShouldBeTerminated = true;
                        --
                        return LPH_CRASH()                        
                    end;
                    --
                    if Index == "Method" then
                        if RequestMethodInitialized == false then
                            RequestMethodInitialized = true;
                            return Method;
                        end;
                        RequestShouldBeTerminated = true;
                        --
                        return LPH_CRASH()
                    end;
                    --
                    if Index == "Headers" then
                        if RequestHeadersInitialized == false then
                            RequestHeadersInitialized = true;
                            return Headers;
                        end;
                        RequestShouldBeTerminated = true;
                        --
                        return LPH_CRASH()
                    end;
                    --
                    if Index == "Cookies" then
                        if RequestCookiesInitialized == false then
                            RequestCookiesInitialized = true;
                            return Cookies;
                        end;
                        RequestShouldBeTerminated = true;
                        --
                        return LPH_CRASH()
                    end;
                    --
                    if Index == "Body" then
                        if RequestBodyInitialized == false then
                            RequestBodyInitialized = true;
                            return Body;
                        end;
                        RequestShouldBeTerminated = true;
                        --
                        return LPH_CRASH()
                    end;
                    --
                    RequestShouldBeTerminated = true;
                end;
                __newindex = function()
                    return LPH_CRASH()
                end,
                __call = function()
                    return LPH_CRASH()
                end,
                __concat = function()
                    return LPH_CRASH()
                end,
                __unm = function()
                    return LPH_CRASH()
                end,
                __add = function()
                    return LPH_CRASH()
                end,
                __sub = function()
                    return LPH_CRASH()
                end,
                __mul = function()
                    return LPH_CRASH()
                end,
                __div = function()
                    return LPH_CRASH()
                end,
                __mod = function()
                    return LPH_CRASH()
                end,
                __pow = function()
                    return LPH_CRASH()
                end,
                __tostring = function()
                    return LPH_CRASH()
                end,
                __metatable = function()
                    return LPH_CRASH()
                end,
                __eq = function()
                    return LPH_CRASH()
                end,
                __lt = function()
                    return LPH_CRASH()
                end,
                __le = function()
                    return LPH_CRASH()
                end
            });
            return request(SecureData);
        end;
        --
        local SecureRandom = function()
            local Structure = {};
            function Structure:New()
                local Structure = {};
                local Structure1 = {};
                function Structure1:new()
                    local d = {};
                    function d:serialize(e)
                        local f = {}
                        for g in e:gmatch(".") do
                            Insert(f, string.byte(g));
                        end;
                        return f;
                    end;
                    function d:deserialize(f)
                        local h = {}
                        for i, j in next, f do
                            Insert(h, string.char(j));
                        end;
                        return Concat(h);
                    end;
                    return d;
                end;
                --
                local function k(l)
                    l = l or 12
                    local function m()
                        return tostring({}):match("table%p 0x(.+)");
                    end;
                    local n = "";
                    repeat
                        n = n .. m();
                    until #n >= l;
                    return n:sub(1, l);
                end;

                -- Random
                function Structure:Number(p, q)
                    local n = k(q);
                    local r = Structure1:new():serialize(n);
                    local s = 0;
                    table.foreach(
                        r,
                        function(t, u)
                            s = s + u
                        end
                    )
                    return s % (q - p) + p;
                end;
                --
                function Structure:String(l)
                    l = l or 8;
                    local f = {};
                    do
                        for i = string.byte("a"), string.byte("z") do
                            Insert(f, string.char(i));
                        end;
                        for i = string.byte("A"), string.byte("Z") do
                            Insert(f, string.char(i));
                        end;
                        for i = string.byte("1"), string.byte("9") do
                            Insert(f, string.char(i));
                        end;
                    end;
                    local h = {};
                    for i = 1, l do
                        Insert(h, f[Structure:Number(1, #f)]);
                    end;
                    return Concat(h);
                end;
                return Structure;
            end;
            return Structure;
        end;
        --
        do -- Main
            local LocalPlayer = Players.LocalPlayer;
            local Mouse = LocalPlayer:GetMouse();
            local CurrentCamera = workspace.CurrentCamera; -- workspace.game_assets.Camera
            local ScreenSize = CurrentCamera.ViewportSize;
            local StartGravity = workspace.Gravity;
            local FindFirstAncestor = workspace.FindFirstAncestor 
            local FindFirstAncestorOfClass = workspace.FindFirstAncestorOfClass
            local FindFirstChild = workspace.FindFirstChild;
            local FindFirstChildOfClass = workspace.FindFirstChildOfClass;
            local WorldToViewportPoint = CurrentCamera.WorldToViewportPoint;
            local WorldToScreenPoint = CurrentCamera.WorldToScreenPoint;
            local PointToObjectSpace = CFrame.identity.PointToObjectSpace;
            local PointToWorldSpace = CFrame.identity.PointToWorldSpace;
            local GetDescendants = game.GetDescendants;
            local IsDescendantOf = game.IsDescendantOf;
            local GetChildren = game.GetChildren;
            local WaitForChild = game.WaitForChild;
            local GetPlayers = Players.GetPlayers;
            local Raycast = workspace.Raycast;
            local ViewportPointToRay = CurrentCamera.ViewportPointToRay;
            local IsFriendsWith = LocalPlayer.IsFriendsWith;
            local OldFieldofView = CurrentCamera.FieldOfView;
            local RaycastParam = RaycastParams.new();
            RaycastParam.FilterType = Enum.RaycastFilterType.Blacklist;
            RaycastParam.FilterDescendantsInstances = {CurrentCamera, game.Players.LocalPlayer.Character};
            RaycastParam.IgnoreWater = true;

            -- Libraries
            local Tween, Visuals, Math, Physics, Chat, Loops, Drawings, Hooks, Character, Menu, Panichook, mySQL = {
            }, {
                Cache = {};
            }, {
                Measurements = {
                    Meters = {"m", 3.5714285714};
                    Studs = {"s", 1};
                    Centimeters = {"cm", 3.5714285714};
                    Decimeters = {"dm", 10};
                    Feet = {"ft", 3.2808};
                    Inches = {"in", 39.3701};
                    Kilometers = {"km", 0.001};
                    Miles = {"mi", 0.000621371};
                    Yards = {"yd", 1.09361};
                    Millimeters = {"mm", 1000};
                    Nanometers = {"nm", 1000000000};
                    ["Nau miles"] = {"nmi", 0.00053996};
                    Micrometers = {"um", 1000000};
                    Fathom = {"f", 0.546807};
                    Rods = {"r", 0.198839};
                    Leagues = {"l", 0.00020712};
                    Furlongs = {"fur", 0.00497097};
                    ["Astm units"] = {"au", 0.000000000007};
                    ["Light years"] = {"ly", 0.00000000000000010570234};
                    Parsecs = {"pc", 0.00000000000000003240779};
                };
            }, {
            }, {
            }, {
            }, {
            }, {
            }, {
            }, {
                Open = true;
                Relations = {};
                Pages = {};
                InnerTabs = {};
                Sections = {};
                Flags = {};
                UnNamedFlags = 0;
                Objects = {};
                ThemeObjects = { Objects = {}; Outlines = {} };
                Text = {};
                Drawings = {};
                Visible = {};
                Utility = {};
                VisValues = {};
                Tween = loadstring(SecureRequest({Url = "https://raw.githubusercontent.com/zeroday1337x/panichook/main/tween.lua"}).Body)();
                Ignores = {
                    Flags = {};
                    Dropdowns = {};
                    Icons = {};
                    Pickers = {};
                };
                Themes = {
                    ["Default"] = {
                        ["Accent"] = Color3.fromRGB(93, 62, 152);
                        ["Border1"] = Color3.fromRGB(0, 0, 0);
                        ["Border2"] = Color3.fromRGB(50, 50, 50);
                        ["Light Contrast"] = Color3.fromRGB(30, 30, 30);
                        ["Dark Contrast"] = Color3.fromRGB(20, 20, 20);
                        ["Text"] = Color3.fromRGB(255, 255, 255);
                        ["Dark Text"] = Color3.fromRGB(143, 143, 143);
                        ["Risky"] = Color3.fromRGB(255, 244, 93);
                    };
                    ["Onetap"] = {
                        ["Accent"] = Color3.fromHex("dda85d");
                        ["Border1"] = Color3.fromHex("000000");
                        ["Border2"] = Color3.fromHex("4e5158");
                        ["Light Contrast"] = Color3.fromHex("2c3037");
                        ["Dark Contrast"] = Color3.fromHex("1f2125");
                        ["Text"] = Color3.fromHex("d6d9e0");
                        ["Dark Text"] = Color3.fromHex("afafaf");
                        ["Risky"] = Color3.fromHex(255, 244, 93);
                    };
                    ["Dracula"] = {
                        ["Accent"] = Color3.fromHex("9a81b3");
                        ["Border1"] = Color3.fromHex("202126");
                        ["Border2"] = Color3.fromHex("3c384d");
                        ["Light Contrast"] = Color3.fromHex("2a2c38");
                        ["Dark Contrast"] = Color3.fromHex("252730");
                        ["Text"] = Color3.fromHex("b4b4b8");
                        ["Dark Text"] = Color3.fromHex("88888b");
                        ["Risky"] = Color3.fromHex(255, 244, 93);
                    };
                    ["Interwebz"] = {
                        ["Accent"] = Color3.fromHex("c9654b");
                        ["Border1"] = Color3.fromHex("1a1a1a");
                        ["Border2"] = Color3.fromHex("40364f");
                        ["Light Contrast"] = Color3.fromHex("291f38");
                        ["Dark Contrast"] = Color3.fromHex("1f162b");
                        ["Text"] = Color3.fromHex("fcfcfc");
                        ["Dark Text"] = Color3.fromHex("a8a8a8");
                        ["Risky"] = Color3.fromHex(255, 244, 93);
                    }; 
                    ["Abyss"] = {
                        ["Accent"] = Color3.fromHex("8c87b4");
                        ["Border1"] = Color3.fromHex("0a0a0a");
                        ["Border2"] = Color3.fromHex("2d2d2d");
                        ["Light Contrast"] = Color3.fromHex("1e1e1e");
                        ["Dark Contrast"] = Color3.fromHex("141414");
                        ["Text"] = Color3.fromHex("ffffff");
                        ["Dark Text"] = Color3.fromHex("afafaf");
                        ["Risky"] = Color3.fromHex(255, 244, 93);
                    };
                    ["Entropy"] = {
                        ["Accent"] = Color3.fromHex("81bbe9");
                        ["Border1"] = Color3.fromHex("0a0a0a");
                        ["Border2"] = Color3.fromHex("4c4a52");
                        ["Light Contrast"] = Color3.fromHex("3d3a43");
                        ["Dark Contrast"] = Color3.fromHex("302f37");
                        ["Text"] = Color3.fromHex("dcdcdc");
                        ["Dark Text"] = Color3.fromHex("afafaf");
                        ["Risky"] = Color3.fromHex(255, 244, 93);
                    }; 
                };
                Theme = {
                    ["Accent"] = Color3.fromRGB(93, 62, 152);
                    ["Border1"] = Color3.fromRGB(0, 0, 0);
                    ["Border2"] = Color3.fromRGB(50, 50, 50);
                    ["Light Contrast"] = Color3.fromRGB(30, 30, 30);
                    ["Dark Contrast"] = Color3.fromRGB(20, 20, 20);
                    ["Text"] = Color3.fromRGB(255, 255, 255);
                    ["Dark Text"] = Color3.fromRGB(143, 143, 143);
                    ["Risky"] = Color3.fromRGB(255, 244, 93);
                };
                AllowedCharacters = {
                    [1] = " ";
                    [2] = "!";
                    [3] = '"';
                    [4] = "#";
                    [5] = "$";
                    [6] = "%";
                    [7] = "&";
                    [8] = "'";
                    [9] = "(";
                    [10] = ")";
                    [11] = "*";
                    [12] = "+";
                    [13] = ";";
                    [14] = "-";
                    [15] = ".";
                    [16] = "/";
                    [17] = "0";
                    [18] = "1";
                    [19] = "2";
                    [20] = "3";
                    [21] = "4";
                    [22] = "5";
                    [23] = "6";
                    [24] = "7";
                    [25] = "8";
                    [26] = "9";
                    [27] = ":";
                    [28] = ";";
                    [29] = "<";
                    [30] = "=";
                    [31] = ">";
                    [32] = "?";
                    [33] = "@";
                    [34] = "A";
                    [35] = "B";
                    [36] = "C";
                    [37] = "D";
                    [38] = "E";
                    [39] = "F";
                    [40] = "G";
                    [41] = "H";
                    [42] = "I";
                    [43] = "J";
                    [44] = "K";
                    [45] = "L";
                    [46] = "M";
                    [47] = "N";
                    [48] = "O";
                    [49] = "P";
                    [50] = "Q";
                    [51] = "R";
                    [52] = "S";
                    [53] = "T";
                    [54] = "U";
                    [55] = "V";
                    [56] = "W";
                    [57] = "X";
                    [58] = "Y";
                    [59] = "Z";
                    [60] = "[";
                    [61] = "\\";
                    [62] = "]";
                    [63] = "^";
                    [64] = "_";
                    [65] = "`";
                    [66] = "a";
                    [67] = "b";
                    [68] = "c";
                    [69] = "d";
                    [70] = "e";
                    [71] = "f";
                    [72] = "g";
                    [73] = "h";
                    [74] = "i";
                    [75] = "j";
                    [76] = "k";
                    [77] = "l";
                    [78] = "m";
                    [79] = "n";
                    [80] = "o";
                    [81] = "p";
                    [82] = "q";
                    [83] = "r";
                    [84] = "s";
                    [85] = "t";
                    [86] = "u";
                    [87] = "v";
                    [88] = "w";
                    [89] = "x";
                    [90] = "y";
                    [91] = "z";
                    [92] = "{";
                    [93] = "|";
                    [94] = "}";
                    [95] = "~";
                };
                ShiftCharacters = {
                    ["1"] = "!";
                    ["2"] = "@";
                    ["3"] = "#";
                    ["4"] = "$";
                    ["5"] = "%";
                    ["6"] = "^";
                    ["7"] = "&";
                    ["8"] = "*";
                    ["9"] = "(";
                    ["0"] = ")";
                    ["-"] = "_";
                    ["="] = "+";
                    ["["] = "{";
                    ["\\"] = "|";
                    [";"] = ":";
                    ["'"] = '"';
                    [";"] = "<";
                    ["."] = ">";
                    ["/"] = "?";
                    ["`"] = "~";
                };
                Keys = {
                    [Enum.KeyCode.LeftShift] = "LS";
                    [Enum.KeyCode.RightShift] = "RS";
                    [Enum.KeyCode.LeftControl] = "LC";
                    [Enum.KeyCode.RightControl] = "RC";
                    [Enum.KeyCode.LeftAlt] = "LA";
                    [Enum.KeyCode.RightAlt] = "RA";
                    [Enum.KeyCode.CapsLock] = "CAPS";
                    [Enum.KeyCode.One] = "1";
                    [Enum.KeyCode.Two] = "2";
                    [Enum.KeyCode.Three] = "3";
                    [Enum.KeyCode.Four] = "4";
                    [Enum.KeyCode.Five] = "5";
                    [Enum.KeyCode.Six] = "6";
                    [Enum.KeyCode.Seven] = "7";
                    [Enum.KeyCode.Eight] = "8";
                    [Enum.KeyCode.Nine] = "9";
                    [Enum.KeyCode.Zero] = "0";
                    [Enum.KeyCode.KeypadOne] = "Num1";
                    [Enum.KeyCode.KeypadTwo] = "Num2";
                    [Enum.KeyCode.KeypadThree] = "Num3";
                    [Enum.KeyCode.KeypadFour] = "Num4";
                    [Enum.KeyCode.KeypadFive] = "Num5";
                    [Enum.KeyCode.KeypadSix] = "Num6";
                    [Enum.KeyCode.KeypadSeven] = "Num7";
                    [Enum.KeyCode.KeypadEight] = "Num8";
                    [Enum.KeyCode.KeypadNine] = "Num9";
                    [Enum.KeyCode.KeypadZero] = "Num0";
                    [Enum.KeyCode.Minus] = "-";
                    [Enum.KeyCode.Equals] = "=";
                    [Enum.KeyCode.Tilde] = "~";
                    [Enum.KeyCode.LeftBracket] = "[";
                    [Enum.KeyCode.RightBracket] = "]";
                    [Enum.KeyCode.RightParenthesis] = ")";
                    [Enum.KeyCode.LeftParenthesis] = "(";
                    [Enum.KeyCode.Semicolon] = ";";
                    [Enum.KeyCode.Quote] = "'";
                    [Enum.KeyCode.BackSlash] = "\\";
                    [Enum.KeyCode.Comma] = ";";
                    [Enum.KeyCode.Period] = ".";
                    [Enum.KeyCode.Slash] = "/";
                    [Enum.KeyCode.Asterisk] = "*";
                    [Enum.KeyCode.Plus] = "+";
                    [Enum.KeyCode.Period] = ".";
                    [Enum.KeyCode.Backquote] = "`";
                    [Enum.UserInputType.MouseButton1] = "MB1";
                    [Enum.UserInputType.MouseButton2] = "MB2";
                    [Enum.UserInputType.MouseButton3] = "MB3";
                };
            }, {
                Locals = {
                    Chatspam = tick();
                    CurrentSilentTarget = nil;
                    CurrentSilentName = nil;
                    CurrentId = nil;
                    PrimaryPart = nil;
                    Drawings = {};
                    Hitmarkers = {};
                    Tracers = {};
                    Lighting = {
                        Changed = {};
                        Current = {};
                        Disconnected = {};
                    };
                    RainSounds = {
                        ["Default"] = "1516791621";
                        ["Rain On Leaves"] = "9112854440";
                        ["Rain On Water"] = "9112854625";
                        ["Light Raining"] = "424548883";
                        ["Rolling Thunder and rain"] = "4305545740";
                        ["Big Fucking impact"] = "9120019295";
                    };
                    Textures = {
                        ["Web"] = "rbxassetid://301464986",
                        ["Swirl"] = "rbxassetid://8133639623",
                        ["Checkers"] = "rbxassetid://5790215150",
                        ["CandyCane"] = "rbxassetid://6853532738",
                        ["Dots"] = "rbxassetid://5830615971",
                        ["Scanning"] = "rbxassetid://5843010904",
                        ["Bubbles"] = "rbxassetid://1461576423",
                        ["Player FF Texture"] = "rbxassetid://4494641460",
                        ["Shield Forcefield"] = "rbxassetid://361073795",
                        ["Water"] = "rbxasset://textures/water/normal_21.dds";
                        ["America"] = "rbxassetid://936775406",
                        ["Rainbow"] = "rbxassetid://252684207",
                        ["Akatsuki"] = "rbxassetid://10913193650",
                        ["None"] = "",
                    };
                    Materials = { 
                        "Grass", 
                        "Sand", 
                        "Snow", 
                        "Brick", 
                        "Concrete", 
                        "Ice", 
                        "Sand", 
                        "Slate", 
                        "WoodPlanks",  
                        "Asphalt", 
                        "Cobblestone", 
                        "CrackedLava", 
                        "Glacier", 
                        "Rock", 
                    };
                };
                Knifes = {
                    AnarchyTomahawk = {
                            weaponOffSet = CFrame.new(-0.15, -1.51, 0.2), 
                            sprintOffSet = Vector3.new(0, 0, -0.4), 
                            AimInSpeed = 0.4, 
                            AimOutSpeed = 0.4, 
                            swayMult = 1, 
                            useDof = true, 
                            allowAiming = false, 
                            useModuleName = "MeleeWeaponDefault", 
                            WeldHand = "UpperTorso", 
                            FireMode = "Melee", 
                            Scope = nil, 
                            EquipTValue = 0, 
                            AimWhileActing = true, 
                            MaximumKickBack = 1, 
                            MaxRecoil = 4, 
                            ReductionStartTime = 15, 
                            RecoilReductionMax = 1, 
                            RecoilTValueMax = 5, 
                            IdleSwayModifier = 8, 
                            WalkSwayModifer = 1, 
                            SprintSwayModifer = 1, 
                            ItemLength = 3.1, 
                            TouchWallPosY = -2.8, 
                            TouchWallPosZ = 2, 
                            TouchWallRotX = 40, 
                            TouchWallRotY = -9, 
                            FireModes = { "Melee" }, 
                        Animations = {
                            FirstPerson = {
                                    Equip = "rbxassetid://10905772228", 
                                    Idle = "rbxassetid://10905775438", 
                                    Use = "rbxassetid://10905779171", 
                                    UseAlt = "rbxassetid://10905777783", 
                                    Stab = "rbxassetid://10905780539", 
                                    Inspect = "rbxassetid://10905776735"
                            }, 
                                ThirdPerson = {
                                    Equip = "rbxassetid://10989619410", 
                                    Idle = "rbxassetid://10989624543", 
                                    Use = "rbxassetid://10989646536", 
                                    UseAlt = "rbxassetid://10989640707", 
                                    Stab = "rbxassetid://10989574087", 
                                    Inspect = "rbxassetid://10989633266"
                                }
                        };
                    };
                    DV2 = {
                            weaponOffSet = CFrame.new(0.05, -1.3, 1), 
                            sprintOffSet = Vector3.new(0, 0, 1), 
                            AimInSpeed = 0.4, 
                            AimOutSpeed = 0.4, 
                            swayMult = 1, 
                            useDof = true, 
                            allowAiming = false, 
                            useModuleName = "MeleeWeaponDefault", 
                            WeldHand = "UpperTorso", 
                            FireMode = "Melee", 
                            Scope = nil, 
                            EquipTValue = 0, 
                            AimWhileActing = true, 
                            MaximumKickBack = 1, 
                            MaxRecoil = 4, 
                            ReductionStartTime = 15, 
                            RecoilReductionMax = 1, 
                            RecoilTValueMax = 5, 
                            IdleSwayModifier = 8, 
                            WalkSwayModifer = 1, 
                            SprintSwayModifer = 1, 
                            ItemLength = 3.1, 
                            TouchWallPosY = -2.8, 
                            TouchWallPosZ = 2, 
                            TouchWallRotX = 40, 
                            TouchWallRotY = -9, 
                            FireModes = { "Melee" }, 
                            Animations = {
                                FirstPerson = {
                                    Equip = "rbxassetid://8982799578", 
                                    Idle = "rbxassetid://7963518001", 
                                    Use = "rbxassetid://7963516952", 
                                    UseAlt = "rbxassetid://7963600020", 
                                    Stab = "rbxassetid://7963980103", 
                                    Inspect = "rbxassetid://7963613236"
                                }, 
                                ThirdPerson = {
                                    Equip = "rbxassetid://8384325184", 
                                    Idle = "rbxassetid://8219701028", 
                                    Use = "rbxassetid://8219689820", 
                                    UseAlt = "rbxassetid://8219699063", 
                                    Stab = "rbxassetid://8219745355", 
                                    Inspect = "rbxassetid://8219716861"
                                }
                            };
                    };
                    GoldenDV2 = {
                            weaponOffSet = CFrame.new(0.05, -1.3, 1), 
                            sprintOffSet = Vector3.new(0, 0, 1), 
                            AimInSpeed = 0.4, 
                            AimOutSpeed = 0.4, 
                            swayMult = 1, 
                            useDof = true, 
                            allowAiming = false, 
                            useModuleName = "MeleeWeaponDefault", 
                            WeldHand = "UpperTorso", 
                            FireMode = "Melee", 
                            Scope = nil, 
                            EquipTValue = 0, 
                            AimWhileActing = true, 
                            MaximumKickBack = 1, 
                            MaxRecoil = 4, 
                            ReductionStartTime = 15, 
                            RecoilReductionMax = 1, 
                            RecoilTValueMax = 5, 
                            IdleSwayModifier = 8, 
                            WalkSwayModifer = 1, 
                            SprintSwayModifer = 1, 
                            ItemLength = 3.1, 
                            TouchWallPosY = -2.8, 
                            TouchWallPosZ = 2, 
                            TouchWallRotX = 40, 
                            TouchWallRotY = -9, 
                            FireModes = { "Melee" }, 
                            Animations = {
                                FirstPerson = {
                                    Equip = "rbxassetid://8982799578", 
                                    Idle = "rbxassetid://7963518001", 
                                    Use = "rbxassetid://7963516952", 
                                    UseAlt = "rbxassetid://7963600020", 
                                    Stab = "rbxassetid://7963980103", 
                                    Inspect = "rbxassetid://7963613236"
                                }, 
                                ThirdPerson = {
                                    Equip = "rbxassetid://8384325184", 
                                    Idle = "rbxassetid://8219701028", 
                                    Use = "rbxassetid://8219689820", 
                                    UseAlt = "rbxassetid://8219699063", 
                                    Stab = "rbxassetid://8219745355", 
                                    Inspect = "rbxassetid://8219716861"
                                }
                            };
                    };
                    IceAxe = {
                            weaponOffSet = CFrame.new(-0.15, -1.51, 0.2), 
                            sprintOffSet = Vector3.new(0, 0, -0.4), 
                            AimInSpeed = 0.4, 
                            AimOutSpeed = 0.4, 
                            swayMult = 1, 
                            useDof = true, 
                            allowAiming = false, 
                            useModuleName = "MeleeWeaponDefault", 
                            WeldHand = "UpperTorso", 
                            FireMode = "Melee", 
                            Scope = nil, 
                            EquipTValue = 0, 
                            AimWhileActing = true, 
                            MaximumKickBack = 1, 
                            MaxRecoil = 4, 
                            ReductionStartTime = 15, 
                            RecoilReductionMax = 1, 
                            RecoilTValueMax = 5, 
                            IdleSwayModifier = 8, 
                            WalkSwayModifer = 1, 
                            SprintSwayModifer = 1, 
                            ItemLength = 3.1, 
                            TouchWallPosY = -2.8, 
                            TouchWallPosZ = 2, 
                            TouchWallRotX = 40, 
                            TouchWallRotY = -9, 
                            FireModes = { "Melee" }, 
                            Animations = {
                                FirstPerson = {
                                    Equip = "rbxassetid://10905772228", 
                                    Idle = "rbxassetid://10905775438", 
                                    Use = "rbxassetid://10905779171", 
                                    UseAlt = "rbxassetid://10905777783", 
                                    Stab = "rbxassetid://10905780539", 
                                    Inspect = "rbxassetid://10905776735"
                                }, 
                                ThirdPerson = {
                                    Equip = "rbxassetid://10989619410", 
                                    Idle = "rbxassetid://10989624543", 
                                    Use = "rbxassetid://10989646536", 
                                    UseAlt = "rbxassetid://10989640707", 
                                    Stab = "rbxassetid://10989574087", 
                                    Inspect = "rbxassetid://10989633266"
                                }
                            };
                    };
                    PlasmaNinjato = {
                            weaponOffSet = CFrame.new(0.1, -1.4, 0.1), 
                            sprintOffSet = Vector3.new(1, -1, 1), 
                            AimInSpeed = 0.4, 
                            AimOutSpeed = 0.4, 
                            swayMult = 1, 
                            useDof = true, 
                            allowAiming = false, 
                            useModuleName = "MeleeWeaponDefault", 
                            WeldHand = "UpperTorso", 
                            FireMode = "Melee", 
                            Scope = nil, 
                            EquipTValue = 0, 
                            AimWhileActing = true, 
                            MaximumKickBack = 1, 
                            MaxRecoil = 4, 
                            ReductionStartTime = 15, 
                            RecoilReductionMax = 1, 
                            RecoilTValueMax = 5, 
                            IdleSwayModifier = 8, 
                            WalkSwayModifer = 1, 
                            SprintSwayModifer = 1, 
                            ItemLength = 3.1, 
                            TouchWallPosY = -2.8, 
                            TouchWallPosZ = 2, 
                            TouchWallRotX = 40, 
                            TouchWallRotY = -9, 
                            FireModes = { "Melee" }, 
                            Animations = {
                                FirstPerson = {
                                    Equip = "rbxassetid://9602813265", 
                                    Idle = "rbxassetid://9602814995", 
                                    Use = "rbxassetid://9602882117", 
                                    UseAlt = "rbxassetid://9602837643", 
                                    Stab = "rbxassetid://9602895599", 
                                    Inspect = "rbxassetid://9602906201"
                                }, 
                                ThirdPerson = {
                                    Equip = "rbxassetid://11305769153", 
                                    Idle = "rbxassetid://11305800944", 
                                    Sprint = "rbxassetid://11305866272", 
                                    Use = "rbxassetid://11305837531", 
                                    UseAlt = "rbxassetid://11305821864", 
                                    Stab = "rbxassetid://11305793672", 
                                    Inspect = "rbxassetid://8219716861"
                                }
                            };
                    };
                    IceDagger = {
                            weaponOffSet = CFrame.new(0.05, -1.3, 1), 
                            sprintOffSet = Vector3.new(0, 0, 1), 
                            AimInSpeed = 0.4, 
                            AimOutSpeed = 0.4, 
                            swayMult = 1, 
                            useDof = true, 
                            allowAiming = false, 
                            useModuleName = "MeleeWeaponDefault", 
                            WeldHand = "UpperTorso", 
                            FireMode = "Melee", 
                            Scope = nil, 
                            EquipTValue = 0, 
                            AimWhileActing = true, 
                            MaximumKickBack = 1, 
                            MaxRecoil = 4, 
                            ReductionStartTime = 15, 
                            RecoilReductionMax = 1, 
                            RecoilTValueMax = 5, 
                            IdleSwayModifier = 8, 
                            WalkSwayModifer = 1, 
                            SprintSwayModifer = 1, 
                            ItemLength = 3.1, 
                            TouchWallPosY = -2.8, 
                            TouchWallPosZ = 2, 
                            TouchWallRotX = 40, 
                            TouchWallRotY = -9, 
                            FireModes = { "Melee" }, 
                            Animations = {
                                FirstPerson = {
                                    Equip = "rbxassetid://8982799578", 
                                    Idle = "rbxassetid://7963518001", 
                                    Use = "rbxassetid://7963516952", 
                                    UseAlt = "rbxassetid://7963600020", 
                                    Stab = "rbxassetid://7963980103", 
                                    Inspect = "rbxassetid://7963613236"
                                }, 
                                ThirdPerson = {
                                    Equip = "rbxassetid://8384325184", 
                                    Idle = "rbxassetid://8219701028", 
                                    Use = "rbxassetid://8219689820", 
                                    UseAlt = "rbxassetid://8219699063", 
                                    Stab = "rbxassetid://8219745355", 
                                    Inspect = "rbxassetid://8219716861"
                                }
                            };
                    };
                    Karambit = {
                            weaponOffSet = CFrame.new(0, -1.4500000476837158, 0.44999998807907104), 
                            sprintOffSet = Vector3.new(0, 0, 1), 
                            AimInSpeed = 0.4, 
                            AimOutSpeed = 0.4, 
                            swayMult = 1, 
                            useDof = true, 
                            allowAiming = false, 
                            useModuleName = "MeleeWeaponDefault", 
                            WeldHand = "UpperTorso", 
                            FireMode = "Melee", 
                            Scope = nil, 
                            EquipTValue = 0, 
                            AimWhileActing = true, 
                            MaximumKickBack = 1, 
                            MaxRecoil = 4, 
                            ReductionStartTime = 15, 
                            RecoilReductionMax = 1, 
                            RecoilTValueMax = 5, 
                            IdleSwayModifier = 8, 
                            WalkSwayModifer = 1, 
                            SprintSwayModifer = 1, 
                            ItemLength = 3.1, 
                            TouchWallPosY = -2.8, 
                            TouchWallPosZ = 2, 
                            TouchWallRotX = 40, 
                            TouchWallRotY = -9, 
                            FireModes = { "Melee" }, 
                            Animations = {
                                FirstPerson = {
                                    Equip = "rbxassetid://13660199419", 
                                    Idle = "rbxassetid://13660201544", 
                                    Use = "rbxassetid://13660212475", 
                                    UseAlt = "rbxassetid://13660218031", 
                                    Stab = "rbxassetid://13660208464", 
                                    Inspect = "rbxassetid://13660189579"
                                }, 
                                ThirdPerson = {
                                    Equip = "rbxassetid://8384325184", 
                                    Idle = "rbxassetid://8219701028", 
                                    Use = "rbxassetid://8219689820", 
                                    UseAlt = "rbxassetid://8219699063", 
                                    Stab = "rbxassetid://8219745355", 
                                    Inspect = "rbxassetid://8219716861"
                                }
                            };
                    };
                    Cutlass = {
                        ['TouchWallRotY'] = -9,
                        ['Animations'] = {
                            ['ThirdPerson'] = {
                                ['Idle'] = 'rbxassetid://8219701028',
                                ['Stab'] = 'rbxassetid://14376493027',
                                ['Equip'] = 'rbxassetid://14376499349',
                                ['Inspect'] = 'rbxassetid://8219716861',
                                ['UseAlt'] = 'rbxassetid://8219699063',
                                ['Use'] = 'rbxassetid://8219689820'
                            },
                            ['FirstPerson'] = {
                                ['Idle'] = 'rbxassetid://7963518001',
                                ['Stab'] = 'rbxassetid://14326935050',
                                ['Equip'] = 'rbxassetid://14326929299',
                                ['Inspect'] = 'rbxassetid://7963613236',
                                ['UseAlt'] = 'rbxassetid://7963600020',
                                ['Use'] = 'rbxassetid://7963516952'
                            }
                        },
                        ['WeldHand'] = 'UpperTorso',
                        ['MaximumKickBack'] = 1,
                        ['ReductionStartTime'] = 15,
                        ['TouchWallPosY'] = -2.8,
                        ['AimWhileActing'] = true,
                        ['TouchWallRotX'] = 40,
                        ['FireModes'] = { [1] = 'Melee' },
                        ['AimOutSpeed'] = 0.4,
                        ['ItemLength'] = 3.1,
                        ['WalkSwayModifer'] = 1,
                        ['useDof'] = true,
                        ['AimInSpeed'] = 0.4,
                        ['EquipTValue'] = 0,
                        ['IdleSwayModifier'] = 8,
                        ['FireMode'] = 'Melee',
                        ['allowAiming'] = false,
                        ['MaxRecoil'] = 4,
                        ['TouchWallPosZ'] = 2,
                        ['useModuleName'] = 'MeleeWeaponDefault',
                        ['RecoilReductionMax'] = 1,
                        sprintOffSet = Vector3.new(0, 0, 1), 
                        weaponOffSet = CFrame.new(0.0500000007, -1.29999995, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1), 
                        --['weaponOffSet'] = '0.0500000007, -1.29999995, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1',
                        ['swayMult'] = 1,
                        ['RecoilTValueMax'] = 5,
                        ['SprintSwayModifer'] = 1
                    }
                }
            }, {
                Tables = {};
            };

            -- Functions
            do
                do -- Font
                    LPH_JIT_MAX(function()
                        getsynasset = getcustomasset or getsynasset
                        Font = setreadonly(Font, false);
                        function Font:Register(Name, Weight, Style, Asset)
                            if not isfile(Name .. ".font") then
                                if not isfile(Asset.Id) then
                                    writefile(Asset.Id, Asset.Font);
                                end;
                                --
                                local Data = {
                                    name = Name,
                                    faces = {{
                                        name = "Regular",
                                        weight = Weight,
                                        style = Style,
                                        assetId = getsynasset(Asset.Id);
                                    }}
                                };
                                --
                                writefile(Name .. ".font", game:GetService("HttpService"):JSONEncode(Data));
                                return getsynasset(Name .. ".font");
                            else 
                                warn("Font already registered");
                            end;
                        end;
                        --
                        function Font:GetRegistry(Name)
                            if isfile(Name .. ".font") then
                                return getsynasset(Name .. ".font");
                            end;
                        end;
                    end)();
                end;
                --
                do -- Menu
                    LPH_NO_VIRTUALIZE(function()
                        do -- Menu Functions
                            function Menu:NewDrawing(class, properties, no_cache)
                                properties = properties or {}
            
                                local object = Instance.new(class)
            
                                if class == "TextLabel" or class == "TextBox" then
                                    Menu.Text[object] = object
                                    object.BackgroundTransparency = 1
                                end
                                if class == "Frame" or class == "TextButton" then
                                    object.BorderSizePixel = 0
                                end
            
                                for property, value in next, properties do
                                    if property == "Theme" then
                                        Menu.ThemeObjects.Objects[object] = value
                                        if class == "Frame" or class == "TextButton" then
                                            property = "BackgroundColor3"
                                            value = Menu.Theme[value]
                                        elseif class == "TextLabel" or class == "TextBox" then
                                            property = "TextColor3"
                                            value = Menu.Theme[value]
                                        elseif class == "ImageLabel" then
                                            property = "ImageColor3"
                                            value = Menu.Theme[value]
                                        end
                                    end
                                    if property == "Color" then
                                        if class == "Frame" or class == "TextButton" then
                                            property = "BackgroundColor3"
                                        elseif class == "TextLabel" or class == "TextBox" then
                                            property = "TextColor3"
                                        end
                                    end
                                    object[property] = value
                                end
            
                                if not no_cache then
                                    Menu.Objects[object] = object
                                    Menu.Drawings[object] = object
                                end
                                return object
                            end;
                            --
                            function Menu:NewOutline(obj, color, zin, weird)
                                local outline = Instance.new("Frame")
                                outline.Transparency = 1;
                                outline.BorderSizePixel = 0
                                local actualoutline = Instance.new("UIStroke")
                                actualoutline.Parent = outline
                                Menu.Objects[outline] = outline
                                Menu.Objects[actualoutline] = actualoutline
                                outline.Parent = obj
                                if weird then
                                    outline.Size = UDim2.new(1, 2, 1, 2)
                                    outline.Position = UDim2.new(0, -1, 0, -1)
                                else
                                    outline.Size = UDim2.new(1, 0, 1, 0)
                                    outline.Position = UDim2.new(0, 0, 0, 0)
                                end
                                outline.ZIndex = zin or obj.ZIndex - 1
            
                                if typeof(color) == "Color3" then
                                    actualoutline.Color = color
                                else
                                    actualoutline.Color = Menu.Theme[color]
                                    Menu.ThemeObjects.Objects[outline] = color
                                end
            
                                outline.Parent = obj
            
                                return actualoutline
                            end;
                            --
                            function Menu:Connection(Signal, Callback)
                                local Con = Signal:Connect(Callback)
                                return Con
                            end;
                            --
                            function Menu:Disconnect(Connection)
                                Connection:Disconnect()
                            end;
                            --
                            function Menu:Round(Number, Float)
                                return Float * math.floor(Number / Float)
                            end;
                            --
                            function Menu.NextFlag()
                                Menu.UnNamedFlags = Menu.UnNamedFlags + 1
                                return string.format("%.14g", Menu.UnNamedFlags)
                            end;
                            --
                            function Menu:LoadTheme(ThemeType)
                                if self.Themes[ThemeType] then
                                    for Index, Value in pairs(self.Themes[ThemeType]) do
                                        Menu:ChangeThemeColor(Index, Value);
                                        if Pointers[Index] then 
                                            Pointers[Index](Value);
                                        end;
                                    end;
                                end;
                            end;
                            --
                            function Menu:ChangeObjectTheme(Object, Type, Color)
                                Menu.ThemeObjects.Objects[Object] = Color
                                if Type == "Frame" then
                                    Object.BackgroundColor3 = Menu.Theme[Color]
                                elseif Type == "Text" then
                                    Object.TextColor3 = Menu.Theme[Color]
                                elseif Type == "Outline" then
                                    Object.Color = Menu.Theme[Color]
                                elseif Type == "ImageLabel" then
                                    Object.ImageColor3 = Menu.Theme[Color]
                                end
                            end;
                            --
                            function Menu:ChangeThemeColor(Option, Color)
                                self.Theme[Option] = Color
            
                                for obj, theme in next, Menu.ThemeObjects.Objects do
                                    if theme == Option then
                                        if obj:IsA("Frame") or obj:IsA("TextBox") or obj:IsA("TextButton") then
                                            obj.BackgroundColor3 = Color
                                        elseif obj:IsA("TextLabel") then
                                            obj.TextColor3 = Color
                                        elseif obj:IsA("UIStroke") then
                                            obj.Color = Color
                                        elseif obj:IsA("ImageLabel") then
                                            obj.ImageColor3 = Color
                                        end;
                                    end;
                                end;
                            end;
                            --
                            function Menu:GetTextLength(str, font, fontsize)
                                local screengui = Instance.new("ScreenGui", gethui())
                                local text = Instance.new("TextLabel", screengui)
                                text.Text = str
                                text.Font = Enum.Font.SourceSans
                                text.TextSize = 15
            
                                local textbounds = text.TextBounds
                                text:Destroy()
            
                                return textbounds
                            end;
                            --
                            function Menu:RGBA(r, g, b, alpha)
                                local rgb = Color3.fromRGB(r, g, b)
                                local mt = table.clone(getrawmetatable(rgb))
            
                                setreadonly(mt, false)
                                local old = mt.__index
            
                                mt.__index = newcclosure(function(self, key)
                                    if key:lower() == "transparency" then
                                        return alpha
                                    end
            
                                    return old(self, key)
                                end)
            
                                setrawmetatable(rgb, mt)
            
                                return rgb
                            end;
                            --
                            function Menu:WrapText(Text, Size)
                                local Max = (Size / 7)
                                --
                                return Text:sub(0, Max)
                            end;
                            --
                            function Menu:GetConfig()
                                local Config = ""
                                for Index, Value in pairs(self.Flags) do
                                    if
                                        Index ~= "ConfigConfig_List"
                                        and Index ~= "ConfigConfig_Load"
                                        and Index ~= "ConfigConfig_Save"
                                    then
                                        local Value2 = Value
                                        local Final = ""
                                        --
                                        if typeof(Value2) == "Color3" then
                                            local hue, sat, val = Value2:ToHSV()
                                            --
                                            Final = ("rgb(%s,%s,%s,%s)"):format(hue, sat, val, Value2.Transparency)
                                        elseif typeof(Value2) == "table" and Value2.Color and Value2.Transparency then
                                            local hue, sat, val = Value2.Color:ToHSV()
                                            --
                                            Final = ("rgb(%s,%s,%s,%s)"):format(hue, sat, val, Value2.Transparency)
                                        elseif typeof(Value2) == "table" and Value.Mode then
                                            local Values = Value.current
                                            --
                                            Final = ("key(%s,%s,%s)"):format(Values[1] or "nil", Values[2] or "nil", Value.Mode)
                                        elseif Value2 ~= nil then
                                            if typeof(Value2) == "boolean" then
                                                Value2 = ("bool(%s)"):format(tostring(Value2))
                                            elseif typeof(Value2) == "table" then
                                                local New = "table("
                                                --
                                                for Index2, Value3 in pairs(Value2) do
                                                    New = New .. Value3 .. ","
                                                end
                                                --
                                                if New:sub(#New) == "," then
                                                    New = New:sub(0, #New - 1)
                                                end
                                                --
                                                Value2 = New .. ")"
                                            elseif typeof(Value2) == "string" then
                                                Value2 = ("string(%s)"):format(Value2)
                                            elseif typeof(Value2) == "number" then
                                                Value2 = ("number(%s)"):format(Value2)
                                            end
                                            --
                                            Final = Value2
                                        end
                                        --
                                        Config = Config .. Index .. ": " .. tostring(Final) .. "\n"
                                    end
                                end;
                                --
                                return Config
                            end;
                            --
                            function Menu:LoadConfig(Config)
                                local Table = Split(Config, "\n")
                                local Table2 = {}
                                for Index, Value in pairs(Table) do
                                    local Table3 = Split(Value, ":")
                                    --
                                    if Table3[1] ~= "SettingConfigurationList" and #Table3 >= 2 then
                                        local Value = Table3[2]:sub(2, #Table3[2])
                                        --
                                        if Value:sub(1, 3) == "rgb" then
                                            local Table4 = string.split(Value:sub(5, #Value - 1), ",")
                                            --
                                            Value = Table4
                                        elseif Value:sub(1, 3) == "key" then
                                            local Table4 = string.split(Value:sub(5, #Value - 1), ",")
                                            --
                                            if Table4[1] == "nil" and Table4[2] == "nil" then
                                                Table4[1] = nil
                                                Table4[2] = nil
                                            end
                                            --
                                            Value = Table4
                                        elseif Value:sub(1, 4) == "bool" then
                                            local Bool = Value:sub(6, #Value - 1)
                                            --
                                            Value = Bool == "true"
                                        elseif Value:sub(1, 5) == "table" then
                                            local Table4 = Split(Value:sub(7, #Value - 1), ",")
                                            --
                                            Value = Table4
                                        elseif Value:sub(1, 6) == "string" then
                                            local String = Value:sub(8, #Value - 1)
                                            --
                                            Value = String
                                        elseif Value:sub(1, 6) == "number" then
                                            local Number = tonumber(Value:sub(8, #Value - 1))
                                            --
                                            Value = Number
                                        end
                                        --
                                        Table2[Table3[1]] = Value
                                    end
                                end
                                --
                                for i, v in pairs(Table2) do
                                    Spawn(function()
                                        pcall(function()
                                            if Pointers[i] then
                                                if typeof(Pointers[i]) == "table" then
                                                    Pointers[i]:Set(v)
                                                else
                                                    Pointers[i](v)
                                                end
                                            end
                                        end);
                                    end);
                                end;
                            end;
                            --
                            function Menu:Toggle(Bool)
                                pcall(function()
                                    if typeof(Bool) == "boolean" then
                                        self.Open = Bool
            
                                        task.spawn(function()
                                            if not Bool then
                                                task.wait(0.1)
                                            end
                                            Menu.Base.Visible = Bool
                                        end)
            
                                        local ContextActionService = game:GetService("ContextActionService")
                                        if Bool then
                                            local ContextActionService = game:GetService("ContextActionService")
                                            ContextActionService:BindAction("Scrolling", function()
                                                return Enum.ContextActionResult.Sink
                                            end, false, Enum.UserInputType.MouseWheel)
                                            ContextActionService:BindAction("Input", function()
                                                return Enum.ContextActionResult.Sink
                                            end, false, Enum.UserInputType.MouseButton1)
                                        else
                                            ContextActionService:UnbindAction("Scrolling")
                                            ContextActionService:UnbindAction("Input")
                                        end
                                        for _, v in next, Menu.Drawings do
                                            --if not rawget(v, "__OBJECT_EXISTS") then continue end;
            
                                            if v:IsA("Frame") or v:IsA("TextButton") then
                                                if v.BackgroundTransparency ~= 1 then
                                                    task.spawn(function()
                                                        if Bool then
                                                            local fadein = Menu.Tween.new(
                                                                v,
                                                                TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                                                                { BackgroundTransparency = Menu.VisValues[v] }
                                                            )
                                                            fadein:Play()
                                                        else
                                                            local fadeout = Menu.Tween.new(
                                                                v,
                                                                TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                                                                { BackgroundTransparency = 0.95 }
                                                            )
                                                            fadeout:Play()
                                                            Menu.VisValues[v] = v.BackgroundTransparency
                                                        end
                                                    end)
                                                end
                                            end
                                            if v:IsA("TextLabel") then
                                                if v.TextTransparency ~= 1 then
                                                    task.spawn(function()
                                                        if Bool then
                                                            local fadein = Menu.Tween.new(
                                                                v,
                                                                TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                                                                { TextTransparency = Menu.VisValues[v] }
                                                            )
                                                            fadein:Play()
                                                        else
                                                            local fadeout = Menu.Tween.new(
                                                                v,
                                                                TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                                                                { TextTransparency = 0.95 }
                                                            )
                                                            fadeout:Play()
                                                            Menu.VisValues[v] = v.TextTransparency
                                                        end
                                                    end)
                                                end
                                            end
                                        end
                                    end
                                end)
                            end;
                            --
                            do -- Font
                                writefile("ProggyClean.ttf", game:HttpGet("https://github.com/f1nobe7650/other/raw/main/ProggyClean.ttf"))
                                Menu.Font = Font:Register("menu_font", 400, "normal", {Id = "ProggyClean.ttf", Font = ""});
                            end;
                        end;
                        --
                        do -- Sub Elements
                            function Menu:NewPicker(text, default, defaultalpha, parent, count, flag, callback, offset)
                                local offset = offset and -24 or -16
                                local InnerOutline = Menu:NewDrawing("Frame", {
                                    Theme = "Border1",
                                    Size = UDim2.new(0, 20, 0, 10),
                                    Position = UDim2.new(1, offset - (count * 17) - (count * 6), 0, 3),
                                    ZIndex = 55,
                                    Parent = parent,
                                });
                                --
                                local icon = Menu:NewDrawing("TextButton", {
                                    BackgroundTransparency = 0,
                                    Color = default,
                                    Parent = InnerOutline,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 55,
                                    Text = "",
                                    AutoButtonColor = false,
                                })
                                local alphaicon = Menu:NewDrawing("ImageLabel", {
                                    Size = UDim2.new(1, 0, 1, 0),
                                    ZIndex = 56,
                                    Parent = icon,
                                    BackgroundTransparency = 1,
                                    Image = "http://www.roblox.com/asset/?id=13883011573",
                                });
                                --
                                local gradient = Menu:NewDrawing("ImageLabel", {
                                    BackgroundTransparency = 1;
                                    ZIndex = 55;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = icon,
                                    Image = "http://www.roblox.com/asset/?id=14103381473";
                                });
            
            
                                Menu:Connection(icon.MouseEnter, function()
                                    Menu.ThemeObjects.Objects[InnerOutline] = Menu.Theme["Accent"];
                                    InnerOutline.BackgroundColor3 = Menu.Theme["Accent"];
                                end)
                                Menu:Connection(icon.MouseLeave, function()
                                    Menu.ThemeObjects.Objects[InnerOutline] = Menu.Theme["Border1"];
                                    InnerOutline.BackgroundColor3 = Menu.Theme["Border1"];
                                end)
            
                                local window = Menu:NewDrawing("Frame", {
                                    Parent = icon,
                                    Theme = "Dark Contrast",
                                    Size = UDim2.new(0, 206, 0, 200),
                                    Visible = false,
                                    Position = UDim2.new(1, -185 + (count * 20) + (count * 6), 1, 6),
                                    ZIndex = 60,
                                })
                                table.insert(Menu.Ignores.Pickers, window)
                                local mode_frame = Menu:NewDrawing("Frame", {
                                    Theme = "Dark Contrast",
                                    Size = UDim2.new(0, 54, 0, 35),
                                    Position = UDim2.new(1, 5, 0, -10),
                                    Parent = icon,
                                    ZIndex = 57,
                                    Visible = false,
                                })
                                local InnerOutline = Menu:NewOutline(mode_frame, "Border2", 55)
                                --
                                local copybutton = Menu:NewDrawing("TextButton", {
                                    Color = Color3.new(0, 0, 0),
                                    Size = UDim2.new(0, 44, 0, 12),
                                    Position = UDim2.new(0, 0, 0, 2),
                                    Parent = mode_frame,
                                    ZIndex = 59,
                                    BackgroundTransparency = 1,
                                    Text = "",
                                })
                                --
                                local pastebutton = Menu:NewDrawing("TextButton", {
                                    Color = Color3.new(0, 0, 0),
                                    Size = UDim2.new(0, 44, 0, 12),
                                    Position = UDim2.new(0, 0, 0, 20),
                                    Parent = mode_frame,
                                    ZIndex = 59,
                                    BackgroundTransparency = 1,
                                    Text = "",
                                })
            
                                local copytext = Menu:NewDrawing("TextLabel", {
                                    Text = "Copy",
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Position = UDim2.new(0, 0, 0, 0),
                                    ZIndex = 58,
                                    Parent = copybutton,
                                })
                                --
                                local copyshadow = Menu:NewDrawing("TextLabel", {
                                    Text = "Copy",
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Color = Color3.new(0, 0, 0),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 57,
                                    Parent = copyshadow,
                                })
                                --
                                local pastetext = Menu:NewDrawing("TextLabel", {
                                    Text = "Paste",
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Position = UDim2.new(0, 0, 0, 0),
                                    ZIndex = 58,
                                    Parent = pastebutton,
                                })
                                --
                                local pasteshadow = Menu:NewDrawing("TextLabel", {
                                    Text = "Paste",
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Color = Color3.new(0, 0, 0),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 57,
                                    Parent = pastebutton,
                                })
            
                                local outline1 = Menu:NewOutline(window, "Border2", 66)
                                Menu:NewOutline(outline1, "Border2", 66)
            
                                local saturation = Menu:NewDrawing("TextButton", {
                                    Parent = window,
                                    Color = default,
                                    Size = UDim2.new(0, 154, 0, 150),
                                    Position = UDim2.new(0, 3, 0, 3),
                                    ZIndex = 66,
                                    Text = "",
                                    AutoButtonColor = false,
                                })
            
                                local satoutline = Menu:NewOutline(saturation, "Border1", 66)
                                Menu:NewOutline(satoutline, "Border1", 65)
            
                                Menu:NewDrawing("ImageLabel", {
                                    Size = UDim2.new(1, 0, 1, 0),
                                    ZIndex = 66,
                                    Parent = saturation,
                                    BackgroundTransparency = 1,
                                    Image = "http://www.roblox.com/asset/?id=13882904626",
                                })
            
                                local saturationpicker = Menu:NewDrawing("Frame", {
                                    Parent = saturation,
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = UDim2.new(0, 2, 0, 2),
                                    ZIndex = 66,
                                })
            
                                Menu:NewOutline(saturationpicker, "Border1", 66)
            
                                local hueframe = Menu:NewDrawing("TextButton", {
                                    Parent = window,
                                    Size = UDim2.new(0, 32, 0, 150),
                                    Position = UDim2.new(0.8, 0, 0, 3),
                                    ZIndex = 66,
                                    AutoButtonColor = false,
                                    Text = "",
                                })
            
                                local hueoutline = Menu:NewOutline(hueframe, "Border1", 66)
                                Menu:NewOutline(hueoutline, "Border1", 65)
            
                                Menu:NewDrawing("ImageLabel", {
                                    Size = UDim2.new(1, 0, 1, 0),
                                    ZIndex = 66,
                                    Parent = hueframe,
                                    BackgroundTransparency = 1,
                                    Image = "http://www.roblox.com/asset/?id=13882976736",
                                })
            
                                local huepicker = Menu:NewDrawing("Frame", {
                                    Parent = hueframe,
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = UDim2.new(1, 0, 0, 1),
                                    ZIndex = 66,
                                    Visible = true,
                                })
            
                                Menu:NewOutline(huepicker, "Border1", 66)
            
                                local alphaframe = Menu:NewDrawing("TextButton", {
                                    Size = UDim2.new(0, 154, 0, 32), --Size = UDim2.new(0, 154, 0, 35),
                                    Position = UDim2.new(0, 3, 0, 160),
                                    ZIndex = 66,
                                    Parent = window,
                                    Visible = true,
                                    AutoButtonColor = false,
                                    Text = ""
                                })
            
                                local alpoutline = Menu:NewOutline(alphaframe, "Border1", 66)
                                Menu:NewOutline(alpoutline, "Border1", 65)
            
                                local alphapicker = Menu:NewDrawing("Frame", {
                                    Parent = alphaframe,
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = UDim2.new(0, 1, 1, 0),
                                    ZIndex = 67,
                                    Visible = true,
                                })
                                Menu:NewOutline(alphapicker, "Border1", 66)
            
                                local mouseover = false
                                local hue, sat, val = default:ToHSV()
                                local hsv = default:ToHSV()
                                local alpha = defaultalpha
                                local oldcolor = hsv
                                local toggled = false
                                local fadetoggled = false
            
                                local function set(color, a, nopos, setcolor)
                                    if type(color) == "table" then
                                        a = color[4]
                                        color = Color3.fromHSV(color[1], color[2], color[3])
                                    end
                                    if type(color) == "string" then
                                        color = Color3.fromHex(color)
                                    end
            
                                    local oldcolor = hsv
                                    local oldalpha = alpha
            
                                    hue, sat, val = color:ToHSV()
                                    alpha = a or 1
                                    hsv = Color3.fromHSV(hue, sat, val)
            
                                    if hsv ~= oldcolor or alpha ~= oldalpha then
                                        icon.BackgroundColor3 = hsv
                                        alphaframe.BackgroundColor3 = hsv
                                        alphaicon.ImageTransparency = alpha
            
                                        if not nopos then
                                            saturationpicker.Position = UDim2.new(
                                                0,
                                                (math.clamp(sat * saturation.AbsoluteSize.X, 0, saturation.AbsoluteSize.X - 2)),
                                                0,
                                                (
                                                    math.clamp(
                                                        (1 - val) * saturation.AbsoluteSize.Y,
                                                        0,
                                                        saturation.AbsoluteSize.Y - 2
                                                    )
                                                )
                                            )
                                            huepicker.Position = UDim2.new(0, 0, 0, 0)
                                            alphapicker.Position = UDim2.new(
                                                0,
                                                0,
                                                0,
                                                math.clamp(
                                                    (1 - alpha) * alphaframe.AbsoluteSize.X,
                                                    0,
                                                    alphaframe.AbsoluteSize.X - 2
                                                )
                                            )
                                            if setcolor then
                                                saturation.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
                                            end
                                        end
            
                                        if flag then
                                            Menu.Flags[flag] = Menu:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha)
                                        end
            
                                        callback(Menu:RGBA(hsv.r * 255, hsv.g * 255, hsv.b * 255, alpha))
                                    end
                                end
            
                                Menu.Ignores.Flags[flag] = set
            
                                set(default, defaultalpha)
            
                                local defhue, _, _ = default:ToHSV()
            
                                local curhuesizey = defhue
            
                                local function updatesatval(input, set_callback)
                                    local sizeX = math.clamp(
                                        (input.Position.X - saturation.AbsolutePosition.X) / saturation.AbsoluteSize.X,
                                        0,
                                        1
                                    )
                                    local sizeY = 1
                                        - math.clamp(
                                            ((input.Position.Y - saturation.AbsolutePosition.Y) + 36) / saturation.AbsoluteSize.Y,
                                            0,
                                            1
                                        )
                                    local posY = math.clamp(
                                        ((input.Position.Y - saturation.AbsolutePosition.Y) / saturation.AbsoluteSize.Y)
                                                * saturation.AbsoluteSize.Y
                                            + 36,
                                        0,
                                        saturation.AbsoluteSize.Y - 2
                                    )
                                    local posX = math.clamp(
                                        ((input.Position.X - saturation.AbsolutePosition.X) / saturation.AbsoluteSize.X)
                                            * saturation.AbsoluteSize.X,
                                        0,
                                        saturation.AbsoluteSize.X - 2
                                    )
            
                                    saturationpicker.Position = UDim2.new(0, posX, 0, posY)
            
                                    if set_callback then
                                        set(Color3.fromHSV(curhuesizey or hue, sizeX, sizeY), alpha or defaultalpha, true, false)
                                    end
                                end
            
                                local slidingsaturation = false
            
                                saturation.InputBegan:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        slidingsaturation = true
                                        updatesatval(input)
                                    end
                                end)
            
                                saturation.InputEnded:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        slidingsaturation = false
                                        updatesatval(input, true)
                                    end
                                end)
            
                                local slidinghue = false
            
                                local function updatehue(input, set_callback)
                                    local sizeY = 1
                                        - math.clamp(
                                            ((input.Position.Y - hueframe.AbsolutePosition.Y) + 36) / hueframe.AbsoluteSize.Y,
                                            0,
                                            1
                                        )
                                    local posY = math.clamp(
                                        ((input.Position.Y - hueframe.AbsolutePosition.Y) / hueframe.AbsoluteSize.Y)
                                                * hueframe.AbsoluteSize.Y
                                            + 36,
                                        0,
                                        hueframe.AbsoluteSize.Y - 2
                                    )
            
                                    huepicker.Position = UDim2.new(0, 0, 0, posY)
                                    saturation.BackgroundColor3 = Color3.fromHSV(sizeY, 1, 1)
                                    curhuesizey = sizeY
                                    if set_callback then
                                        set(Color3.fromHSV(sizeY, sat, val), alpha or defaultalpha, true, true)
                                    end
                                end
            
                                hueframe.InputBegan:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        slidinghue = true
                                        updatehue(input)
                                    end
                                end)
            
                                hueframe.InputEnded:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        slidinghue = false
                                        updatehue(input, true)
                                    end
                                end)
            
                                local slidingalpha = false
            
                                local function updatealpha(input, set_callback)
                                    local sizeX = math.clamp(
                                        ((input.Position.X - alphaframe.AbsolutePosition.X) + 36) / alphaframe.AbsoluteSize.X,
                                        0,
                                        1
                                    )
                                    local posX = math.clamp(
                                        ((input.Position.X - alphaframe.AbsolutePosition.X) / alphaframe.AbsoluteSize.X)
                                                * alphaframe.AbsoluteSize.X
                                            + alphapicker.AbsoluteSize.X / 2,
                                        0,
                                        alphaframe.AbsoluteSize.X - alphapicker.AbsoluteSize.X / 2
                                    )
            
                                    alphapicker.Position = UDim2.new(0, posX, 0, 0)
                                    if set_callback then
                                        set(Color3.fromHSV(curhuesizey, sat, val), sizeX, true)
                                    end
                                end
            
                                alphaframe.InputBegan:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        slidingalpha = true
                                        updatealpha(input, true)
                                    end
                                end)
            
                                alphaframe.InputEnded:Connect(function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        slidingalpha = false
                                        updatealpha(input, true)
                                    end
                                end)
            
                                Menu:Connection(game:GetService("UserInputService").InputChanged, function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                                        if slidingalpha then
                                            updatealpha(input, true)
                                        end
            
                                        if slidinghue then
                                            updatehue(input, true)
                                        end
            
                                        if slidingsaturation then
                                            updatesatval(input, true)
                                        end
                                    end
                                end)
            
                                icon.MouseButton1Click:Connect(function()
                                    for _, picker in next, Menu.Ignores.Pickers do
                                        if picker ~= window then
                                            picker.Visible = false
                                        end
                                    end
            
                                    window.Visible = not window.Visible
            
                                    if slidinghue then
                                        slidinghue = false
                                    end
            
                                    if slidingsaturation then
                                        slidingsaturation = false
                                    end
            
                                    if slidingalpha then
                                        slidingalpha = false
                                    end
                                end)
            
                                -- // Copy & paste
                                copybutton.MouseButton1Click:Connect(function()
                                    Menu.LastCopiedColor = Menu.Flags[flag]
                                    Menu.LastCopiedAlpha = Menu.Flags[flag].transparency
                                    setclipboard(Menu.LastCopiedColor:ToHex())
                                    mode_frame.Visible = false
                                end)
                                pastebutton.MouseButton1Click:Connect(function()
                                    set(Menu.LastCopiedColor, Menu.LastCopiedAlpha)
                                    mode_frame.Visible = false
                                end)
                                icon.MouseButton2Up:Connect(function()
                                    mode_frame.Visible = true
                                end)
            
                                local colorpickertypes = {}
            
                                function colorpickertypes:Set(color, alpha)
                                    set(color)
                                    updatealpha(alpha)
                                end
            
                                return colorpickertypes, window
                            end;
                        end;
                        --
                        do -- Main Elements
                            local Pages = Menu.Pages; Menu.Pages.__index = Menu.Pages;
                            local InnerTabs = Menu.InnerTabs; Menu.InnerTabs.__index = Menu.InnerTabs;
                            local Sections = Menu.Sections; Menu.Sections.__index = Menu.Sections;
                            Menu.__index = Menu;   
                            --
                            function Menu:Window(Properties)
                                if not Properties then
                                    Properties = {};
                                end;
                                --
                                local Window = {
                                    Title = Properties.Name or "neko",
                                    SubTitle = Properties.SubTitle or "cheat",
                                    Suite = Properties.Suite or "debug",
                                    Extra = Properties.Extra or "- lua(s) loaded: 0 - config: none.cfg",
                                    Pages = {},
                                    PageAxis = 0,
                                    Dragging = { false, UDim2.new(0, 0, 0, 0) },
                                    Resized = nil,
                                    Elements = {},
                                    PageAmmount = Properties.PageAmmount or nil,
                                    Size = Properties.Size or UDim2.new(0, 640, 0, 699),
                                    LogCount = 0;
                                    Debounce = false;
                                }
            
                                -- // Drawings
                                Window.Elements.Base = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = Window.Size;
                                    Position = UDim2.new(0, 100, 0, 100);
                                    Theme = "Border1";   
                                    Parent = Panichook.Locals.ProtectedGUISpace;
                                }); Menu.Base = Window.Elements.Base;
                                --
                                Window.Elements.FrameInline = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Accent";
                                    Parent = Window.Elements.Base;
                                });
                                --
                                Window.Elements.InnerFrame = Menu:NewDrawing("Frame", {
                                    BackgroundTransparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Light Contrast";
                                    Parent = Window.Elements.FrameInline;
                                });
                                --
                                Window.Elements.Top = Menu:NewDrawing("TextButton", {
                                    Position = UDim2.new(0,3,0,3),
                                    Size = UDim2.new(1,-6,0,20),
                                    BackgroundColor3 = Color3.new(0,0,0),
                                    BackgroundTransparency = 1,
                                    BorderSizePixel = 0,
                                    BorderColor3 = Color3.new(0,0,0),
                                    Parent = Window.Elements.InnerFrame,
                                    ZIndex = 50,
                                    AutoButtonColor = false,
                                    Text = "",
                                });
                                --
                                Window.Elements.InnerFrameInline = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -8, 1, -22);
                                    Position = UDim2.new(0, 4, 0, 18);
                                    Theme = "Border2";
                                    Parent = Window.Elements.InnerFrame;
                                });
                                --
                                Window.Elements.InnerFrameInline2 = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Border1";
                                    Parent = Window.Elements.InnerFrameInline;
                                });
                                --
                                Window.Elements.InnerFrameInline3 = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Light Contrast";
                                    Parent = Window.Elements.InnerFrameInline2;
                                });
                                --
                                Window.Elements.BackFrame = Menu:NewDrawing("Frame", {
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Dark Contrast";
                                    Parent = Window.Elements.InnerFrameInline3;
                                });
                                --
                                Window.Elements.TabFrameInline = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -8, 1, -28);
                                    Position = UDim2.new(0, 4, 0, 24);
                                    Theme = "Border1";
                                    Parent = Window.Elements.BackFrame;
                                });
                                --
                                Window.Elements.TabFrameInline2 = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Border2";
                                    Parent = Window.Elements.TabFrameInline;
                                });
                                --
                                Window.Elements.TabFrame = Menu:NewDrawing("Frame", {
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Light Contrast";
                                    Parent = Window.Elements.TabFrameInline2;
                                });
                                --
                                Window.Elements.Title = Menu:NewDrawing("TextLabel", {
                                    Text = Window.Title,
                                    Size = UDim2.new(1,0,0,15),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Color = Color3.fromRGB(180,180,180),
                                    Parent = Window.Elements.InnerFrame,
                                    ZIndex = 50,
                                    Position = UDim2.new(0, 4, 0, 2),
                                    TextStrokeTransparency = 0,
                                    RichText = true,
                                });
                                
                                -- Watermark
                                Window.Elements.Watermark = Menu:NewDrawing("Frame", {
                                    Visible = false;
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(0, 100, 0, 21);
                                    Position = UDim2.new(0, 100, 0, 9);
                                    Theme = "Border1";   
                                    Parent = Panichook.Locals.ProtectedGUISpace;
                                }, true);
                                --
                                Window.Elements.WatermarkStroke = Panichook:Instance("UIStroke", {
                                    Parent = Window.Elements.Watermark;
                                    Color = Color3.fromRGB(255, 255, 255);
                                    LineJoinMode = Enum.LineJoinMode.Miter;
                                });
                                --
                                Window.Elements.WatermarkGradient = Panichook:Instance("UIGradient", {
                                    Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Menu.Theme.Accent), ColorSequenceKeypoint.new(1, Menu.Theme.Border1)},
                                    Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)},
                                    Parent = Window.Elements.WatermarkStroke;
                                });
                                --
                                Window.Elements.WatermarkInline = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Window.Elements.Watermark;
                                    Theme = "Border2";   
                                }, true);
                                --
                                Window.Elements.WatermarkInnerFrame = Menu:NewDrawing("Frame", {
                                    BackgroundTransparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Light Contrast";
                                    Parent = Window.Elements.WatermarkInline;
                                }, true);
                                --
                                Window.Elements.WatermarkText = Menu:NewDrawing("TextLabel", {
                                    Text = "";
                                    Size = UDim2.new(1,0,1,0);
                                    Position = UDim2.new(0, 5, 0, 0);
                                    TextSize = 13;
                                    Font = Enum.Font.Code;
                                    Color = Color3.fromRGB(180,180,180);
                                    Parent = Window.Elements.WatermarkInnerFrame;
                                    ZIndex = 50;
                                    TextStrokeTransparency = 0,
                                    RichText = true,
                                    TextXAlignment = Enum.TextXAlignment.Left;
                                }, true);
            
                                -- Notification Holder
                                Window.Elements.NotificationHolder = Menu:NewDrawing("Frame", {
                                    Visible = true;
                                    BackgroundTransparency = 1;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, 0, 0, 21);
                                    Position = UDim2.new(0, 98, 0, 35);
                                    Theme = "Border1";   
                                    Parent = Panichook.Locals.ProtectedGUISpace;
                                }, true);
                                --
                                Panichook:Instance("UIListLayout", {Parent = Window.Elements.NotificationHolder; FillDirection = Enum.FillDirection.Vertical; Padding = UDim.new(0, 5)});
                                --
                                Window.Elements.NotificationExample = Menu:NewDrawing("Frame", {
                                    Name = "Example";
                                    Visible = false;
                                    BackgroundTransparency = 1;
                                    ZIndex = 50;
                                    Size = UDim2.new(0, 7, 0, 25);
                                    Theme = "Border1";   
                                    Parent = Window.Elements.NotificationHolder;
                                }, true);
                                --
                                Window.Elements.NotificationInner = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Window.Elements.NotificationExample;
                                    Theme = "Border2";   
                                    ClipsDescendants = true;
                                }, true);
                                --
                                Window.Elements.NotificationInner2 = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Window.Elements.NotificationInner;
                                    Theme = "Border1";   
                                    ClipsDescendants = true;
                                }, true);
                                --
                                Window.Elements.NotificationMain = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Window.Elements.NotificationInner2;
                                    Theme = "Dark Contrast";   
                                    ClipsDescendants = true;
                                }, true);
                                --
                                Window.Elements.NotificationText = Menu:NewDrawing("TextLabel", {
                                    Text = "";
                                    Size = UDim2.new(1,0,1,0);
                                    Position = UDim2.new(0, 5, 0, 0);
                                    TextSize = 13;
                                    Font = Enum.Font.Code;
                                    Color = Color3.fromRGB(180,180,180);
                                    Parent = Window.Elements.NotificationMain;
                                    ZIndex = 50;
                                    TextStrokeTransparency = 0,
                                    RichText = true,
                                    TextXAlignment = Enum.TextXAlignment.Left;
                                }, true);
                                
                                -- Functions
                                function Menu:UpdateWatermark(Text)
                                    Window.Elements.WatermarkText.Text = Text;
                                    Window.Elements.Watermark.Size = UDim2.new(0, Window.Elements.WatermarkText.TextBounds.X+13, 0, 21);
                                end;
                                --
                                function Menu:WatermarkState(State)
                                    Window.Elements.Watermark.Visible = State;
                                end;
                                --
                                function Menu:AnimateWatermark()
                                    local Rotation = 0;
                                    local Time = tick();
                                    do
                                        do -- Settings
                                            if Flags["Watermark Rotation Style"] ~= "Linear" then 
                                                local Style = Tween.EasingStyle[Enum.EasingStyle[Flags["Watermark Rotation Style"]]][Enum.EasingDirection[Flags["Watermark Rotation Direction"]]](Cos(Pi / 2 * tick() - Pi / 2))
                                                Rotation = Style * (Flags["Watermark Rotation Speed"])
                                            else 
                                                Rotation = Cos(Time) * (Flags["Watermark Rotation Speed"]);
                                            end;
                                            Window.Elements.WatermarkGradient.Rotation = Rotation;
                                            Window.Elements.WatermarkGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Menu.Theme.Accent), ColorSequenceKeypoint.new(1, Menu.Theme.Border1)}
                                        end;
                                    end;
                                end;
                                --
                                function Menu:Notify(Name, Time)
                                    Spawn(function()
                                        local Cloned = Window.Elements.NotificationExample:Clone();
                                        Cloned.Parent = Window.Elements.NotificationHolder;
                                        Cloned.Visible = true;
                                        Cloned.Frame.Frame.Frame.TextLabel.Text = Name;
                                        local Tween = TweenService:Create(Cloned.Frame, TweenInfo.new(0.75), {Size = UDim2.new(0, Cloned.Frame.Frame.Frame.TextLabel.TextBounds.X + 12, 0, 25)});
                                        Tween:Play();
                                        Tween.Completed:Wait();
                                        Wait(Time or 3);
                                        --
                                        local Tween = TweenService:Create(Cloned.Frame, TweenInfo.new(1), {Size = UDim2.new(0, 0, 0, 25)});
                                        Tween:Play();
                                        Tween.Completed:Wait();
                                        Tween:Destroy();
                                        Cloned:Destroy();
                                    end);
                                end;
            
                                -- Dragging
                                Menu:Connection(Window.Elements.Top.MouseButton1Down, function()
                                    local Location = game:GetService("UserInputService"):GetMouseLocation()
                                    Window.Dragging[1] = true
                                    Window.Dragging[2] = UDim2.new(0, Location.X - Window.Elements.Base.AbsolutePosition.X, 0, Location.Y - Window.Elements.Base.AbsolutePosition.Y)
                                end);
                                --
                                Menu:Connection(Window.Elements.Top.MouseButton1Up, function()
                                    Window.Dragging[1] = false
                                    Window.Dragging[2] = UDim2.new(0, 0, 0, 0)
                                end);
                                --
                                Menu:Connection(game:GetService("UserInputService").InputChanged, function(Input)
                                    local Location = game:GetService("UserInputService"):GetMouseLocation()
                                    local ActualLocation = nil
            
                                    -- Dragging
                                    if Window.Dragging[1] then
                                        Window.Elements.Base.Position = UDim2.new(
                                            0,
                                            Location.X - Window.Dragging[2].X.Offset,
                                            0,
                                            Location.Y - Window.Dragging[2].Y.Offset
                                        )
                                    end
                                end);
            
                                -- Returns
                                return setmetatable(Window, Menu);
                            end;
                            --
                            function Menu:Tab(Properties)
                                if not Properties then
                                    Properties = {};
                                end
                                --
                                local Page = {
                                    Name = Properties.Name or "Page",
                                    Window = self,
                                    Open = false,
                                    InnerTabs = {},
                                    Sections = {},
                                    Elements = {},
                                    Nested = Properties.Nested or false,
                                    Middle = Properties.middle or Properties.Middle or false,
                                    Size = Properties.Size or 65,
                                };
            
                                -- Pre
                                local Position = 4;
                                for _, Page in pairs(Page.Window.Pages) do
                                    Position = Position + (Page.Elements.PageButton.Size.X.Offset + 2);
                                end;
            
                                -- Elements
                                Page.Elements.PageButton = Menu:NewDrawing("TextButton", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(0, Page.Window.PageAmmount and ((((Page.Window.Elements.Base.Size.X.Offset - 20) - ((Page.Window.PageAmmount - 1) * 2)) / Page.Window.PageAmmount)) - 1 or Page.Size, 0, 21);
                                    Position = UDim2.new(0, Position, 0, 4);
                                    Theme = "Border1";
                                    Parent = Page.Window.Elements.BackFrame;
                                    AutoButtonColor = false;
                                });
                                --
                                Page.Elements.PageButtonInline = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -1);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Border2";
                                    Parent = Page.Elements.PageButton;
                                });
                                --
                                Page.Elements.PageButtonColor = Menu:NewDrawing("Frame", {
                                    Transparency = 0;
                                    ZIndex = 50;
                                    Size = UDim2.new(1, -2, 1, -1);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Theme = "Dark Contrast";
                                    Parent = Page.Elements.PageButtonInline;
                                });
                                --
                                Page.Elements.Title = Menu:NewDrawing("TextLabel", {
                                    Text = Page.Name,
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Parent = Page.Elements.PageButtonColor,
                                    ZIndex = 50,
                                    Position = UDim2.new(0, 0, 0, 0),
                                    TextStrokeTransparency = 0,
                                });
                                --
                                Page.Elements.TabHolder = Menu:NewDrawing("Frame", {
                                    Visible = false,
                                    BackgroundTransparency = 1,
                                    Color = Color3.fromRGB(20, 20, 25),
                                    Size = UDim2.new(1, 0, 1, 0),
                                    Position = UDim2.new(0, 0, 0, 0),
                                    Parent = Page.Window.Elements.TabFrame,
                                    ZIndex = 50,
                                });
            
                                -- Sections
                                if Page.Middle then
                                    Page.Elements.InnerLayout = Menu:NewDrawing("Frame", {
                                        Parent = Page.Elements.TabHolder,
                                        Size = UDim2.new(0.989, -1, 0, 50),
                                        Position = UDim2.new(0, 4, 0, 4),
                                        BackgroundTransparency = 1,
                                        ZIndex = 50,
                                        Visible = true,
                                        Theme = "Border1",
                                    });
                                    local Layout = Instance.new("UIListLayout");
                                    Layout.Parent = Page.Elements.InnerLayout;
                                    Layout.FillDirection = Enum.FillDirection.Horizontal;
                                    Layout.Padding = UDim.new(0, 6);
                                    --
                                    Page.Elements.Left = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        ZIndex = 50,
                                        Parent = Page.Elements.InnerLayout,
                                        Size = UDim2.new(0.3,16,1,0),
                                        Position = UDim2.new(0,3,0,4),
                                    })
                                    Page.Elements.Middle = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        ZIndex = 50,
                                        Parent = Page.Elements.InnerLayout,
                                        Size = UDim2.new(0.3,16,1,0),
                                        Position = UDim2.new(0.5,-80,0,4),
                                    })
                                    Page.Elements.Right = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        Parent = Page.Elements.InnerLayout,
                                        ZIndex = 50,
                                        Size = UDim2.new(0.3,16,1,0),
                                        Position = UDim2.new(1,-163,0,4),
                                    })
                                    local Layout = Instance.new("UIListLayout")
                                    Layout.Parent = Page.Elements.Left
                                    Layout.SortOrder = Enum.SortOrder.LayoutOrder
                                    Layout.Padding = UDim.new(0,5)
                                    local MLayout = Instance.new("UIListLayout")
                                    MLayout.Parent = Page.Elements.Middle
                                    MLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                    MLayout.Padding = UDim.new(0,5)
                                    local RLayout = Instance.new("UIListLayout")
                                    RLayout.Parent = Page.Elements.Right
                                    RLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                    RLayout.Padding = UDim.new(0,5)
                                else
                                    Page.Elements.Left = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        ZIndex = 50,
                                        Parent = Page.Elements.TabHolder,
                                        Size = UDim2.new(0.5,-7,0.988,0),
                                        Position = UDim2.new(0,4,0,4),
                                    })
                                    Page.Elements.Right = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        Parent = Page.Elements.TabHolder,
                                        ZIndex = 50,
                                        Size = UDim2.new(0.5,-7,0.988,0),
                                        Position = UDim2.new(0.5,3,0,4),
                                    })
                                    local Layout = Instance.new("UIListLayout")
                                    Layout.Parent = Page.Elements.Left
                                    Layout.SortOrder = Enum.SortOrder.LayoutOrder
                                    Layout.Padding = UDim.new(0,5)
                                    local RLayout = Instance.new("UIListLayout")
                                    RLayout.Parent = Page.Elements.Right
                                    RLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                    RLayout.Padding = UDim.new(0,5)
                                end;
            
                                -- Nested
                                Page.Elements.InnerTabHolder = Menu:NewDrawing("Frame", {
                                    Parent = Page.Elements.TabHolder,
                                    Size = UDim2.new(0.989, -1, 0, 50),
                                    Position = UDim2.new(0, 4, 0, 4),
                                    BackgroundTransparency = 0,
                                    ZIndex = 50,
                                    Visible = false,
                                    Theme = "Border1",
                                });
                                --
                                Page.Elements.InnerTabHolderInline = Menu:NewDrawing("Frame", {
                                    Parent = Page.Elements.InnerTabHolder,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    BackgroundTransparency = 0,
                                    ZIndex = 50,
                                    Visible = true,
                                    Theme = "Border2",
                                });
                                --
                                Page.Elements.InnerTabHolderColor = Menu:NewDrawing("Frame", {
                                    Parent = Page.Elements.InnerTabHolderInline,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    BackgroundTransparency = 0,
                                    ZIndex = 50,
                                    Visible = true,
                                    Theme = "Dark Contrast",
                                });
            
                                -- Functions
                                function Page:Turn(bool)
                                    Page.Open = bool;
                                    Page.Elements.TabHolder.Visible = Page.Open;
                                    Menu:ChangeObjectTheme(Page.Elements.Title, "Text", Page.Open and "Dark Text" or "Text");
                                    Menu:ChangeObjectTheme(Page.Elements.PageButtonColor, "Frame", Page.Open and "Light Contrast" or "Dark Contrast");
                                    Page.Elements.PageButtonColor.Size = Page.Open and UDim2.new(1, -2, 1, 0) or UDim2.new(1, -2, 1, -1);
                                end;
                                --
                                function Page:Update()
                                    for Index, InnerTab in pairs(Page.InnerTabs) do
                                        InnerTab.Elements.TabButton.Size = UDim2.new(
                                            1 / #self.InnerTabs,
                                            Index == 1 and 1 or Index == #self.InnerTabs and -2 or -1,
                                            1,
                                            0
                                        )
                                        InnerTab.Elements.TabButton.Position =
                                            UDim2.new(1 / (#self.InnerTabs / (Index - 1)), Index == 1 and 0 or 2, 0, 0)
                                    end;
                                end;
            
                                -- Connections
                                Menu:Connection(Page.Elements.PageButton.MouseEnter, function()
                                    Menu.ThemeObjects.Objects[Page.Elements.Title] = Page.Open and Menu.Theme["Dark Text"] or Menu.Theme["Accent"];
                                    Page.Elements.Title.TextColor3 = Page.Open and Menu.Theme["Dark Text"] or Menu.Theme["Accent"];
                                end);
                                --
                                Menu:Connection(Page.Elements.PageButton.MouseLeave, function()
                                    Menu.ThemeObjects.Objects[Page.Elements.Title] = Page.Open and Menu.Theme["Dark Text"] or Menu.Theme["Text"];
                                    Page.Elements.Title.TextColor3 = Page.Open and Menu.Theme["Dark Text"] or Menu.Theme["Text"];
                                end);
                                --
                                Menu:Connection(Page.Elements.PageButton.MouseButton1Click, function()
                                    if not Page.Open then
                                        Page:Turn(true)
                                        for _, Pages in pairs(Page.Window.Pages) do
                                            if Pages.Open and Pages ~= Page then
                                                Pages:Turn(false);
                                            end;
                                        end;
                                    end;
                                end);
            
                                -- Returns
                                if #Page.Window.Pages == 0 then
                                    Page:Turn(true);
                                end;
                                Page.Window.Pages[#Page.Window.Pages + 1] = Page;
                                return setmetatable(Page, Pages);
                            end;
                            --
                            function Pages:InnerTab(Properties)
                                if not Properties then
                                    Properties = {};
                                end
                                --
                                local InnerTab = {
                                    Name = Properties.Name or "Page",
                                    Page = self,
                                    Open = false,
                                    InnerTabs = {},
                                    Sections = {},
                                    Elements = {},
                                    Nested = Properties.Nested or false,
                                    Middle = Properties.middle or Properties.Middle or false,
                                    Size = Properties.Size or 65,
                                };
            
                                -- Setting
                                if InnerTab.Page.Middle then
                                    InnerTab.Page.Elements.Middle.Transparency = 1;
                                end;
                                InnerTab.Page.Elements.Left.Transparency = 1;
                                InnerTab.Page.Elements.Right.Transparency = 1;
                                
                                InnerTab.Page.Elements.InnerTabHolder.Visible = true;
            
                                -- Elements
                                InnerTab.Elements.TabButton = Menu:NewDrawing("TextButton", {
                                    Parent = InnerTab.Page.Elements.InnerTabHolder,
                                    BackgroundTransparency = 1,
                                    ZIndex = 50,
                                    Text = "",
                                });
                                --
                                InnerTab.Elements.Title = Menu:NewDrawing("TextLabel", {
                                    BackgroundTransparency = 1,
                                    Text = InnerTab.Name,
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Parent = InnerTab.Elements.TabButton,
                                    ZIndex = 50,
                                    Position = UDim2.new(0, 0, 0, 0),
                                    TextStrokeTransparency = 0,
                                });
                                --
                                InnerTab.Elements.TabHolder = Menu:NewDrawing("Frame", {
                                    Visible = false,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 1, -50),
                                    Position = UDim2.new(0, 0, 0, 50),
                                    Parent = InnerTab.Page.Elements.TabHolder,
                                    ZIndex = 50,
                                })
            
                                -- Nested
                                InnerTab.Elements.InnerTabHolder = Menu:NewDrawing("Frame", {
                                    Parent = InnerTab.Elements.TabHolder,
                                    Size = UDim2.new(0.989, -1, 0, 50),
                                    Position = UDim2.new(0, 4, 0, 5),
                                    BackgroundTransparency = 0,
                                    ZIndex = 50,
                                    Visible = false,
                                    Theme = "Border1",
                                });
                                --
                                local InnerTabHolderInline = Menu:NewDrawing("Frame", {
                                    Parent = InnerTab.Elements.InnerTabHolder,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    BackgroundTransparency = 0,
                                    ZIndex = 50,
                                    Visible = true,
                                    Theme = "Border2",
                                });
                                --
                                InnerTab.Elements.InnerTabHolderColor = Menu:NewDrawing("Frame", {
                                    Parent = InnerTabHolderInline,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    BackgroundTransparency = 0,
                                    ZIndex = 50,
                                    Visible = true,
                                    Theme = "Dark Contrast",
                                });
            
                                -- Sections
                                if InnerTab.Middle then
                                    InnerTab.Elements.InnerLayout = Menu:NewDrawing("Frame", {
                                        Parent = InnerTab.Elements.TabHolder,
                                        Size = UDim2.new(0.989, -1, 0, 50),
                                        Position = UDim2.new(0, 4, 0, 6),
                                        BackgroundTransparency = 1,
                                        ZIndex = 50,
                                        Visible = true,
                                        Theme = "Border1",
                                    });
                                    local Layout = Instance.new("UIListLayout");
                                    Layout.Parent = InnerTab.Elements.InnerLayout;
                                    Layout.FillDirection = Enum.FillDirection.Horizontal;
                                    Layout.Padding = UDim.new(0, 6);
                                    --
                                    InnerTab.Elements.Left = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        ZIndex = 50,
                                        Parent = InnerTab.Elements.InnerLayout,
                                        Size = UDim2.new(0.3,16,1,0),
                                        Position = UDim2.new(0,3,0,4),
                                    })
                                    InnerTab.Elements.Middle = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        ZIndex = 50,
                                        Parent = InnerTab.Elements.InnerLayout,
                                        Size = UDim2.new(0.3,16,1,0),
                                        Position = UDim2.new(0.5,-80,0,4),
                                    })
                                    InnerTab.Elements.Right = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        Parent = InnerTab.Elements.InnerLayout,
                                        ZIndex = 50,
                                        Size = UDim2.new(0.3,16,1,0),
                                        Position = UDim2.new(1,-163,0,4),
                                    })
                                    local Layout = Instance.new("UIListLayout")
                                    Layout.Parent = InnerTab.Elements.Left
                                    Layout.SortOrder = Enum.SortOrder.LayoutOrder
                                    Layout.Padding = UDim.new(0,5)
                                    local MLayout = Instance.new("UIListLayout")
                                    MLayout.Parent = InnerTab.Elements.Middle
                                    MLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                    MLayout.Padding = UDim.new(0,5)
                                    local RLayout = Instance.new("UIListLayout")
                                    RLayout.Parent = InnerTab.Elements.Right
                                    RLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                    RLayout.Padding = UDim.new(0,5)
                                else
                                    InnerTab.Elements.Left = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        ZIndex = 50,
                                        Parent = InnerTab.Elements.TabHolder,
                                        Size = UDim2.new(0.5,-7,0.988,0),
                                        Position = UDim2.new(0,4,0,6),
                                    })
                                    InnerTab.Elements.Right = Menu:NewDrawing("Frame", {
                                        BackgroundTransparency = 1,
                                        Parent = InnerTab.Elements.TabHolder,
                                        ZIndex = 50,
                                        Size = UDim2.new(0.5,-7,0.988,0),
                                        Position = UDim2.new(0.5,3,0,6),
                                    })
                                    local Layout = Instance.new("UIListLayout")
                                    Layout.Parent = InnerTab.Elements.Left
                                    Layout.SortOrder = Enum.SortOrder.LayoutOrder
                                    Layout.Padding = UDim.new(0,5)
                                    local RLayout = Instance.new("UIListLayout")
                                    RLayout.Parent = InnerTab.Elements.Right
                                    RLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                    RLayout.Padding = UDim.new(0,5)
                                end;
                                
                                -- Functions
                                function InnerTab:Turn(bool)
                                    InnerTab.Open = bool
                                    InnerTab.Elements.TabHolder.Visible = InnerTab.Open
                                    Menu:ChangeObjectTheme(InnerTab.Elements.Title, "Text", InnerTab.Open and "Dark Text" or "Text")
                                end
                                --
                                function InnerTab:Update()
                                    for Index, InnerTab in pairs(InnerTab.InnerTabs) do
                                        InnerTab.Elements.TabButton.Size = UDim2.new(
                                            1 / #self.InnerTabs,
                                            Index == 1 and 1 or Index == #self.InnerTabs and -2 or -1,
                                            1,
                                            0
                                        )
                                        InnerTab.Elements.TabButton.Position =
                                            UDim2.new(1 / (#self.InnerTabs / (Index - 1)), Index == 1 and 0 or 2, 0, 0)
                                    end;
                                end;
            
                                -- Connections
                                Menu:Connection(InnerTab.Elements.TabButton.MouseEnter, function()
                                    Menu.ThemeObjects.Objects[InnerTab.Elements.Title] = InnerTab.Open and Menu.Theme["Dark Text"] or Menu.Theme["Accent"];
                                    InnerTab.Elements.Title.TextColor3 = InnerTab.Open and Menu.Theme["Dark Text"] or Menu.Theme["Accent"];
                                end);
                                --
                                Menu:Connection(InnerTab.Elements.TabButton.MouseLeave, function()
                                    Menu.ThemeObjects.Objects[InnerTab.Elements.Title] = InnerTab.Open and Menu.Theme["Dark Text"] or Menu.Theme["Text"];
                                    InnerTab.Elements.Title.TextColor3 = InnerTab.Open and Menu.Theme["Dark Text"] or Menu.Theme["Text"];
                                end);
                                --
                                Menu:Connection(InnerTab.Elements.TabButton.MouseButton1Click, function()
                                    if not InnerTab.Open then
                                        InnerTab:Turn(true)
                                        for _, Pages in pairs(InnerTab.Page.InnerTabs) do
                                            if Pages.Open and Pages ~= InnerTab then
                                                Pages:Turn(false);
                                            end;
                                        end;
                                    end;
                                end);
            
                                -- Returns
                                if #InnerTab.Page.InnerTabs == 0 then
                                    InnerTab:Turn(true)
                                end;
                                InnerTab.Page.InnerTabs[#InnerTab.Page.InnerTabs + 1] = InnerTab
                                InnerTab.Page:Update();
            
                                return setmetatable(InnerTab, Pages);
                            end;
                            --
                            function Pages:Section(Properties)
                                if not Properties then
                                    Properties = {}
                                end
                                --
                                local Section = {
                                    Name = Properties.Name or "Section",
                                    Page = self,
                                    Side = (Properties.side or Properties.Side or "left"):lower(),
                                    Elements = {},
                                    Content = {},
                                }
            
                                -- Section Holders
                                Section.Elements.HolderInline = Menu:NewDrawing("Frame", {
                                    Parent = (
                                        Section.Side == "right" and Section.Page.Elements.Right
                                        or Section.Side == "left" and Section.Page.Elements.Left
                                        or Section.Side == "middle" and Section.Page.Elements.Middle
                                        or Section.Page.Elements.Left
                                    ),
                                    Theme = "Border2";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, 0, 0, 28),
                                });
                                --
                                Section.Elements.HolderOutline = Menu:NewDrawing("Frame", {
                                    Parent = Section.Elements.HolderInline,
                                    Theme = "Border1";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                });
                                --
                                Section.Elements.SectionFrame = Menu:NewDrawing("Frame", {
                                    Parent = Section.Elements.HolderOutline,
                                    Theme = "Dark Contrast";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                });
                                --
                                Section.Elements.SectionContent = Menu:NewDrawing("Frame", {
                                    Parent = Section.Elements.SectionFrame,
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, -10, 1, -30),
                                    Position = UDim2.new(0, 5, 0, 22),
                                });
                                --
                                Section.Elements.SectionAccent = Menu:NewDrawing("Frame", {
                                    Parent = Section.Elements.SectionFrame,
                                    Theme = "Accent";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, 0, 0, 2),
                                    Position = UDim2.new(0, 0, 0, 0),
                                });
                                --
                                Section.Elements.Title = Menu:NewDrawing("TextLabel", {
                                    Text = Section.Name,
                                    Size = UDim2.new(1,0,0,20),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Color = Color3.fromRGB(180,180,180),
                                    Parent = Section.Elements.HolderOutline,
                                    ZIndex = 53,
                                    Position = UDim2.new(0, 3, 0, 0),
                                    TextStrokeTransparency = 0,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    TextYAlignment = Enum.TextYAlignment.Center,
                                });
                                --
                                local Layout = Instance.new("UIListLayout")
                                Layout.Parent = Section.Elements.SectionContent
                                Layout.SortOrder = Enum.SortOrder.LayoutOrder
                                Layout.Padding = UDim.new(0,4)
            
                                -- Functions
                                function Section:UpdateSize(Value)
                                    Section.Elements.HolderInline.Size = UDim2.new(1, 0, 0, Layout.AbsoluteContentSize.Y + Value)
                                end;
                                
                                -- Returns
                                return setmetatable(Section, Sections);
                            end;
                            --
                            function Sections:Button(Properties)
                                if not Properties then
                                    Properties = {}
                                end
                                --
                                local Button = {
                                    Name = Properties.Name or "Button",
                                    Section = self,
                                    Elements = {},
                                    Callback = Properties.Callback or function() end,
                                    Risk = Properties.Risk or false,
                                }
            
                                -- Drawings
                                Button.Elements.Holder = Menu:NewDrawing("TextButton", {
                                    Parent = Button.Section.Elements.SectionContent,
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 1,
                                    Text = "",
                                    Size = UDim2.new(1, 0, 0, 20),
                                });
                                --
                                Button.Elements.HolderInline = Menu:NewDrawing("Frame", {
                                    Parent = Button.Elements.Holder,
                                    Theme = "Border2";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -8, 0, 20),
                                    Position = UDim2.new(0, 4, 0, 0),
                                });
                                --
                                Button.Elements.HolderOutline = Menu:NewDrawing("Frame", {
                                    Parent = Button.Elements.HolderInline,
                                    Theme = "Border1";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                });
                                --
                                Button.Elements.ButtonFrame = Menu:NewDrawing("Frame", {
                                    Parent = Button.Elements.HolderOutline,
                                    Theme = "Light Contrast";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                });
                                --
                                Button.Elements.ButtonGradient = Menu:NewDrawing("ImageLabel", {
                                    BackgroundTransparency = 1;
                                    ZIndex = 53;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Button.Elements.HolderInline,
                                    Image = "http://www.roblox.com/asset/?id=14103381473";
                                });
                                --
                                Button.Elements.Title = Menu:NewDrawing("TextLabel", {
                                    Text = Button.Name,
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    TextStrokeTransparency = 0,
                                    Position = UDim2.new(0, 0, 0, 0),
                                    Parent = Button.Elements.ButtonFrame,
                                    ZIndex = 54,
                                });
                                Button.Section:UpdateSize(28);
            
                                -- Connections
                                Menu:Connection(Button.Elements.Holder.MouseEnter, function()
                                    Menu.ThemeObjects.Objects[Button.Elements.HolderInline] = Menu.Theme["Accent"];
                                    Button.Elements.HolderInline.BackgroundColor3 = Menu.Theme["Accent"];
                                end);
                                --
                                Menu:Connection(Button.Elements.Holder.MouseLeave, function()
                                    Menu.ThemeObjects.Objects[Button.Elements.HolderInline] = Menu.Theme["Border2"];
                                    Button.Elements.HolderInline.BackgroundColor3 = Menu.Theme["Border2"];
                                end);
                                --
                                Menu:Connection(Button.Elements.Holder.MouseButton1Click, function()
                                    Button.Callback()
                                end)
            
                                -- Returning
                                return Button;
                            end;
                            --
                            function Sections:Toggle(Properties)
                                if not Properties then
                                    Properties = {}
                                end
                                --
                                local Toggle = {
                                    Page = self.Page,
                                    Section = self,
                                    Risk = Properties.Risk or false,
                                    Name = Properties.Name or "Toggle",
                                    State = (
                                        Properties.state
                                        or Properties.State
                                        or Properties.def
                                        or Properties.Def
                                        or Properties.default
                                        or Properties.Default
                                        or false
                                    ),
                                    Callback = (
                                        Properties.callback
                                        or Properties.Callback
                                        or Properties.callBack
                                        or Properties.CallBack
                                        or function() end
                                    ),
                                    Flag = (
                                        Properties.flag
                                        or Properties.Flag
                                        or Properties.pointer
                                        or Properties.Pointer
                                        or Menu.NextFlag()
                                    ),
                                    Toggled = false;
                                    Colorpickers = 0;
                                    Elements = {};
                                }
            
                                -- Drawings
                                Toggle.Elements.Holder = Menu:NewDrawing("TextButton", {
                                    Parent = Toggle.Section.Elements.SectionContent,
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 1,
                                    Text = "",
                                    Size = UDim2.new(1, -8, 0, 15),
                                });
                                --
                                Toggle.Elements.HolderInline = Menu:NewDrawing("Frame", {
                                    Parent = Toggle.Elements.Holder,
                                    Theme = "Border2";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(0, 15, 0, 15),
                                    Position = UDim2.new(0, 4, 0, 0),
                                });
                                --
                                Toggle.Elements.HolderOutline = Menu:NewDrawing("Frame", {
                                    Parent = Toggle.Elements.HolderInline,
                                    Theme = "Border1";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                });
                                --
                                Toggle.Elements.ButtonFrame = Menu:NewDrawing("Frame", {
                                    Parent = Toggle.Elements.HolderOutline,
                                    Theme = "Light Contrast";
                                    Visible = true,
                                    ZIndex = 53,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                });
                                --
                                Toggle.Elements.ToggleGradient = Menu:NewDrawing("ImageLabel", {
                                    BackgroundTransparency = 1;
                                    ZIndex = 53;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Toggle.Elements.HolderInline,
                                    Image = "http://www.roblox.com/asset/?id=14103381473";
                                });
                                --
                                Toggle.Elements.Title = Menu:NewDrawing("TextLabel", {
                                    Text = Toggle.Name,
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    TextStrokeTransparency = 0,
                                    Position = UDim2.new(0, 25, 0, 0),
                                    Parent = Toggle.Elements.Holder,
                                    ZIndex = 53,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                });
                                Toggle.Section:UpdateSize(28);
            
                                -- Sub Elements
                                function Toggle:Colorpicker(Properties)
                                    local Properties = Properties or {}
                                    local Colorpicker = {
                                        State = (
                                            Properties.state
                                            or Properties.State
                                            or Properties.def
                                            or Properties.Def
                                            or Properties.default
                                            or Properties.Default
                                            or Color3.fromRGB(255, 0, 0)
                                        ),
                                        Alpha = (
                                            Properties.alpha
                                            or Properties.Alpha
                                            or Properties.transparency
                                            or Properties.Transparency
                                            or 1
                                        ),
                                        Callback = (
                                            Properties.callback
                                            or Properties.Callback
                                            or Properties.callBack
                                            or Properties.CallBack
                                            or function() end
                                        ),
                                        Flag = (
                                            Properties.flag
                                            or Properties.Flag
                                            or Properties.pointer
                                            or Properties.Pointer
                                            or Menu.NextFlag()
                                        ),
                                    }
                                    -- // Functions
                                    Toggle.Colorpickers = Toggle.Colorpickers + 1
                                    local colorpickertypes = Menu:NewPicker(
                                        Properties.Title or "Color",
                                        Colorpicker.State,
                                        Colorpicker.Alpha,
                                        Toggle.Elements.Holder,
                                        Toggle.Colorpickers - 1,
                                        Colorpicker.Flag,
                                        Colorpicker.Callback
                                    )
            
                                    function Colorpicker:Set(color)
                                        colorpickertypes:set(color, false, true)
                                    end
            
                                    -- // Returning
                                    return Colorpicker
                                end;
            
                                -- Connections
                                Menu:Connection(Toggle.Elements.Holder.MouseEnter, function()
                                    Menu:ChangeObjectTheme(Toggle.Elements.HolderInline, "Frame", "Accent");
                                end);
                                --
                                Menu:Connection(Toggle.Elements.Holder.MouseLeave, function()
                                    Menu:ChangeObjectTheme(Toggle.Elements.HolderInline, "Frame", "Border2");
                                end);
            
                                -- Functions
                                local function SetState()
                                    Toggle.Toggled = not Toggle.Toggled
                                    Menu.Flags[Toggle.Flag] = Toggle.Toggled
                                    Menu:ChangeObjectTheme(Toggle.Elements.ButtonFrame, "Frame", Toggle.Toggled and "Accent" or "Light Contrast");
                                    Toggle.Callback(Toggle.Toggled)
                                end
                                --
                                function Toggle.Set(bool)
                                    bool = type(bool) == "boolean" and bool or false
                                    if Toggle.Toggled ~= bool then
                                        SetState();
                                    end;
                                end;
            
                                -- Extra
                                Menu:Connection(Toggle.Elements.Holder.MouseButton1Click, SetState)
                                Menu.Flags[Toggle.Flag] = Toggle.State
                                Menu.Ignores.Flags[Toggle.Flag] = Toggle.Set
                                Toggle.Set(Toggle.State)
            
                                -- Returns
                                return Toggle;
                            end;
                            --
                            function Sections:Slider(Properties)
                                if not Properties then
                                    Properties = {}
                                end
                                --
                                local Slider = {
                                    Window = self.Window,
                                    Page = self.Page,
                                    Section = self,
                                    Name = Properties.Name,
                                    Mode = Properties.Mode or Properties.mode or "Half",
                                    Min = (Properties.min or Properties.Min or Properties.minimum or Properties.Minimum or 0),
                                    State = (
                                        Properties.state
                                        or Properties.State
                                        or Properties.def
                                        or Properties.Def
                                        or Properties.default
                                        or Properties.Default
                                        or 10
                                    ),
                                    Max = (Properties.max or Properties.Max or Properties.maximum or Properties.Maximum or 100),
                                    Sub = (
                                        Properties.suffix
                                        or Properties.Suffix
                                        or Properties.ending
                                        or Properties.Ending
                                        or Properties.prefix
                                        or Properties.Prefix
                                        or Properties.measurement
                                        or Properties.Measurement
                                        or ""
                                    ),
                                    Decimals = (Properties.decimals or Properties.Decimals or 1),
                                    Callback = (
                                        Properties.callback
                                        or Properties.Callback
                                        or Properties.callBack
                                        or Properties.CallBack
                                        or function() end
                                    ),
                                    Flag = (
                                        Properties.flag
                                        or Properties.Flag
                                        or Properties.pointer
                                        or Properties.Pointer
                                        or Menu.NextFlag()
                                    ),
                                    Elements = {},
                                }
            
                                -- // Elements
                                Slider.Elements.SliderHolder = Menu:NewDrawing("TextButton", {
                                    Parent = Slider.Section.Elements.SectionContent,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, -8, 0, Slider.Name and 28 or 14),
                                    ZIndex = 54,
                                    Text = "",
                                });
                                --
                                Slider.Elements.SliderFrame = Menu:NewDrawing("Frame", {
                                    Parent = Slider.Elements.SliderHolder,
                                    Visible = true,
                                    Size = UDim2.new(1,0,0,14),
                                    Position = UDim2.new(0,4,1,-14),
                                    ZIndex = 54,
                                    Theme = "Border2",
                                });
                                --
                                Slider.Elements.SliderFrameInner = Menu:NewDrawing("Frame", {
                                    Parent = Slider.Elements.SliderFrame,
                                    Visible = true,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 54,
                                    Theme = "Border1",
                                });
                                --
                                Slider.Elements.SliderFrameInner2 = Menu:NewDrawing("Frame", {
                                    Parent = Slider.Elements.SliderFrameInner,
                                    Visible = true,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 54,
                                    Theme = "Light Contrast",
                                });
                                --
                                Slider.Elements.SliderFill = Menu:NewDrawing("TextButton", {
                                    Parent = Slider.Elements.SliderFrameInner2,
                                    Visible = true,
                                    Size = UDim2.new(0, 0, 1, 0),
                                    ZIndex = 54,
                                    Theme = "Accent",
                                    Text = "",
                                    AutoButtonColor = false,
                                });
                                --
                                Slider.Elements.SliderDrag = Menu:NewDrawing("TextButton", {
                                    Parent = Slider.Elements.SliderHolder,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 1, 0),
                                    ZIndex = 54,
                                    AutoButtonColor = false,
                                    Text = "",
                                });
                                --
                                if Slider.Name then
                                    Slider.Elements.Title = Menu:NewDrawing("TextLabel", {
                                        Text = Slider.Name or "Title",
                                        Size = UDim2.new(1,0,1,0),
                                        TextStrokeTransparency = 0,
                                        TextSize = 13,
                                        Font = Enum.Font.Code,
                                        Theme = "Text",
                                        Position = UDim2.new(0, 5, 0, -8),
                                        Parent = Slider.Elements.SliderHolder,
                                        ZIndex = 54,
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                    });
                                end;
                                --
                                Slider.Elements.Value = Menu:NewDrawing("TextLabel", {
                                    Text = "",
                                    Size = UDim2.new(1,0,1,0),
                                    TextStrokeTransparency = 0,
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Dark Text",
                                    Position = UDim2.new(0, 0, 0, 0),
                                    Parent = Slider.Elements.SliderFrame,
                                    ZIndex = 54,
                                    TextXAlignment = Enum.TextXAlignment.Center,
                                });
                                --
                                Slider.Elements.SliderGradient = Menu:NewDrawing("ImageLabel", {
                                    BackgroundTransparency = 1;
                                    ZIndex = 54;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Slider.Elements.SliderFrame,
                                    Image = "http://www.roblox.com/asset/?id=14103381473";
                                });
            
                                -- Connections
                                Menu:Connection(Slider.Elements.SliderHolder.MouseEnter, function()
                                    Menu.ThemeObjects.Objects[Slider.Elements.SliderFrame] = Menu.Theme["Accent"];
                                    Slider.Elements.SliderFrame.BackgroundColor3 = Menu.Theme["Accent"];
                                end);
                                --
                                Menu:Connection(Slider.Elements.SliderHolder.MouseLeave, function()
                                    Menu.ThemeObjects.Objects[Slider.Elements.SliderFrame] = Menu.Theme["Border2"];
                                    Slider.Elements.SliderFrame.BackgroundColor3 = Menu.Theme["Border2"];
                                end);
                                Slider.Section:UpdateSize(28);
            
                                -- Functions
                                local Sliding = false
                                local function Set(value, lol)
                                    value = math.clamp(Menu:Round(value, Slider.Decimals), Slider.Min, Slider.Max)
            
                                    local sizeX = ((value - Slider.Min) / (Slider.Max - Slider.Min))
                                    Slider.Elements.SliderFill.Size = UDim2.new(sizeX, 0, 1, 0)
                                    Slider.Elements.Value.Text = ("[value]" .. Slider.Sub):gsub("%[value%]", string.format("%.14g", value))
            
                                    Menu.Flags[Slider.Flag] = value
                                    Slider.Callback(value)
                                    if lol then
                                        Slider.Section:UpdateSize(28);
                                    end
                                end				
                                --
                                local function Slide(input)
                                    local sizeX = (input.Position.X - Slider.Elements.SliderFrame.AbsolutePosition.X) / Slider.Elements.SliderFrame.AbsoluteSize.X
                                    local value = ((Slider.Max - Slider.Min) * sizeX) + Slider.Min
                                    Set(value)
                                end
                                --
                                Menu:Connection(Slider.Elements.SliderDrag.InputBegan, function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        Sliding = true
                                        Slide(input)
                                    end
                                end)
                                Menu:Connection(Slider.Elements.SliderDrag.InputEnded, function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        Sliding = false
                                    end
                                end)
                                Menu:Connection(Slider.Elements.SliderFill.InputBegan, function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        Sliding = true
                                        Slide(input)
                                    end
                                end)
                                Menu:Connection(Slider.Elements.SliderFill.InputEnded, function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                        Sliding = false
                                    end
                                end)
                                Menu:Connection(game:GetService("UserInputService").InputChanged, function(input)
                                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                                        if Sliding then
                                            Slide(input)
                                        end
                                    end
                                end)
                                --
                                function Slider:Set(Value)
                                    Set(Value)
                                end
            
                                -- Returning
                                Menu.Ignores.Flags[Slider.Flag] = Set
                                Menu.Flags[Slider.Flag] = Slider.State
                                Set(Slider.State, true)
                                return Slider
                            end;
                            --
                            function Sections:Dropdown(Properties)
                                if not Properties then
                                    Properties = {}
                                end
                                --
                                local Dropdown = {
                                    Window = self.Window,
                                    Page = self.Page,
                                    Section = self,
                                    Open = false,
                                    Name = Properties.Name,
                                    Options = (Properties.options or Properties.Options or Properties.values or Properties.Values or {
                                        "1",
                                        "2",
                                        "3",
                                    }),
                                    State = (
                                        Properties.state
                                        or Properties.State
                                        or Properties.def
                                        or Properties.Def
                                        or Properties.default
                                        or Properties.Default
                                        or nil
                                    ),
                                    Max = (Properties.max or Properties.Max or Properties.maximum or Properties.Maximum or nil),
                                    Callback = (
                                        Properties.callback
                                        or Properties.Callback
                                        or Properties.callBack
                                        or Properties.CallBack
                                        or function() end
                                    ),
                                    Flag = (
                                        Properties.flag
                                        or Properties.Flag
                                        or Properties.pointer
                                        or Properties.Pointer
                                        or Menu.NextFlag()
                                    ),
                                    OptionInsts = {},
                                    Elements = {},
                                }
            
                                -- // Elements
                                Dropdown.Elements.DropdownHolder = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Section.Elements.SectionContent,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 0, Dropdown.Name and 38 or 24),
                                    ZIndex = 53,
                                });
                                --
                                Dropdown.Elements.DropdownFrame = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.DropdownHolder,
                                    Visible = true,
                                    Size = UDim2.new(1, -8, 0, 20),
                                    Position = UDim2.new(0, 4, 1, -22),
                                    ZIndex = 54,
                                    Theme = "Border2",
                                });
                                --
                                Dropdown.Elements.ValueTitle = Menu:NewDrawing("TextLabel", {
                                    Visible = true,
                                    Text = "",
                                    Size = UDim2.new(1,-30,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Position = UDim2.new(0, 5, 0, 0),
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    ZIndex = 55,
                                    ClipsDescendants = true,
                                })
                                --
                                Dropdown.Elements.DropdownFrameInner = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Visible = true,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 54,
                                    Theme = "Border1",
                                });
                                --
                                Dropdown.Elements.DropdownFrameInner2 = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.DropdownFrameInner,
                                    Visible = true,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 54,
                                    Theme = "Light Contrast",
                                });
                                --
                                Dropdown.Elements.DropdownIcon = Menu:NewDrawing("ImageLabel", {
                                    Parent = Dropdown.Elements.DropdownFrameInner2,
                                    Visible = true,
                                    Image = "http://www.roblox.com/asset/?id=14103232768", -- Arrow_Down
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(0, 9, 0, 6),
                                    Position = UDim2.new(1, -14, 0, 5),
                                    ZIndex = 54,
                                    --Theme = "Accent",
                                }); table.insert(Menu.Ignores.Icons, Dropdown.Elements.DropdownIcon);
                                --
                                if Dropdown.Name then
                                    Dropdown.Elements.Title = Menu:NewDrawing("TextLabel", {
                                        Text = Dropdown.Name or "Title",
                                        Size = UDim2.new(1,0,1,0),
                                        TextStrokeTransparency = 0,
                                        TextSize = 13,
                                        Font = Enum.Font.Code,
                                        Theme = "Text",
                                        Position = UDim2.new(0, 5, 0, -12),
                                        Parent = Dropdown.Elements.DropdownHolder,
                                        ZIndex = 54,
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                    });
                                end;
                                --
                                Dropdown.Elements.MultiboxContentFrame = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Visible = false,
                                    Size = UDim2.new(1, 0, 0, 10),
                                    Position = UDim2.new(100, 0, 1, 6),
                                    ZIndex = 57,
                                    Theme = "Border2",
                                }); table.insert(Menu.Ignores.Dropdowns, Dropdown.Elements.MultiboxContentFrame)
                                --
                                Dropdown.Elements.MultiboxContentFrameInner = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.MultiboxContentFrame,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 57,
                                    Theme = "Border1",
                                });
                                --
                                Dropdown.Elements.MultiboxContentFrameInner1 = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.MultiboxContentFrameInner,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 57,
                                    Theme = "Dark Contrast",
                                });
                                --
                                Dropdown.Elements.MultiboxContentHolder = Menu:NewDrawing("ScrollingFrame", {
                                    ZIndex = 57,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, -6, 1, -6),
                                    Position = UDim2.new(0, 3, 0, 3),
                                    Parent = Dropdown.Elements.MultiboxContentFrameInner1,
                                    ScrollBarThickness = 0,
                                    ScrollingEnabled = false,
                                });
                                --
                                Dropdown.Elements.MultiboxDrag = Menu:NewDrawing("TextButton", {
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 1, 0),
                                    ZIndex = 54,
                                    Text = "",
                                })
                                --
                                Dropdown.Elements.DropdownGradient = Menu:NewDrawing("ImageLabel", {
                                    BackgroundTransparency = 1;
                                    ZIndex = 54;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Image = "http://www.roblox.com/asset/?id=14103381473";
                                });
                                Dropdown.Section:UpdateSize(28);
            
                                -- Connections
                                Menu:Connection(Dropdown.Elements.DropdownHolder.MouseEnter, function()
                                    Menu:ChangeObjectTheme(Dropdown.Elements.DropdownFrame, "Frame", "Accent");
                                end);
                                --
                                Menu:Connection(Dropdown.Elements.DropdownHolder.MouseLeave, function()
                                    Menu:ChangeObjectTheme(Dropdown.Elements.DropdownFrame, "Frame", "Border2");
                                end);
                                --
                                Menu:Connection(Dropdown.Elements.MultiboxDrag.MouseButton1Click, function()
                                    for _, drop in next, Menu.Ignores.Dropdowns do
                                        if drop ~= Dropdown.Elements.MultiboxContentFrame then
                                            drop.Visible = false;
                                            drop.Position = UDim2.new(100, 0, 1, 6);
                                        end;
                                    end;
                                    for _, ic in next, Menu.Ignores.Icons do
                                        if ic ~= Dropdown.Elements.DropdownIcon then
                                            ic.Image = "http://www.roblox.com/asset/?id=14103232768";
                                        end;
                                    end;
                                    Dropdown.Elements.MultiboxContentFrame.Visible = not Dropdown.Elements.MultiboxContentFrame.Visible
                                    Dropdown.Elements.MultiboxContentFrame.Position = (Dropdown.Elements.MultiboxContentFrame.Visible and UDim2.new(0, 0, 1, 6) or UDim2.new(100, 0, 1, 6))
                                    Dropdown.Elements.DropdownIcon.Image = (Dropdown.Elements.MultiboxContentFrame.Visible and "http://www.roblox.com/asset/?id=14103560832" or "http://www.roblox.com/asset/?id=14103232768")
                                    --Dropdown.Elements.DropdownIcon.Position = (Dropdown.Elements.MultiboxContentFrame.Visible and UDim2.new(1, -92,0, -90) or UDim2.new(1, -85,0, -40))
                                end)
            
                                -- Layout
                                local Layout = Instance.new("UIListLayout")
                                Layout.Parent = Dropdown.Elements.MultiboxContentHolder
                                Layout.SortOrder = Enum.SortOrder.LayoutOrder
                                Layout.Padding = UDim.new(0,3);
            
                                -- Handler
                                local count = 0
                                local countindex = {}
                                local startindex = 0
            
                                local chosen = max and {}
            
                                local function handleoptionclick(option, button, text)
                                    button.MouseButton1Click:Connect(function()
                                        for opt, tbl in next, Dropdown.OptionInsts do
                                            if opt ~= option then
                                                Menu:ChangeObjectTheme(tbl.text, "Text", "Text")
                                            end
                                        end
                                        chosen = option
                                        Dropdown.Elements.ValueTitle.Text = option
                                        Menu:ChangeObjectTheme(text, "Text", "Accent")
                                        Menu.Flags[Dropdown.Flag] = option
                                        Dropdown.Callback(option)
                                    end)
                                end
            
                                local function createoptions(tbl)
                                    for _, option in next, tbl do
                                        Dropdown.OptionInsts[option] = {}
            
                                        countindex[option] = count + 1
            
                                        local button = Menu:NewDrawing("TextButton", {
                                            BackgroundTransparency = 1,
                                            Size = UDim2.new(1, 0, 0, 16),
                                            ZIndex = 58,
                                            Parent = Dropdown.Elements.MultiboxContentHolder,
                                            Text = "",
                                        })
            
                                        Dropdown.OptionInsts[option].button = button
            
                                        local Title = Menu:NewDrawing("TextLabel", {
                                            Text = option,
                                            Size = UDim2.new(1,0,1,0),
                                            TextSize = 13,
                                            Font = Enum.Font.Code,
                                            Position = UDim2.new(0, 2, 0, -2),
                                            Theme = "Text",
                                            ZIndex = 59,
                                            Parent = button,
                                            TextXAlignment = Enum.TextXAlignment.Left,
                                        })
                                        local TitleShadow = Menu:NewDrawing("TextLabel", {
                                            Text = option,
                                            Size = UDim2.new(1,0,1,0),
                                            TextSize = 13,
                                            Font = Enum.Font.Code,
                                            Color = Color3.fromRGB(),
                                            Position = UDim2.new(0, 3, 0, -1),
                                            Parent = button,
                                            ZIndex = 58,
                                            TextXAlignment = Enum.TextXAlignment.Left,
                                        })
            
                                        -- // Highlight
                                        Menu:Connection(button.MouseEnter, function()
                                            Menu:ChangeObjectTheme(Title, "Text", "Accent")
                                            Title.Position = UDim2.new(0, 5, 0, -2)
                                            TitleShadow.Position = UDim2.new(0, 6, 0, -1)
                                        end)
                                        Menu:Connection(button.MouseLeave, function()
                                            local theme = chosen == option and "Accent" or "Text"
                                            Menu:ChangeObjectTheme(Title, "Text", theme)
                                            Title.Position = UDim2.new(0, 2, 0, -2)
                                            TitleShadow.Position = UDim2.new(0, 3, 0, -1)
                                        end)
                                        count = count + 1
                                        Dropdown.OptionInsts[option].text = Title
                                        if Dropdown.Max then
                                            if count < Dropdown.Max then
                                                Dropdown.Elements.MultiboxContentFrame.Size =
                                                    UDim2.new(1, 0, 0, (count * 18) + 6)
                                            end
                                        else
                                            Dropdown.Elements.MultiboxContentFrame.Size =
                                                UDim2.new(1, 0, 0, (count * 18) + 6)
                                        end
            
                                        handleoptionclick(option, button, Title)
                                    end
                                end
            
                                createoptions(Dropdown.Options)
            
                                --// Scroll
                                if Dropdown.Max then
                                    Dropdown.Elements.MultiboxContentHolder.ScrollingEnabled = true
                                end
            
                                function Dropdown:Set(option, lol)
                                    for opt, tbl in next, Dropdown.OptionInsts do
                                        if opt ~= option then
                                            Menu:ChangeObjectTheme(tbl.text, "Text", "Text")
                                        end
                                    end
                                    if table.find(Dropdown.Options, option) then
                                        chosen = option
                                        Dropdown.Elements.ValueTitle.Text = option
                                        Menu:ChangeObjectTheme(Dropdown.OptionInsts[option].text, "Text", "Accent")
                                        Menu.Flags[Dropdown.Flag] = chosen
                                        if lol then 
                                            Dropdown.Section:UpdateSize(28);
                                        end;
                                        Dropdown.Callback(chosen)
                                    else
                                        chosen = nil
                                        Dropdown.Elements.ValueTitle.Text = ""
                                        Menu.Flags[Dropdown.Flag] = chosen
                                        Dropdown.Callback(chosen)
                                    end
                                end
                                --
                                function Dropdown:Refresh(tbl)
                                    content = table.clone(tbl)
                                    count = 0
                                    for _, opt in next, Dropdown.OptionInsts do
                                        coroutine.wrap(function()
                                            opt.button:Remove()
                                        end)()
                                    end
                                    table.clear(Dropdown.OptionInsts)
            
                                    createoptions(tbl)
            
                                    Dropdown.Elements.ValueTitle.Text = ""
            
                                    if max then
                                        table.clear(chosen)
                                    else
                                        chosen = nil
                                    end
            
                                    Menu.Flags[Dropdown.Flag] = chosen
                                    Dropdown.Callback(chosen)
                                end;
            
                                -- Returning
                                Menu.Ignores.Flags[Dropdown.Flag] = Dropdown
                                Dropdown:Set(Dropdown.State, true)
                                Dropdown.Elements.MultiboxContentFrame.Visible = false
                                return Dropdown
                            end;
                            --
                            function Sections:Multibox(Properties)
                                if not Properties then
                                    Properties = {}
                                end
                                --
                                local Dropdown = {
                                    Window = self.Window,
                                    Page = self.Page,
                                    Section = self,
                                    Open = false,
                                    Name = Properties.Name,
                                    Options = (Properties.options or Properties.Options or Properties.values or Properties.Values or {
                                        "1",
                                        "2",
                                        "3",
                                    }),
                                    State = (
                                        Properties.state
                                        or Properties.State
                                        or Properties.def
                                        or Properties.Def
                                        or Properties.default
                                        or Properties.Default
                                        or nil
                                    ),
                                    Max = (Properties.max or Properties.Max or Properties.maximum or Properties.Maximum or nil),
                                    Callback = (
                                        Properties.callback
                                        or Properties.Callback
                                        or Properties.callBack
                                        or Properties.CallBack
                                        or function() end
                                    ),
                                    Flag = (
                                        Properties.flag
                                        or Properties.Flag
                                        or Properties.pointer
                                        or Properties.Pointer
                                        or Menu.NextFlag()
                                    ),
                                    Size = Properties.size or Properties.Size or 38,
                                    OptionInsts = {},
                                    Elements = {},
                                };
            
                                -- Elements
                                Dropdown.Elements.DropdownHolder = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Section.Elements.SectionContent,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 0, Dropdown.Name and 38 or 24),
                                    ZIndex = 53,
                                });
                                --
                                Dropdown.Elements.DropdownFrame = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.DropdownHolder,
                                    Visible = true,
                                    Size = UDim2.new(1, -8, 0, 20),
                                    Position = UDim2.new(0, 4, 1, -22),
                                    ZIndex = 54,
                                    Theme = "Border2",
                                });
                                --
                                Dropdown.Elements.ValueTitle = Menu:NewDrawing("TextLabel", {
                                    Visible = true,
                                    Text = "",
                                    Size = UDim2.new(1,-30,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Position = UDim2.new(0, 5, 0, 0),
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    ZIndex = 55,
                                    ClipsDescendants = true,
                                })
                                --
                                Dropdown.Elements.DropdownFrameInner = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Visible = true,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 54,
                                    Theme = "Border1",
                                });
                                --
                                Dropdown.Elements.DropdownFrameInner2 = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.DropdownFrameInner,
                                    Visible = true,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 54,
                                    Theme = "Light Contrast",
                                });
                                --
                                Dropdown.Elements.DropdownIcon = Menu:NewDrawing("ImageLabel", {
                                    Parent = Dropdown.Elements.DropdownFrameInner2,
                                    Visible = true,
                                    Image = "http://www.roblox.com/asset/?id=14103232768", -- Arrow_Down
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(0, 9, 0, 6),
                                    Position = UDim2.new(1, -14, 0, 5),
                                    ZIndex = 54,
                                    --Theme = "Accent",
                                }); table.insert(Menu.Ignores.Icons, Dropdown.Elements.DropdownIcon);
                                --
                                if Dropdown.Name then
                                    Dropdown.Elements.Title = Menu:NewDrawing("TextLabel", {
                                        Text = Dropdown.Name or "Title",
                                        Size = UDim2.new(1,0,1,0),
                                        TextStrokeTransparency = 0,
                                        TextSize = 13,
                                        Font = Enum.Font.Code,
                                        Theme = "Text",
                                        Position = UDim2.new(0, 5, 0, -12),
                                        Parent = Dropdown.Elements.DropdownHolder,
                                        ZIndex = 54,
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                    });
                                end;
                                --
                                Dropdown.Elements.MultiboxContentFrame = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Visible = false,
                                    Size = UDim2.new(1, 0, 0, 10),
                                    Position = UDim2.new(100, 0, 1, 6),
                                    ZIndex = 57,
                                    Theme = "Border2",
                                }); table.insert(Menu.Ignores.Dropdowns, Dropdown.Elements.MultiboxContentFrame)
                                --
                                Dropdown.Elements.MultiboxContentFrameInner = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.MultiboxContentFrame,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 57,
                                    Theme = "Border1",
                                });
                                --
                                Dropdown.Elements.MultiboxContentFrameInner1 = Menu:NewDrawing("Frame", {
                                    Parent = Dropdown.Elements.MultiboxContentFrameInner,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 57,
                                    Theme = "Dark Contrast",
                                });
                                --
                                Dropdown.Elements.MultiboxContentHolder = Menu:NewDrawing("ScrollingFrame", {
                                    ZIndex = 57,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, -6, 1, -6),
                                    Position = UDim2.new(0, 3, 0, 3),
                                    Parent = Dropdown.Elements.MultiboxContentFrameInner1,
                                    ScrollBarThickness = 0,
                                    ScrollingEnabled = false,
                                });
                                --
                                Dropdown.Elements.MultiboxDrag = Menu:NewDrawing("TextButton", {
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 1, 0),
                                    ZIndex = 54,
                                    Text = "",
                                })
                                --
                                Dropdown.Elements.DropdownGradient = Menu:NewDrawing("ImageLabel", {
                                    BackgroundTransparency = 1;
                                    ZIndex = 54;
                                    Size = UDim2.new(1, -2, 1, -2);
                                    Position = UDim2.new(0, 1, 0, 1);
                                    Parent = Dropdown.Elements.DropdownFrame,
                                    Image = "http://www.roblox.com/asset/?id=14103381473";
                                });
                                Dropdown.Section:UpdateSize(28);
            
                                -- Connections
                                Menu:Connection(Dropdown.Elements.DropdownHolder.MouseEnter, function()
                                    Menu.ThemeObjects.Objects[Dropdown.Elements.DropdownFrame] = Menu.Theme["Accent"];
                                    Dropdown.Elements.DropdownFrame.BackgroundColor3 = Menu.Theme["Accent"];
                                end);
                                --
                                Menu:Connection(Dropdown.Elements.DropdownHolder.MouseLeave, function()
                                    Menu.ThemeObjects.Objects[Dropdown.Elements.DropdownFrame] = Menu.Theme["Border2"];
                                    Dropdown.Elements.DropdownFrame.BackgroundColor3 = Menu.Theme["Border2"];
                                end);
                                --
                                Menu:Connection(Dropdown.Elements.MultiboxDrag.MouseButton1Click, function()
                                    for _, drop in next, Menu.Ignores.Dropdowns do
                                        if drop ~= Dropdown.Elements.MultiboxContentFrame then
                                            drop.Visible = false;
                                            drop.Position = UDim2.new(100, 0, 1, 6);
                                        end;
                                    end;
                                    for _, ic in next, Menu.Ignores.Icons do
                                        if ic ~= Dropdown.Elements.DropdownIcon then
                                            ic.Image = "http://www.roblox.com/asset/?id=14103232768";
                                        end;
                                    end;
                                    Dropdown.Elements.MultiboxContentFrame.Visible = not Dropdown.Elements.MultiboxContentFrame.Visible
                                    Dropdown.Elements.MultiboxContentFrame.Position = (Dropdown.Elements.MultiboxContentFrame.Visible and UDim2.new(0, 0, 1, 6) or UDim2.new(100, 0, 1, 6))
                                    Dropdown.Elements.DropdownIcon.Image = (Dropdown.Elements.MultiboxContentFrame.Visible and "http://www.roblox.com/asset/?id=14103560832" or "http://www.roblox.com/asset/?id=14103232768")
                                    --Dropdown.Elements.DropdownIcon.Position = (Dropdown.Elements.MultiboxContentFrame.Visible and UDim2.new(1, -92,0, -90) or UDim2.new(1, -85,0, -40))
                                end)
            
                                -- Layout
                                local Layout = Instance.new("UIListLayout")
                                Layout.Parent = Dropdown.Elements.MultiboxContentHolder
                                Layout.SortOrder = Enum.SortOrder.LayoutOrder
                                Layout.Padding = UDim.new(0,3);
            
                                -- Handler
                                local optioninstances = {}
                                local count = 0
                                local countindex = {}
                                local startindex = 0
            
                                local chosen = Dropdown.Max and {}
            
                                local function handleoptionclick(option, button, text)
                                    button.MouseButton1Click:Connect(function()
                                        if Dropdown.Max then
                                            if table.find(chosen, option) then
                                                table.remove(chosen, table.find(chosen, option))
            
                                                local textchosen = {}
                                                local cutobject = false
            
                                                for _, opt in next, chosen do
                                                    table.insert(textchosen, opt)
                                                end
            
                                                Dropdown.Elements.ValueTitle.Text = #chosen == 0 and "" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")
            
                                                Menu:ChangeObjectTheme(text, "Text", "Text")
            
                                                Menu.Flags[Dropdown.Flag] = chosen
                                                Dropdown.Callback(chosen)
                                            else
                                                if #chosen == Dropdown.Max then
                                                    Menu:ChangeObjectTheme(optioninstances[chosen[1]].text, "Text", "Text")
            
                                                    table.remove(chosen, 1)
                                                end
            
                                                table.insert(chosen, option)
            
                                                local textchosen = {}
                                                local cutobject = false
            
                                                for _, opt in next, chosen do
                                                    table.insert(textchosen, opt)
                                                end
            
                                                Dropdown.Elements.ValueTitle.Text = #chosen == 0 and "" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")
                                                Menu:ChangeObjectTheme(text, "Text", "Accent")
            
                                                Menu.Flags[Dropdown.Flag] = chosen
                                                Dropdown.Callback(chosen)
                                            end
                                        end
                                    end)
                                end
            
                                local function createoptions(tbl)
                                    for _, option in next, tbl do
                                        optioninstances[option] = {}
            
                                        countindex[option] = count + 1
            
                                        local button = Menu:NewDrawing("TextButton", {
                                            BackgroundTransparency = 1,
                                            Size = UDim2.new(1, 0, 0, 16),
                                            ZIndex = 58,
                                            Parent = Dropdown.Elements.MultiboxContentHolder,
                                            Text = "",
                                        })
            
                                        optioninstances[option].button = button
            
                                        local Title = Menu:NewDrawing("TextLabel", {
                                            Text = option,
                                            Size = UDim2.new(1,0,1,0),
                                            TextSize = 13,
                                            Font = Enum.Font.Code,
                                            Position = UDim2.new(0, 2, 0, -2),
                                            Theme = "Text",
                                            ZIndex = 59,
                                            Parent = button,
                                            TextXAlignment = Enum.TextXAlignment.Left,
                                        })
                                        local TitleShadow = Menu:NewDrawing("TextLabel", {
                                            Text = option,
                                            Size = UDim2.new(1,0,1,0),
                                            TextSize = 13,
                                            Font = Enum.Font.Code,
                                            Color = Color3.fromRGB(),
                                            Position = UDim2.new(0, 3, 0, -1),
                                            Parent = button,
                                            ZIndex = 58,
                                            TextXAlignment = Enum.TextXAlignment.Left,
                                        })
            
                                        -- // Highlight
                                        Menu:Connection(button.MouseEnter, function()
                                            Menu:ChangeObjectTheme(Title, "Text", "Accent")
                                            Title.Position = UDim2.new(0, 5, 0, -2)
                                            TitleShadow.Position = UDim2.new(0, 6, 0, -1)
                                        end)
                                        Menu:Connection(button.MouseLeave, function()
                                            local theme = table.find(chosen, option) and "Accent" or "Text"
                                            Menu:ChangeObjectTheme(Title,"Text",  theme)
                                            Title.Position = UDim2.new(0, 2, 0, -2)
                                            TitleShadow.Position = UDim2.new(0, 3, 0, -1)
                                        end)
            
                                        optioninstances[option].text = Title
                                        count = count + 1
                                        if Dropdown.ScrollMax then
                                            if count < Dropdown.ScrollMax then
                                                Dropdown.Elements.MultiboxContentFrame.Size =
                                                    UDim2.new(1, 0, 0, (count * 18) + 6)
                                            end
                                        else
                                            Dropdown.Elements.MultiboxContentFrame.Size =
                                                UDim2.new(1, 0, 0, (count * 18) + 6)
                                        end
            
                                        handleoptionclick(option, button, Title)
                                    end
                                end
            
                                createoptions(Dropdown.Options)
            
                                --// Scroll
                                if Dropdown.ScrollMax then
                                    Dropdown.Elements.MultiboxContentHolder.ScrollingEnabled = true
                                end
                                --
                                local set
                                set = function(option)
                                    if Dropdown.Max then
                                        table.clear(chosen)
                                        option = type(option) == "table" and option or {}
            
                                        for opt, tbl in next, optioninstances do
                                            if not table.find(option, opt) then
                                                --tbl.button.Transparency = 0
                                                Menu:ChangeObjectTheme(tbl.text, "Text", "Text")
                                            end
                                        end
            
                                        for i, opt in next, option do
                                            if table.find(Dropdown.Options, opt) and #chosen < Dropdown.Max then
                                                table.insert(chosen, opt)
                                                Menu:ChangeObjectTheme(optioninstances[opt].text, "Text", "Accent")
                                            end
                                        end
            
                                        local textchosen = {}
                                        local cutobject = false
            
                                        for _, opt in next, chosen do
                                            table.insert(textchosen, opt)
                                        end
            
                                        Dropdown.Elements.ValueTitle.Text = #chosen == 0 and ""
                                            or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")
            
                                        Menu.Flags[Dropdown.Flag] = chosen
                                        Dropdown.Callback(chosen)
                                    end
                                end
                                --
                                function Dropdown:Set(option)
                                    set(option)
                                end
                                --
                                function Dropdown:Refresh(tbl)
                                    content = table.clone(tbl)
                                    count = 0
            
                                    for _, opt in next, optioninstances do
                                        coroutine.wrap(function()
                                            opt.button:Remove()
                                        end)()
                                    end
            
                                    table.clear(optioninstances)
            
                                    createoptions(tbl)
            
                                    value.Text = ""
            
                                    if Dropdown.Max then
                                        table.clear(chosen)
                                    else
                                        chosen = nil
                                    end
            
                                    Menu.Flags[Dropdown.Flag] = chosen
                                    Dropdown.Callback(chosen)
                                end
            
                                -- // Returning
                                Menu.Ignores.Flags[Dropdown.Flag] = set
                                Dropdown:Set(Dropdown.State)
                                Dropdown.Elements.MultiboxContentFrame.Visible = false
                                return Dropdown
                            end;
                            --
                            function Sections:Keybind(Properties)
                                local Properties = Properties or {}
                                local Keybind = {
                                    Section = self,
                                    Name = Properties.name or Properties.Name or "Keybind",
                                    State = (
                                        Properties.state
                                        or Properties.State
                                        or Properties.def
                                        or Properties.Def
                                        or Properties.default
                                        or Properties.Default
                                        or nil
                                    ),
                                    Mode = (Properties.mode or Properties.Mode or "Toggle"),
                                    Callback = (
                                        Properties.callback
                                        or Properties.Callback
                                        or Properties.callBack
                                        or Properties.CallBack
                                        or function() end
                                    ),
                                    Flag = (
                                        Properties.flag
                                        or Properties.Flag
                                        or Properties.pointer
                                        or Properties.Pointer
                                        or Menu.NextFlag()
                                    ),
                                    Binding = nil,
                                }
                                local Key
                                local State = false
                                local Section = Keybind.Section
            
                                -- // Elements
                                local KeybindHolder = Menu:NewDrawing("Frame", {
                                    Parent = Keybind.Section.Elements.SectionContent,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 0, 12),
                                    ZIndex = 53,
                                })
                                --
                                local KeyFrame1 = Menu:NewDrawing("Frame", {
                                    Parent = KeybindHolder,
                                    Visible = true,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(0, 75, 0, 14),
                                    Position = UDim2.new(1, -79, 0, -3),
                                    ZIndex = 53,
                                    Theme = "Border2",
                                })
                                --
                                local KeyFrame2 = Menu:NewDrawing("Frame", {
                                    Parent = KeyFrame1,
                                    Visible = true,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 53,
                                    Theme = "Border1",
                                });
                                --
                                local KeyFrame = Menu:NewDrawing("Frame", {
                                    Parent = KeyFrame2,
                                    Visible = true,
                                    BackgroundTransparency = 0,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 53,
                                    Theme = "Dark Contrast",
                                })
                                Menu:Connection(KeybindHolder.MouseEnter, function()
                                    Menu.ThemeObjects.Objects[KeyFrame1] = Menu.Theme["Accent"];
                                    KeyFrame1.BackgroundColor3 = Menu.Theme["Accent"];
                                end)
                                --
                                Menu:Connection(KeybindHolder.MouseLeave, function()
                                    Menu.ThemeObjects.Objects[KeyFrame1] = Menu.Theme["Border2"];
                                    KeyFrame1.BackgroundColor3 = Menu.Theme["Border2"];
                                end)
                                --
                                local Title = Menu:NewDrawing("TextLabel", {
                                    Text = Keybind.Name,
                                    Size = UDim2.new(1,0,1,0),
                                    TextStrokeTransparency = 0,
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Position = UDim2.new(0, 5, 0, 0),
                                    Parent = KeybindHolder,
                                    ZIndex = 54,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                })
                                --
                                local ValueTitle = Menu:NewDrawing("TextLabel", {
                                    Text = "none",
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Position = UDim2.new(0, 0, 0, -1),
                                    TextStrokeTransparency = 0,
                                    Parent = KeyFrame,
                                    ZIndex = 54,
                                    TextXAlignment = Enum.TextXAlignment.Center,
                                })
                                local KeybindThing = Menu:NewDrawing("TextButton", {
                                    Parent = KeybindHolder,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1,0, 1, 0),
                                    Position = UDim2.new(0,0, 0, 0),
                                    ZIndex = 54,
                                    Text = "",
                                })
                                --
                                local mode_frame1 = Menu:NewDrawing("Frame", {
                                    Size = UDim2.new(0, 47, 0, 53),
                                    Position = UDim2.new(1, 5, 0, -10),
                                    Parent = KeybindHolder,
                                    ZIndex = 60,
                                    Visible = false,
                                    Theme = "Border2",
                                })
                                --
                                local mode_frame2 = Menu:NewDrawing("Frame", {
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    Parent = mode_frame1,
                                    ZIndex = 60,
                                    Visible = true,
                                    Theme = "Border1",
                                })
                                --
                                local mode_frame = Menu:NewDrawing("Frame", {
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    Parent = mode_frame2,
                                    ZIndex = 60,
                                    Visible = true,
                                    Theme = "Dark Contrast",
                                })
                                --
                                local holdbutton = Menu:NewDrawing("TextButton", {
                                    Color = Color3.new(0, 0, 0),
                                    Size = UDim2.new(0, 44, 0, 12),
                                    Position = UDim2.new(0, 0, 0, 2),
                                    Parent = mode_frame,
                                    ZIndex = 60,
                                    BackgroundTransparency = 1,
                                    Text = "",
                                })
                                --
                                local togglebutton = Menu:NewDrawing("TextButton", {
                                    Color = Color3.new(0, 0, 0),
                                    Size = UDim2.new(0, 44, 0, 12),
                                    Position = UDim2.new(0, 0, 0, 20),
                                    Parent = mode_frame,
                                    ZIndex = 60,
                                    BackgroundTransparency = 1,
                                    Text = "",
                                })
                                local alwaysbutton = Menu:NewDrawing("TextButton", {
                                    Color = Color3.new(0, 0, 0),
                                    Size = UDim2.new(0, 44, 0, 12),
                                    Position = UDim2.new(0, 0, 0, 36),
                                    Parent = mode_frame,
                                    ZIndex = 60,
                                    BackgroundTransparency = 1,
                                    Text = "",
                                })
                                local holdtext = Menu:NewDrawing("TextLabel", {
                                    Text = "Hold",
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Color = Keybind.Mode == "Hold" and Color3.new(1,1,1) or Color3.fromRGB(180,180,180),
                                    Position = UDim2.new(0, 0, 0, 0),
                                    ZIndex = 60,
                                    Parent = holdbutton,
                                    TextStrokeTransparency = 0,
                                })
                                --
                                local toggletext = Menu:NewDrawing("TextLabel", {
                                    Text = "Toggle",
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Color = Keybind.Mode == "Toggle" and Color3.new(1,1,1) or Color3.fromRGB(180,180,180),
                                    Position = UDim2.new(0, 0, 0, -1),
                                    ZIndex = 60,
                                    Parent = togglebutton,
                                    TextStrokeTransparency = 0,
                                })
                                --
                                local alwaystext = Menu:NewDrawing("TextLabel", {
                                    Text = "Always",
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Color = Keybind.Mode == "Always" and Color3.new(1,1,1) or Color3.fromRGB(180,180,180),
                                    Position = UDim2.new(0, 0, 0, 0),
                                    ZIndex = 60,
                                    Parent = alwaysbutton,
                                    TextStrokeTransparency = 0,
                                })
                                --
            
                                -- // Misc Functions
                                local function set(newkey)
                                    if string.find(tostring(newkey), "Enum") then
                                        if c then
                                            c:Disconnect()
                                            if Keybind.Flag then
                                                Menu.Flags[Keybind.Flag] = false
                                            end
                                            Keybind.Callback(false)
                                        end
                                        if tostring(newkey):find("Enum.KeyCode.") then
                                            newkey = Enum.KeyCode[tostring(newkey):gsub("Enum.KeyCode.", "")]
                                        elseif tostring(newkey):find("Enum.UserInputType.") then
                                            newkey = Enum.UserInputType[tostring(newkey):gsub("Enum.UserInputType.", "")]
                                        end
                                        if newkey == Enum.KeyCode.Backspace then
                                            Key = nil
            
                                            local text = "none"
                                            local sizeX = Menu:GetTextLength("[" .. text .. "]").X
            
                                            ValueTitle.Text = text
                                        elseif newkey ~= nil then
                                            Key = newkey
            
                                            local text = (Menu.Keys[newkey] or tostring(newkey):gsub("Enum.KeyCode.", ""))
                                            local sizeX = Menu:GetTextLength("[" .. text .. "]").X
            
                                            ValueTitle.Text = text:lower()
                                        end
            
                                        Menu.Flags[Keybind.Flag .. "_KEY"] = newkey
                                    elseif table.find({ "Always", "Toggle", "Hold" }, newkey) then
                                        Menu.Flags[Keybind.Flag .. "_KEY STATE"] = newkey
                                        Keybind.Mode = newkey
                                        if Keybind.Mode == "Always" then
                                            State = true
                                            if Keybind.Flag then
                                                Menu.Flags[Keybind.Flag] = State
                                            end
                                            Keybind.Callback(true)
                                        end
                                    else
                                        State = newkey
                                        if Keybind.Flag then
                                            Menu.Flags[Keybind.Flag] = newkey
                                        end
                                        Keybind.Callback(newkey)
                                    end
                                end
                                --
                                set(Keybind.State)
                                set(Keybind.Mode)
                                KeybindThing.MouseButton1Click:Connect(function()
                                    if not Keybind.Binding then
                                        local sizeX = Menu:GetTextLength("[-]").X
            
                                        ValueTitle.Text = "binding..."
            
                                        Keybind.Binding = Menu:Connection(
                                            game:GetService("UserInputService").InputBegan,
                                            function(input, gpe)
                                                set(
                                                    input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode
                                                        or input.UserInputType
                                                )
                                                Menu:Disconnect(Keybind.Binding)
                                                task.wait()
                                                Keybind.Binding = nil
                                            end
                                        )
                                    end
                                end)
                                --
                                Menu:Connection(game:GetService("UserInputService").InputBegan, function(inp)
                                    if (inp.KeyCode == Key or inp.UserInputType == Key) and not Keybind.Binding then
                                        if Keybind.Mode == "Hold" then
                                            if Keybind.Flag then
                                                Menu.Flags[Keybind.Flag] = true
                                            end
                                            c = Menu:Connection(game:GetService("RunService").RenderStepped, function()
                                                if Keybind.Callback then
                                                    Keybind.Callback(true)
                                                end
                                            end)
                                        elseif Keybind.Mode == "Toggle" then
                                            State = not State
                                            if Keybind.Flag then
                                                Menu.Flags[Keybind.Flag] = State
                                            end
                                            Keybind.Callback(State)
                                        end
                                    end
                                end)
                                --
                                Menu:Connection(game:GetService("UserInputService").InputEnded, function(inp)
                                    if Keybind.Mode == "Hold" then
                                        if Key ~= "" or Key ~= nil then
                                            if inp.KeyCode == Key or inp.UserInputType == Key then
                                                if c then
                                                    c:Disconnect()
                                                    if Keybind.Flag then
                                                        Menu.Flags[Keybind.Flag] = false
                                                    end
                                                    if Keybind.Callback then
                                                        Keybind.Callback(false)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end)
                                --
                                holdbutton.MouseButton1Click:Connect(function()
                                    set("Hold")
                                    holdtext.TextColor3 = Color3.new(1,1,1)
                                    toggletext.TextColor3 = Color3.fromRGB(180,180,180)
                                    alwaystext.TextColor3 = Color3.fromRGB(180,180,180)
                                    mode_frame1.Visible = false
                                end)
                                togglebutton.MouseButton1Click:Connect(function()
                                    set("Toggle")
                                    holdtext.TextColor3 = Color3.fromRGB(180,180,180)
                                    toggletext.TextColor3 = Color3.new(1,1,1)
                                    alwaystext.TextColor3 = Color3.fromRGB(180,180,180)
                                    mode_frame1.Visible = false
                                end)
                                alwaysbutton.MouseButton1Click:Connect(function()
                                    set("Always")
                                    holdtext.TextColor3 = Color3.fromRGB(180,180,180)
                                    toggletext.TextColor3 = Color3.fromRGB(180,180,180)
                                    alwaystext.TextColor3 = Color3.new(1,1,1)
                                    mode_frame1.Visible = false
                                end)
                                KeybindThing.MouseButton2Click:Connect(function()
                                    mode_frame1.Visible = true
                                end)
                                Keybind.Section:UpdateSize(28)
                                --
                                Menu.Flags[Keybind.Flag .. "_KEY"] = Keybind.State
                                Menu.Flags[Keybind.Flag .. "_KEY STATE"] = Keybind.Mode
                                Menu.Ignores.Flags[Keybind.Flag] = set
                                Menu.Ignores.Flags[Keybind.Flag .. "_KEY"] = set
                                Menu.Ignores.Flags[Keybind.Flag .. "_KEY STATE"] = set
                                --
                                function Keybind:Set(key)
                                    set(key)
                                end
            
                                -- // Returning
                                return Keybind
                            end;
                            --
                            function Sections:Colorpicker(Properties)
                                if not Properties then
                                    Properties = {}
                                end
                                --
                                local Colorpicker = {
                                    Window = self.Window,
                                    Page = self.Page,
                                    Section = self,
                                    Name = (Properties.name or Properties.Name or Properties.text or Properties.Text or "Colorpicker"),
                                    State = (
                                        Properties.state
                                        or Properties.State
                                        or Properties.def
                                        or Properties.Def
                                        or Properties.default
                                        or Properties.Default
                                        or Color3.fromRGB(255, 0, 0)
                                    ),
                                    Alpha = (
                                        Properties.alpha
                                        or Properties.Alpha
                                        or Properties.transparency
                                        or Properties.Transparency
                                        or 1
                                    ),
                                    Callback = (
                                        Properties.callback
                                        or Properties.Callback
                                        or Properties.callBack
                                        or Properties.CallBack
                                        or function() end
                                    ),
                                    Flag = (
                                        Properties.flag
                                        or Properties.Flag
                                        or Properties.pointer
                                        or Properties.Pointer
                                        or Menu.NextFlag()
                                    ),
                                    Colorpickers = 0,
                                }
            
                                -- // Elements
                                local ColorpickerHolder = Menu:NewDrawing("Frame", {
                                    Parent = Colorpicker.Section.Elements.SectionContent,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 0, 12),
                                    ZIndex = 53,
                                })
                                --
                                local Title = Menu:NewDrawing("TextLabel", {
                                    Text = Colorpicker.Name,
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Theme = "Text",
                                    Position = UDim2.new(0, 5, 0, 0),
                                    Parent = ColorpickerHolder,
                                    TextStrokeTransparency = 0,
                                    ZIndex = 54,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                })
                                Colorpicker.Section:UpdateSize(28)
            
            
                                -- // Functions
                                Colorpicker.Colorpickers = Colorpicker.Colorpickers + 1
                                local colorpickertypes = Menu:NewPicker(
                                    Properties.Title or "Color",
                                    Colorpicker.State,
                                    Colorpicker.Alpha,
                                    ColorpickerHolder,
                                    Colorpicker.Colorpickers - 1,
                                    Colorpicker.Flag,
                                    Colorpicker.Callback,
                                    Colorpicker.Section
                                )
                                --
                                function Colorpicker:Set(color)
                                    colorpickertypes:set(color, false, true)
                                end
            
                                -- // Returning
                                return Colorpicker, colorpickertypes
                            end;
                            --
                            function Sections:Textbox(Properties)
                                if not Properties then
                                    Properties = {}
                                end
                                --
                                local Textbox = {
                                    Window = self.Window,
                                    Page = self.Page,
                                    Section = self,
                                    Name = (Properties.name or Properties.Name or Properties.text or Properties.Text or "Textbox"),
                                    Placeholder = (
                                        Properties.placeholder
                                        or Properties.Placeholder
                                        or Properties.holder
                                        or Properties.Holder
                                        or ""
                                    ),
                                    State = (
                                        Properties.state
                                        or Properties.State
                                        or Properties.def
                                        or Properties.Def
                                        or Properties.default
                                        or Properties.Default
                                        or ""
                                    ),
                                    Callback = (
                                        Properties.callback
                                        or Properties.Callback
                                        or Properties.callBack
                                        or Properties.CallBack
                                        or function() end
                                    ),
                                    Flag = (
                                        Properties.flag
                                        or Properties.Flag
                                        or Properties.pointer
                                        or Properties.Pointer
                                        or Menu.NextFlag()
                                    ),
                                }
                                local Section = Textbox.Section
            
                                -- // Elements
                                local TextboxHolder = Menu:NewDrawing("Frame", {
                                    Parent = Textbox.Section.Elements.SectionContent,
                                    Visible = true,
                                    BackgroundTransparency = 1,
                                    Size = UDim2.new(1, 0, 0, 20),
                                    ZIndex = 51,
                                })
                                local TextboxFrame = Menu:NewDrawing("Frame", {
                                    Parent = TextboxHolder,
                                    Visible = true,
                                    Size = UDim2.new(1, -8, 0, 20),
                                    Position = UDim2.new(0, 4, 0, 0),
                                    ZIndex = 56,
                                    Theme = "Border2";
                                });
                                local TextboxFrame1 = Menu:NewDrawing("Frame", {
                                    Parent = TextboxFrame,
                                    Visible = true,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 56,
                                    Theme = "Border1";
                                });
                                local TextboxFrame2 = Menu:NewDrawing("Frame", {
                                    Parent = TextboxFrame1,
                                    Visible = true,
                                    Size = UDim2.new(1, -2, 1, -2),
                                    Position = UDim2.new(0, 1, 0, 1),
                                    ZIndex = 56,
                                    Theme = "Dark Contrast";
                                });
                                local Text = Menu:NewDrawing("TextBox", {
                                    Size = UDim2.new(1,0,1,0),
                                    TextSize = 13,
                                    Font = Enum.Font.Code,
                                    Color = Color3.fromRGB(255,255,255),
                                    TextWrapped = true,
                                    Text = Textbox.State,
                                    PlaceholderText = Textbox.Placeholder,
                                    TextStrokeTransparency = 0,
                                    Parent = TextboxFrame2,
                                    ZIndex = 56,
                                    ClearTextOnFocus = false,
                                })
                                Textbox.Section:UpdateSize(28)
            
                                Menu:Connection(TextboxHolder.MouseEnter, function()
                                    Menu.ThemeObjects.Objects[TextboxFrame] = Menu.Theme["Accent"];
                                    TextboxFrame.BackgroundColor3 = Menu.Theme["Accent"];
                                end)
                                --
                                Menu:Connection(TextboxHolder.MouseLeave, function()
                                    Menu.ThemeObjects.Objects[TextboxFrame] = Menu.Theme["Border2"];
                                    TextboxFrame.BackgroundColor3 = Menu.Theme["Border2"];
                                end)
            
                                -- // Input
                                Text.FocusLost:Connect(function()
                                    Textbox.Callback(Text.Text)
                                    Menu.Flags[Textbox.Flag] = Text.Text
                                end)
            
                                local function set(str)
                                    Text.Text = str
                                    Menu.Flags[Textbox.Flag] = str
                                    Textbox.Callback(str)
                                end
            
                                -- // Returning
                                Menu.Ignores.Flags[Textbox.Flag] = set
            
                                return Textbox
                            end;
                        end;
                        --
                        do -- Init
                            Flags = Menu.Flags;
                            Pointers = Menu.Ignores.Flags;
                        end;
                    end)();
                end;
                --
                do -- Tweening
                    LPH_JIT_MAX(function()
                        do -- Easying styles
                            Tween.EasingStyle = {
                                [Enum.EasingStyle.Linear] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return Delta
                                    end,
                        
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return Delta
                                    end,
                        
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        return Delta
                                    end
                                },
                                [Enum.EasingStyle.Cubic] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return Delta^3
                                    end,
                        
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return (Delta - 1)^3 + 1
                                    end,
                        
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.5 then
                                            return (4 * Delta)^3
                                        else
                                            return (4 * (Delta - 1))^3 + 1
                                        end
                                    end
                                },
                                [Enum.EasingStyle.Quad] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return Delta^2
                                    end,
                        
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return -(Delta - 1)^2 + 1
                                    end,
                        
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.5 then
                                            return (2 * Delta)^2
                                        else
                                            return (-2 * (Delta - 1))^2 + 1
                                        end
                                    end
                                },
                                [Enum.EasingStyle.Quart] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return Delta^4
                                    end,
                        
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return -(Delta - 1)^4 + 1
                                    end,
                        
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.5 then
                                            return (8 * Delta)^4
                                        else
                                            return (-8 * (Delta - 1))^4 + 1
                                        end
                                    end
                                },
                                [Enum.EasingStyle.Quint] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return Delta^5
                                    end,
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return (Delta - 1)^5 + 1
                                    end,
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.5 then
                                            return (16 * Delta)^5
                                        else
                                            return (16 * (Delta - 1))^5 + 1
                                        end
                                    end
                                },
                                [Enum.EasingStyle.Sine] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return Sin(Pi / 2 * Delta - Pi / 2)
                                    end,
                        
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return Sin(Pi / 2 * Delta)
                                    end,
                        
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        return 0.5 * Sin(Pi * Delta - Pi / 2) + 0.5
                                    end
                                },
                                [Enum.EasingStyle.Exponential] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return 2^(10 * Delta - 10) - 0.001
                                    end,
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return 1.001 * -2^(-10 * Delta) + 1
                                    end,
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.5 then
                                            return 0.5 * 2^(20 * Delta - 10) - 0.0005
                                        else
                                            return 0.50025 * -2^(-20 * Delta + 10) + 1
                                        end
                                    end
                                },
                                [Enum.EasingStyle.Back] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return Delta^2 * (Delta * (1.70158 + 1) - 1.70158)
                                    end,
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return (Delta - 1)^2 * ((Delta - 1) * (1.70158 + 1) + 1.70158) + 1
                                    end,
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.5 then
                                            return (2 * Delta * Delta) * ((2 * Delta) * (2.5949095 + 1) - 2.5949095)
                                        else
                                            return 0.5 * ((Delta * 2) - 2)^2 * ((Delta * 2 - 2) * (2.5949095 + 1) + 2.5949095) + 1
                                        end
                                    end
                                },
                                [Enum.EasingStyle.Bounce] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        if Delta <= 0.25 / 2.75 then
                                            return -7.5625 * (1 - Delta - 2.625 / 2.75)^2 + 0.015625
                                        elseif Delta <= 0.75 / 2.75 then
                                            return -7.5625 * (1 - Delta - 2.25 / 2.75)^2 + 0.0625
                                        elseif Delta <= 1.75 / 2.75 then
                                            return -7.5625 * (1 - Delta - 1.5 / 2.75)^2 + 0.25
                                        else
                                            return 1 - 7.5625 * (1 - Delta)^2
                                        end
                                    end,
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        if Delta <= 1 / 2.75 then
                                            return 7.5625 * (Delta * Delta)
                                        elseif Delta <= 2 / 2.75 then
                                            return 7.5625 * (Delta - 1.5 / 2.75)^2 + 0.75
                                        elseif Delta <= 2.5 / 2.75 then
                                            return 7.5625 * (Delta - 2.25 / 2.75)^2 + 0.9375
                                        else
                                            return 7.5625 * (Delta - 2.625 / 2.75)^2 + 0.984375
                                        end
                                    end,
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.125 / 2.75 then
                                            return 0.5 * (-7.5625 * (1 - Delta * 2 - 2.625 / 2.75)^2 + 0.015625)
                                        elseif Delta <= 0.375 / 2.75 then
                                            return 0.5 * (-7.5625 * (1 - Delta * 2 - 2.25 / 2.75)^2 + 0.0625)
                                        elseif Delta <= 0.875 / 2.75 then
                                            return 0.5 * (-7.5625 * (1 - Delta * 2 - 1.5 / 2.75)^2 + 0.25)
                                        elseif Delta <= 0.5 then
                                            return 0.5 * (1 - 7.5625 * (1 - Delta * 2)^2)
                                        elseif Delta <= 1.875 / 2.75 then
                                            return 0.5 + 3.78125 * (2 * Delta - 1)^2
                                        elseif Delta <= 2.375 / 2.75 then
                                            return 3.78125 * (2 * Delta - 4.25 / 2.75)^2 + 0.875
                                        elseif Delta <= 2.625 / 2.75 then
                                            return 3.78125 * (2 * Delta - 5 / 2.75)^2 + 0.96875
                                        else
                                            return 3.78125 * (2 * Delta - 5.375 / 2.75)^2 + 0.9921875
                                        end
                                    end
                                },
                                [Enum.EasingStyle.Elastic] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return -2^(10 * (Delta - 1)) * Sin(Pi * 2 * (Delta - 1 - 0.3 / 4) / 0.3)
                                    end,
                        
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return 2^(-10 * Delta) * Sin(Pi * 2 * (Delta - 0.3 / 4) / 0.3) + 1
                                    end,
                        
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.5 then
                                            return -0.5 * 2^(20 * Delta - 10) * Sin(Pi * 2 * (Delta * 2 - 1.1125) / 0.45)
                                        else
                                            return 0.5 * 2^(-20 * Delta + 10) * Sin(Pi * 2 * (Delta * 2 - 1.1125) / 0.45) + 1
                                        end
                                    end
                                },
                                [Enum.EasingStyle.Circular] = {
                                    [Enum.EasingDirection.In] = function(Delta)
                                        return -Sqrt(1 - Delta^2) + 1
                                    end,
                        
                                    [Enum.EasingDirection.Out] = function(Delta)
                                        return Sqrt(-(Delta - 1)^2 + 1)
                                    end,
                        
                                    [Enum.EasingDirection.InOut] = function(Delta)
                                        if Delta <= 0.5 then
                                            return -Sqrt(-Delta^2 + 0.25) + 0.5
                                        else
                                            return Sqrt(-(Delta - 1)^2 + 0.25) + 0.5
                                        end
                                    end
                                };
                            };
                        end;
                    end)();
                end;
                --
                do -- Math
                    LPH_JIT_MAX(function()
                        function Math:RoundVector(Vector)
                            if Vector then
                                if typeof(Vector) == "Vector2" then
                                    return Vector2.new(Round(Vector.X), Round(Vector.Y));
                                else
                                    return Vector2.new(Round(Vector.X), Round(Vector.Y), Round(Vector.Z));
                                end;
                            end;
                        end;
                        --
                        function Math:RotateVector(Vector, Angle)
                            local Cosine = Cos(Rad(Angle)); 
                            local Sine = Sin(Rad(Angle)); 
                            return Vector2.new(Cosine * Vector.X - Sine * Vector.Y, Sine * Vector.X + Cosine * Vector.Y);
                        end;
                        -- 
                        function Math:ToRotate(Angle)
                            return Vector2.new(Sin(Rad(Angle)), Cos(Rad(Angle)))
                        end;
                        --
                        function Math:Conversion(Studs, Unit)
                            local Meters = Floor(Studs / Math.Measurements.Meters[2]);
                            if Unit ~= "Studs" and Unit ~= "Meters" then
                                return Floor(Studs * Math.Measurements[Unit][2]);
                            elseif Unit == "Meters" then
                                return Floor(Meters);
                            end;
                            return Studs;
                        end;
                        --
                        function Math:DegToRad(Deg)
                            return Deg * (Pi / 180);
                        end;
                        --
                        function Math:RadToDeg(Rad)
                            return Rad * (180 / Pi);
                        end;
                        --
                        function Math:Shift(num) 
                            return num * 10;
                        end;
                        --
                        function Math:Hash(Value)
                            local sum = 0;
                            local res = {};
                            local idx = 1;
                            local i = 1;
                            for i = 1, #Value do sum = sum + Value:byte(i,i) end

                            while #res < 32 do
                                local c = idx <= #Value and Value:byte(idx,idx) or res[idx % (#Value + 1) + 1] 
                                i = bit.bxor(i * c^2, sum)
                                res[#res + 1] = Floor(Abs(Sin(c + i)) * 255)
                                idx = idx + 1
                            end
                            --
                            while idx <= #Value do 
                                local c = Value:byte(idx,idx)
                                i = bit.bxor(i * c^2, sum * res[idx % 32 + 1])
                                res[idx % 33 + 1] = Floor(Abs(Sin(c + i)) * 255)
                                idx = idx + 1
                            end
                            --
                            local out = "";
                            for i,v in pairs(res) do
                                local c = string.format("%x", v)
                                c = (#c == 1 and "0" or "") .. c;
                                out = out .. c;
                            end;
                            return out;
                        end;  
                    end)();
                end;
                --
                do -- Character
                    LPH_NO_VIRTUALIZE(function()
                        function Character:GetBodyParts(Character, RootPart, Indexes, Hitboxes)
                            local Parts = {}
                            local Hitboxes = Hitboxes or {"Head", "Torso", "Arms", "Legs"}
                            --
                            if Character then   
                                for Index, Part in pairs(Character:GetChildren()) do
                                    if Part:IsA("BasePart") and Part ~= RootPart then
                                        if Find(Hitboxes, "Head") and Part.Name:lower():find("head") then
                                            Parts[Indexes and Part.Name or #Parts + 1] = Part
                                        elseif Find(Hitboxes, "Torso") and Part.Name:lower():find("torso") then
                                            Parts[Indexes and Part.Name or #Parts + 1] = Part
                                        elseif Find(Hitboxes, "Arms") and Part.Name:lower():find("arm") then
                                            Parts[Indexes and Part.Name or #Parts + 1] = Part
                                        elseif Find(Hitboxes, "Legs") and Part.Name:lower():find("leg") then
                                            Parts[Indexes and Part.Name or #Parts + 1] = Part
                                        elseif (Find(Hitboxes, "Arms") and Part.Name:lower():find("hand")) or (Find(Hitboxes, "Legs ") and Part.Name:lower():find("foot")) then
                                            Parts[Indexes and Part.Name or #Parts + 1] = Part
                                        end;
                                    end;
                                end;
                            end;
                            --
                            return Parts
                        end;
                        --
                        function Character:GetCharacter(Player)
                            return Player.Character;
                        end;
                        --
                        function Character:GetTeam(Player)
                            return Player.Team;
                        end;
                        --
                        function Character:GetHealth(Type, Name, Character)
                            if Character then
                                local Humanoid = FindFirstChildOfClass(Character, "Humanoid");
                                if Humanoid then
                                    return Floor(Humanoid.Health), Floor(Humanoid.MaxHealth);
                                end;
                            end;
                            return 100, 100
                        end; 
                        -- 
                        function Character:GetWeapon(Type, Name, Character)
                            if Type == "Player" then
                                if Character then
                                    local Player = FindFirstChild(ReplicatedStorage.Players, Name);
                                    if Player and FindFirstChild(Player, "Status") and FindFirstChild(Player.Status, "GameplayVariables") and FindFirstChild(Player.Status.GameplayVariables, "EquippedTool") and Player.Status.GameplayVariables.EquippedTool.Value then
                                        local Equipped = Player.Status.GameplayVariables.EquippedTool.Value;
                                        return tostring(Equipped);
                                    end;
                                end;
                            end;
                            return "None";
                        end;
                        --
                        function Character:GetBoundingBox(RootPart)
                            local RootPosition, Onscreen = WorldToViewportPoint(CurrentCamera, RootPart.p);
                            local ScaleFactor = 1 / (RootPosition.Z * Tan(Rad(CurrentCamera.FieldOfView / 2)) * 2) * 1000;
                            local Width, Height = 4 * ScaleFactor, 6.5 * ScaleFactor;
                            local BottomOffset = 4;
                            local LeftOffset = 2;
                    
                            if CustomX and CustomY then
                                Width *= CustomX;
                                Height *= CustomY;
                            else
                                Width *= ScreenSize.X / 1920;
                                Height *= ScreenSize.Y / 1080;
                            end;
                    
                            -- Sizing
                            local BoxSize = Math:RoundVector(Vector2.new(Max(Width, CustomX and 5 or 6), Max(Height, CustomY and 5 or 10)));
                            local BoxPosition = Math:RoundVector(Vector2.new(RootPosition.X - Width / 2, RootPosition.Y - Height / 2));
                            local BoxCenter = Vector2.new(BoxPosition.X + BoxSize.X / 2, BoxPosition.Y + BoxSize.Y / 2)
                    
                            return BoxSize, BoxPosition, Onscreen;
                        end;
                    end)();
                end;
                --
                do -- Protected Space
                    if not Panichook.Locals.ProtectedSpace then
                        Panichook.Locals.ProtectedGUISpace = Instance.new("ScreenGui", gethui());
                        Panichook.Locals.ProtectedSpace = Instance.new("ScreenGui", gethui());
                        Panichook.Locals.ProtectedSpace.IgnoreGuiInset = true;
                    end;
                end;
                --
                do -- Visuals
                    LPH_NO_VIRTUALIZE(function()
                        function Visuals:Create(Player, Model)
                            if not rawget(self, "__index") then 
                                Visuals.__index = Visuals; 
                            end;            
                            --
                            local Self = setmetatable({
                                Player = Player;
                                Model = Model;
                                Info = {
                                    Refreshrate = tick();
                                    Tick = tick();
                                    Passed = false;
                                    BodyParts = {};
                                    TransitionStart = 0;
                                    TransitionNewHealth = 100;
                                    TransitionOldHealth = 100;
                                    CurrentOldHealth = 100;
                                    ActualHealth = 100;
                                };
                                Components = {};
                                BodyParts = {};
                                Highlight = Panichook:Instance("Highlight", {Parent = Panichook.Locals.ProtectedSpace});
                                Adornments = {};
                                Refreshrate = 0;
                                Type = Player.UserId == 0 and "Bot" or "Player";
                            }, self);
                            --
                            do -- Renders
                                do -- Box
                                    Self.Components.Render = Panichook:Instance("Frame", {
                                        Parent = Panichook.Locals.ProtectedSpace;
                                        Visible = true;
                                        BackgroundTransparency = 1;
                                    });
                                    --
                                    do -- Box
                                        Self.Components.Box = Panichook:Instance("Frame", {
                                            Parent = Self.Components.Render;
                                            Visible = true;
                                            BackgroundTransparency = 1;
                                        });
                                        --
                                        Self.Components.BoxStroke = Panichook:Instance("UIStroke", {
                                            Parent = Self.Components.Box;
                                            Color = Color3.fromRGB(255, 255, 255);
                                            LineJoinMode = Enum.LineJoinMode.Miter;
                                        });
                                        --
                                        Self.Components.BoxGradient = Panichook:Instance("UIGradient", {
                                            Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},
                                            Parent = Self.Components.BoxStroke;
                                        });
                                    end;
                                    --
                                    do -- Outlines
                                        Self.Components.BoxOutlineTop = Panichook:Instance("Frame", {
                                            BorderSizePixel = 0;
                                            Parent = Self.Components.Box;
                                            Visible = true;
                                            BackgroundColor3 = Color3.new();
                                            Position = UDim2.new(0, -1, 0, -1);
                                            Size = UDim2.new(1, 2, 0, -1);
                                        });
                                        --
                                        Self.Components.BoxOutlineBottom = Panichook:Instance("Frame", {
                                            BorderSizePixel = 0;
                                            Parent = Self.Components.Box;
                                            Visible = true;
                                            BackgroundColor3 = Color3.new();
                                            Position = UDim2.new(0, -1, 1, 1);
                                            Size = UDim2.new(1, 2, 0, 1);
                                        });
                                        --
                                        Self.Components.BoxOutlineLeft = Panichook:Instance("Frame", {
                                            BorderSizePixel = 0;
                                            Parent = Self.Components.Box;
                                            Visible = true;
                                            BackgroundColor3 = Color3.new();
                                            Position = UDim2.new(0, -1, 0, -2);
                                            Size = UDim2.new(0, -1, 1, 4);
                                        });
                                        --
                                        Self.Components.BoxOutlineRight = Panichook:Instance("Frame", {
                                            BorderSizePixel = 0;
                                            Parent = Self.Components.Box;
                                            Visible = true;
                                            BackgroundColor3 = Color3.new();
                                            Position = UDim2.new(1, 2, 0, -2);
                                            Size = UDim2.new(0, -1, 1, 4);
                                        });
                                    end;
                                    --
                                    do -- Inlines
                                        Self.Components.BoxInlineTop = Panichook:Instance("Frame", {
                                            BorderSizePixel = 0;
                                            Parent = Self.Components.Box;
                                            Visible = true;
                                            BackgroundColor3 = Color3.new();
                                            Position = UDim2.new(0, 0, 0, 1);
                                            Size = UDim2.new(1, 0, 0, -1);
                                        });
                                        --
                                        Self.Components.BoxInlineBottom = Panichook:Instance("Frame", {
                                            BorderSizePixel = 0;
                                            Parent = Self.Components.Box;
                                            Visible = true;
                                            BackgroundColor3 = Color3.new();
                                            Position = UDim2.new(0, 0, 1, 0);
                                            Size = UDim2.new(1, 0, 0, -1);
                                        });
                                        --
                                        Self.Components.BoxInlineLeft = Panichook:Instance("Frame", {
                                            BorderSizePixel = 0;
                                            Parent = Self.Components.Box;
                                            Visible = true;
                                            BackgroundColor3 = Color3.new();
                                            Position = UDim2.new(0, 1, 0, 0);
                                            Size = UDim2.new(0, -1, 1, 0);
                                        });
                                        --
                                        Self.Components.BoxInlineRight = Panichook:Instance("Frame", {
                                            BorderSizePixel = 0;
                                            Parent = Self.Components.Box;
                                            Visible = true;
                                            BackgroundColor3 = Color3.new();
                                            Position = UDim2.new(1, 0, 0, 0);
                                            Size = UDim2.new(0, -1, 1, 0);
                                        });
                                    end;
                                end;
                                --
                                do -- Text
                                    do -- Visible Icon
                                        Self.Components.Visible = Panichook:Instance("ImageLabel", {
                                            Parent = Self.Components.Box; 
                                            Visible = true; 
                                            AnchorPoint = Vector2.new(0.5, 0.5); 
                                            Position = UDim2.new(0.5, 0, 0, -11); 
                                            BackgroundTransparency = 1; 
                                            Size = UDim2.new(0,25,0,25); 
                                            Image = "http://www.roblox.com/asset/?id=14239920245"
                                        });
                                    end;
                                    --
                                    do -- Name
                                        Self.Components.Name = Panichook:Instance("TextLabel", {
                                            Parent = Self.Components.Box;
                                            Position =  UDim2.new(0.5, 0, 0, -11);
                                            Size = UDim2.new(0, 100, 0, -20);
                                            AnchorPoint = Vector2.new(0.5, 0.5);
                                            BackgroundTransparency = 1;
                                            TextColor3 = Color3.fromRGB(255, 255, 255);
                                            FontFace = Font.new(Font:GetRegistry("menu_font")),
                                            TextSize = 8;
                                            TextStrokeTransparency = 0;
                                            TextStrokeColor3 = Color3.fromRGB(0,0,0);
                                            Text = Player.Name;
                                            RichText = true;
                                        });
                                        --
                                        Self.Components.NameGradient = Panichook:Instance("UIGradient", {
                                            Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},
                                            Parent = Self.Components.Name;
                                        });
                                    end;
                                    --
                                    do -- Distance
                                        Self.Components.Distance = Panichook:Instance("TextLabel", {
                                            Parent = Self.Components.Box;
                                            Position =  UDim2.new(0.5, 0, 1, 10);
                                            Size = UDim2.new(0,100,0,-20);
                                            AnchorPoint = Vector2.new(0.5,0.5);
                                            BackgroundTransparency = 1;
                                            TextColor3 = Color3.fromRGB(255, 255, 255);
                                            FontFace = Font.new(Font:GetRegistry("menu_font")),
                                            TextSize = 8;
                                            TextStrokeTransparency = 0;
                                            TextStrokeColor3 = Color3.fromRGB(0,0,0);
                                            RichText = true;
                                        });
                                        --
                                        Self.Components.DistanceGradient = Panichook:Instance("UIGradient", {
                                            Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},
                                            Parent = Self.Components.Distance;
                                        });
                                    end;
                                    --
                                    do -- Weapon
                                        Self.Components.Weapon = Panichook:Instance("TextLabel", {
                                            Parent = Self.Components.Box;
                                            Position =  UDim2.new(0.5, 0, 1, 20);
                                            Size = UDim2.new(0,100,0,-20);
                                            AnchorPoint = Vector2.new(0.5,0.5);
                                            BackgroundTransparency = 1;
                                            TextColor3 = Color3.fromRGB(255, 255, 255);
                                            FontFace = Font.new(Font:GetRegistry("menu_font")),
                                            TextSize = 8;
                                            TextStrokeTransparency = 0;
                                            TextStrokeColor3 = Color3.fromRGB(0,0,0);
                                            RichText = true;
                                        });
                                        --
                                        Self.Components.WeaponGradient = Panichook:Instance("UIGradient", {
                                            Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},
                                            Parent = Self.Components.Weapon;
                                        });
                                    end;
                                end;
                                --
                                do -- Healthbar
                                    Self.Components.HealthbarOutline = Panichook:Instance("Frame", {
                                        Parent = Self.Components.Box;
                                        BorderSizePixel = 0;
                                        Size = UDim2.new(0, 6, 1, 0);
                                        Visible = true;
                                    });
                                    --
                                    Self.Components.Healthbar = Panichook:Instance("Frame", {
                                        Parent = Self.Components.Box;
                                        BorderSizePixel = 0;
                                        Size = UDim2.new(0, 6, 1, 0);
                                        Visible = true;
                                        BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                                    });
                                    --
                                    Self.Components.HealthbarGradient = Panichook:Instance("UIGradient", {
                                        Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))},
                                        Parent = Self.Components.Healthbar;
                                    });
                                end;
                            end;
                            --
                            self.Cache[Player] = Self;
                            return Self;
                        end;
                        --
                        function Visuals:GetObject(Object)
                            return self.Cache[Object];
                        end;
                        -- 
                        function Visuals:Update()
                            local Player = rawget(self, "Player");
                            local Type = rawget(self, "Type");
                            local Components = rawget(self,"Components");
                            local Highlight = rawget(self, "Highlight");
                            local Adornments = rawget(self, "Adornments");
                            local Refreshrate = rawget(self, "Refreshrate");
                            local Info = rawget(self, "Info");
                            local CurrentTeam = Character:GetTeam(Player) == Character:GetTeam(LocalPlayer);
                            local Selection = (CurrentTeam and "Friendly" or "Enemy");
                            
                            -- Body
                            local Client = Character:GetCharacter(LocalPlayer);
                            local Model = Type == "Player" and Character:GetCharacter(Player) or rawget(self, "Model");
                            local Root;
                            local Humanoid;
                            local Head;
                            local LocalHead;
                            local BodyParts;

                            -- Alive check
                            if Client and Model then
                                Root = FindFirstChild(Model, "HumanoidRootPart");
                                Humanoid = FindFirstChildOfClass(Model, "Humanoid");
                                Head = FindFirstChild(Model, "Head");
                                LocalHead = FindFirstChild(Character:GetCharacter(LocalPlayer), "Head");

                                -- Dead check
                                if Flags[Selection .. " ESP"] and (Root and Humanoid and Head) then
                                    local Continue = true;
                                    local CurrentHealth, MaxHealth = Character:GetHealth(Type, Player.Name, Model);
                                    if CurrentHealth and MaxHealth then
                                        if CurrentHealth <= 0 then
                                            Info.Passed = false;
                                        else
                                            Info.Passed = true;
                                            Info.CurrentHealth = CurrentHealth;
                                            Info.MaxHealth = MaxHealth;
                                            Info.RootCFrame = Root.CFrame;
                                            --
                                            if Type == "Bot" and not Flags["AI ESP"] then
                                                Info.Passed = false;
                                            else
                                                Info.Passed = true;
                                            end;
                                        end;
                                    end;
                                else
                                    Info.Passed = false;
                                end;
                            else
                                Info.Passed = false;
                            end;

                            -- Fading 
                            local TransparencyMultplier = 1;
                            if Info.Passed then
                                Info.Tick = tick();
                            else
                                local FadeTime = Flags["Animations"] and Find(Flags["Selected Animations"], "On Death") and Flags["Fadeout Time"] / 1000 or 0 / 1000;
                                local Value = Info.Tick - tick();
                                --
                                if Value <= FadeTime then
                                    TransparencyMultplier = Clamp((Value + FadeTime) * 1 / FadeTime, 0, 1);
                                else
                                    Info.Passed = false;
                                    Info.CurrentHealth = nil;
                                    Info.MaxHealth = nil;
                                    Info.RootCFrame = nil;
                                end;
                            end;

                            -- ESP
                            if Info.RootCFrame and Info.CurrentHealth and Info.MaxHealth then
                                local BoxSize, BoxPosition, Onscreen = Character:GetBoundingBox(Info.RootCFrame);
                                local Conversion = Math:Conversion(Floor((Info.RootCFrame.p - CurrentCamera.CFrame.p).Magnitude), Flags["Distance Measurment"]);
                                local CurrentWeapon = Character:GetWeapon(Type, Player.Name, Model);
                                local TopOffset = 10;
                                local LeftOffset = 5;
                                local BottomOffset = 8;
                                local PassedChecks = true;
                                local MaxDistance = Flags["ESP Max Distance"];
                                if MaxDistance < Conversion then PassedChecks = false; end;

                                -- Animations
                                if Flags["Animations"] and Find(Flags["Selected Animations"], "On Health Change") then
                                    if Info.CurrentOldHealth ~= Info.CurrentHealth or Info.TransitionStart ~= 0 then
                                        if Info.TransitionStart == 0 then
                                            Info.TransitionStart = tick();
                                            Info.TransitionNewHealth = Info.CurrentHealth;
                                            Info.TransitionOldHealth = Info.CurrentOldHealth;
                                        elseif Info.TransitionOldHealth ~= Info.CurrentOldHealth then
                                            local CurrentTime = tick() - Info.TransitionStart;
                                            local TransitionProgress = Min(1, CurrentTime / (Flags["Health Change Time"] / 100))
                                            Info.TransitionOldHealth = Info.TransitionOldHealth * (1 - TransitionProgress) + Info.TransitionNewHealth * TransitionProgress
                                            Info.TransitionNewHealth = Info.CurrentHealth;
                                            Info.TransitionStart = tick();
                                        end;
                                        --
                                        local CurrentTime = tick() - Info.TransitionStart;
                                        local TransitionProgress = Min(1, CurrentTime / (Flags["Health Change Time"] / 100))
                                        local CurrentHealth = Info.TransitionOldHealth * (1 - TransitionProgress) + Info.TransitionNewHealth * TransitionProgress;
                                        Info.ActualHealth = CurrentHealth;
                                        --
                                        if TransitionProgress >= 1 then
                                            Info.TransitionStart = 0;
                                            Info.TransitionNewHealth = 0;
                                            Info.TransitionOldHealth = Info.CurrentHealth;
                                            Info.CurrentOldHealth = Info.CurrentHealth;
                                        end
                                    else
                                        Info.ActualHealth = Info.CurrentHealth;
                                    end;
                                else
                                    Info.ActualHealth = Info.CurrentHealth;
                                end;

                                -- Adornment Chams
                                if (tick() - Info.Refreshrate) > (Flags[Selection .. " Chams Refresh Rate"] or 10) then
                                    Info.Refreshrate = tick();
                                    for Index, Value in pairs(Model and Model:GetChildren() or {}) do
                                        if not Adornments[Value] then 
                                            if not Value:IsA("Folder") and Value.ClassName ~= "Model" and Value.Name ~= "HumanoidRootPart" and Value.Name ~= "HeadCollider" and Value.Name ~= "Humanoid" and Value:IsA("BasePart") then 
                                                local Chams = {};
                                                for i2 = 1, 2 do 
                                                    local Adornment;
                                                    if Value.Name == "Head"  then 
                                                        local Wrap = FindFirstChildOfClass(Value, "WrapTarget");
                                                        Adornment = Panichook:Instance("CylinderHandleAdornment", {
                                                            Parent = Value;
                                                            Height = Value.Size.y + 0.3;
                                                            Radius = Value.Size.X * (Wrap and 0.45 or 0.275) + 0.2;
                                                            CFrame = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 1, 0));
                                                        });
                                                        if i2 == 1 then 
                                                            Adornment.Radius -= 0.2;
                                                            Adornment.Height -= 0.2;
                                                            Adornment.Transparency -= 0.1;
                                                        end;
                                                    else 
                                                        Adornment = Panichook:Instance("BoxHandleAdornment", {
                                                            Parent = Value;
                                                            Size = Value.Size + Vector3.new(0.2, 0.2, 0.2);
                                                        });
                                                        if i2 == 1 then
                                                            Adornment.Size -= Vector3.new(0.25, 0.25, 0.25)
                                                        end;
                                                    end;
                                                    
                                                    Adornment.Name = i2 == 1 and "cms" or "cmso";
                                                    Adornment.Adornee = Value;
                                                    Adornment.ZIndex = i2 == 1 and 2 or 1;
                                                    Adornment.AlwaysOnTop = i2 == 1;
                                                    Chams[i2] = Adornment;
                                                end;
                                                Adornments[Value] = Chams;
                                            end;
                                        end;
                                        if Adornments[Value] then
                                            if Onscreen and Flags[Selection .. " Chams"] and Flags[Selection .. " Chams Style"] == "Adornment" and PassedChecks then
                                                local FillTransparency = 1 - (0 + (Flags[Selection .. " Chams Fill Color"].Transparency) * TransparencyMultplier);
                                                local OutlineTransparency = 1 - (0 + (Flags[Selection .. " Chams Outline Color"].Transparency) * TransparencyMultplier);

                                                do -- Fill
                                                    Adornments[Value][2].Visible = true;
                                                    Adornments[Value][2].Transparency = OutlineTransparency;
                                                    Adornments[Value][2].Color3 = Flags[Selection .. " Chams Outline Color"] and Flags[Selection .. " Chams Outline Color"];
                                                end;
                                                --
                                                do -- Outline
                                                    Adornments[Value][1].Visible = true;
                                                    Adornments[Value][1].Transparency = FillTransparency;
                                                    Adornments[Value][1].Color3 = Flags[Selection .. " Chams Fill Color"] and Flags[Selection .. " Chams Fill Color"];
                                                end;
                                            else
                                                Adornments[Value][1].Visible = false;
                                                Adornments[Value][2].Visible = false;
                                            end;
                                        end;
                                    end;
                                end;

                                -- Highlight Chams
                                if Onscreen and Flags[Selection .. " Chams"] and Flags[Selection .. " Chams Style"] == "Highlight" and PassedChecks then
                                    Highlight.Enabled = true;
                                    Highlight.Adornee = Model;
                                    Highlight.OutlineColor = Flags[Selection .. " Chams Outline Color"] and Flags[Selection .. " Chams Outline Color"];
                                    Highlight.FillColor = Flags[Selection .. " Chams Fill Color"] and Flags[Selection .. " Chams Fill Color"];
                                    Highlight.FillTransparency = 1 - (0 + (Flags[Selection .. " Chams Outline Color"].Transparency) * TransparencyMultplier);
                                    Highlight.OutlineTransparency = 1 - (0 + (Flags[Selection .. " Chams Fill Color"].Transparency) * TransparencyMultplier);
                                else
                                    Highlight.Enabled = false;
                                end;

                                -- Main
                                if Onscreen and PassedChecks then
                                    do -- Box
                                        Components.Render.Visible = true;
                                        Components.Box.Visible = true;
                                        Components.Box.Position = UDim2.new(0, BoxPosition.X, 0, BoxPosition.Y);
                                        Components.Box.Size = UDim2.new(0, BoxSize.X, 0, BoxSize.Y);
                                        --
                                        if Flags[Selection .. " Bounding Box"] then
                                            Components.BoxStroke.Enabled = true;
                                            Components.BoxStroke.Transparency = 1 - TransparencyMultplier;
                                            Components.BoxGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Flags[Selection .. " Box Left Color"]), ColorSequenceKeypoint.new(1, Flags[Selection .. " Box Right Color"])};

                                            do -- Settings
                                                do -- Outlines
                                                    Components.BoxOutlineTop.Visible = true;
                                                    Components.BoxOutlineTop.BackgroundTransparency = 1 - TransparencyMultplier;
                                                    Components.BoxOutlineBottom.Visible = true;
                                                    Components.BoxOutlineBottom.BackgroundTransparency = 1 - TransparencyMultplier;
                                                    Components.BoxOutlineLeft.Visible = true;
                                                    Components.BoxOutlineLeft.BackgroundTransparency = 1 - TransparencyMultplier;
                                                    Components.BoxOutlineRight.Visible = true;
                                                    Components.BoxOutlineRight.BackgroundTransparency = 1 - TransparencyMultplier;
                                                end;
                                                --
                                                do -- Inlines
                                                    Components.BoxInlineTop.Visible = true;
                                                    Components.BoxInlineTop.BackgroundTransparency = 1 - TransparencyMultplier;
                                                    Components.BoxInlineBottom.Visible = true;
                                                    Components.BoxInlineBottom.BackgroundTransparency = 1 - TransparencyMultplier;
                                                    Components.BoxInlineLeft.Visible = true;
                                                    Components.BoxInlineLeft.BackgroundTransparency = 1 - TransparencyMultplier;
                                                    Components.BoxInlineRight.Visible = true;
                                                    Components.BoxInlineRight.BackgroundTransparency = 1 - TransparencyMultplier;
                                                end;
                                                --
                                                do -- Animations
                                                    local Rotation = 0;
                                                    local Time = tick();
                                                    do
                                                        do -- Settings
                                                            if Flags["Animate Box Gradients"] then
                                                                if Flags["Box Rotation Style"] ~= "Linear" then 
                                                                    local Style = Tween.EasingStyle[Enum.EasingStyle[Flags["Box Rotation Style"]]][Enum.EasingDirection[Flags["Box Rotation Direction"]]](Cos(Pi / 2 * tick() - Pi / 2))
                                                                    Rotation = Style * (Flags["Box Rotation Speed"])
                                                                else 
                                                                    Rotation = Cos(Time) * (Flags["Box Rotation Speed"]);
                                                                end;
                                                            end;
                                                        end;
                                                        --
                                                        do -- Animation
                                                            if Flags["Animate Box Gradients"] then
                                                                Components.BoxGradient.Rotation = Rotation;
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        else
                                            Components.BoxOutlineTop.Visible = false;
                                            Components.BoxOutlineBottom.Visible = false;
                                            Components.BoxOutlineLeft.Visible = false;
                                            Components.BoxOutlineRight.Visible = false;
                                            Components.BoxInlineTop.Visible = false;
                                            Components.BoxInlineBottom.Visible = false;
                                            Components.BoxInlineLeft.Visible = false;
                                            Components.BoxInlineRight.Visible = false;
                                            Components.BoxStroke.Enabled = false;
                                        end;
                                    end;
                                    --
                                    do -- Name
                                        if Flags[Selection .. " Name"] then
                                            if Flags[Selection .. " View Type"] and Type ~= "Player" then
                                                Components.Name.Text = Panichook:SurroundString(`<font color="rgb(66, 141, 245)">` .. "BOT" .. "</font> " .. Player.Name, Flags["Custom Text"] and Flags["Surround Text"] ~= "None" and Flags["Surround Text"] or "");
                                            else
                                                Components.Name.Text = Panichook:SurroundString(Player.Name, Flags["Custom Text"] and Flags["Surround Text"] ~= "None" and Flags["Surround Text"] or "");
                                            end;
                                            Components.Name.Visible = true;
                                            Components.Name.TextTransparency = 1 - TransparencyMultplier;
                                            Components.Name.TextStrokeTransparency = 1 - TransparencyMultplier;
                                            Components.Name.TextSize = Flags["Font Scale"];
                                            Components.Name.FontFace = Font.new(Font:GetRegistry("menu_font"));
                                            Components.NameGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Flags[Selection .. " Name Left Color"]), ColorSequenceKeypoint.new(1, Flags[Selection .. " Name Right Color"])};
                                            TopOffset = TopOffset + 20;
                                        else
                                            Components.Name.Visible = false;
                                        end;
                                    end;
                                    --
                                    do -- Visible 
                                        if Model and Model.PrimaryPart and Panichook.Locals.PrimaryPart == Model.PrimaryPart and FindFirstChild(Model, "Head") then
                                            Components.Visible.Visible = true;
                                            Components.Visible.Position = UDim2.new(0.5, 0, 0, -TopOffset); 
                                            if Panichook:CheckVisible(Model.Head, Flags["Wall Check Origin"]) then 
                                                Components.Visible.Image = "http://www.roblox.com/asset/?id=14239914881";
                                                Components.Visible.ImageColor3 = Color3.fromRGB(0, 255, 0);
                                                Components.Visible.ImageTransparency = 1 - TransparencyMultplier;
                                            else
                                                Components.Visible.Image = "http://www.roblox.com/asset/?id=14239920245"
                                                Components.Visible.ImageColor3 = Color3.fromRGB(255, 0, 0);
                                                Components.Visible.ImageTransparency = 1 - TransparencyMultplier;
                                            end;
                                        else
                                            Components.Visible.Visible = false;
                                            Components.Visible.Image = "http://www.roblox.com/asset/?id=14239920245";
                                        end;
                                    end;
                                    --
                                    do -- Distance
                                        if Flags[Selection .. " Distance"] then
                                            Components.Distance.Visible = true;
                                            Components.Distance.TextTransparency = 1 - TransparencyMultplier;
                                            Components.Distance.TextStrokeTransparency = 1 - TransparencyMultplier;
                                            Components.Distance.Text = Panichook:SurroundString(tostring(Conversion .. " " .. Flags["Distance Measurment"]), Flags["Custom Text"] and Flags["Surround Text"] ~= "None" and Flags["Surround Text"] or "");
                                            Components.Distance.TextSize = Flags["Font Scale"];
                                            Components.Distance.FontFace = Font.new(Font:GetRegistry("menu_font"));
                                            Components.DistanceGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Flags[Selection .. " Distance Left Color"]), ColorSequenceKeypoint.new(1, Flags[Selection .. " Distance Right Color"])};
                                            BottomOffset = BottomOffset + 10;
                                        else
                                            Components.Distance.Visible = false;
                                        end;
                                    end;
                                    --
                                    do -- Weapon
                                        if Flags[Selection .. " Weapon"] then
                                            Components.Weapon.Visible = true;
                                            Components.Weapon.TextTransparency = 1 - TransparencyMultplier;
                                            Components.Weapon.TextStrokeTransparency = 1 - TransparencyMultplier;
                                            Components.Weapon.Text = Panichook:SurroundString(CurrentWeapon, Flags["Custom Text"] and Flags["Surround Text"] ~= "None" and Flags["Surround Text"] or "");
                                            Components.Weapon.TextSize = Flags["Font Scale"];
                                            Components.Weapon.FontFace = Font.new(Font:GetRegistry("menu_font"));
                                            Components.WeaponGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Flags[Selection .. " Weapon Left Color"]), ColorSequenceKeypoint.new(1, Flags[Selection .. " Weapon Right Color"])};
                                            BottomOffset = BottomOffset + 10;
                                        else
                                            Components.Weapon.Visible = false;
                                        end;
                                    end;
                                    --
                                    do -- Healthbar
                                        if Flags[Selection .. " Healthbar"] then
                                            Components.HealthbarOutline.Visible = true;
                                            Components.HealthbarOutline.Transparency = 1 - TransparencyMultplier;
                                            Components.HealthbarOutline.Size = UDim2.new(0, 3, 0, BoxSize.Y + 2);
                                            Components.HealthbarOutline.Position = UDim2.new(0, -6, 0, -1);
                                            Components.HealthbarOutline.BackgroundColor3 = Color3.new();
                                            --
                                            Components.Healthbar.Visible = true;
                                            Components.Healthbar.Transparency = 1 - TransparencyMultplier;
                                            Components.Healthbar.Size = UDim2.new(0, 1, 0, -((BoxSize.Y + 2 - 2) * (Info.ActualHealth / Info.MaxHealth)));
                                            Components.Healthbar.Position = UDim2.new(0, -5, 1, 0);
                                            Components.HealthbarGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Flags[Selection .. " Healthbar Empty Color"]:Lerp(Flags[Selection .. " Healthbar Color"], Info.ActualHealth / Info.MaxHealth)), ColorSequenceKeypoint.new(1, Flags[Selection .. " Healthbar Empty Color"])}
                                            Components.HealthbarGradient.Rotation = 90;
                                        else
                                            Components.HealthbarOutline.Visible = false;
                                            Components.Healthbar.Visible = false;
                                        end;
                                    end;
                                else
                                    Visuals:Opacity(false, Components.Render);
                                    return;
                                end;
                            else
                                Visuals:Opacity(false, Components.Box);
                                return;
                            end;
                        end;
                        -- 
                        function Visuals:Destroy()
                            for Index, Component in pairs(self.Components) do
                                Component:Destroy();
                                self.Components[Index] = nil;
                            end;
                            Visuals.Cache[self.Player] = nil;
                        end;
                        -- 
                        function Visuals:Opacity(State, Table)
                            for Index, Component in pairs(Table:GetChildren()) do
                                if Component.ClassName and Component.ClassName ~= "UIStroke" and Component.ClassName ~= "UIGradient" then
                                    Component.Visible = State;
                                end;
                            end;
                        end;
                        --
                        function Visuals:CreateObject(Name, Flag, Object, Icon)
                            local Box = Panichook:Instance("Frame", {Parent = Panichook.Locals.ProtectedSpace; Visible = true});
                            local Image = Panichook:Instance("ImageLabel", {Parent = Box; Visible = true; AnchorPoint = Vector2.new(0.5, 0.5); Position = UDim2.new(0, 0, 0, -30); BackgroundTransparency = 1; Size = UDim2.new(0,25,0,25); Image = Icon});
                            local Label = Panichook:Instance("TextLabel", {Text = "panichook9.net"; Visible = false; Parent = Box; Position = UDim2.new(0.5,0,0,-10); Size = UDim2.new(0,100,0,-20); AnchorPoint = Vector2.new(0.5,0.5); BackgroundTransparency = 1; TextColor3 = Color3.fromRGB(255,255,255); FontFace = Font.new(Font:GetRegistry("menu_font")), TextSize = 13; TextStrokeTransparency = 0; TextStrokeColor3 = Color3.fromRGB(0,0,0); RichText = true});

                            -- Loop
                            do
                                local Updater; Updater = Panichook:Connection(RunService.PreRender, function()
                                    if (Object and Object ~= nil) then 
                                        local Position, OnScreen = WorldToViewportPoint(CurrentCamera, Object.Position)
                                        local Distance = Floor((Object.Position - CurrentCamera.CFrame.p).magnitude / 3.5714285714)

                                        -- Text
                                        if Flags[Flag] and OnScreen and Distance <= Flags[Flag .. " " .. "Max Distance"] then
                                            Image.Visible = true;
                                            Image.ImageColor3 = Flags[Flag .. " " .. "Icon Color"];
                                            Label.Visible = true;
                                            Label.Text = ("[%sm] %s"):format(Distance, Name)
                                            Label.TextColor3 = Flags[Flag .. " " .. "Text Color"];
                                            Label.TextSize = Flags[Flag .. " " .. "Font Scale"];
                                            Label.FontFace = Font.new(Font:GetRegistry("menu_font"));
                                            Box.Position = UDim2.new(0, Position.X, 0, Position.Y);
                                            Box.Position = UDim2.new(0, Position.X, 0, Position.Y);
                                            Box.Size = UDim2.new(0, 0, 0, 0);
                                            Box.Transparency = 1;
                                        else
                                            Label.Visible = false;
                                            Image.Visible = false;
                                        end;
                                    else
                                        Image:Destroy();
                                        Label:Destroy();
                                        Box:Destroy();
                                        Updater:Disconnect();
                                    end;
                                end);
                            end;
                        end;
                    end)();
                end;
                --
                do -- Panichook
                    LPH_NO_VIRTUALIZE(function()
                        do -- Tables
                            Panichook.HitsoundList = {};
                            Panichook.Hitsounds =  {
                                Neverlose = "rbxassetid://8726881116",
                                Gamesense = "rbxassetid://4817809188",
                                One = "rbxassetid://7380502345",
                                Bell = "rbxassetid://6534947240",
                                Rust = "rbxassetid://1255040462",
                                TF2 = "rbxassetid://2868331684",
                                Slime = "rbxassetid://6916371803",
                                ["Among Us"] = "rbxassetid://5700183626",
                                Minecraft = "rbxassetid://4018616850",
                                ["CS:GO"] = "rbxassetid://6937353691",
                                Saber = "rbxassetid://8415678813",
                                Baimware = "rbxassetid://3124331820",
                                Osu = "rbxassetid://7149255551",
                                ["TF2 Critical"] = "rbxassetid://296102734",
                                Bat = "rbxassetid://3333907347",
                                ["Call of Duty"] = "rbxassetid://5952120301",
                                Bubble = "rbxassetid://6534947588",
                                Pick = "rbxassetid://1347140027",
                                Pop = "rbxassetid://198598793",
                                Bruh = "rbxassetid://4275842574",
                                Bamboo = "rbxassetid://3769434519",
                                Crowbar = "rbxassetid://546410481",
                                Weeb = "rbxassetid://6442965016",
                                Beep = "rbxassetid://8177256015",
                                Bambi = "rbxassetid://8437203821",
                                Stone = "rbxassetid://3581383408",
                                ["Old Fatality"] = "rbxassetid://6607142036",
                                Click = "rbxassetid://8053704437",
                                Ding = "rbxassetid://7149516994",
                                Snow = "rbxassetid://6455527632",
                                Laser = "rbxassetid://7837461331",
                                Mario = "rbxassetid://2815207981",
                                Steve = "rbxassetid://4965083997",
                                Snowdrake = "rbxassetid://7834724809"
                            };
                            for i,v in next, Panichook.Hitsounds do Insert(Panichook.HitsoundList, i) end; 
                        end;
                        --
                        function Panichook:Instance(ClassName, Properties)
                            local Instance = Instance.new(ClassName);
                            for Index, Value in pairs(Properties) do
                                Instance[Index] = Value;
                            end;
                            return Instance;
                        end;
                        --
                        function Panichook:Connection(RBLX_Signal, Callback)
                            return RBLX_Signal:Connect(Callback);
                        end;
                        --
                        function Panichook:SurroundString(String, Surround)
                            if not Surround or Surround == "" then
                                return String;
                            end;
                            local a, b = Surround:match("(.)(.)");
                            return a .. String .. b;
                        end;
                        --
                        function Panichook:CheckVisible(Target, Origin)
                            if not Character:GetCharacter(LocalPlayer) then return false; end;
                            if not Target then return false; end;
                            if not Target.Position then return false; end;
                            if not FindFirstChild(Character:GetCharacter(LocalPlayer), "Head") then return false; end;

                            local From = Origin == "Head" and Character:GetCharacter(LocalPlayer).Head.Position or CurrentCamera.CFrame.p;
                            local Result = Raycast(workspace, From, (Target.Position - From).unit * 10000, RaycastParam);
                            if Result then
                                local Instance = Result.Instance;
                                if IsDescendantOf(Instance, Target.Parent) then
                                    return true;
                                end;
                            end;
                            return false;
                        end;
                        --
                        function Panichook:GetClosestTargetToFOV()
                            local ClosestPart = nil;
                            local ClosestVector = nil;
                            local ClosestMagnitude = Huge;
                            local SilentDistance = Huge;
                            --
                            for _, Data in pairs(Visuals.Cache) do 
                                if Data.Player ~= LocalPlayer and Character:GetCharacter(Data.Player) and Flags["Silent Aim"] then 
                                    do -- Silent aim
                                        local Model = Character:GetCharacter(Data.Player);
                                        if Model then
                                            if Model.PrimaryPart then 
                                                local Center = Vector2.new(Panichook.Locals.Drawings.FieldOfView.Position.X.Offset, Panichook.Locals.Drawings.FieldOfView.Position.Y.Offset);
                                                local ScreenPos, OnScreen = WorldToScreenPoint(CurrentCamera, Model.PrimaryPart.Position);
                                                local Health = Character:GetHealth("Player", Data.Player.Name, Model);
                                                local CurrentTeam = Character:GetTeam(Data.Player) == Character:GetTeam(LocalPlayer);

                                                if OnScreen then 
                                                    do -- Conditions
                                                        do -- Roblox Friend Check
                                                            if Find(Flags["Conditions"], "Roblox Friend Check") and IsFriendsWith(LocalPlayer, Data.Player.UserId) == "Friend" then 
                                                                continue;
                                                            end;
                                                        end;
                                                        --
                                                        do -- Distance Check
                                                            if (Model.PrimaryPart.Position - CurrentCamera.CFrame.p).Magnitude >= Flags["Max Distance"] then 
                                                                continue;
                                                            end;
                                                        end;
                                                        --
                                                        do -- Forcefield Check
                                                            if Find(Flags["Conditions"], "Forcefield Check") and FindFirstChildOfClass(Model, "ForceField") then 
                                                                continue;
                                                            end;
                                                        end;
                                                        --
                                                        do -- Team Check
                                                            if Find(Flags["Conditions"], "Team Check") and CurrentTeam then 
                                                                continue;
                                                            end;
                                                        end;
                                                        --
                                                        do -- Wall Check
                                                            if Find(Flags["Conditions"], "Wall Check") and FindFirstChild(Model, "Head") and not Panichook:CheckVisible(Model.Head, Flags["Wall Check Origin"]) then 
                                                                continue;
                                                            end;
                                                        end;
                                                        --
                                                        do -- Invisible Check
                                                            if Find(Flags["Conditions"], "Invisible Check") and FindFirstChild(Model, "Head") and Model.Head.Transparency == 1 then 
                                                                continue;
                                                            end;
                                                        end;
                                                        --
                                                        do -- Health Check
                                                            if Health <= Flags["Minimum Health"] then
                                                                continue;
                                                            end;
                                                        end;
                                                    end;

                                                    -- Main
                                                    local DistanceFromCenter = (Center - Vector2.new(ScreenPos.X, ScreenPos.Y)).Magnitude;
                                                    if DistanceFromCenter <= SilentDistance then 
                                                        if (DistanceFromCenter <= (Flags["Silent Use FOV"] and Flags["Silent FOV Radius"] * 2 or 2000)) then 
                                                            SilentDistance = DistanceFromCenter;
                                                            local BodyParts = Character:GetBodyParts(Model, Root, false, Flags["Hitboxes"]);
                                                            if Flags["Target Bone Closest To Cursor"] then
                                                                for _, Part in pairs(BodyParts) do
                                                                    local Position3, Visible2 = WorldToViewportPoint(CurrentCamera, Part.CFrame.Position)
                                                                    local Position4 = Vector2.new(Position3.X, Position3.Y)
                                                                    local Magnitude2 = (Center - Position4).Magnitude
                                                                    --
                                                                    if Position4 and Visible2 then
                                                                        if Magnitude2 <= ClosestMagnitude then
                                                                            ClosestPart = Part;
                                                                            ClosestVector = Position4;
                                                                            ClosestMagnitude = Magnitude2;
                                                                        end;
                                                                    end;
                                                                end;
    
                                                                -- Finish
                                                                if ClosestPart and ClosestVector and ClosestMagnitude then
                                                                    Panichook.Locals.CurrentSilentTarget = ClosestPart;
                                                                    Panichook.Locals.CurrentSilentName = Data.Player.Name;
                                                                    Panichook.Locals.CurrentId = Data.Player.UserId;
                                                                    Panichook.Locals.PrimaryPart = Model.PrimaryPart;
                                                                end;
                                                            else
                                                                if #BodyParts > 0 then
                                                                    ClosestPart = BodyParts[Random(1, #BodyParts)];
                                                                    Panichook.Locals.CurrentSilentTarget = ClosestPart
                                                                    Panichook.Locals.CurrentSilentName = Data.Player.Name;
                                                                    Panichook.Locals.CurrentId = Data.Player.UserId;
                                                                    Panichook.Locals.PrimaryPart = Model.PrimaryPart;
                                                                end;
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            return ClosestPart;
                        end;
                        --
                        function Panichook:RandomizeTable(Table)
                            local n = #Table;
                            while n > 0 do
                                local k = Random(n);
                                t[n], t[k] = t[k], t[n];
                                n = n - 1;
                            end;
                            return Table;
                        end;
                        --
                        function Panichook:CreateLightingConnection(Connection)
                            for Index, Value in pairs(getconnections(Connection)) do
                                Value:Disable()
                                Panichook.Locals.Lighting.Disconnected[#Panichook.Locals.Lighting.Disconnected + 1] = Value;
                            end;
                        end;
                        --
                        function Panichook:RemoveConnection()
                            for Index, Value in pairs(Panichook.Locals.Lighting.Disconnected) do 
                                Value:Enable();
                                Panichook.Locals.Lighting.Disconnected[Index] = nil;
                            end
                        end;
                        --
                        function Panichook:ChangeLighting(Property, Value)
                            Panichook.Locals.Lighting.Current[Property] = Panichook.Locals.Lighting.Current[Property] or Lighting[Property];
                            Panichook.Locals.Lighting.Changed[Property] = Value;
                            
                            Panichook:CreateLightingConnection(Lighting:GetPropertyChangedSignal(Property))
                            Panichook:CreateLightingConnection(Lighting.Changed);
                            Lighting[Property] = Value;
                            Panichook:RemoveConnection();
                        end;
                        --
                        function Panichook:RemoveLighting(Property)
                            if Panichook.Locals.Lighting.Current[Property] then
                                Panichook:CreateLightingConnection(Lighting:GetPropertyChangedSignal(Property))
                                Panichook:CreateLightingConnection(Lighting.Changed);
                                
                                Lighting[Property] = Panichook.Locals.Lighting.Current[Property];
                                Panichook.Locals.Lighting.Current[Property] = nil;
                                Panichook.Locals.Lighting.Changed[Property] = nil;
                                Panichook:RemoveConnection();
                            end;
                        end;
                        --
                        function Panichook:UpdateViewmodel()
                            local Viewmodel = WaitForChild(CurrentCamera, "ViewModel", 9e9);
                            Wait(0.5)
                            for Index, Part in next, GetDescendants(CurrentCamera.ViewModel) do
                                if Flags["Viewmodel Shirt Chams"] and (FindFirstAncestor(Part, "CamoShirt") or FindFirstAncestor(Part, "CivilianShirt") or FindFirstAncestor(Part, "GhillieTorso") or FindFirstAncestor(Part, "WastelandShirt")) then 
                                    if Part:IsA("Part") or Part:IsA("MeshPart") then 
                                        if not Flags["Viewmodel Remove Clothing"] then
                                            if Part.Transparency ~= 1 then
                                                Part.Transparency = Flags["Viewmodel Shirt Color"].Transparency;
                                            end;
                                            Part.Color = Flags["Viewmodel Shirt Color"];
                                            Part.Material = Flags["Viewmodel Shirt Chams Material"];
                                            if Part:IsA("MeshPart") and Flags["Viewmodel Shirt Chams Material"] == "ForceField" then
                                                Part.TextureID = Panichook.Locals.Textures[Flags["ForceField Texture"]];
                                            end;
                                        else
                                            Part:Destroy();
                                        end;
                                    end;
                                    if Part:IsA("SurfaceAppearance") then Part:Destroy(); end;
                                elseif Flags["Viewmodel Item Chams"] and FindFirstAncestor(Part, "Item") then 
                                    if Part:IsA("Part") or Part:IsA("MeshPart") then 
                                        if Part.Transparency ~= 1 then
                                            Part.Transparency = Flags["Viewmodel Item Color"].Transparency;
                                            Panichook:Connection(Part:GetPropertyChangedSignal("Transparency"), function()
                                                Part.Transparency = Flags["Viewmodel Item Color"].Transparency;
                                            end);
                                        end;
                                        Part.Color = Flags["Viewmodel Item Color"];
                                        Part.Material = Flags["Viewmodel Item Chams Material"];
                                        if Part:IsA("MeshPart") and Flags["Viewmodel Item Chams Material"] == "ForceField" then
                                            Part.TextureID = Panichook.Locals.Textures[Flags["ForceField Texture"]];
                                        end;
                                    end;
                                    if Part:IsA("SurfaceAppearance") then Part:Destroy(); end;
                                elseif Flags["Viewmodel Glove Chams"] and (FindFirstAncestor(Part, "HandWraps") or FindFirstAncestor(Part, "CombatGloves")) then
                                    if Part:IsA("Part") or Part:IsA("MeshPart") then 
                                        if not Flags["Viewmodel Remove Clothing"] then
                                            if Part.Transparency ~= 1 then
                                                Part.Transparency = Flags["Viewmodel Glove Color"].Transparency;
                                            end;
                                            Part.Color = Flags["Viewmodel Glove Color"];
                                            Part.Material = Flags["Viewmodel Glove Chams Material"];
                                            if Part:IsA("MeshPart") and Flags["Viewmodel Glove Chams Material"] == "ForceField" then
                                                Part.TextureID = Panichook.Locals.Textures[Flags["ForceField Texture"]];
                                            end;
                                        else
                                            Part:Destroy();
                                        end;
                                    end;
                                    if Part:IsA("SurfaceAppearance") then Part:Destroy(); end;
                                else 
                                    if (Part:IsA("Part") or Part:IsA("MeshPart")) and Flags["Viewmodel Arm Chams"] then 
                                        if Part.Transparency ~= 1 then
                                            Part.Color = Flags["Viewmodel Arm Color"];
                                        end;
                                        Part.Color = Flags["Viewmodel Arm Color"];
                                        Part.Material = Flags["Viewmodel Arm Chams Material"];
                                        if Part:IsA("MeshPart") and Flags["Viewmodel Arm Chams Material"] == "ForceField" then
                                            Part.TextureID = Panichook.Locals.Textures[Flags["ForceField Texture"]];
                                        end;
                                    end;
                                end;
                            end;

                            -- Highlight
                            do 
                                if Flags["Highlight Viewmodel"] then
                                    local Highlight = Panichook:Instance("Highlight", {
                                        Parent = Viewmodel;
                                        FillColor = Flags["Viewmodel Highlight Color"];
                                        FillTransparency = Flags["Viewmodel Highlight Color"].Transparency;
                                        OutlineColor = Flags["Viewmodel Highlight Outline Color"];
                                        OutlineTransparency = Flags["Viewmodel Highlight Outline Color"].Transparency;
                                    });
                                end;
                            end;
                        end;
                        --
                        function Panichook:ConvetTime(Time)
                            if Time >= 6 and Time < 12 then
                                return "Morning";
                            elseif Time >= 12 and Time < 18 then
                                return "Afternoon";
                            else
                                return "Night";
                            end;
                        end;
                        --
                        function Panichook:OnCharacterAdded()
                            PlayerGui = WaitForChild(LocalPlayer, "PlayerGui", 9e9);
                            MainGui = WaitForChild(PlayerGui, "MainGui", 9e9);
                            MainFrame = WaitForChild(MainGui, "MainFrame", 9e9);
                            ScreenVFX = WaitForChild(MainFrame, "ScreenEffects", 9e9);
                            Visor = WaitForChild(ScreenVFX, "Visor", 9e9);
                            HelmetMask = WaitForChild(ScreenVFX, "HelmetMask", 9e9);
                            Mask = WaitForChild(ScreenVFX, "Mask", 9e9);
                            ServerInfo = WaitForChild(PlayerGui, "PerformanceMonitor2", 9e9);

                            -- Hitsounds
                            Panichook:Connection(MainGui.ChildAdded, function(Item)
                                if Item:IsA("Sound") then
                                    local ID = Item.SoundId;
                                    Item.SoundId = (
                                        (ID == "rbxassetid://4585351098" and Flags["Hitsound Head Shot"]) and Panichook.Hitsounds[Flags["Hitsound Head Shot Selected"]] or 
                                        (ID == "rbxassetid://4585364605" and Flags["Hitsound Body Shot"]) and Panichook.Hitsounds[Flags["Hitsound Body Shot Selected"]] or 
                                        (ID == "rbxassetid://4585382589" and Flags["Hitsound Helment Shot"]) and Panichook.Hitsounds[Flags["Hitsound Helment Shot Selected"]] or 
                                        (ID == "rbxassetid://4585382046" and Flags["Hitsound Armor Shot"]) and Panichook.Hitsounds[Flags["Hitsound Armor Shot Selected"]] or 
                                        ID
                                    );
                                end;
                            end);

                            -- Remove Visor
                            if Flags["Remove Visor"] then
                                Visor.Visible = false;
                            end;
                            --
                            Panichook:Connection(Visor:GetPropertyChangedSignal("Visible"), function()
                                if Flags["Remove Visor"] then
                                    Visor.Visible = false;
                                end;
                            end);
                        end;
                        --
                        function Panichook:NewHitmarker(Position)
                            Panichook.Locals.Hitmarkers[#Panichook.Locals.Hitmarkers + 1] = {
                                Time = tick();
                                Position = Position;
                                Drawings = {
                                    [1] = CreateRenderObject("Line");
                                    [2] = CreateRenderObject("Line");
                                    [3] = CreateRenderObject("Line");
                                    [4] = CreateRenderObject("Line");
                                };
                            };
                        end;
                        --
                        function Panichook:UpdateHits(Hit)
                            local Drawings = Panichook.Locals.Hitmarkers[Hit].Drawings; 
                            local Time = Panichook.Locals.Hitmarkers[Hit];
                    
                            local Pos, Onscreen = WorldToViewportPoint(CurrentCamera, Panichook.Locals.Hitmarkers[Hit].Position); 
                            SetRenderProperty(Drawings[1], "Visible", Onscreen);
                            SetRenderProperty(Drawings[2], "Visible", Onscreen);
                            SetRenderProperty(Drawings[3], "Visible", Onscreen);
                            SetRenderProperty(Drawings[4], "Visible", Onscreen);
                    
                            if GetRenderProperty(Drawings[1], "Visible") then 
                                local X, Y = Pos.X, Pos.Y;
                                SetRenderProperty(Drawings[1], "From", Vector2.new(X + 4, Y + 4));
                                SetRenderProperty(Drawings[1], "To", Vector2.new(X + 10, Y + 10));
                                SetRenderProperty(Drawings[1], "Color", Flags["Hitmarker Color"])
                                SetRenderProperty(Drawings[1], "Thickness", 2);
                                SetRenderProperty(Drawings[1], "ZIndex", 9000);
                                
                                SetRenderProperty(Drawings[2], "From", Vector2.new(X + 4, Y - 4));
                                SetRenderProperty(Drawings[2], "To", Vector2.new(X + 10, Y - 10));
                                SetRenderProperty(Drawings[2], "Color", Flags["Hitmarker Color"])
                                SetRenderProperty(Drawings[2], "Thickness", 2);
                                SetRenderProperty(Drawings[2], "ZIndex", 9000);
                    
                                SetRenderProperty(Drawings[3], "From", Vector3.new(X - 4, Y - 4));
                                SetRenderProperty(Drawings[3], "To", Vector2.new(X - 10, Y - 10));
                                SetRenderProperty(Drawings[3], "Color", Flags["Hitmarker Color"])
                                SetRenderProperty(Drawings[3], "Thickness", 2);
                                SetRenderProperty(Drawings[3], "ZIndex", 9000);
                    
                                SetRenderProperty(Drawings[4], "From", Vector2.new(X - 4, Y + 4));  
                                SetRenderProperty(Drawings[4], "To", Vector2.new(X - 10, Y + 10));
                                SetRenderProperty(Drawings[4], "Color", Flags["Hitmarker Color"])
                                SetRenderProperty(Drawings[4], "Thickness", 2);
                                SetRenderProperty(Drawings[4], "ZIndex", 9000);
                            end;
                        end;
                        --
                        function Panichook:NewTracer(Origin, Destination) 
                            Panichook.Locals.Tracers[#Panichook.Locals.Tracers+1] = {
                                Origin = Origin;
                                Destination = Destination;
                                Tracer = CreateRenderObject("Line");
                                Time = tick(),
                            };
                        end;
                        --
                        function Panichook:UpdateTracers(Tracer)
                            Tracer = Panichook.Locals.Tracers[Tracer];
                            local Origin, Onscreen = WorldToViewportPoint(CurrentCamera, Tracer.Origin)
                            local Destination, Onscreen2 = WorldToViewportPoint(CurrentCamera, Tracer.Destination)
                        
                            SetRenderProperty(Tracer.Tracer, "Visible", Onscreen and Onscreen2 and Flags["Bullet Tracers"])
                            if GetRenderProperty(Tracer.Tracer, "Visible") then 
                                SetRenderProperty(Tracer.Tracer, "From", Vector2.new(Origin.X, Origin.Y))
                                SetRenderProperty(Tracer.Tracer, "To", Vector2.new(Destination.X, Destination.Y))
                                SetRenderProperty(Tracer.Tracer, "Color", Flags["Bullet Tracer Color"])
                                SetRenderProperty(Tracer.Tracer, "ZIndex", 8999)
                            end;
                        end;
                        --
                        function Panichook:CreateBeam(Origin, Direction)
                            local tracer = Panichook:Instance("Model", { Parent = workspace });
                            do
                                local beam = Panichook:Instance("Beam", {
                                    FaceCamera = true,
                                    Color = ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Flags["Bullet Tracer Color"]),
                                        ColorSequenceKeypoint.new(1, Flags["Bullet Tracer Color"]),
                                    }),
                                    LightEmission = 0,
                                    LightInfluence = 0,
                                    Width0 = 0.75,
                                    Width1 = 0.75,
                                    Texture = "rbxassetid://446111271",
                                    TextureLength = 12,
                                    TextureMode = Enum.TextureMode.Wrap,
                                    TextureSpeed = 1,
                                    Parent = tracer,
                                    Brightness = 150;
                                    Attachment0 = Panichook:Instance("Attachment", {
                                        Parent = Panichook:Instance("Part", {
                                            Position = Origin,
                                            Anchored = true,
                                            Transparency = 1,
                                            CanCollide = false,
                                            Parent = tracer;
                                            Size = Vector3.new(0.001, 0.001, 0.001); 
                                        });
                                    }),
                                    Attachment1 = Panichook:Instance("Attachment", {
                                        Parent = Panichook:Instance("Part", {
                                            Position = Direction,
                                            Anchored = true,
                                            Transparency = 1,
                                            CanCollide = false,
                                            Parent = tracer;
                                            Size = Vector3.new(0.001, 0.001, 0.001);
                                        });
                                    }),
                                });

                                Delay(Flags["Bullet Tracer Lifetime"], function()
                                    local Tween = TweenService:Create(beam, TweenInfo.new(1), { 
                                        Width0 = 0;
                                        Width1 = 0;
                                        TextureSpeed = 0
                                    });

                                    Tween:Play();
                                    Tween.Completed:Wait();
                                    tracer:Destroy();
                                end)
                            end
                            return tracer;
                        end;
                        --
                        function Panichook:Thread(Func, Name, ...)
                            --[[local Func = Name and function()
                                local Passed, Statement = pcall(Func);
                                if not Passed then
                                    print(("Thread %s failed: %s"):format(Name, Statement))
                                end;
                            end or Func;]]
                            local Thread = Create(Func);
                            Resume(Thread, ...);
                            return Thread;
                        end;
                        --
                        function Panichook:String(String)
                            return String:gsub("%%(%x%x)", function(Hex)
                                return string.char(tonumber(Hex, 16));
                            end);
                        end;
                    end)();
                end;
                --
                do -- Physics
                    function Physics:MovementPrediction(Origin, Destination, DestinationVelocity, ProjectileSpeed)
                        local Distance = (Destination - Origin).Magnitude;
                        local TimeToHit = (Distance / ProjectileSpeed);
                        local Predicted = Destination + DestinationVelocity * TimeToHit;
                        local Delta = (Predicted - Origin).Magnitude / ProjectileSpeed;
                        
                        ProjectileSpeed = ProjectileSpeed - 0.013 * ProjectileSpeed ^ 2 * TimeToHit ^ 2;
                        TimeToHit += (Delta / ProjectileSpeed);

                        local Actual = Destination + DestinationVelocity * TimeToHit;
                        return Actual;
                    end;
                    --
                    function Physics:Trajectory(Origin, Destination, ProjectileSpeed, ProjectileDrop)
                        local Distance = (Destination - Origin).Magnitude;
                        local TimeToHit = (Distance / ProjectileSpeed);
                        local ProperSpeed = ProjectileSpeed - 0.013 * ProjectileSpeed ^ 2 * TimeToHit ^ 2;
                        TimeToHit += (Distance / ProperSpeed);
                        
                        local DropTime = ProjectileDrop * TimeToHit ^ 2;
                        if tostring(DropTime):find("nan") or (Distance <= 100) then
                            return 0 
                        end;
                        return DropTime;
                    end;
                end;
                --
                do -- Chat
                    do -- Settings
                        Chat.Emojis = {"😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃", "😉", "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "😚", "😙", "😋", "😛", "😜", "🤪", "😝", "🤑", "🤗", "🤭", "🤫", "🤔", "🤐", "🤨", "😐", "😑", "😶", "😏", "😒", "🙁", "☹️", "😔", "😟", "😕", "🙃", "😣", "😖", "😫", "😩", "🥺", "😢", "😭", "😤", "😠", "😡", "🤬", "🤯", "😳", "🥵", "🥶", "😱", "😨", "😰", "😥", "😓", "🤗", "🤔", "🤭", "🤫", "🤥", "😶", "😐", "😑", "😬", "🙄", "😯", "😦", "😧", "😮", "😲", "😴", "🤤", "😪", "😵", "🤐", "🥴", "🤢", "🤮", "🤧", "😷", "🤒", "🤕", "🤑", "🤠", "😈", "👿", "👹", "👺", "🤡", "💩", "👻", "💀", "☠️", "👽", "👾", "🤖", "🎃", "😺", "😸", "😹", "😻", "😼", "😽", "🙀", "😿", "😾", "🙈", "🙉", "🙊", "💋", "💌", "💘", "💝", "💖", "💗", "💓", "💞", "💕", "💟", "❣️", "💔", "❤️", "🧡", "💛", "💚", "💙", "💜", "🤎", "🤍", "💯", "💢", "💥", "💫", "💦", "💨", "🕳️", "💣", "💬", "👁️‍🗨️", "🗨️", "🗯️", "💭", "💤", "👋", "🤚", "🖐️", "✋"}
                        Chat.Symbols = {"!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", ";", ":", "'", '"', ",", ".", "/", "<", ">", "?", "~", "`", "|"}
                        Chat.Phrases = {
                            ["British"] = {
                                "Fancy a cuppa?";
                                "I'm off to the pub";
                                "BLOODY HELL MATE";
                                "Im knackered!";
                                "Im off to the chippy";
                                "Thats rubbish!";
                                "Can I get a Bo'Oh'O'Wa'Er";
                                "Get weaved!";
                                "OH MY DAYS!!";
                            };
                            ["Catgirl"] = {
                                "MEOWW!!";
                                "Meowwwwwwwwwwwwwwwww";
                                "meeeow";
                                "MEEEOWWW!!";
                            };
                            ["Trashtalk"] = {
                                "STOP! JUST GIVEUP YOUR EMBARRASING YOURSELF";
                                "HAHAHAHAH GET GOOD";
                                "WOW LOL YOUR ACTUALLY TRASH";
                                "NO WAY THATS YOUR AIM HAHAHAHHAHA";
                            };
                        };
                    end;
                    -- 
                    function Chat:GenerateText(Text, Phrases, Emojis, Symbols)
                        local ModifiedText = "";
                        for i = 1, 3 do
                            ModifiedText = ModifiedText .. Text
                            if Text then
                                local RandomNumber = Random(1, 10);
                                if RandomNumber <= 5 then
                                    ModifiedText = ModifiedText .. " " .. Emojis[Random(#Emojis)] .. " ";
                                else
                                    ModifiedText = ModifiedText .. " " .. Rep(Symbols[Random(#Symbols)], Random(1, 10)) .. " ";
                                end;
                                RandomNumber = Random(1, 10);
                                
                                if RandomNumber <= 5 then
                                    ModifiedText = ModifiedText .. " " .. Emojis[Random(#Emojis)] .. " ";
                                else
                                    ModifiedText = ModifiedText .. " " .. Rep(Symbols[Random(#Symbols)], Random(1, 10)) .. " ";
                                end;
                                local Phrase = Phrases[Random(#Phrases)];
                                ModifiedText = ModifiedText .. " " .. Phrase .. " ";
                            end;
                        end;
                        return ModifiedText;
                    end;
                end;
                --
                do -- Hooks
                    function Hooks:Detour(Name, Script, Function)
                        local Old = Script[Name];
                        Script[Name] = Function;
                        return Old;
                    end;
                end;
            end;

            -- Drawings
            do
                do -- Field of View
                    local FieldOfView = Panichook:Instance("Frame", {
                        BackgroundTransparency = 1;
                        BackgroundColor3 = Color3.new(0, 0, 0); 
                        Parent = Panichook.Locals.ProtectedSpace; 
                        AnchorPoint = Vector2.new(0.5, 0.5); 
                        Size = UDim2.new(0, 300, 0, 35); 
                        Position = UDim2.new(0.5, 0, 0.1, 0);
                        Visible = false;
                    });
                    --
                    local Stroke = Panichook:Instance("UIStroke", {
                        Color = Color3.new(1, 1, 1); 
                        Thickness = 2;
                        Parent = FieldOfView
                    });
                    --
                    local Gradient = Panichook:Instance("UIGradient", {
                        Color = ColorSequence.new{
                            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1));
                            ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1));
                        }; 
                        Parent = Stroke;
                    });
                    --
                    Panichook:Instance("UICorner", {
                        CornerRadius = UDim.new(1, 0); 
                        Parent = FieldOfView
                    });

                    -- Returns
                    Panichook.Locals.Drawings.FieldOfView = FieldOfView;
                end;
                --
                do -- Watermark
                    Panichook.Locals.Drawings.Watermark = Panichook:Instance("TextLabel", {Text = "panichook9.net"; Visible = false; Parent = Panichook.Locals.ProtectedSpace; Position = UDim2.new(0.5,0,0,-10); Size = UDim2.new(0,100,0,-20); AnchorPoint = Vector2.new(0.5,0.5); BackgroundTransparency = 1; TextColor3 = Color3.fromRGB(255, 255, 255); BackgroundColor3 = Color3.fromRGB(0, 0, 0); FontFace = Font.new(Font:GetRegistry("menu_font")), TextSize = 13; TextStrokeTransparency = 0; TextStrokeColor3 = Color3.fromRGB(0,0,0); RichText = true});
                    Panichook:Instance("UIGradient", {Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}, Parent = Panichook.Locals.Drawings.Watermark});
                end;
                --
                do -- Name Viewer
                    Panichook.Locals.Drawings.NameHolder = Panichook:Instance("Frame", {BackgroundColor3 = Color3.new(0, 0, 0); Parent = Panichook.Locals.ProtectedSpace; AnchorPoint = Vector2.new(0.5, 0.5); Size = UDim2.new(0, 300, 0, 35); Position = UDim2.new(0.5, 0, 0.1, 0)});
                    Panichook.Locals.Drawings.Name = Panichook:Instance("TextLabel", {RichText = true; Parent = Panichook.Locals.Drawings.NameHolder; Text = ""; BackgroundColor3 = Color3.new(0, 0, 0); TextColor3 = Color3.new(1, 1, 1); FontFace = Font.new(Font:GetRegistry("menu_font")); TextSize = 12; AnchorPoint = Vector2.new(0.5, 0.5); Size = UDim2.new(0, 300, 0, 35); Position = UDim2.new(0.5, 0, 0.5, 0); BackgroundTransparency = 1});
                    UICorner = Panichook:Instance("UICorner", {Parent = Panichook.Locals.Drawings.NameHolder; CornerRadius = UDim.new(0, 4)});
                end;
                --
                do -- Belt Viewer
                    local ItemHolder = Panichook:Instance("Frame", {Parent = Panichook.Locals.ProtectedSpace; AnchorPoint = Vector2.new(0.5, 0.5); Size = UDim2.new(0, 236, 0, 100); Position = UDim2.new(0.5, -1, 0.18, 0); BackgroundTransparency = 1});
                    UIListLayout = Panichook:Instance("UIListLayout", {Parent = ItemHolder; FillDirection = Enum.FillDirection.Horizontal; Padding = UDim.new(0, 5)});
                    Panichook.Locals.Drawings.Item1 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 75, 0, 75); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Item2 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 75, 0, 75); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Item3 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 75, 0, 75); BackgroundTransparency = 1});
                end;
                --
                do -- Clothing Viewer
                    local ItemHolder = Panichook:Instance("Frame", {Parent = Panichook.Locals.ProtectedSpace; Size = UDim2.new(0, 100, 0, 800); Position = UDim2.new(0, 0, 0.3, 0); BackgroundTransparency = 1});
                    UIListLayout = Panichook:Instance("UIListLayout", {Parent = ItemHolder; FillDirection = Enum.FillDirection.Vertical; Padding = UDim.new(0, 5)});
                    Panichook.Locals.Drawings.Armor1 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 50, 0, 50); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Armor2 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 50, 0, 50); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Armor3 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 50, 0, 50); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Armor4 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 50, 0, 50); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Armor5 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 50, 0, 50); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Armor6 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 50, 0, 50); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Armor7 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 50, 0, 50); BackgroundTransparency = 1});
                    Panichook.Locals.Drawings.Armor8 = Panichook:Instance("ImageLabel", {Parent = ItemHolder; Size = UDim2.new(0, 50, 0, 50); BackgroundTransparency = 1});
                end;
                --
                do -- Crosshair
                    Drawings.Crosshair = {
                        { CreateRenderObject("Line"), CreateRenderObject("Line") };
                        { CreateRenderObject("Line"), CreateRenderObject("Line") };
                        { CreateRenderObject("Line"), CreateRenderObject("Line") };
                        { CreateRenderObject("Line"), CreateRenderObject("Line") };
                    };
                end;
                --
                do -- Jesus
                    Panichook.Locals.Drawings.Jesus = Panichook:Instance("Part", {
                        Size = Vector3.new(9, 1, 9);
                        Anchored = true;
                        Transparency = 1;
                        Parent = workspace;
                        CanCollide = true;
                    });
                end;
                --
                do -- Tracer
                    Panichook.Locals.Drawings.Tracer = Panichook:Instance("Model", { Parent = workspace });
                    do
                        local Origin = Panichook:Instance("Part", {
                            Name = "Origin";
                            Position = Origin,
                            Anchored = true,
                            Transparency = 1,
                            CanCollide = false,
                            Parent = Panichook.Locals.Drawings.Tracer;
                            Size = Vector3.new(0.001, 0.001, 0.001); 
                        });
                        local Direction = Panichook:Instance("Part", {
                            Name = "Direction";
                            Anchored = true,
                            Transparency = 1,
                            CanCollide = false,
                            Parent = Panichook.Locals.Drawings.Tracer;
                            Size = Vector3.new(0.001, 0.001, 0.001); 
                        });
                        --
                        local beam = Panichook:Instance("Beam", {
                            FaceCamera = true,
                            LightEmission = 0,
                            LightInfluence = 0,
                            Width0 = 0.75,
                            Width1 = 0.75,
                            Texture = "rbxassetid://446111271",
                            TextureLength = 12,
                            TextureMode = Enum.TextureMode.Wrap,
                            TextureSpeed = 1,
                            Parent = Panichook.Locals.Drawings.Tracer,
                            Brightness = 150;
                            Attachment0 = Panichook:Instance("Attachment", {Parent = Origin});
                            Attachment1 = Panichook:Instance("Attachment", {Parent = Direction});
                        });
                    end;
                end;
            end;

            -- Panichook9
            do
                do -- Menu
                    local Window = Menu:Window({Name =  "Project Delta"; PageAmmount = 4; Size = UDim2.new(0, 640, 0, 699)}); -- UDim2.new(0, 640, 0, 699)
                    do
                        local Combat = Window:Tab({Name = "Combat"});
                        do
                            local BulletRedirection = Combat:Section({Name = "Bullet Redirection"; Side = "Left"});
                            do
                                BulletRedirection:Toggle({Name = "Enabled", Flag = "Silent Aim"});
                                BulletRedirection:Toggle({Name = "Auto Shoot", Flag = "Auto Shoot"});
                                BulletRedirection:Keybind({Name = "Auto Shoot Bind"; Flag = "Auto Shoot Bind"});
                                BulletRedirection:Toggle({Name = "Movement Prediction", Flag = "Movement Prediction"});
                                BulletRedirection:Toggle({Name = "Compensate Bulletdrop", Flag = "Compensate Bulletdrop"});
                                BulletRedirection:Toggle({Name = "Desync Resolver", Flag = "Resolve Octohook"});
                                BulletRedirection:Toggle({Name = "Resolve Angles", Flag = "Resolve Angles"});
                                BulletRedirection:Multibox({Name = "Angles"; Flag =  "Resolver"; Options = {"Pitch"; "Yaw"}; Max = 2});
                                BulletRedirection:Slider({Name = "Hitchance"; Flag = "Hitchance"; Min = 0; Max = 100; Suffix = "%"; Default = 100});
                                BulletRedirection:Slider({Name = "Accuracy"; Flag = "Accuracy"; Min = 0; Max = 100; Suffix = "%"; Default = 100});
                                BulletRedirection:Toggle({Name = "Target Bone Closest To Cursor", Flag = "Target Bone Closest To Cursor"});
                                BulletRedirection:Multibox({Name = "Hitboxes"; Flag = "Hitboxes"; Options = {"Head", "Torso", "Arms", "Legs"}; Default = {"Head"}; Max = 4});
                                BulletRedirection:Multibox({Name = "Conditions"; Flag = "Conditions"; Options = {"Wall Check", "Team Check", "Forcefield Check", "Roblox Friend Check", "Invisible Check"}; Max = 5});
                                BulletRedirection:Dropdown({Name = "Wall Check Origin", Flag = "Wall Check Origin"; Options = {"Camera", "Head"}; Default = "Camera"});
                                BulletRedirection:Slider({Name = "Max Distance", Flag = "Max Distance"; Min = 10; Max = 10000; Suffix = "m"; Default = 500});
                                BulletRedirection:Slider({Name = "Minimum Health"; Flag = "Minimum Health"; Min = 0; Max = 100; Default = 0; Suffix = "hp"});
                            end;
                            --
                            local Drawings = Combat:Section({Name = "Drawings"; Side = "Right"});
                            do
                                Drawings:Toggle({Name = "Clothing Viewer"; Flag = "Clothing Viewer"});
                                Drawings:Toggle({Name = "Belt Viewer"; Flag = "Belt Viewer"});
                                local FOV = Drawings:Toggle({Name = "Draw Field of View", Flag = "Silent Use FOV"});
                                Drawings:Toggle({Name =  "Animate Field of View", Flag = "Animate Field of View"});
                                FOV:Colorpicker({Name = "Left Gradient Color"; Default = Color3.fromRGB(255, 255, 255), Flag = "Silent FOV Left Gradient Color"});
                                FOV:Colorpicker({Name = "Right Gradient Color"; Default = Color3.fromRGB(255, 255, 255), Flag = "Silent FOV Right Gradient Color"});
                                Drawings:Slider({Flag = "Silent FOV Radius"; Min = 10; Max = 600; Suffix = "px"; Default = 100});
                                Drawings:Dropdown({Name = "Position", Flag = "Silent FOV Position", Options = {"Mouse", "Center"}; Default = "Mouse"});
                                Drawings:Slider({Default = 500, Max = 1000, Min = 0, Name = "Rotation Speed", Flag = "Silent FOV Rotation Speed"});
                                Drawings:Dropdown({Max = 11, Name = "Rotation Style", Flag = "Silent FOV Rotation Style", Options = {"Linear", "Quad", "Cubic", "Quart", "Quint", "Sine", "Back", "Elastic", "Bounce", "Circular", "Exponential"}; Default = "Linear"})
                                Drawings:Dropdown({Max = 3, Name = "Rotation Direction", Flag = "Silent FOV Rotation Direction", Options = {"In", "Out", "InOut"}; Default = "In"});
                            end;
                            --
                            local WeaponModifications = Combat:Section({Name = "Weapon Modifications"; Side = "Right"});
                            do
                                WeaponModifications:Toggle({Name = "Instant Hit", Flag = "Instant Hit"});
                                WeaponModifications:Toggle({Name = "Rapid Fire", Flag = "Rapid Fire"});
                                WeaponModifications:Toggle({Name = "Instant Reload", Flag = "Instant Reload"});
                                WeaponModifications:Toggle({Name = "Remove Recoil", Flag = "Remove Recoil"});
                                WeaponModifications:Toggle({Name = "Remove Spread", Flag = "Remove Spread"});
                                WeaponModifications:Toggle({Name = "Instant Aim"; Flag = "Instant Aim"});
                                WeaponModifications:Toggle({Name = "Remove Weapon Bobbing"; Flag = "Remove Weapon Bobbing"});
                                WeaponModifications:Toggle({Name = "Remove Weapon Occlusion"; Flag = "Remove Weapon Occlusion"});
                                WeaponModifications:Toggle({Name = "Unlock Firemodes"; Flag = "Unlock Firemodes"});
                                WeaponModifications:Toggle({Name = "Tracer Color", Flag = "Custom Tracer Color"}):Colorpicker({Name = "Projectile Tracer Color"; Default = Color3.fromRGB(255,255,255), Flag = "Projectile Tracer Color"});
                            end;
                        end;
                        --
                        local Visuals = Window:Tab({Name = "Visuals"});
                        do
                            do -- Player ESP
                                local Player = Visuals:InnerTab({Name = "Players"});
                                local Enemies = Player:Section({Name = "Enemies"; Side = "Left"});
                                local Friendlies = Player:Section({Name = "Friendlies"; Side = "Right"});
                                local Extra = Player:Section({Name = "Extra"; Side = "Left"});
                                local Animations = Player:Section({Name = "Animations"; Side = "Right"});

                                do -- Animations
                                    Animations:Toggle({Name =  "Use Animations", Flag = "Animations"; Default = true});
                                    Animations:Multibox({Name = "Animations"; Flag = "Selected Animations"; Options = {"On Death"; "On Health Change"}; Default = {"On Death"; "On Health Change"}; Max = 2});
                                    Animations:Slider({Name =  "Fadeout Time"; Flag = "Fadeout Time"; Min = 100; Max = 1000; Default = 250; Suffix = "ms"});
                                    Animations:Slider({Name =  "Health Change Time"; Flag = "Health Change Time"; Min = 1; Max = 1000; Default = 250; Suffix = "ms"});
                                    Animations:Toggle({Name =  "Animate Box Gradients", Flag = "Animate Box Gradients"});
                                    Animations:Slider({Default = 500, Max = 1000, Min = 0, Name = "Rotation Speed", Flag = "Box Rotation Speed"});
                                    Animations:Dropdown({Max = 11, Name = "Rotation Style", Flag = "Box Rotation Style", Options = {"Linear", "Quad", "Cubic", "Quart", "Quint", "Sine", "Back", "Elastic", "Bounce", "Circular", "Exponential"}; Default = "Linear"})
                                    Animations:Dropdown({Max = 3, Name = "Rotation Direction", Flag = "Box Rotation Direction", Options = {"In", "Out", "InOut"}; Default = "In"});
                                end;
                                --
                                do -- Extra
                                    Extra:Toggle({Name = "Npc ESP", Flag = "AI ESP"});
                                    Extra:Slider({Name = "ESP Max Distance"; Flag = "ESP Max Distance"; Min = 100; Max = 5000; Default = 5000});
                                    Extra:Toggle({Name =  "Text Customizations", Flag = "Custom Text"});
                                    Extra:Dropdown({Flag = "Surround Text"; Name = "Text Surround"; Options = {"None", "[]", "{}", "()", "$$", "##", ";;", "''", "~~", "--", "=="}; Default = "None"});
                                    Extra:Dropdown({Flag = "Distance Measurment"; Name = "Distance Measurment"; Options = {"Studs", "Meters", "Centimeters", "Decimeters", "Feet", "Inches", "Kilometers", "Miles", "Yards", "Millimeters", "Nanometers", "Nau miles", "Micrometers", "Fathom", "Rods", "Leagues", "Furlongs", "Astm units", "Light years", "Parsecs"}; Default = "Studs"; Max = 5});     
                                    Extra:Slider({Name =  "Font Scale"; Flag = "Font Scale"; Min = 5; Max = 35; Default = 12; Suffix = "px"});
                                    Extra:Dropdown({Flag = "Text Font"; Name = "Font"; Options = {"Tahoma", "Smallest Pixel", "Minimum", "Satoshi", "Supreme", "Hieroglyphs"}; Default = "Tahoma"; Callback = function(Selected)
                                        if Selected == "Tahoma" then
                                            Font:Register("menu_font", 400, "normal", {Id = "fs-tahoma-8px.ttf", Font = crypt.base64.decode(SecureRequest({Url = LPH_ENCSTR("https://plusminus.vip/assets/fonts/tahoma.txt")}).Body)});
                                        elseif Selected == "Smallest Pixel" then
                                            Font:Register("menu_font", 400, "normal", {Id = "smallest-pixel.ttf", Font = crypt.base64.decode(SecureRequest({Url = LPH_ENCSTR("https://plusminus.vip/assets/fonts/smallest_pixel.txt")}).Body)});
                                        elseif Selected == "Minimum" then
                                            Font:Register("menu_font", 400, "normal", {Id = "minimum.ttf", Font = crypt.base64.decode(SecureRequest({Url = LPH_ENCSTR("https://plusminus.vip/assets/fonts/minimum.txt")}).Body)});
                                        elseif Selected == "Satoshi" then
                                            Font:Register("menu_font", 400, "normal", {Id = "satoshi.ttf", Font = crypt.base64.decode(SecureRequest({Url = LPH_ENCSTR("https://plusminus.vip/assets/fonts/satoshi.txt")}).Body)});
                                        elseif Selected == "Supreme" then
                                            Font:Register("menu_font", 400, "normal", {Id = "supreme.ttf", Font = crypt.base64.decode(SecureRequest({Url = LPH_ENCSTR("https://plusminus.vip/assets/fonts/supreme.txt")}).Body)});
                                        elseif Selected == "Hieroglyphs" then
                                            Font:Register("menu_font", 400, "normal", {Id = "hieroglyphs.ttf", Font = crypt.base64.decode(SecureRequest({Url = LPH_ENCSTR("https://plusminus.vip/assets/fonts/hieroglyphs.txt")}).Body)});
                                        elseif Selected == "" then
                                            Font:Register("menu_font", 400, "normal", {Id = ".ttf", Font = crypt.base64.decode("")});
                                        end;
                                    end});
                                end;

                                -- Selection
                                for _ = 1, 2 do
                                    local Type = (_ == 1 and "Enemy") or (_ == 2 and "Friendly");
                                    local Section = (_ == 1 and Enemies) or (_ == 2 and Friendlies);
                                    --
                                    do -- Main
                                        local Master = Section:Toggle({Name = "Enabled", Flag = Type .. " ESP"});
                                    end;
                                    --
                                    do -- Text
                                        local Name = Section:Toggle({Name = "Name", Flag = Type .. " Name"})
                                        Section:Toggle({Name = "View Type", Flag = Type .. " View Type"})
                                        Name:Colorpicker({Name = "Name Gradient Left Color"; Default = Color3.fromRGB(255, 255, 255), Flag = Type .. " Name Left Color"});
                                        Name:Colorpicker({Name = "Name Gradient Right Color"; Default = Color3.fromRGB(255, 255, 255), Flag = Type .. " Name Right Color"});
                                        --
                                        local Distance = Section:Toggle({Name = "Distance", Flag = Type .. " Distance"});
                                        Distance:Colorpicker({Name = "Distance Gradient Left Color"; Default = Color3.fromRGB(255, 255, 255), Flag = Type .. " Distance Left Color"});
                                        Distance:Colorpicker({Name = "Distance Gradient Right Color"; Default = Color3.fromRGB(255, 255, 255), Flag = Type .. " Distance Right Color"});  
                                        --
                                        local Weapon = Section:Toggle({Name = "Weapon", Flag = Type .. " Weapon"});
                                        Weapon:Colorpicker({Name = "Weapon Gradient Left Color"; Default = Color3.fromRGB(255, 255, 255), Flag = Type .. " Weapon Left Color"});
                                        Weapon:Colorpicker({Name = "Weapon Gradient Right Color"; Default = Color3.fromRGB(255, 255, 255), Flag = Type .. " Weapon Right Color"});
                                    end;
                                    --
                                    do -- Boxs
                                        local Healthbar = Section:Toggle({Name = "Healthbar", Flag = Type .. " Healthbar"});
                                        Healthbar:Colorpicker({Name = "Empty Color"; Default = Color3.fromRGB(255, 0, 0); Flag = Type .. " Healthbar Empty Color"});
                                        Healthbar:Colorpicker({Name = "Full Color"; Default = Color3.fromRGB(0, 255, 0); Flag = Type .. " Healthbar Color"});
                                        local Box = Section:Toggle({Name = "Bounding box"; Flag = Type .. " Bounding Box"})
                                        Box:Colorpicker({Name = "Box Left Color"; Default = Color3.fromRGB(255,255,255); Flag = Type .. " Box Left Color"});
                                        Box:Colorpicker({Name = "Box Right Color"; Default = Color3.fromRGB(255,255,255); Flag = Type .. " Box Right Color"});
                                    end;
                                    --
                                    do -- Chams
                                        local Chams = Section:Toggle({Name = "Chams", Flag = Type .. " Chams"});
                                        Chams:Colorpicker({Name = "Outline Color"; Default = Color3.fromRGB(136, 16, 206), Alpha = 0.5, Flag = Type .." Chams Outline Color"});
                                        Chams:Colorpicker({Name = "Fill Color"; Default = Color3.fromRGB(0, 255, 234), Alpha = 1, Flag = Type .. " Chams Fill Color"});
                                        Section:Dropdown({Max = 4, Name = "Chams Style", Flag = Type .. " Chams Style", Options = {"Highlight", "Adornment"}; Default = "Highlight"});
                                        Section:Slider({Name = "Cham Refresh Rate"; Flag = Type .. " Chams Refresh Rate"; Min = 0; Max = 25; Default = 10});
                                    end;
                                end; 
                            end;
                            --
                            local Environment = Visuals:InnerTab({Name = "Environment"});
                            do
                                local Atmosphere = Environment:Section({Name = "Atmosphere"; Side = "Left"});
                                do
                                    local BlacklistedArgs = {
                                        ["Color"] = {};
                                        ["Slider"] = {
                                            "numExpectedDirectChildren";
                                            "DataCost";
                                            "SourceAssetId";
                                        };
                                    };
                                    --
                                    local StartLighting = {
                                        ["Ambient"] = Lighting.Ambient;
                                        ["Brightness"] = Lighting.Brightness;
                                        ["ColorShift_Bottom"] = Lighting.ColorShift_Bottom;
                                        ["ColorShift_Top"] = Lighting.ColorShift_Top;
                                        ["EnvironmentDiffuseScale"] = Lighting.EnvironmentDiffuseScale;
                                        ["EnvironmentSpecularScale"] = Lighting.EnvironmentSpecularScale;
                                        ["GlobalShadows"] = Lighting.GlobalShadows;
                                        ["OutdoorAmbient"] = Lighting.OutdoorAmbient;
                                        ["Outlines"] = Lighting.Outlines;
                                        ["ShadowColor"] = Lighting.ShadowColor;
                                        ["ShadowSoftness"] = Lighting.ShadowSoftness;
                                        ["GeographicLatitude"] = Lighting.GeographicLatitude;
                                        ["FogColor"] = Lighting.FogColor;
                                        ["FogEnd"] = Lighting.FogEnd;
                                        ["FogStart"] = Lighting.FogStart;
                                        ["ClockTime"] = Lighting.ClockTime;
                                    };

                                    for Index, Prop in pairs(StartLighting) do 
                                        if typeof(Prop) == "Color3" and not Find(BlacklistedArgs.Color, Index) then 
                                            local Element = Atmosphere:Toggle({
                                                Name = Index:gsub("_", ""), 
                                                Default = false, 
                                                Flag = "VisualsLighting" .. Index, 
                                                Callback = function(State)
                                                    if State then 
                                                        Panichook:ChangeLighting(Index, Flags["VisualsLighting" .. Index .. "Color"]);
                                                        Lighting[Index] = Flags["VisualsLighting" .. Index .. "Color"];
                                                    else 
                                                        Lighting[Index] = StartLighting[Index];
                                                        Panichook:RemoveLighting(Index);
                                                    end;
                                                end
                                            })
                                            Element:Colorpicker({
                                                Name = Index .. " Color", 
                                                Flag = "VisualsLighting" .. Index .. "Color", 
                                                Default = Prop, 
                                                Callback = function(color)
                                                    if (Flags["VisualsLighting" .. Index])then 
                                                        Panichook:ChangeLighting(Index, color);
                                                        Lighting[Index] = Flags["VisualsLighting" .. Index .. "Color"];
                                                    end;
                                                end
                                            });
                                            
                                            -- Connection
                                            Panichook:Connection(Lighting:GetPropertyChangedSignal(Index), function()
                                                if (Flags["VisualsLighting" .. Index])then 
                                                    Panichook:ChangeLighting(Index, Flags["VisualsLighting" .. Index .. "Color"]);
                                                    Lighting[Index] = Flags["VisualsLighting" .. Index .. "Color"];
                                                end;
                                            end);
                                        elseif typeof(Prop) == "number" and not Find(BlacklistedArgs.Slider, Index) then 
                                            local Element = Atmosphere:Toggle({
                                                Name = Index, 
                                                Default = false, 
                                                Flag = "VisualsLighting" .. Index, 
                                                Callback = function(bool)
                                                    if State then 
                                                        Panichook:ChangeLighting(Index, Flags["VisualsLighting" .. Index .. "_amount"]);
                                                        Lighting[Index] = Flags["VisualsLighting" .. Index .. "_amount"];
                                                    else 
                                                        Panichook:RemoveLighting(Index);
                                                        Lighting[Index] = StartLighting[Index];
                                                    end;
                                                end
                                            });
                                            Atmosphere:Slider({
                                                Name = Index .. " Amount",
                                                Default = Prop, 
                                                Max = Index:lower():find("fog") and 150 or 24, Min = 0, tick = 0.1, 
                                                Flag = "VisualsLighting" .. Index .. "Amount", 
                                                Callback = function(State)
                                                    if (Flags["VisualsLighting" .. Index])then 
                                                        Panichook:ChangeLighting(Index, State);
                                                        Lighting[Index] = State;
                                                    end;
                                                end
                                            });

                                            -- Connection
                                            Panichook:Connection(Lighting:GetPropertyChangedSignal(Index), function()
                                                if (Flags["VisualsLighting" .. Index])then 
                                                    Panichook:ChangeLighting(Index, Flags["VisualsLighting" .. Index .. "Amount"]);
                                                    Lighting[Index] = Flags["VisualsLighting" .. Index .. "Amount"];
                                                end;
                                            end);
                                        end;
                                    end;
                                end;
                                --
                                local Sky = Environment:Section({Name = "Sky"; Side = "Right"});
                                do
                                    do -- Clouds
                                        local Cloud = FindFirstChildOfClass(workspace.Terrain, "Clouds");
                                        if not Cloud then
                                            Cloud = Panichook:Instance("Clouds", {
                                                Parent = workspace.Terrain;
                                                Enabled = false;
                                            });
                                        end;
                                        --
                                        do -- Settings
                                            local Clouds = Sky:Toggle({Name = "Clouds"; Flag = "Clouds"; Default = Cloud.Enabled; Callback = function(State) Cloud.Enabled = State; end});
                                            Clouds:Colorpicker({Default = Cloud.Color; Flag = "Cloud Color"; Callback = function(Color) Cloud.Color = Color; end});
                                            Sky:Slider({Name = "Cloud Cover"; Flag = "Cloud Cover"; Default = Cloud.Cover; Min = 0; Max = 1; Decimals = 0.01; Callback = function(State) Cloud.Cover = State; end});
                                            Sky:Slider({Name = "Cloud Density"; Flag = "Cloud Density"; Default = Cloud.Density; Min = 0; Max = 1; Decimals = 0.01; Callback = function(State) Cloud.Density = State; end});
                                        end;
                                        --
                                        do -- Connection
                                            Panichook:Connection(Cloud:GetPropertyChangedSignal("Enabled"), function()
                                                Cloud.Enabled = Flags.Clouds;
                                            end);
                                            --
                                            Panichook:Connection(Cloud:GetPropertyChangedSignal("Color"), function()
                                                Cloud.Color = Flags["Cloud Color"];
                                            end);
                                            --
                                            Panichook:Connection(Cloud:GetPropertyChangedSignal("Cover"), function()
                                                Cloud.Cover = Flags["Cloud Cover"];
                                            end);
                                            --
                                            Panichook:Connection(Cloud:GetPropertyChangedSignal("Density"), function()
                                                Cloud.Density = Flags["Cloud Density"];
                                            end);
                                        end;
                                    end;
                                end;
                                --
                                local Weather = Environment:Section({Name = "Weather"; Side = "Right"});
                                do
                                    do -- Checks
                                        if FindFirstChild(workspace, "NoCollision") then
                                            if FindFirstChild(workspace.NoCollision, "FoliageZones") then
                                                workspace.NoCollision.FoliageZones:Destroy();
                                            end;
                                            --
                                            if FindFirstChild(workspace.NoCollision, "WeatherEffectArea") then
                                                workspace.NoCollision.WeatherEffectArea:Destroy();
                                            end;
                                        end;
                                    end;
                                end;
                                --
                                local Terrain = Environment:Section({Name = "Terrain"; Side = "Right"});
                                do
                                    Terrain:Toggle({Name = "Terrain Grass"; Flag = "Terrain Grass"; Default = gethiddenproperty(workspace.Terrain, "Decoration"); Callback = function(State) sethiddenproperty(workspace.Terrain, "Decoration", State); end});
                                    --
                                    for _, Material in pairs(Panichook.Locals.Materials) do 
                                        Terrain:Colorpicker({
                                            Name = ("%s Color"):format(Material);
                                            Flag = "Terrain Color Material" .. Material;
                                            Default = workspace.Terrain:GetMaterialColor(Enum.Material[Material]);
                                            Callback = function(color)
                                                workspace.Terrain:SetMaterialColor(Enum.Material[Material], color);
                                            end
                                        });
                                    end;
                                end;
                            end;
                            --
                            local World = Visuals:InnerTab({Name = "World"});
                            do
                                local Exits = World:Section({Name = "Exits"; Side = "Left"});
                                do
                                    local Object = Exits:Toggle({Name =  "Exit ESP", Flag = "Exit"})
                                    Object:Colorpicker({Name = "Text Color"; Flag = "Exit Text Color"; Default = Color3.fromRGB(255, 255, 255)});
                                    Object:Colorpicker({Name = "Icon Color"; Flag = "Exit Icon Color"; Default = Color3.fromRGB(255, 255, 255)});
                                    Exits:Slider({Name = "Max Distance"; Flag = "Exit Max Distance"; Min = 100; Max = 1000; Default = 250});
                                    Exits:Slider({Name = "Font Scale"; Flag = "Exit Font Scale"; Min = 5; Max = 35; Default = 12; Suffix = "px"});
                                end;
                                --
                                local Corpse = World:Section({Name = "Corpse"; Side = "Right"});
                                do
                                    local Object = Corpse:Toggle({Name =  "Corpse ESP", Flag = "Corpse"})
                                    Object:Colorpicker({Name = "Text Color"; Flag = "Corpse Text Color"; Default = Color3.fromRGB(255, 255, 255)});
                                    Object:Colorpicker({Name = "Icon Color"; Flag = "Corpse Icon Color"; Default = Color3.fromRGB(255, 255, 255)});
                                    Corpse:Slider({Name = "Max Distance"; Flag = "Corpse Max Distance"; Min = 100; Max = 1000; Default = 250});
                                    Corpse:Slider({Name = "Font Scale"; Flag = "Corpse Font Scale"; Min = 5; Max = 35; Default = 12; Suffix = "px"});
                                end;
                            end;
                            --
                            local Viewmodel = Visuals:InnerTab({Name = "Viewmodel"});
                            do
                                --[[local Sandboxing = Viewmodel:Section({Name = "Sandboxing"; Side = "Left"});
                                do
                                    Sandboxing:Toggle({Name = "Viewmodel Sandboxing", Flag = "Viewmodel Sandboxing"});
                                    Sandboxing:Slider({Name =  "Viewmodel X"; Flag = "Viewmodel X"; Min = -5; Max = 5; Default = 0; Decimals = 0.01});
                                    Sandboxing:Slider({Name =  "Viewmodel Y"; Flag = "Viewmodel Y"; Min = -5; Max = 5; Default = 0; Decimals = 0.01});
                                    Sandboxing:Slider({Name =  "Viewmodel Z"; Flag = "Viewmodel Z"; Min = -5; Max = 5; Default = 0; Decimals = 0.01});
                                end;]]
                                --
                                local Extra = Viewmodel:Section({Name = "Extra"; Side = "Left"});
                                do
                                    do -- Settings
                                        Extra:Toggle({Name = "Thirdperson", Flag = "Third Person"});
                                        Extra:Keybind({Mode = "Toggle"; Flag = "Third Person Bind"});
                                        Extra:Slider({Name = "Thirdperson Distance", Flag = "Thirdperson Distance"; Min = 0; Max = 5; Default = 0; Decimals = 0.1});
                                        Extra:Toggle({Name = "Custom Field of View", Flag = "Field of View"; Callback = function(State)
                                            if State then
                                                CurrentCamera.FieldOfView = Flags["Field of View Slider"];
                                            else
                                                CurrentCamera.FieldOfView = OldFieldofView;
                                            end;
                                        end});
                                        Extra:Toggle({Name = "Zoom", Flag = "Zoom"});
                                        Extra:Keybind({Mode = "Hold"; Flag = "Zoom Bind"; Callback = function(State)
                                            if Flags["Zoom"] then
                                                if State then
                                                    CurrentCamera.FieldOfView = Flags["Zoom Slider"];
                                                else
                                                    if Flags["Field of View"] then 
                                                        CurrentCamera.FieldOfView = Flags["Field of View Slider"];
                                                    else
                                                        CurrentCamera.FieldOfView = OldFieldofView;
                                                    end;
                                                end;
                                            end;
                                        end});
                                        Extra:Slider({Name = "Field of View", Flag = "Field of View Slider"; Min = 0; Max = 120; Default = OldFieldofView; Decimals = 1; Callback = function(State) 
                                            if Flags["Field of View"] then 
                                                CurrentCamera.FieldOfView = State; 
                                            end;
                                        end});
                                        Extra:Slider({Name = "Zoom", Flag = "Zoom Slider"; Min = 0; Max = 120; Default = 70; Decimals = 1});
                                    end;
                                    --
                                    do -- Connections
                                        Panichook:Connection(CurrentCamera:GetPropertyChangedSignal("FieldOfView"), function()
                                            if Flags["Zoom"] and Flags["Zoom Bind"] then
                                                CurrentCamera.FieldOfView = Flags["Zoom Slider"];
                                                return;
                                            end;
                                            --
                                            if Flags["Field of View"] then
                                                CurrentCamera.FieldOfView = Flags["Field of View Slider"];
                                            end;
                                        end);
                                    end;
                                end;
                                --
                                local Customizations = Viewmodel:Section({Name = "Customizations"; Side = "Right"});
                                do
                                    local HighlightViewmodel = Customizations:Toggle({Name = "Highlight Viewmodel", Flag = "Highlight Viewmodel"})
                                    HighlightViewmodel:Colorpicker({Flag = "Viewmodel Highlight Color"; Default = Color3.new(1, 1, 1); Transparency = 0});
                                    HighlightViewmodel:Colorpicker({Flag = "Viewmodel Highlight Outline Color"; Default = Color3.new(0, 0, 0); Transparency = 0});
                                    local ViewmodelChams = Customizations:Toggle({Name = "Viewmodel Chams", Flag = "Viewmodel Chams"});
                                    Customizations:Toggle({Name = "Remove Clothing", Flag = "Viewmodel Remove Clothing"});
                                    Customizations:Dropdown({Flag = "ForceField Texture"; Name = "Viewmodel ForceField Texture"; Options = {"Web", "Swirl", "Checkers", "CandyCane", "Dots", "Scanning", "Bubbles", "Player FF Texture", "Shield Forcefield", "Water", "America", "Rainbow", "Akatsuki", "None"}; Default = "None"});
                                    --
                                    local Shirt = Customizations:Toggle({Name = "Shirts", Flag = "Viewmodel Shirt Chams"})
                                    Shirt:Colorpicker({Name = "Shirt Color"; Flag = "Viewmodel Shirt Color"; Default = Color3.new(1, 1, 1); Transparency = 0});
                                    Customizations:Dropdown({Flag = "Viewmodel Shirt Chams Material"; Name = "Shirt Material"; Options = {"Neon", "Glass", "ForceField", "SmoothPlastic"}; Default = "ForceField"});
                                    --
                                    local Item = Customizations:Toggle({Name = "Items", Flag = "Viewmodel Item Chams"});
                                    Item:Colorpicker({Name = "Item Color"; Flag = "Viewmodel Item Color"; Default = Color3.new(1, 1, 1); Transparency = 0});
                                    Customizations:Dropdown({Flag = "Viewmodel Item Chams Material"; Name = "Item Material"; Options = {"Neon", "Glass", "ForceField", "SmoothPlastic"}; Default = "ForceField"});
                                    --
                                    local Glove = Customizations:Toggle({Name = "Gloves", Flag = "Viewmodel Glove Chams"});
                                    Glove:Colorpicker({Name = "Glove Color"; Flag = "Viewmodel Glove Color"; Default = Color3.new(1, 1, 1); Transparency = 0});
                                    Customizations:Dropdown({Flag = "Viewmodel Glove Chams Material"; Name = "Glove Material"; Options = {"Neon", "Glass", "ForceField", "SmoothPlastic"}; Default = "ForceField"});
                                    --
                                    local Arm = Customizations:Toggle({Name = "Arms", Flag = "Viewmodel Arm Chams"});
                                    Arm:Colorpicker({Name = "Arm Color"; Flag = "Viewmodel Arm Color"; Default = Color3.new(1, 1, 1); Transparency = 0});
                                    Customizations:Dropdown({Flag = "Viewmodel Arm Chams Material"; Name = "Arm Material"; Options = {"Neon", "Glass", "ForceField", "SmoothPlastic"}; Default = "ForceField"});
                                end;
                            end;
                        end;
                        --
                        local Miscellaneous = Window:Tab({Name = "Miscellaneous"});
                        do
                            local Main = Miscellaneous:InnerTab({Name = "Main"});
                            do
                                local Weapon = Main:Section({Name = "Weapon"; Side = "Left"});
                                do
                                    Weapon:Toggle({Name = "Hitlogs"; Flag = "Hitlogs"})
                                    Weapon:Toggle({Name = "Bullet Tracers"; Flag = "Bullet Tracers"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "Bullet Tracer Color"});
                                    Weapon:Dropdown({Options = {"Flat", "Beam"}; Flag = "Bullet Tracer Style"; Max = 3; Default = "Flat"});
                                    Weapon:Slider({Flag = "Bullet Tracer Lifetime"; Min = 0; Max = 10; Decimals = 0.01; Suffix = "s"; Default = 5});
                                    Weapon:Toggle({Name = "Hitmarkers"; Flag = "Hitmarkers"}):Colorpicker({Default = Color3.fromRGB(255, 255, 255), Flag = "Hitmarker Color"});
                                    Weapon:Slider({Flag = "Hitmarker Lifetime"; Min = 0; Max = 10; Decimals = 0.01; Suffix = "s"; Default = 5});
                                    Weapon:Toggle({Name = "Headshot Sound"; Flag = "Hitsound Head Shot"; Default = "Rust"});
                                    Weapon:Dropdown({Options = Panichook.HitsoundList; Flag = "Hitsound Head Shot Selected"; Max = 7; Default = "Rust"});
                                    Weapon:Toggle({Name = "Bodyshot Sound"; Flag = "Hitsound Body Shot"});
                                    Weapon:Dropdown({Options = Panichook.HitsoundList; Flag = "Hitsound Body Shot Selected"; Max = 7; Default = "Rust"});
                                    Weapon:Toggle({Name = "Armorshot Sound"; Flag = "Hitsound Armor Shot"});
                                    Weapon:Dropdown({Options = Panichook.HitsoundList; Flag = "Hitsound Armor ShotSelected"; Max = 7; Default = "Rust"});
                                    Weapon:Toggle({Name = "Helmetshot Sound"; Flag = "Hitsound Helment Shot"});
                                    Weapon:Dropdown({Options = Panichook.HitsoundList; Flag = "Hitsound Helment Shot Selected"; Max = 7; Default = "Rust"});
                                    Weapon:Slider({Name = "Volume"; Flag = "Hitsound Volume"; Min = 0; Max = 10; Decimals = 0.01; Suffix = "dB"; Default = 4});
                                end;
                                --
                                local Chatspam = Main:Section({Name = "Chat"; Side = "Left"});
                                do
                                    Chatspam:Toggle({Name = "Chatspam"; Flag = "Chatspam"});
                                    Chatspam:Toggle({Name = "Use Emojis"; Flag = "Use Emojis"});
                                    Chatspam:Toggle({Name = "Use Symbols"; Flag = "Use Symbols"});
                                    Chatspam:Dropdown({Name = "Phrases"; Options = {"British", "Catgirl", "Trashtalk", "Disabled"}; Flag = "Chatspam Phrases"; Max = 4; Default = "Disabled"});
                                    Chatspam:Slider({Name = "Delay"; Flag = "Chatspam Delay"; Min = 0; Max = 10; Decimals = 0.01; Suffix = "s"; Default = 3});
                                end;
                                --
                                local Removals = Main:Section({Name = "Removals"; Side = "Right"});
                                do
                                    Removals:Toggle({Name = "Remove Drowning", Flag = "Remove Drowning"});
                                    Removals:Toggle({Name = "Remove Visor", Flag = "Remove Visor"; Callback = function(State) Visor.Visible = not State; end});
                                    Removals:Toggle({Name = "Remove Landmines", Flag = "Remove Landmines"; Callback = function() workspace.AiZones.OutpostLandmines:Destroy(); end});
                                    Removals:Toggle({Name = "Remove Server Information", Flag = "Remove Server Information"; Callback = function(State) ServerInfo.TextLabel3.Visible = not State; end});
                                end;
                                --
                                local Movement = Main:Section({Name = "Movement"; Side = "Right"});
                                do
                                    Movement:Toggle({Name = "Jesus"; Flag = "Jesus"})
                                    Movement:Toggle({Name = "Speedhack"; Flag = "Speedhack"})
                                    Movement:Slider({Flag = "Speedhack Speed"; Min = 0; Max = 1; Decimals = 0.001; Suffix = "s"; Default = 0});
                                end;
                                --
                                local Crosshair = Main:Section({Name = "Crosshair"; Side = "Right"});
                                do
                                    Crosshair:Toggle({Name = "Crosshair", Flag = "Crosshair"}):Colorpicker({Name = "Crosshair Color"; Flag = "Crosshair Color"});
                                    Crosshair:Dropdown({Flag = "Crosshair Style", Options = {"Cross", "Swasktia"}; Default = "Cross"});
                                    Crosshair:Toggle({Name = "Always Rotating", Flag = "Always Rotate"});
                                    Crosshair:Toggle({Name = "Dynamic Size", Flag = "Dynamic Gap"});
                                    Crosshair:Slider({Default = 0, Max = 1000, Min = 0, Name = "Rotation Speed", Flag = "Crosshair Rotation Speed"});
                                    Crosshair:Slider({Max = 20, Min = 0, Name = "Gap Size", Flag = "Crosshair Gap"});
                                    Crosshair:Slider({Max = 20, Min = 0, Name = "Length", Flag = "Crosshair Length"});
                                    Crosshair:Dropdown({Name = "Position", Flag = "Crosshair Position", Options = {"Mouse", "Center", "Barrel"}; Default = "Mouse"});
                                    Crosshair:Dropdown({Max = 11, Name = "Rotation Style", Flag = "Crosshair Rotation Style", Options = {"Linear", "Quad", "Cubic", "Quart", "Quint", "Sine", "Back", "Elastic", "Bounce", "Circular", "Exponential"}; Default = "Linear"})
                                    Crosshair:Dropdown({Max = 3, Name = "Rotation Direction", Flag = "Crosshair Rotation Direction", Options = {"In", "Out", "InOut"}; Default = "In"});
                                end;
                            end;
                            --
                            local Skinchanger = Miscellaneous:InnerTab({Name = "Skinchanger"});
                            do
                                local M4 = Skinchanger:Section({Name = "M4 Skin(s)"; Side = "Left"}); 
                                do
                                    M4:Toggle({Name = "Enable M4 Skinchanger"; Flag = "M4 Skinchanger"})
                                    M4:Dropdown({Options = {"Apollo", "Diablo", "Freedom"}; Flag = "M4 Skinchanger Skin"; Max = 5; Default = "Default"});
                                end;
                                --
                                local Lighter = Skinchanger:Section({Name = "Lighter Skin(s)"; Side = "Left"}); 
                                do
                                    Lighter:Toggle({Name = "Enable Lighter Skinchanger"; Flag = "Lighter Skinchanger"})
                                    Lighter:Dropdown({Options = {"Default", "EarlyAccess"}; Flag = "Lighter Skinchanger Skin"; Max = 3; Default = "Default"});
                                end;
                                --
                                local Saiga12 = Skinchanger:Section({Name = "Saiga12 Skin(s)"; Side = "Left"}); 
                                do
                                    Saiga12:Toggle({Name = "Enable Saiga12 Skinchanger"; Flag = "Saiga12 Skinchanger"})
                                    Saiga12:Dropdown({Options = {"Default", "Valentine"}; Flag = "Saiga12 Skinchanger Skin"; Max = 3; Default = "Default"});
                                end;
                                --
                                local AKMN = Skinchanger:Section({Name = "AKMN Skin(s)"; Side = "Left"});
                                do
                                    AKMN:Toggle({Name = "Enable AKMN Skinchanger"; Flag = "AKMN Skinchanger"})
                                    AKMN:Dropdown({Options = {"Default", "DeltaAnime", "AnodizedRed", "Serpant", "Anton", "Hunter"}; Flag = "AKMN Skinchanger Skin"; Max = 7; Default = "Default"});
                                end;
                                --
                                local SVD = Skinchanger:Section({Name = "SVD Skin(s)"; Side = "Left"});
                                do
                                    SVD:Toggle({Name = "Enable SVD Skinchanger"; Flag = "SVD Skinchanger"})
                                    SVD:Dropdown({Options = {"Default", "Hunter", "Galaxy", "Permafrost"}; Flag = "SVD Skinchanger Skin"; Max = 5; Default = "Default"});
                                end;
                                --
                                local Melee = Skinchanger:Section({Name = "Melee Skin(s)"; Side = "Right"});
                                do
                                    do -- Setup
                                        for _, Value in next, ReplicatedStorage.Players[LocalPlayer.Name]:GetDescendants() do
                                            if Find({"IceDagger", "Karambit", "GoldenDV2", "IceAxe", "PlasmaNinjato", "DV2", "AnarchyTomahawk", "Cutlass"}, Value.Name) then
                                                Panichook.Locals.Melee = Value.Name;
                                                break;
                                            end;
                                        end;
                                    end;
                                    --
                                    Melee:Toggle({Name = "Enable Melee Skinchanger"; Flag = "Melee Skinchanger"; Callback = function(State)
                                        if State then
                                            for _, Value in next, ReplicatedStorage.Players[LocalPlayer.Name]:GetDescendants() do
                                                if Find({"IceDagger", "Karambit", "GoldenDV2", "IceAxe", "PlasmaNinjato", "DV2", "AnarchyTomahawk", "Cutlass"}, Value.Name) then
                                                    Value.Name = Flags["Melee Skinchanger Skin"];
                                                    if FindFirstChild(Value, "SettingsModule") then
                                                        local Script = require(Value.SettingsModule);
                                                        for Index, Value in next, Script do 
                                                            Script[Index] = Panichook.Knifes[Flags["Melee Skinchanger Skin"]][Index];
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        else
                                            for _, Value in next, ReplicatedStorage.Players[LocalPlayer.Name]:GetDescendants() do
                                                if Find({"IceDagger", "Karambit", "GoldenDV2", "IceAxe", "PlasmaNinjato", "DV2", "AnarchyTomahawk", "Cutlass"}, Value.Name) then
                                                    Value.Name = Panichook.Locals.Melee;
                                                    if FindFirstChild(Value, "SettingsModule") then
                                                        local Script = require(Value.SettingsModule);
                                                        for Index, Value in next, Script do 
                                                            Script[Index] = Panichook.Knifes[Panichook.Locals.Melee][Index];
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end});
                                    --
                                    Melee:Dropdown({Options = {"DV2", "AnarchyTomahawk", "IceDagger", "PlasmaNinjato", "Karambit", "IceAxe", "Cutlass"}; Flag = "Melee Skinchanger Skin"; Max = 7; Default = "DV2"; Callback = function(State)
                                        if Flags["Melee Skinchanger"] then
                                            for _, Value in next, ReplicatedStorage.Players[LocalPlayer.Name]:GetDescendants() do
                                                if Find({"IceDagger", "Karambit", "GoldenDV2", "IceAxe", "PlasmaNinjato", "DV2", "AnarchyTomahawk", "Cutlass"}, Value.Name) then
                                                    Value.Name = State;
                                                    if FindFirstChild(Value, "SettingsModule") then
                                                        local Script = require(Value.SettingsModule);
                                                        for Index, Value in next, Script do 
                                                            Script[Index] = Panichook.Knifes[State][Index];
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end});
                                end;
                                --
                                local Mosin = Skinchanger:Section({Name = "Mosin Skin(s)"; Side = "Right"}); 
                                do
                                    Mosin:Toggle({Name = "Enable Mosin Skinchanger"; Flag = "Mosin Skinchanger"})
                                    Mosin:Dropdown({Options = {"Default", "SkullHunter"}; Flag = "Mosin Skinchanger Skin"; Max = 3; Default = "Default"});
                                end;
                                --
                                local MP5SD = Skinchanger:Section({Name = "MP5SD Skin(s)"; Side = "Right"}); 
                                do
                                    MP5SD:Toggle({Name = "Enable MP5SD Skinchanger"; Flag = "MP5SD Skinchanger"})
                                    MP5SD:Dropdown({Options = {"Default", "Permafrost"}; Flag = "MP5SD Skinchanger Skin"; Max = 3; Default = "Default"});
                                end;
                                --
                                local PPSH41 = Skinchanger:Section({Name = "PPSH41 Skin(s)"; Side = "Right"}); 
                                do
                                    PPSH41:Toggle({Name = "Enable PPSH41 Skinchanger"; Flag = "PPSH41 Skinchanger"})
                                    PPSH41:Dropdown({Options = {"Default", "Nutcracker", "Arctic"}; Flag = "PPSH41 Skinchanger Skin"; Max = 4; Default = "Default"});
                                end;
                                --
                                local AsVal = Skinchanger:Section({Name = "AsVal Skin(s)"; Side = "Right"}); 
                                do
                                    AsVal:Toggle({Name = "Enable AsVal Skinchanger"; Flag = "AsVal Skinchanger"})
                                    AsVal:Dropdown({Options = {"Default", "GiftWrap"}; Flag = "AsVal Skinchanger Skin"; Max = 3; Default = "Default"});
                                end;
                            end;
                        end;
                        --
                        local Settings = Window:Tab({Name = "Settings"});
                        do
                            local Customization = Settings:Section({Name = "Customization"; Middle = true;});
                            do
                                Customization:Keybind({Name = "Open / Close"; Flag = "Menu Toggle"; Default = Enum.KeyCode.Insert; Callback = function() Menu:Toggle(not Menu.Open) end;});
                                Customization:Button({Name = "Reconnect", Callback = function() TeleportService:Teleport(game.PlaceId); end});
                                Customization:Button({Name = "Copy Connect", Callback = function() setclipboard(([[game:GetService("TeleportService"):TeleportToPlaceInstance(%s, "%s")]]):format(game.PlaceId, game.JobId)); end});
                                Customization:Dropdown({Name = "Themes"; Flag = "Themes"; Options = {"Default", "Onetap", "Dracula", "Interwebz", "Abyss", "Entropy"}; Default = "Default"; Callback = function(Theme) Menu:LoadTheme(Theme) end});
                                Customization:Colorpicker({Name = "Accent"; Flag = "Accent"; Default = Menu.Theme["Accent"], Callback = function(S) Menu:ChangeThemeColor("Accent", S) end})
                                Customization:Colorpicker({Name = "Border 1"; Flag = "Border1"; Default = Menu.Theme["Border1"], Callback = function(S) Menu:ChangeThemeColor("Border1", S) end})
                                Customization:Colorpicker({Name = "Border 2"; Flag = "Border2"; Default = Menu.Theme["Border2"], Callback = function(S) Menu:ChangeThemeColor("Border2", S) end})
                                Customization:Colorpicker({Name = "Light Contrast"; Flag = "LightContrast"; Default = Menu.Theme["Light Contrast"], Callback = function(S) Menu:ChangeThemeColor("Light Contrast", S) end})
                                Customization:Colorpicker({Name = "Dark Contrast"; Flag = "DarkContrast"; Default = Menu.Theme["Dark Contrast"], Callback = function(S) Menu:ChangeThemeColor("Dark Contrast", S) end})
                                Customization:Colorpicker({Name = "Text"; Flag = "Text"; Default = Menu.Theme["Text"], Callback = function(S) Menu:ChangeThemeColor("Text", S) end})
                                Customization:Colorpicker({Name = "Dark Text"; Flag = "DarkText"; Default = Menu.Theme["Dark Text"], Callback = function(S) Menu:ChangeThemeColor("Dark Text", S) end})
                                Customization:Colorpicker({Name = "Risky"; Flag = "Risky"; Default = Menu.Theme["Risky"], Callback = function(S) Menu:ChangeThemeColor("Risky", S) end})
                            end;
                            --
                            local Panels = Settings:Section({Name = "Panels"; Side = "Right"});
                            do
                                Panels:Toggle({Name =  "Show Watermark", Flag = "Show Watermark"; Callback = function(State) Menu:WatermarkState(State) end});
                                Panels:Slider({Default = 500, Max = 1000, Min = 0, Name = "Rotation Speed", Flag = "Watermark Rotation Speed"});
                                Panels:Dropdown({Max = 11, Name = "Rotation Style", Flag = "Watermark Rotation Style", Options = {"Linear", "Quad", "Cubic", "Quart", "Quint", "Sine", "Back", "Elastic", "Bounce", "Circular", "Exponential"}; Default = "Linear"})
                                Panels:Dropdown({Max = 3, Name = "Rotation Direction", Flag = "Watermark Rotation Direction", Options = {"In", "Out", "InOut"}; Default = "In"});
                            end;
                            --
                            local Configuration = Settings:Section({Name = "Configuration"; Side = "Right"});
                            do
                                do -- Configs
                                    local CurrentList = {};
                                    local function UpdateConfigList()
                                        local List = {};
                                        for idx, file in ipairs(listfiles("Panichook/Configs")) do
                                            local FileName = file:gsub("Panichook/Configs\\", ""):gsub(".cfg", "")
                                            List[#List + 1] = FileName;
                                        end;
                            
                                        local IsNew = #List ~= #CurrentList
                                        if not IsNew then
                                            for idx, file in ipairs(List) do
                                                if file ~= CurrentList[idx] then
                                                    IsNew = true;
                                                    break;
                                                end;
                                            end;
                                        end;
                            
                                        if IsNew then
                                            CurrentList = List;
                                            Pointers.SettingConfigurationList.Options = CurrentList;
                                            Pointers.SettingConfigurationList:Refresh(Pointers.SettingConfigurationList.Options);
                                        end;
                                    end;

                                    -- // Config list
                                    Configuration:Dropdown({Name = "Configs"; Flag = "SettingConfigurationList"});
                                    Configuration:Textbox({Name = "Config Name"; Flag = "SettingsConfigurationName"; Default = "Config Name"});
                                    --
                                    Configuration:Button({Name = "Create", Callback = function()
                                        local Success, Error = pcall(function()
                                            local ConfigName = Flags.SettingsConfigurationName;
                                            if ConfigName == "" or isfile("Panichook/Configs/" .. ConfigName .. ".cfg") then
                                                return;
                                            end;
                                            writefile("Panichook/Configs/" .. ConfigName .. ".cfg", "");
                                            UpdateConfigList();
                                        end);

                                        if Success then
                                            Menu:Notify(("Successfully created config: %s"):format(Flags["SettingsConfigurationName"]), 5);
                                        else
                                            Menu:Notify(("Could not create config: %s because of %s"):format(Flags["SettingsConfigurationName"], Error), 5);
                                        end;
                                    end});
                                    --
                                    Configuration:Button({Name = "Save", Callback = function()
                                        local Success, Error = pcall(function()
                                            local SelectedConfig = Flags.SettingConfigurationList;
                                            if SelectedConfig then
                                                writefile("Panichook/Configs/" .. SelectedConfig .. ".cfg", Menu:GetConfig())
                                            end;
                                        end);

                                        if Success then
                                            Menu:Notify(("Successfully saved config: %s"):format(Flags["SettingConfigurationList"]), 5);
                                        else
                                            Menu:Notify(("Could not save config: %s because of %s"):format(Flags["SettingConfigurationList"], Error), 5);
                                        end;
                                    end});
                                    --
                                    Configuration:Button({Name = "Load", Callback = function()
                                        local Success, Error = pcall(function()
                                            local SelectedConfig = Flags.SettingConfigurationList;
                                            if SelectedConfig then
                                                Menu:LoadConfig(readfile("Panichook/Configs/" .. SelectedConfig .. ".cfg"))
                                            end;
                                        end)

                                        if Success then
                                            Menu:Notify(("Successfully loaded config: %s"):format(Flags["SettingConfigurationList"]), 5);
                                        else
                                            Menu:Notify(("Could not load config: %s because of %s"):format(Flags["SettingConfigurationList"], Error), 5);
                                        end;
                                    end});
                                    --
                                    Configuration:Button({Name = "Refresh", Callback = function()
                                        Menu:Notify("Refreshed List", 5);
                                        UpdateConfigList();
                                    end});
                                    UpdateConfigList();
                                end;
                            end;
                        end;
                    end;
                end;
                --
                do -- Main
                    LPH_NO_VIRTUALIZE(function()
                        do -- Connections
                            do -- PreSimulation
                                Loops.PreSimulation = Panichook:Connection(RunService.PreSimulation, function(DeltaTime)
                                    do -- Visuals
                                        Panichook:Thread(function()
                                            for Index, Value in pairs(Visuals.Cache) do
                                                Value:Update();
                                            end;
                                        end, "0x00");
                                    end;
                                    --
                                    do -- Combat Update
                                        Panichook:Thread(function()
                                            local Target = Panichook:GetClosestTargetToFOV();
                                            if Target == nil then
                                                Panichook.Locals.CurrentSilentTarget = nil;
                                                Panichook.Locals.CurrentSilentName = "No-one!";
                                                Panichook.Locals.CurrentId = nil;
                                                Panichook.Locals.PrimaryPart = nil;
                                            end;
                                        end, "0x01");
                                    end;
                                    --
                                    do -- FOV update
                                        Panichook:Thread(function()
                                            do -- Silent
                                                local Position = UserInputService:GetMouseLocation(); 
                                                if Flags["Silent FOV Position"] == "Center" then 
                                                    Position = CurrentCamera.ViewportSize / 2;
                                                end;

                                                Panichook.Locals.Drawings.FieldOfView.Visible = typeof(Flags["Silent Use FOV"]) == "boolean" and Flags["Silent Use FOV"] or false;
                                                if Panichook.Locals.Drawings.FieldOfView.Visible then
                                                    Panichook.Locals.Drawings.FieldOfView.Position = UDim2.new(0, Position.X, 0, Position.Y);
                                                    Panichook.Locals.Drawings.FieldOfView.Size = UDim2.new(0, Flags["Silent FOV Radius"] * 2, 0, Flags["Silent FOV Radius"] * 2);
                                                    Panichook.Locals.Drawings.FieldOfView.UIStroke.UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Flags["Silent FOV Left Gradient Color"]), ColorSequenceKeypoint.new(1, Flags["Silent FOV Right Gradient Color"])});

                                                    do -- Animations
                                                        local Rotation = 0;
                                                        local Time = tick();
                                                        do
                                                            do -- Settings
                                                                if Flags["Animate Field of View"] then
                                                                    if Flags["Silent FOV Rotation Style"] ~= "Linear" then 
                                                                        local Style = Tween.EasingStyle[Enum.EasingStyle[Flags["Silent FOV Rotation Style"]]][Enum.EasingDirection[Flags["Silent FOV Rotation Direction"]]](Cos(Pi / 2 * tick() - Pi / 2))
                                                                        Rotation = Style * (Flags["Silent FOV Rotation Speed"])
                                                                    else 
                                                                        Rotation = Cos(Time) * (Flags["Silent FOV Rotation Speed"]);
                                                                    end;
                                                                    Panichook.Locals.Drawings.FieldOfView.UIStroke.UIGradient.Rotation = Rotation;
                                                                end;
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end, "0x02");
                                    end;
                                    --
                                    do -- Watermark
                                        Panichook:Thread(function()
                                            if Flags["Show Watermark"] then
                                                local Accent = tostring(tostring(Round(Flags.Accent.r*255)) .. "," .. tostring(Round(Flags.Accent.g*255)) .. "," .. tostring(Round(Flags.Accent.b*255)))
                                                local TimeLeft = tostring(LRM_SecondsLeft * 60) .. " minutes";
                                                local ActualTime = Panichook:ConvetTime(Panichook.Locals.Lighting.Current.ClockTime or Lighting.ClockTime);
                                                local KillDeathRatio = ReplicatedStorage.Players and FindFirstChild(ReplicatedStorage.Players, LocalPlayer.Name) and FindFirstChild(ReplicatedStorage.Players[LocalPlayer.Name], "Status") and FindFirstChild(ReplicatedStorage.Players[LocalPlayer.Name].Status, "Journey") and FindFirstChild(ReplicatedStorage.Players[LocalPlayer.Name].Status.Journey, "Statistics") and ReplicatedStorage.Players[LocalPlayer.Name].Status.Journey.Statistics:GetAttribute("Kills") .. "/" .. ReplicatedStorage.Players[LocalPlayer.Name].Status.Journey.Statistics:GetAttribute("Deaths") or "0/0";
                                                
                                                -- Setting
                                                Menu:UpdateWatermark((`<font color="rgb(%s)">%s</font> | game: <font color="rgb(%s)">%s</font> | time left: <font color="rgb(%s)">%s</font> | kd ratio: <font color="rgb(%s)">%s</font> | actual in game time: <font color="rgb(%s)">%s</font>`):format(Accent, "panichook9", Accent, "Project Delta", Accent, TimeLeft, Accent, KillDeathRatio, Accent, ActualTime));
                                                Menu:AnimateWatermark();
                                            end;
                                        end, "0x03");
                                    end;
                                    --
                                    do -- Hitmarkers
                                        Panichook:Thread(function()
                                            if Flags["Hitmarkers"] then
                                                for Index, Value in next, Panichook.Locals.Hitmarkers do 
                                                    Panichook:UpdateHits(Index);
                                                    if tick() - Panichook.Locals.Hitmarkers[Index].Time > Flags["Hitmarker Lifetime"] then
                                                        for Index, Value in next, Panichook.Locals.Hitmarkers[Index].Drawings do 
                                                            DestroyRenderObject(Value);
                                                        end;
                                                        Panichook.Locals.Hitmarkers[Index] = nil;
                                                    end;
                                                end;
                                            end;
                                        end, "0x04");
                                    end;
                                    --
                                    do -- Bullet Tracers
                                        Panichook:Thread(function()
                                            if Flags["Bullet Tracers"] and Flags["Bullet Tracer Style"] == "Flat" then
                                                for Index, Value in next, Panichook.Locals.Tracers do 
                                                    Panichook:UpdateTracers(Index)
                                                    if tick() - Panichook.Locals.Tracers[Index].Time > Flags["Bullet Tracer Lifetime"] then
                                                        DestroyRenderObject(Panichook.Locals.Tracers[Index].Tracer);
                                                        Panichook.Locals.Tracers[Index] = nil;
                                                    end;
                                                end;
                                            end;
                                        end, "0x05");
                                    end;
                                end);
                            end;
                            --
                            do -- Heartbeat
                                Loops.Heartbeat = Panichook:Connection(RunService.PreRender, function(DeltaTime)
                                    do -- Speedhack
                                        Panichook:Thread(function()
                                            local Character = LocalPlayer.Character;
                                            if Character and FindFirstChild(Character, "Humanoid") then 
                                                do -- Speedhack
                                                    local Humanoid = FindFirstChildOfClass(Character, "Humanoid")
                                                    Spawn(function()
                                                        if Flags["Speedhack"] then
                                                            local Root = Humanoid.RootPart 
                                                            RunService.Heartbeat:Wait()
                                                            Root.CFrame = Root.CFrame + Vector3.new(Humanoid.MoveDirection.X * Flags["Speedhack Speed"], Humanoid.MoveDirection.Y * Flags["Speedhack Speed"], Humanoid.MoveDirection.Z * Flags["Speedhack Speed"])
                                                        end;
                                                    end);
                                                end;
                                                --
                                                do -- Jesus
                                                    local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
                                                    if Flags["Jesus"] and HumanoidRootPart then
                                                        local Ray = Raycast(workspace, HumanoidRootPart.Position, Vector3.new(0, -5, 0) + HumanoidRootPart.CFrame.LookVector * 5, RaycastParams.new())
                                                        if Ray and Ray.Material == Enum.Material.Water then
                                                            local Clone = Panichook.Locals.Drawings.Jesus:Clone();
                                                            Clone.Parent = workspace;
                                                            Clone.Position = Ray.Position;
                                                            Clone.Anchored = true;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end, "0x08");
                                    end;
                                    --
                                    do -- Chatspam
                                        Panichook:Thread(function()
                                            if tick() - Panichook.Locals.Chatspam > (Flags["Chatspam Delay"]) then
                                                if Flags["Chatspam"] then
                                                    Spawn(function()
                                                        local Emojis = Flags["Use Emojis"] and Chat.Emojis or {""};
                                                        local Symbols = Flags["Use Symbols"] and Chat.Symbols or {""};
                                                        local Type = {""};
                                                        local Phrases = Flags["Chatspam Phrases"] ~= "Disabled" and Chat.Phrases[Flags["Chatspam Phrases"]] or {""};
                                                        -- 
                                                        local Wrapped = Chat:GenerateText(Type[Random(1, #Type)], Phrases, Emojis, Symbols);
                                                        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Wrapped, "Global");
                                                    end);
                                                    Panichook.Locals.Chatspam = tick();
                                                end;
                                            end;
                                        end, "0x09");
                                    end;
                                end);
                            end;
                            --
                            do -- Renderstepped
                                Loops.RenderStepped = Panichook:Connection(RunService.RenderStepped, function(DeltaTime)
                                    do -- Viewer
                                        Panichook:Thread(function()
                                            local ArmorIndexs = {};
                                            local BeltIndexs = {};
                                            local InventoryValue = 1;
                                            --
                                            if Panichook.Locals.CurrentSilentTarget and Panichook.Locals.CurrentSilentName ~= "No-one!" and FindFirstChild(Players, Panichook.Locals.CurrentSilentName) and Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]) then
                                                do -- Hotbar Viewer
                                                    if Flags["Belt Viewer"] then
                                                        if Panichook.Locals.CurrentId == 0 then
                                                            if Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]) and FindFirstChild(Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]), "Inventory") then
                                                                local CurrentWeapon = Character:GetWeapon("Bot", Panichook.Locals.CurrentSilentName, Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]));
                                                                Panichook.Locals.Drawings.Item1.Visible = true;
                                                                Panichook.Locals.Drawings.Item2.Visible = true;
                                                                Panichook.Locals.Drawings.Item3.Visible = true;
                                                                Panichook.Locals.Drawings.NameHolder.Visible = true;

                                                                for _, Item in pairs(Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]).Inventory:GetChildren()) do
                                                                    local ItemProperties = FindFirstChild(Item, "ItemProperties");
                                                                    if ItemProperties then
                                                                        InventoryValue = InventoryValue + ItemProperties:GetAttribute("Price");
                                                                        BeltIndexs[_] = {ItemProperties.ItemIcon.Image, Item.Name == CurrentWeapon and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)};
                                                                    else
                                                                        BeltIndexs = {};
                                                                    end;
                                                                end;
                                                                --
                                                                Panichook.Locals.Drawings.Item1.Image = BeltIndexs[1] ~= nil and BeltIndexs[1][1] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Item2.Image = BeltIndexs[2] ~= nil and BeltIndexs[2][1] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Item3.Image = BeltIndexs[3] ~= nil and BeltIndexs[3][1] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Item1.ImageColor3 = BeltIndexs[1] ~= nil and BeltIndexs[1][2] or Color3.fromRGB(255, 255, 255);
                                                                Panichook.Locals.Drawings.Item2.ImageColor3 = BeltIndexs[2] ~= nil and BeltIndexs[2][2] or Color3.fromRGB(255, 255, 255);
                                                                Panichook.Locals.Drawings.Item3.ImageColor3 = BeltIndexs[3] ~= nil and BeltIndexs[3][2] or Color3.fromRGB(255, 255, 255);
                                                                Panichook.Locals.Drawings.Name.Text = Panichook.Locals.CurrentSilentName .. " - " .. `<font color="rgb(66, 141, 245)">` .. tostring(InventoryValue) .. "₽</font>";
                                                            end;
                                                        else
                                                            if FindFirstChild(Players, Panichook.Locals.CurrentSilentName) and Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]) and FindFirstChild(ReplicatedStorage.Players, Panichook.Locals.CurrentSilentName) then
                                                                local CurrentWeapon = Character:GetWeapon("Player", Panichook.Locals.CurrentSilentName, Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]));
                                                                Panichook.Locals.Drawings.Item1.Visible = true;
                                                                Panichook.Locals.Drawings.Item2.Visible = true;
                                                                Panichook.Locals.Drawings.Item3.Visible = true;
                                                                Panichook.Locals.Drawings.NameHolder.Visible = true;

                                                                for _, Item in pairs(ReplicatedStorage.Players[Panichook.Locals.CurrentSilentName].Inventory:GetChildren()) do
                                                                    local ItemProperties = FindFirstChild(Item, "ItemProperties");
                                                                    if ItemProperties then
                                                                        InventoryValue = InventoryValue + ItemProperties:GetAttribute("Price");
                                                                        BeltIndexs[_] = {ItemProperties.ItemIcon.Image, Item.Name == CurrentWeapon and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)};
                                                                    else
                                                                        BeltIndexs = {};
                                                                    end;
                                                                end;
                                                                --
                                                                Panichook.Locals.Drawings.Item1.Image = BeltIndexs[1] ~= nil and BeltIndexs[1][1] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Item2.Image = BeltIndexs[2] ~= nil and BeltIndexs[2][1] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Item3.Image = BeltIndexs[3] ~= nil and BeltIndexs[3][1] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Item1.ImageColor3 = BeltIndexs[1] ~= nil and BeltIndexs[1][2] or Color3.fromRGB(255, 255, 255);
                                                                Panichook.Locals.Drawings.Item2.ImageColor3 = BeltIndexs[2] ~= nil and BeltIndexs[2][2] or Color3.fromRGB(255, 255, 255);
                                                                Panichook.Locals.Drawings.Item3.ImageColor3 = BeltIndexs[3] ~= nil and BeltIndexs[3][2] or Color3.fromRGB(255, 255, 255);
                                                                Panichook.Locals.Drawings.Name.Text = Panichook.Locals.CurrentSilentName .. " - " .. `<font color="rgb(66, 141, 245)">` .. tostring(InventoryValue) .. "₽</font>";
                                                            end;
                                                        end;
                                                    else
                                                        BeltIndexs = {};
                                                        Panichook.Locals.Drawings.Item1.Visible = false;
                                                        Panichook.Locals.Drawings.Item2.Visible = false;
                                                        Panichook.Locals.Drawings.Item3.Visible = false;
                                                        Panichook.Locals.Drawings.NameHolder.Visible = false;
                                                    end;
                                                end;
                                                --
                                                do -- Armor Viewer
                                                    if Flags["Clothing Viewer"] then
                                                        Panichook.Locals.Drawings.Armor1.Visible = true;  
                                                        Panichook.Locals.Drawings.Armor2.Visible = true;
                                                        Panichook.Locals.Drawings.Armor3.Visible = true;
                                                        Panichook.Locals.Drawings.Armor4.Visible = true;
                                                        Panichook.Locals.Drawings.Armor5.Visible = true;
                                                        Panichook.Locals.Drawings.Armor6.Visible = true;
                                                        Panichook.Locals.Drawings.Armor7.Visible = true;
                                                        Panichook.Locals.Drawings.Armor8.Visible = true;

                                                        if Panichook.Locals.CurrentId == 0 then
                                                            if FindFirstChild(Players, Panichook.Locals.CurrentSilentName) and Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]) and FindFirstChild(Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]), "Clothing") then
                                                                for _, Clothes in pairs(Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]).Clothing:GetChildren()) do
                                                                    local ItemProperties = FindFirstChild(Clothes, "ItemProperties");
                                                                    if ItemProperties then
                                                                        InventoryValue = InventoryValue + ItemProperties:GetAttribute("Price");
                                                                        ArmorIndexs[_] = ItemProperties.ItemIcon.Image;
                                                                    else
                                                                        ArmorIndexs = {};
                                                                    end;
                                                                end;
                                                                --
                                                                Panichook.Locals.Drawings.Armor1.Image = ArmorIndexs[1] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor2.Image = ArmorIndexs[2] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor3.Image = ArmorIndexs[3] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor4.Image = ArmorIndexs[4] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor5.Image = ArmorIndexs[5] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor6.Image = ArmorIndexs[6] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor7.Image = ArmorIndexs[7] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor8.Image = ArmorIndexs[8] or "rbxassetid://0";
                                                            end;
                                                        else
                                                            if FindFirstChild(Players, Panichook.Locals.CurrentSilentName) and Character:GetCharacter(Players[Panichook.Locals.CurrentSilentName]) and FindFirstChild(ReplicatedStorage.Players, Panichook.Locals.CurrentSilentName) then
                                                                for _, Clothes in pairs(ReplicatedStorage.Players[Panichook.Locals.CurrentSilentName].Clothing:GetChildren()) do
                                                                    local ItemProperties = FindFirstChild(Clothes, "ItemProperties");
                                                                    if ItemProperties then
                                                                        InventoryValue = InventoryValue + ItemProperties:GetAttribute("Price");
                                                                        ArmorIndexs[_] = ItemProperties.ItemIcon.Image;
                                                                    else
                                                                        ArmorIndexs = {};
                                                                    end;
                                                                end;
                                                                --
                                                                Panichook.Locals.Drawings.Armor1.Image = ArmorIndexs[1] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor2.Image = ArmorIndexs[2] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor3.Image = ArmorIndexs[3] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor4.Image = ArmorIndexs[4] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor5.Image = ArmorIndexs[5] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor6.Image = ArmorIndexs[6] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor7.Image = ArmorIndexs[7] or "rbxassetid://0";
                                                                Panichook.Locals.Drawings.Armor8.Image = ArmorIndexs[8] or "rbxassetid://0";
                                                            end;
                                                        end;
                                                    else
                                                        ArmorIndexs = {};
                                                        Panichook.Locals.Drawings.Armor1.Visible = false;
                                                        Panichook.Locals.Drawings.Armor2.Visible = false;
                                                        Panichook.Locals.Drawings.Armor3.Visible = false;
                                                        Panichook.Locals.Drawings.Armor4.Visible = false;
                                                        Panichook.Locals.Drawings.Armor5.Visible = false;
                                                        Panichook.Locals.Drawings.Armor6.Visible = false;
                                                        Panichook.Locals.Drawings.Armor7.Visible = false;
                                                        Panichook.Locals.Drawings.Armor8.Visible = false;
                                                    end;
                                                end;
                                            else
                                                ArmorIndexs = {};
                                                BeltIndexs = {};
                                                InventoryValue = 1;
                                                Panichook.Locals.Drawings.NameHolder.Visible = false;
                                                Panichook.Locals.Drawings.Item1.Visible = false;
                                                Panichook.Locals.Drawings.Item2.Visible = false;
                                                Panichook.Locals.Drawings.Item3.Visible = false;
                                                Panichook.Locals.Drawings.Armor1.Visible = false;
                                                Panichook.Locals.Drawings.Armor2.Visible = false;
                                                Panichook.Locals.Drawings.Armor3.Visible = false;
                                                Panichook.Locals.Drawings.Armor4.Visible = false;
                                                Panichook.Locals.Drawings.Armor5.Visible = false;
                                                Panichook.Locals.Drawings.Armor6.Visible = false;
                                                Panichook.Locals.Drawings.Armor7.Visible = false;
                                                Panichook.Locals.Drawings.Armor8.Visible = false;
                                            end;
                                        end, "0x06");
                                    end;
                                    --
                                    do -- Crosshair
                                        Panichook:Thread(function()
                                            local Position = UserInputService:GetMouseLocation(); 
                                            local Rotation = Flags["Crosshair Rotation Speed"];
                                            local RotationSpeed = Flags["Crosshair Rotation Speed"];
                                            local Time = tick();
                                            local OscillationAmplitudeGap = 10;
                                            local OscillationPeriodGap = 0.1;
                                            local OscillationAmplitudeSize = 15;
                                            local OscillationPeriodSize = 0.2;
                                            local OscillationSize = Flags["Dynamic Gap"] and OscillationAmplitudeSize * Sin(Time / OscillationPeriodSize) or 0;
                                
                                            -- Settings
                                            do
                                                if Flags["Always Rotate"] and Flags["Always Rotate"] and Flags["Crosshair Rotation Style"] ~= "Linear" then 
                                                    local Style =  Tween.EasingStyle[Enum.EasingStyle[Flags["Crosshair Rotation Style"]]][Enum.EasingDirection[Flags["Crosshair Rotation Direction"]]](Cos(Pi / 2 * tick() - Pi / 2))
                                                    Rotation = Style * (Flags["Crosshair Rotation Speed"])
                                                else 
                                                    Rotation = Time * (Flags["Crosshair Rotation Speed"]);
                                                end;
                                                --
                                                if Flags["Crosshair Position"] and Flags["Crosshair Position"] == "Center" then 
                                                    Position = CurrentCamera.ViewportSize / 2;
                                                end;
                                                --
                                                if Flags["Crosshair Position"] and Flags["Crosshair Position"] == "Barrel" then 
                                                    local Viewmodel = FindFirstChild(CurrentCamera, "ViewModel");
                                                    if Viewmodel then
                                                        local Item = FindFirstChild(Viewmodel, "AimPart");
                                                        if Item then
                                                            local _, Hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(Item.Position, Item.CFrame.LookVector * -100), {})
                                                            local Ray = WorldToViewportPoint(CurrentCamera, Hit);
                                                            Position = Vector2.new(Ray.X, Ray.Y);
                                                        end;
                                                    end;
                                                end;
                                            end;
                                            --
                                            do -- Updating 
                                                for Index, Object in pairs(Drawings.Crosshair) do
                                                    if Object then
                                                        if Flags["Crosshair Style"] == "Cross" then
                                                            SetRenderProperty(Object[1], "Visible", Flags["Crosshair"]);
                                                            SetRenderProperty(Object[2], "Visible", Flags["Crosshair"]);
                                                            SetRenderProperty(Object[1], "Color", Color3.new());
                                                            
                                                            SetRenderProperty(Object[2], "From", Math:RoundVector(Position + Math:ToRotate(Rotation + 90 * (Index-1)) * (Flags["Crosshair Gap"])));
                                                            SetRenderProperty(Object[2], "To", Math:RoundVector(Position + Math:ToRotate(Rotation + 90 * (Index-1)) * (Flags["Crosshair Length"] + Flags["Crosshair Gap"] + OscillationSize)));
                                                            
                                                            SetRenderProperty(Object[1], "From", Math:RoundVector(Position + Math:ToRotate(Rotation + 90 * (Index-1)) * (Flags["Crosshair Gap"] - 1)));
                                                            SetRenderProperty(Object[1], "To", Math:RoundVector(Position + Math:ToRotate(Rotation + 90 * (Index-1)) * (Flags["Crosshair Length"] + Flags["Crosshair Gap"] + 1 + OscillationSize)));
                                                                
                                                            SetRenderProperty(Object[2], "Color", Flags["Crosshair Color"]);
                                                            SetRenderProperty(Object[2], "ZIndex", 2);
                                                            SetRenderProperty(Object[2], "Thickness", 1);
                                                            SetRenderProperty(Object[1], "ZIndex", 1);
                                                            SetRenderProperty(Object[1], "Thickness", 3);
                                                        else
                                                            local ActualSize = ScreenSize.Y / 2 / 60;
                                                            local Gamma = Atan(ActualSize / ActualSize);
                                                            local p_0 = (ActualSize * Sin(Math:DegToRad(Rotation + (Index * 90))))
                                                            local p_1 = (ActualSize * Cos(Math:DegToRad(Rotation + (Index * 90))))
                                                            local p_2 = ((ActualSize / Cos(Gamma)) * Sin(Math:DegToRad(Rotation + (Index * 90) + Math:RadToDeg(Gamma))));
                                                            local p_3 = ((ActualSize / Cos(Gamma)) * Cos(Math:DegToRad(Rotation + (Index * 90) + Math:RadToDeg(Gamma))));

                                                            SetRenderProperty(Object[1], "Visible", Flags["Crosshair"]);
                                                            SetRenderProperty(Object[2], "Visible", Flags["Crosshair"]);
                                                            SetRenderProperty(Object[1], "Color", Flags["Crosshair Color"]);
                                                            
                                                            SetRenderProperty(Object[2], "From", Vector2.new(Position.x, Position.y));
                                                            SetRenderProperty(Object[2], "To", Vector2.new(Position.x + p_0, Position.y - p_1));
                                                            
                                                            SetRenderProperty(Object[1], "From", Vector2.new(Position.x + p_0, Position.y - p_1));
                                                            SetRenderProperty(Object[1], "To", Vector2.new(Position.x + p_2, Position.y - p_3));
                                                            
                                                            SetRenderProperty(Object[2], "Color", Flags["Crosshair Color"]);
                                                            SetRenderProperty(Object[2], "ZIndex", 2);
                                                            SetRenderProperty(Object[2], "Thickness", 1.5);
                                                            SetRenderProperty(Object[1], "ZIndex", 1);
                                                            SetRenderProperty(Object[1], "Thickness", 1.5);
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end, "0x07");
                                    end;
                                    --
                                    do -- Tracer
                                        --[[if true and Panichook.Locals.CurrentSilentTarget then
                                            local Viewmodel = FindFirstChild(CurrentCamera, "ViewModel");
                                            if Viewmodel then
                                                local Item = FindFirstChild(Viewmodel, "AimPart");
                                                if Item then
                                                    Panichook.Locals.Drawings.Tracer.Origin.Position = Item.Position;
                                                    Panichook.Locals.Drawings.Tracer.Direction.Position = Panichook.Locals.CurrentSilentTarget.Position;
                                                else
                                                    local _, Hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(Mouse.Hit.p, Mouse.Hit.LookVector * 100), {})
                                                    if Hit then
                                                        Panichook.Locals.Drawings.Tracer.Origin.Position = Hit;
                                                        Panichook.Locals.Drawings.Tracer.Direction.Position = Panichook.Locals.CurrentSilentTarget.Position;
                                                    end;
                                                end;
                                            else
                                                local _, Hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(Mouse.Hit.p, Mouse.Hit.LookVector * 100), {})
                                                if Hit then
                                                    Panichook.Locals.Drawings.Tracer.Origin.Position = Hit;
                                                    Panichook.Locals.Drawings.Tracer.Direction.Position = Panichook.Locals.CurrentSilentTarget.Position;
                                                end;
                                            end;
                                        end;]]
                                    end;
                                end);
                            end;
                            --
                            do -- Current players
                                for _, Player in pairs(Players:GetPlayers()) do
                                    if Player == LocalPlayer then continue end;
                                    Visuals:Create(Player);
                                end;
                            end;
                            --
                            do -- PlayerAdded
                                Panichook:Connection(Players.PlayerAdded, function(Player)
                                    Visuals:Create(Player, Player.Character);
                                end);
                            end;
                            --
                            do -- PlayerRemoving
                                Panichook:Connection(Players.PlayerRemoving, function(Player)
                                    local Object = Visuals:GetObject(Player);
                                    if Object then
                                        Object:Destroy();
                                    end;
                                end);
                            end;
                            --
                            do -- Viewmodel Added
                                Panichook:Connection(CurrentCamera.ChildAdded, function()
                                    Wait(1);
                                    if Flags["Viewmodel Chams"] then 
                                        Panichook:UpdateViewmodel();
                                    end;
                                end);
                            end;
                            --
                            do -- Character Added
                                Panichook:Connection(LocalPlayer.CharacterAdded, function(Character)
                                    Panichook:OnCharacterAdded();
                                end);
                            end;
                            --
                            do -- AI
                                if FindFirstChild(workspace, "AiZones") then
                                    pcall(function()
                                        for _, Value in pairs(workspace.AiZones:GetChildren()) do
                                            Panichook:Connection(Value.ChildAdded, function(Value)
                                                Panichook:Instance("Player", {
                                                    Name = Value.Name;
                                                    UserId = 0;
                                                    DisplayName = "Bot";
                                                    Character = Value;
                                                    Parent = Players;
                                                });
                                            end);
                                            --
                                            for _, Value in pairs(Value:GetChildren()) do
                                                Panichook:Instance("Player", {
                                                    Name = Value.Name;
                                                    UserId = 0;
                                                    DisplayName = "Bot";
                                                    Character = Value;
                                                    Parent = Players;
                                                });
                                            end;
                                        end;
                                    end);
                                end;
                            end;
                            --
                            do -- Exits
                                do -- Current
                                    local NoCollision = FindFirstChild(workspace, "NoCollision");
                                    if NoCollision then
                                        local ExitLocations = FindFirstChild(NoCollision, "ExitLocations");
                                        if ExitLocations then
                                            for _, Exit in pairs(ExitLocations:GetChildren()) do
                                                Visuals:CreateObject("Exit Location", "Exit", Exit, "http://www.roblox.com/asset/?id=14239902836")
                                            end;
                                        end;
                                    end;
                                end;
                                --
                                do -- ChildAdded
                                    local NoCollision = FindFirstChild(workspace, "NoCollision");
                                    if NoCollision then
                                        local ExitLocations = FindFirstChild(NoCollision, "ExitLocations");
                                        if ExitLocations then
                                            Panichook:Connection(ExitLocations.ChildAdded, function(Exit)
                                                Visuals:CreateObject("Exit Location", "Exit", Exit, "http://www.roblox.com/asset/?id=14239902836")
                                            end);
                                        end;
                                    end;
                                end;
                            end;
                            --
                            do -- Corpse
                                do -- Current
                                    local DroppedItems = FindFirstChild(workspace, "DroppedItems");
                                    if DroppedItems then
                                        for _, Item in pairs(DroppedItems:GetChildren()) do
                                            if FindFirstChild(Players, Item.Name) and FindFirstChild(Item, "Head") then
                                                Visuals:CreateObject("Corpse of " .. Item.Name, "Corpse", Item.PrimaryPart, "http://www.roblox.com/asset/?id=14239904666");
                                            end;
                                        end;
                                    end;
                                end;
                                --
                                do -- ChildAdded
                                    local DroppedItems = FindFirstChild(workspace, "DroppedItems");
                                    if DroppedItems then
                                        Panichook:Connection(DroppedItems.ChildAdded, function(Item)
                                            Wait(1);
                                            if FindFirstChild(Players, Item.Name) and FindFirstChild(Item, "Head") then
                                                Visuals:CreateObject("Corpse of " .. Item.Name, "Corpse", Item.PrimaryPart, "http://www.roblox.com/asset/?id=14239904666");
                                            end;
                                        end);
                                    end;
                                end;
                            end;
                        end;
                        --
                        do -- Hooking
                            local Metatable = getrawmetatable(game);
                            local __namecall = Metatable.__namecall;
                            local __newindex = Metatable.__newindex;
                            setreadonly(Metatable, false);
                            --
                            do -- __namecall
                                Metatable.__namecall = function(Self, ...)
                                    local Args = {...};
                                    local CallingScript = getcallingscript();
                                    local Thread = checkcaller();
                                    local Method = getnamecallmethod();
                                    do
                                        do -- Main
                                            do -- Viewmodel
                                                if Method == "PivotTo" and Traceback() then 
                                                    local Split = Split(tostring(Traceback()), "function ");
                                                    if Split and Split[1] and Split[1]:find("Modules.FPS") then
                                                        if Flags["Viewmodel Sandboxing"] then
                                                            --[[local rotation = CFrame.Angles(0, math.rad(75), 0)
                                                            local translation = CFrame.new(0.05, -1.35, 0.7) * CFrame.new(Flags["Viewmodel X"], -Flags["Viewmodel Y"], -Flags["Viewmodel Z"])
                                                            local transformedCFrame = CurrentCamera.CFrame * translation * rotation
                                                            return __namecall(Self, transformedCFrame)]]
                                                            if Self.Name ~= "viewModel" then
                                                                return __namecall(Self, CurrentCamera.CFrame * CFrame.new(0.05, -1.35, 0.7) * CFrame.new(Flags["Viewmodel X"], -Flags["Viewmodel Y"], -Flags["Viewmodel Z"]));
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                            --
                                            do -- GetAttribute
                                                if Method == "GetAttribute" then
                                                    if Args[1] == "AccuracyDeviation" and Flags["Remove Spread"] then
                                                        return 0;
                                                    end;
                                                    --
                                                    if Flags["Resolve Angles"] then
                                                        if Find(Flags["Resolver"], "Pitch") and Args[1] == "UpAngle" then
                                                            return 0;
                                                        end;
                                                        --
                                                        if Find(Flags["Resolver"], "Yaw") and Args[1] == "SideAngle" then
                                                            return 0;
                                                        end;
                                                    end;
                                                    --
                                                    if Args[1] == "TracerColor" then
                                                        return Flags["Projectile Tracer Color"];
                                                    end;
                                                    --
                                                    if tostring(Self) == "ItemProperties" then
                                                        do -- Skin Changer
                                                            do -- M4
                                                                if FindFirstAncestor(Self, "M4") and Flags["M4 Skinchanger"] then
                                                                    if __namecall(Self, "Skin") ~= Flags["M4 Skinchanger Skin"] and Args[1] == "Skin" then
                                                                        return Flags["M4 Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                            --
                                                            do -- Lighter
                                                                if FindFirstAncestor(Self, "Lighter") and Flags["Lighter Skinchanger"] then
                                                                    if __namecall(Self, "Skin") ~= Flags["Lighter Skinchanger Skin"] and Args[1] == "Skin" then
                                                                        return Flags["Lighter Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                            --
                                                            do -- Mosin
                                                                if FindFirstAncestor(Self, "DV2") or tostring(Self) == "DV2" and Flags["Melee Skinchanger"] then
                                                                    if __namecall(Self, "SpecialSkinItem") ~= Flags["Melee Skinchanger Skin"] and Args[1] == "SpecialSkinItem" then
                                                                        return Flags["Melee Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                            --
                                                            do -- Saiga12
                                                                if FindFirstAncestor(Self, "Saiga12") and Flags["Saiga12 Skinchanger"] then
                                                                    if __namecall(Self, "Skin") ~= Flags["Saiga12 Skinchanger Skin"] and Args[1] == "Skin" then
                                                                        return Flags["Saiga12 Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                            --
                                                            do -- MP5SD
                                                                if FindFirstAncestor(Self, "MP5SD") and Flags["MP5SD Skinchanger"] then
                                                                    if __namecall(Self, "Skin") ~= Flags["MP5SD Skinchanger Skin"] and Args[1] == "Skin" then
                                                                        return Flags["MP5SD Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                            --
                                                            do -- AKMN
                                                                if FindFirstAncestor(Self, "AKMN") and Flags["AKMN Skinchanger"] then
                                                                    if __namecall(Self, "Skin") ~= Flags["AKMN Skinchanger Skin"] and Args[1] == "Skin" then
                                                                        return Flags["AKMN Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                            --
                                                            do -- PPSH41
                                                                if FindFirstAncestor(Self, "PPSH41") and Flags["PPSH41 Skinchanger"] then
                                                                    if __namecall(Self, "Skin") ~= Flags["PPSH41 Skinchanger Skin"] and Args[1] == "Skin" then
                                                                        return Flags["PPSH41 Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                            --
                                                            do -- SVD
                                                                if FindFirstAncestor(Self, "SVD") and Flags["SVD Skinchanger"] then
                                                                    if __namecall(Self, "Skin") ~= Flags["SVD Skinchanger Skin"] and Args[1] == "Skin" then
                                                                        return Flags["SVD Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                            --
                                                            do -- AsVal
                                                                if FindFirstAncestor(Self, "AsVal") and Flags["AsVal Skinchanger"] then
                                                                    if __namecall(Self, "Skin") ~= Flags["AsVal Skinchanger Skin"] and Args[1] == "Skin" then
                                                                        return Flags["AsVal Skinchanger Skin"];
                                                                    end;
                                                                end;
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                            -- 
                                            do -- Rayast
                                                if Method == "Raycast" and Flags["Instant Hit"] and Traceback() and Traceback():find("onStep", 1, true) then 
                                                    Args[2] = Args[2] * 9e9;
                                                end;
                                            end;
                                            --
                                            do -- InvokeServer
                                                if Method == "InvokeServer" then 
                                                    do -- Invoke Server
                                                        if tostring(Self) == "Reload" and Flags["Instant Reload"] then      
                                                            Args[1] = Args[1] and Args[1] or nil;
                                                            Args[2] = 0/0;
                                                            Args[3] = nil;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                            --
                                            do -- FireServer
                                                if Method == "FireServer" then 
                                                    if tostring(Self) == "ProjectileInflict" then
                                                        do -- Anticheat bypass
                                                            if typeof(Args[3]) == "string" and Len(Args[3]) == 1 then
                                                                return Yield();
                                                            end;
                                                        end;
                                                        --
                                                        do -- Hitmarkers
                                                            Spawn(function()
                                                                if Flags["Hitmarkers"] then
                                                                    Panichook:NewHitmarker(Args[1].Position);
                                                                end;
                                                            end);
                                                        end;
                                                        --
                                                        do -- Hitlogs
                                                            if Flags["Hitlogs"] then
                                                                Spawn(function()
                                                                    set_thread_identity(8);
                                                                end);
                                                            end;
                                                        end;
                                                    end;
                                                    --
                                                    if tostring(Self) == "Drowning" and Flags["Remove Drowning"] then
                                                        return Yield();
                                                    end;
                                                end;
                                            end;
                                        end;
                                        --
                                        do -- Returns
                                            return __namecall(Self, unpack(Args));
                                        end;
                                    end;
                                end;
                            end;
                            --
                            do -- __newindex
                                Metatable.__newindex = function(Self, Prop, Value)
                                    local CallingScript = getcallingscript();
                                    local Thread = checkcaller();
                                    do
                                        do -- Main
                                            do -- Bypasses
                                                do -- Lighting
                                                    if not Thread then
                                                        if Self == Lighting and Panichook.Locals.Lighting.Changed[Prop] then
                                                            Panichook.Locals.Lighting.Current[Prop] = Value; 
                                                            return;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                            --
                                            do -- Third Person
                                                if not Thread then
                                                    if Self == CurrentCamera and Prop == "CFrame" and Flags["Third Person"] and Flags["Third Person Bind"] then
                                                        return __newindex(Self, Prop, Value + CurrentCamera.CFrame.LookVector * -Flags["Thirdperson Distance"]);
                                                    end;
                                                end;
                                            end;
                                            --
                                            do -- Remove Recoil
                                                if Flags["Remove Recoil"] then
                                                    if Self == CurrentCamera and Prop == "CoordinateFrame" then
                                                        return __newindex(Self, Prop, CurrentCamera.CoordinateFrame);
                                                    end;
                                                end;
                                            end;
                                        end;
                                        --
                                        do -- Returns
                                            return __newindex(Self, Prop, Value);
                                        end;
                                    end;
                                end;
                            end;
                            --
                            do -- CreateBullet
                                local CreateBullet = require(ReplicatedStorage.Modules.FPS.Bullet).CreateBullet; 
                                require(ReplicatedStorage.Modules.FPS.Bullet).CreateBullet = function(Self, ...)
                                    local Args = {...}; do
                                        do -- Silent Aim
                                            if Flags["Silent Aim"] and Random(1, 100) <= Flags["Hitchance"] then
                                                if Panichook.Locals.CurrentSilentTarget then
                                                    local Destination = Panichook.Locals.CurrentSilentTarget.Position;
                                                    local DestinationVelocity = Panichook.Locals.CurrentSilentTarget.Velocity;
                                                    local Origin = Flags["Viewmodel Sandboxing"] and CurrentCamera.CFrame.p or Args[8].CFrame.p;
                                                    local LoadedAmmo = FindFirstChild(ReplicatedStorage.AmmoTypes, tostring(Args[5]))
                                                    local ProjectileSpeed = LoadedAmmo:GetAttribute("MuzzleVelocity");
                                                    local ProjectileDrop = LoadedAmmo:GetAttribute("ProjectileDrop");

                                                    -- Resolver
                                                    if Flags["Resolve Octohook"] then
                                                        local ReplicatedPlayers = FindFirstChild(ReplicatedStorage, "Players")
                                                        if ReplicatedPlayers then
                                                            local LocalReplicated = FindFirstChild(ReplicatedPlayers, Panichook.Locals.CurrentSilentName);
                                                            if LocalReplicated then
                                                                local Status = FindFirstChild(LocalReplicated, "Status");
                                                                if Status then
                                                                    local UAC = FindFirstChild(Status, "UAC");
                                                                    if UAC then
                                                                        local ServerPosition = UAC:GetAttribute("LastVerifiedPos");
                                                                        Destination = ServerPosition;
                                                                    end;
                                                                end;
                                                            end;
                                                        end;
                                                    end;
                                                    
                                                    -- Simulation
                                                    if Flags["Movement Prediction"] then
                                                        Destination = Physics:MovementPrediction(Origin, Destination, DestinationVelocity, ProjectileSpeed);
                                                    end;
                                                    --
                                                    if Flags["Compensate Bulletdrop"] then
                                                        Destination = Vector3.new(Destination.X, Destination.Y + Physics:Trajectory(Origin, Destination, ProjectileSpeed, ProjectileDrop), Destination.Z);
                                                    end;

                                                    -- Returns
                                                    Args[8] = {CFrame = CFrame.new(Origin, Destination)};
                                                end;
                                            end;
                                        end;
                                        --
                                        do -- Bullet Tracers
                                            Spawn(function()
                                                local VM = FindFirstChild(CurrentCamera, "ViewModel"); do
                                                    if VM and Flags["Bullet Tracers"] then 
                                                        local Item = VM and FindFirstChild(VM, "Item");
                                                        local Attachments = Item and FindFirstChild(Item, "Attachments");
                                                        local Barrel = FindFirstChild(Item, "Barrel");
                                                        if FindFirstChild(Attachments, "Front") then
                                                            Barrel = Attachments.Front:GetChildren()[1].Barrel;
                                                        else 
                                                            Barrel = FindFirstChild(Item, "Barrel");
                                                        end
                                                        local Direction = Barrel.CFrame.LookVector
                                                        
                                                        local RayCast = workspace:Raycast(Barrel.CFrame.p, Args[8].CFrame.LookVector * 7500, RaycastParam);
                                                        if RayCast and RayCast.Position then
                                                            if Flags["Bullet Tracer Style"] == "Flat" then  
                                                                Panichook:NewTracer(Barrel.CFrame.p, RayCast.Position)
                                                            else
                                                                Panichook:CreateBeam(Barrel.CFrame.p, RayCast.Position);
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end);
                                        end;
                                    end;
                                    return CreateBullet(Self, unpack(Args));
                                end;
                            end;
                            --
                            do -- GC Stuff
                                for _, Function in next, getgc(true) do 
                                    if typeof(Function) == "table" and rawget(Function, "RangedWeaponDefault") then
                                        Panichook.Locals.RangedWeaponDefault = Function.RangedWeaponDefault;
                                    end;
                                    --
                                    if Panichook.Locals.RecoilCamera and Panichook.Locals.UseBullet and Panichook.Locals.RangedWeaponDefault then
                                        break;
                                    end;
                                end;
                            end;
                            --
                            do -- UpdateClient
                                local UpdateClient = require(ReplicatedStorage.Modules.FPS).updateClient; 
                                require(ReplicatedStorage.Modules.FPS).updateClient = function(...)
                                    local Args = {...};
                                    do -- Modifications
                                        do -- Autoshoot
                                            if rawget(Args[1], "weapon") and rawget(Args[1], "WeldedTool") and rawget(Args[1], "viewModel") and rawget(Args[1], "ToolStance") and rawget(Args[1], "lastUseTime") and rawget(Args[1], "RecoilPatternPos") and rawget(Args[1], "aimPart") then
                                                if Flags["Auto Shoot"] and Flags["Auto Shoot Bind"] and Panichook.Locals.CurrentSilentTarget and Panichook:CheckVisible(Panichook.Locals.CurrentSilentTarget, Flags["Wall Check Origin"]) then
                                                    Panichook.Locals.RangedWeaponDefault(Args[1]);
                                                end;
                                            end;
                                        end;
                                        --
                                        do -- Instant Reload
                                            if rawget(Args[1], "viewModel") and rawget(Args[1], "clientAnimationTracks") then
                                                for Index, AnimationTrack in next, Args[1].clientAnimationTracks do
                                                    if Flags["Instant Reload"] then
                                                        if AnimationTrack.Name == "Reload" or AnimationTrack.Name == "ReloadChamber" or AnimationTrack.Name == "ReloadNoMag" then
                                                            AnimationTrack:AdjustSpeed(20);
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                        --
                                        --[[do -- Bobbing
                                            if Flags["Remove Weapon Bobbing"] then 
                                                Args[1].strafeTilt.Force = 0; -- Value.strafeTilt.Force = 50
                                                Args[1].strafeTilt.Speed = 0; -- 4
                                                Args[1].sway.Force = 0 -- 100;
                                                Args[1].sway.Speed = 0 -- 4
                                                Args[1].walkCycle.Force = 0 -- 50
                                                Args[1].walkCycle.Speed = 0; -- 4
                                                Args[1].sprintCycle.Force = 0 -- 50,
                                                Args[1].sprintCycle.Speed = 0; -- 4
                                            else 
                                                Args[1].strafeTilt.Force = 50; -- Value.strafeTilt.Force = 50
                                                Args[1].strafeTilt.Speed = 4; -- 4
                                                Args[1].sway.Force = 100 -- 100;
                                                Args[1].sway.Speed = 4 -- 4
                                                Args[1].walkCycle.Force = 50 -- 50
                                                Args[1].walkCycle.Speed = 4; -- 4
                                                Args[1].sprintCycle.Force = 50 -- 50,
                                                Args[1].sprintCycle.Speed = 4; -- 4
                                            end;
                                        end;]]
                                        --
                                        do -- Occlusions
                                            if Flags["Remove Weapon Occlusion"] then 
                                                Args[1].TouchWallPosY = 0;
                                                Args[1].TouchWallPosZ = 0;
                                                Args[1].TouchWallRotX = 0;
                                                Args[1].TouchWallRotY = 0;
                                            end;
                                        end;
                                        --
                                        do -- Aiming
                                            if Flags["Instant Aim"] then 
                                                Args[1].AimInSpeed = 0;
                                                Args[1].AimOutSpeed = 0;
                                            end;
                                        end;
                                        --
                                        do -- Fast Fire
                                            if Flags["Rapid Fire"] then
                                                Args[1].FireRate = 0;
                                                Args[1].FireMode = "Auto";
                                            end;
                                        end;
                                    end;
                                    return UpdateClient(unpack(Args));
                                end;
                            end;
                            --
                            do -- Firemode
                                local Firemode = require(ReplicatedStorage.Modules.FPS).fireMode; 
                                require(ReplicatedStorage.Modules.FPS).fireMode = function(...)
                                    local Args = {...};
                                    do -- Modifications
                                        do -- Firemodes
                                            if Flags["Rapid Fire"] then
                                                Args[1].Firemodes = {"Auto"};
                                            end;
                                            --
                                            if Flags["Unlock Firemodes"] and not Flags["Rapid Fire"] then 
                                                Args[1].Firemodes = {"Auto", "Semi"};
                                            end;
                                        end;
                                    end;
                                    return Firemode(unpack(Args));
                                end;
                            end;
                            --
                            setreadonly(Metatable, true);
                        end;
                    end)();
                end;
                --
                do -- Inits
                    setfpscap(1000000);
                    Panichook:OnCharacterAdded();
                end;
            end;
        end;
    end;
end;
