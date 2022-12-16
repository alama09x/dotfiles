-- ------- --
-- IMPORTS --
-- ------- --
-- To customize anything, we need to import modules.

-- Base library
import XMonad
import XMonad.Prelude ( sort )

-- Prompt
import XMonad.Prompt
import XMonad.Prompt.Directory
import XMonad.Prompt.Input
import XMonad.Prompt.Man
import XMonad.Prompt.Shell (compgenFiles)

-- Hooks
import XMonad.ManageHook
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

-- Layouts
import XMonad.Layout.ResizableTile
import XMonad.Layout.Fullscreen
import XMonad.Layout.ToggleLayouts

-- Layout modifiers
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed

-- Utilities
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce
import XMonad.Util.Hacks

-- For type signatures
import XMonad.Layout.LayoutModifier

-- Standard library
import Data.Maybe (fromJust)
import qualified Data.Map as M

-- --------- --
-- VARIABLES --
-- --------- --
-- This section consists of a collection of variables that are used throughout
-- the program. This follows the *DRY* (Don't Repeat Yourself) principle.

-- Primary modifier
myModMask :: KeyMask
myModMask = mod4Mask

myTerminal :: String
myTerminal = "alacritty"

myBrowser :: String
myBrowser = "firefox"

myBrowserPrivateMode :: String
myBrowserPrivateMode = "--private-window"

myFileManager :: String
myFileManager = "dolphin"

myMailClient :: String
myMailClient = "thunderbird"

myScreenshotTool :: String
myScreenshotTool = "gnome-screenshot"

myDocumentViewer :: String
myDocumentViewer = "evince"

myImageViewer :: String
myImageViewer = "eog"

myWordProcessor :: String
myWordProcessor = "libreoffice"

myEditor :: String
myEditor = myTerminal ++ " -e nvim"

myEditorConfig :: String
myEditorConfig = "~/.config/nvim/lua/"

myShellConfig :: String
myShellConfig = "~/.zshrc"

myXMonadConfig :: String
myXMonadConfig = "~/.config/xmonad/xmonad.hs"

myXmobarConfig :: String
myXmobarConfig = "~/.config/xmobar/xmobarrc"

myTerminalConfig :: String
myTerminalConfig = "~/.config/alacritty/alacritty.yml"

myScriptingDir :: String
myScriptingDir = "~/.scripts"

-- Focused window's border color
myFocusedBorderColor :: String
myFocusedBorderColor = "#dddddd"

-- All inactive windows' border color
myNormalBorderColor :: String
myNormalBorderColor = "#888888" -- inactive windows

-- Width of all windows' borders
myBorderWidth :: Dimension
myBorderWidth = 2 -- width of borders

-- Workspace names in order
myWorkspaces :: [String]
myWorkspaces =
    [ "<fn=1>\xf121</fn>"
    , "<fn=1>\xf0e0</fn>"
    , "<fn=1>\xf51c</fn>"
    , "<fn=1>\xf02d</fn>"
    , "<fn=1>\xf590</fn>"
    , "<fn=1>\xf001</fn>"
    , "<fn=1>\xf1fc</fn>"
    , "<fn=1>\xf11b</fn>"
    , "<fn=1>\xf86d</fn>"
    ]

-- Associated list of workspace names and their indices
myWorkspaceIndices :: (Num a, Enum a) => M.Map String a
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]

-- ----- --
-- HOOKS --
-- ----- --
-- This section consists of functions that are called when certain events occur.
--   * The manage hook is called on window creation.
--   * The startup hook is called on startup.
--   * The layout hook specifies enabled layouts and their customizations.

-- The startup hook is called on startup
myStartupHook :: X ()
myStartupHook = do

    -- Enable right click
    spawnOnce "xinput set-prop 'SYNA3297:00 06CB:CD50 Touchpad' 'libinput Click Method Enabled' 0 1"

    -- Set default cursor type
    spawnOnce "xsetroot -cursor_name left_ptr"

    -- Automatically switch audio to bluetooth headphones
    spawnOnce "pactl load-module module-switch-on-connect"

    -- Render wallpaper
    spawnOnce "$HOME/.fehbg"

    -- Start up compositor for enhancements
    spawnOnce "picom"

    -- Start up emoji picker
    spawnOnce "emote"

    -- Start systray
    -- spawnOnce "trayer\
    --     \ --edge top --align center\
    --     \ --SetDockType true --SetPartialStrut true\
    --     \ --transparent true --tint 0x224455\
    --     \ --width 8 --height 38\
    --     \ --expand true --alpha 0\
    --     \ --padding 10 --iconspacing 10\
    --     \ -l"
    spawnOnce "stalonetray"

    -- Start notification daemon
    spawnOnce "dunst"

    -- Start applets
    spawnOnce "nm-applet"
    spawnOnce "volumeicon"

-- The manage hook is called on window creation
myManageHook :: ManageHook
myManageHook = composeAll
    [ isDialog               --> doFloat
    , className =? "dolphin" --> doFloat
    ]

myHandleEventHook = trayerAboveXmobarEventHook

-- Spacing around windows
mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing sp = spacingRaw
    True               -- smartBorder (whether to hide gaps when < 2 windows)
    (Border 0 sp 0 sp) -- screenBorder
    True               -- screenBorderEnabled
    (Border sp 0 sp 0) -- windowBorder
    True               -- windowBorderEnabled

-- Specify every layout
myLayoutHook
    =   mySpacing 12
    $   toggleLayouts Full tiled
    ||| toggleLayouts Full (Mirror tiled)
  where
    tiled   = renamed [Replace "Tall"]
            $ ResizableTall nmaster delta frac []
    nmaster = 1       -- Amount of master windows
    delta   = 2 / 100 -- Amount to increment/decrement by
    frac    = 1 / 2   -- Width of master window

-- ------ --
-- PROMPT --
-- ------ --
-- This section consists of my own prompt config to match our theme.

myXPConfig :: XPConfig
myXPConfig = def
    { font        = "xft:FiraCode:medium:size=13"
    , bgColor     = "#223344"
    , fgColor     = "#aaaaaa"
    , borderColor = "#aaaaaa"
    , position    = CenteredAt 0.04 0.5
    , height      = 64
    }

-- ------- --
-- PROMPTS --
-- ------- --
-- This section consists of my defined prompts.
-- (COPY + PASTED AND MODIFIED FROM XMonad.Prompt.Directory)
data File = File String ComplCaseSensitivity (String -> X ())

instance XPrompt File where
    showXPrompt (File x _ _) = x
    completionFunction (File _ csn _) = getFileCompl csn
    modeAction (File _ _ f) buf auto =
      let dir = if null auto then buf else auto
      in f dir

filePrompt :: XPConfig -> String -> (String -> X ()) -> X ()
filePrompt c prom f = mkXPrompt (File prom csn f) c (getFileCompl csn) f
    where csn = complCaseSensitivity c

getFileCompl :: ComplCaseSensitivity -> String -> IO [String]
getFileCompl csn s = sort . lines <$> compgenFiles csn s

-- Check whether file is hidden or not
-- notboring :: String -> Bool
-- notboring ('.':'.':_) = True
-- notboring ('.':_) = False
-- notboring _ = True

-- ----------- --
-- KEYBINDINGS --
-- ----------- --
-- This section consists of key combinations that map onto events, such as
-- opening an editor, or taking a screenshot.

myKeyBindings :: [(String, X ())]
myKeyBindings =
    -- Spotify Pause/Play
    [ ("M-s", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")

    -- Take fullscreen screenshot
    , ("M-C-S-=", spawn myScreenshotTool)

    -- Take screenshot of selection
    , ("M-S-=", unGrab *> spawn (myScreenshotTool ++ " -a"))

    -- Open file/directory in editor
    , ("M-e M-e", do
        filePrompt
            myXPConfig
            "File/Directory to edit: "
            (\f -> spawn (myEditor ++ " " ++ f)))

    -- Edit the editor's configuration file.
    , ("M-e M-o", spawn (myEditor ++ " " ++ myEditorConfig))

    -- Edit XMonad config
    , ("M-e M-x", spawn (myEditor ++ " " ++ myXMonadConfig))

    -- Edit Xmobar config
    , ("M-e M-b", spawn (myEditor ++ " " ++ myXmobarConfig))

    -- Edit shell config
    , ("M-e M-s", spawn (myEditor ++ " " ++ myShellConfig))

    -- Edit terminal config
    , ("M-e M-t", spawn (myEditor ++ " " ++ myTerminalConfig))

    -- View manpages
    , ("M-C-m", manPrompt myXPConfig)

    -- Launch web browser
    , ("M-S-'", spawn myBrowser)

    -- Launch web browser in private mode
    , ("M-C-S-'", spawn (myBrowser ++ " " ++ myBrowserPrivateMode))

    -- Launch Spotify
    , ("M-S-s", spawn "spotify --force-device-scale-factor=1.75")

    -- Launch Discord
    , ("M-S-d", spawn "discord")

    -- Launch file manager
    , ("M-S-f", spawn myFileManager)

    -- Launch mail client
    , ("M-S-m M-S-m", spawn myMailClient)

    -- Launch Musescore
    , ("M-S-m M-S-s", spawn "mscore")

    -- Launch document viewer
    , ("M-S-v", spawn myDocumentViewer)

    -- Launch image viewer
    , ("M-S-i", spawn myImageViewer)

    -- Launch word processor
    , ("M-S-w", spawn myWordProcessor)

    -- Launch application menu
    , ("M-p"  , spawn "rofi -show drun -theme-str 'element-icon { size: 1.5ch; }'")

    , ("M-["  , spawn "rofi -show  run -theme-str 'element-icon { size: 1.5ch; }'")

    -- Multimedia keys
    , ("<XF86MonBrightnessUp>"  , spawn "brightnessctl set 1%+")
    , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 1%-")
    , ("<XF86AudioMute>"        , spawn "pamixer -t"           )
    , ("<XF86AudioLowerVolume>" , spawn "pamixer -d 5"         )
    , ("<XF86AudioRaiseVolume>" , spawn "pamixer -i 5"         )
    , ("<XF86AudioPrev>"        , spawn "playerctl previous"   )
    , ("<XF86AudioPlay>"        , spawn "playerctl play-pause" )
    , ("<XF86AudioNext>"        , spawn "playerctl next"       )

    -- Tiled window manipulation
    , ("M-a", sendMessage MirrorShrink)
    , ("M-z", sendMessage MirrorExpand)

    -- Toggle between layouts
    , ("M-f", sendMessage ToggleLayout)
    ]

-- ------ --- --
-- STATUS BAR --
-- ------ --- --
-- This section consists of PP (Pretty Print) configuration, which is logged by
-- XMonad. The status bar then reads this logging via the ~UnsafeXMonadLog~
-- command, and prints it onto the left side.

-- Allow workspaces to respond to clicking
clickable :: String -> String
clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
  where
    i = fromJust $ M.lookup ws myWorkspaceIndices

-- Return new string without first "word"
removeFirstWord :: String -> String
removeFirstWord (' ':xs) = xs
removeFirstWord (x:xs)   = removeFirstWord xs
removeFirstWord _        = ""

-- Pretty print to xmobar
myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = sepColor " | "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = yellow . wrap "[" "]"
    , ppHidden          = white . clickable
    , ppHiddenNoWindows = lowWhite . clickable
    , ppLayout          = removeFirstWord -- remove "Spacing" prefix
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, ly, _, wins] -> [white (" <fn=1>\xf009</fn> " ++ ly), ws, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (yellow   "[") (yellow   "]") . yellow   . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . lowWhite . ppWindow

    -- Windows should have a title that does not exceed x characters
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 20

    -- Some colors
    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
    sepColor = xmobarColor "#667788" ""

-- ---- --------- --
-- MAIN EXECUTION --
-- ---- --------- --
-- All of those "my" suffixed variables and functions will not connect themselves.
-- They are manually passed into the XMonad configuration, which is passed as an
-- argument to 'xmonad.'

-- Start statusbar with pretty-print settings.
-- Run XMonad with specified configuration.
main :: IO ()
main = do
    xmonad
        . ewmhFullscreen -- proper fullscreen support with EWMH hints
        . ewmh           -- Extended Window Manager Hints
        . fullscreenSupportBorder
        . withEasySB (statusBarProp "xmobar" $ pure myXmobarPP) defToggleStrutsKey
        $ myConfig

-- Pass variables to their matching fields
myConfig = def
    -- General
    { modMask    = myModMask
    , workspaces = myWorkspaces

    -- Default applications
    , terminal = myTerminal

    -- Border
    , focusedBorderColor = myFocusedBorderColor
    , normalBorderColor  = myNormalBorderColor
    , borderWidth        = myBorderWidth

    -- Hooks
    , layoutHook      = myLayoutHook
    , manageHook      = myManageHook
    , startupHook     = myStartupHook
    , handleEventHook = myHandleEventHook

    } `additionalKeysP` myKeyBindings
