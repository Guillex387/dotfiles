from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"

keys = [
    # Layout dynamics
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "o", lazy.window.toggle_floating()),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Qtile commands
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "Shift"], "Tab", lazy.prev_layout()),

    # Programs
    Key([mod], "Return", lazy.spawn("alacritty"), desc="Launch terminal"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "m", lazy.spawn("rofi -show run")),
    Key([mod, "shift"], "m", lazy.spawn("rofi -show")),
    Key([mod], "c", lazy.spawn("code")),
    Key([mod], "f", lazy.spawn("firefox")),
    Key([mod], "p", lazy.spawn("polo-gtk")),
    Key([mod, "shift"], "s", lazy.spawn("scrot")),
    # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    Key([], "XF86AudioMute", lazy.spawn(
    "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),
    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

groups = [Group(i) for i in ["  ", "  ", "  ", "  ", "  ", "  "]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])


theme = {
    "dark": "#292d3e",
    "grey": "#434758",
    "light": "#ffffff",
    "text": "#292d3e",
    "focus": "#A77AC4",
    "urgent": "#ff5555",
    "active": "#f1ffff",
    "inactive": "#4c566a",
    "color1": "#ff5555",
    "color2": "#A77AC4",
    "color3": "#7197E7",
    "color4": "#ffb86c"
}

layout_theme = {
    "margin": 2,
    "border_width": 2,
    "border_focus": theme["focus"],
    "border_normal": theme["inactive"],
    "border_on_single": True
}

layouts = [
  layout.MonadTall(**layout_theme),
  layout.Max(**layout_theme),
  layout.Columns(**layout_theme)
]

widget_defaults = dict(
    font="UbuntuMono Nerd Font Bold",
    fontsize=15,
    padding=1,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    fontsize=32,
                    margin_y=3,
                    margin_x=0,
                    padding_y=8,
                    padding_x=2,
                    borderwidth=1,
                    active=theme["active"],
                    inactive=theme["inactive"],
                    rounded=False,
                    highlight_method='block',
                    urgent_alert_method='block',
                    this_current_screen_border=theme["focus"],
                    disable_drag=True
                ),
                widget.Spacer(),
                widget.TextBox(
                    text="",
                    fontsize=36,
                    padding=-3,
                    foreground=theme["color4"]
                ),
                widget.CPU(fmt="   {} ", format="{freq_current}GHz {load_percent}%", background=theme["color4"]),
                widget.TextBox(
                    text="",
                    fontsize=36,
                    padding=-3,
                    foreground=theme["color1"],
                    background=theme["color4"]
                ),
                widget.Memory(fmt=" {} ", format="{MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}", background=theme["color1"]),
                widget.TextBox(
                    text="",
                    fontsize=36,
                    padding=-3,
                    foreground=theme["color2"],
                    background=theme["color1"]
                ),
                widget.CurrentLayoutIcon(scale=0.65, background=theme["color2"]),
                widget.CurrentLayout(fmt=" {} ", background=theme["color2"]),
                widget.TextBox(
                    text="",
                    fontsize=36,
                    padding=-3,
                    foreground=theme["color3"],
                    background=theme["color2"]
                ),
                widget.PulseVolume(fmt=" 墳 {} ", background=theme["color3"]),
                widget.TextBox(
                    text="",
                    fontsize=36,
                    padding=-3,
                    foreground=theme["color4"],
                    background=theme["color3"]
                ),
                widget.Battery(format="{percent:2.0%}", fmt="   {} ", background=theme["color4"]),
                widget.TextBox(
                    text="",
                    fontsize=36,
                    padding=-3,
                    foreground=theme["color1"],
                    background=theme["color4"]
                ),
                widget.Clock(fmt=" {} ", format="%d/%m/%y %H:%M", background=theme["color1"]),
                widget.TextBox(
                    text="",
                    fontsize=36,
                    padding=-3,
                    foreground=theme["dark"],
                    background=theme["color1"]
                ),
                widget.QuickExit(default_text="  ", countdown_format=" {} ", background=theme["dark"]),
            ],
            25,
            background=theme["dark"],
            margin=2,
            border_width=2,
            border_color=theme["inactive"]
        ),
        wallpaper='/home/guillex/Wallpapers/01.png',
        wallpaper_mode='stretch'
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    no_reposition_rules=None,
    **layout_theme
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
