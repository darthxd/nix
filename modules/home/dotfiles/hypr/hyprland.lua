
-- ==================================================
-- Hyprland - ROG Zephyrus G14
-- NixOS 26.05 | Lua
-- ==================================================

-- Aplicativos
local terminal = "kitty"
local fileManager = "thunar"
local menu = "fuzzel"
local browser = "firefox"
local mainMod = "SUPER"

-- ==================================================
-- MONITORES
-- ==================================================

hl.monitor({
    output = "eDP-1",
    mode = "2560x1600@165",
    position = "0x0",
    scale = 1.67,
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

-- ==================================================
-- VARIAVEIS DE AMBIENTE
-- ==================================================

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "macOS-hypr")

-- ==================================================
-- INICIALIZACAO AUTOMATICA
-- ==================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("blueman-applet")

    hl.exec_cmd(
        "systemctl --user start hyprpolkitagent.service"
    )

    -- Habilitar apos configurar e testar
    -- hl.exec_cmd("hyprpaper")
    -- hl.exec_cmd("hypridle")
end)

-- ==================================================
-- CONFIGURACOES GERAIS
-- ==================================================

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,

        col = {
            active_border = "rgba(89b4faff)",
            inactive_border = "rgba(45475aff)",
        },

        layout = "dwindle",
        resize_on_border = true,
        allow_tearing = false,
    },

    decoration = {
        rounding = 8,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled = false,
        },

        shadow = {
            enabled = false,
        },
    },

    animations = {
        enabled = false,
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_options = "ctrl:nocaps",

        follow_mouse = 1,
        sensitivity = -0.3,
	accel_profile = "flat",
	force_no_accel = false,

        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
            disable_while_typing = true,
        },
    },
})

hl.device({
    name = "asuf1204:00-2808:0201-touchpad",
    sensitivity = 0.2,          -- -1.0 to 1.0 (0.0 is default)
    accel_profile = "adaptive", -- "adaptive" or "flat"
})


-- ==================================================
-- FUNCOES AUXILIARES
-- ==================================================

local function bind(key, dispatcher, flags)
    return hl.bind(
        mainMod .. " + " .. key,
        dispatcher,
        flags or {}
    )
end

local function exec(key, command)
    bind(key, hl.dsp.exec_cmd(command))
end

-- ==================================================
-- APLICATIVOS
-- ==================================================

exec("RETURN", terminal)
exec("D", menu)
exec("E", fileManager)
exec("B", browser)

-- Bloquear sessao
exec("CTRL + L", "hyprlock")

-- Encerrar sessao UWSM
exec("SHIFT + E", "uwsm stop")

-- ==================================================
-- GERENCIAMENTO DE JANELAS
-- ==================================================

bind("Q", hl.dsp.window.close())

bind("F", function()
    hl.exec_cmd("hyprctl dispatch 'hl.dsp.window.fullscreen()'")
end)

bind("SPACE", hl.dsp.window.float({
    action = "toggle",
}))

-- ==================================================
-- NAVEGACAO VIM
-- ==================================================

local directions = {
    H = "left",
    J = "down",
    K = "up",
    L = "right",
}

for key, direction in pairs(directions) do
    -- Alterar foco
    bind(key, hl.dsp.focus({
        direction = direction,
    }))

    -- Mover janela
    bind("SHIFT + " .. key, hl.dsp.window.move({
        direction = direction,
    }))
end

-- ==================================================
-- WORKSPACES
-- ==================================================

for i = 1, 10 do
    local key = tostring(i % 10)

    -- Alternar workspace
    bind(key, hl.dsp.focus({
        workspace = i,
    }))

    -- Mover janela para workspace
    bind("SHIFT + " .. key, hl.dsp.window.move({
        workspace = i,
    }))
end

-- Alternar workspaces com scroll
bind("mouse_down", hl.dsp.focus({
    workspace = "e+1",
}))

bind("mouse_up", hl.dsp.focus({
    workspace = "e-1",
}))

-- ==================================================
-- MOUSE
-- ==================================================

bind("mouse:272", hl.dsp.window.drag(), {
    mouse = true,
})

bind("mouse:273", hl.dsp.window.resize(), {
    mouse = true,
})

-- ==================================================
-- AUDIO
-- ==================================================

local repeating = {
    locked = true,
    repeating = true,
}

local locked = {
    locked = true,
}

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ),
    repeating
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ),
    repeating
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ),
    locked
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ),
    locked
)

-- ==================================================
-- BRILHO
-- ==================================================

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set 5%+"),
    repeating
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-"),
    repeating
)

-- ==================================================
-- MULTIMIDIA
-- ==================================================

local mediaKeys = {
    XF86AudioPlay = "playerctl play-pause",
    XF86AudioPause = "playerctl play-pause",
    XF86AudioNext = "playerctl next",
    XF86AudioPrev = "playerctl previous",
}

for key, command in pairs(mediaKeys) do
    hl.bind(key, hl.dsp.exec_cmd(command), locked)
end

-- ==================================================
-- CAPTURAS DE TELA
-- ==================================================

-- Tela inteira -> clipboard
hl.bind(
    "PRINT",
    hl.dsp.exec_cmd("grim - | wl-copy")
)

-- Regiao selecionada -> clipboard
hl.bind(
    "SHIFT + PRINT",
    hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]])
)

-- ==================================================
-- GESTOS DO TOUCHPAD
-- ==================================================

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

