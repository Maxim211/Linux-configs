import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

-- Util
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

-- Layout
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutModifier(ModifiedLayout)

-- Colors
import Colors.GruvboxDark


main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig
  where
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{ modMask = m } = (m, xK_b)

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ -- Programs
      ((modm .|. shiftMask,   xK_Return), spawn "alacritty")
    , ((modm,                 xK_p),      spawn "dmenu_run")
    , ((modm,                 xK_g),      spawn "google-chrome-stable")

    -- Print screen
    , ((modm,                 xK_Print),  spawn "flameshot gui")
    
    -- Close curent window
    , ((modm,                 xK_c),      kill)
    -- Switch to the next layout
    , ((modm,                 xK_Return), sendMessage NextLayout)

    -- Move focus
    , ((modm,                 xK_f),      windows W.focusDown)
    , ((modm,                 xK_d),      windows W.focusUp)

    -- Swap the focused window
    , ((modm .|. shiftMask,   xK_j),      windows W.swapDown)
    , ((modm .|. shiftMask,   xK_k),      windows W.swapUp)

    -- Change the master area
    , ((modm .|. controlMask, xK_h),      sendMessage Shrink)
    , ((modm .|. controlMask, xK_l),      sendMessage Expand)

    -- Restart xmonad
    , ((modm,                 xK_q),      spawn "xmonad --recompile; xmonad --restart")
    
    -- Switch language
    , ((modm,                 xK_space),  spawn "$HOME/bin/layout_switch.sh")
    ]
    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myConfig = def
    { modMask            = mod1Mask      -- Rebind Mod to the Alt
    , layoutHook         = myLayout      -- Use custom layouts
    , keys               = myKeys

    , normalBorderColor  = colorBack
    , focusedBorderColor = color15
    }

mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

tall = renamed [Replace "Tall"]
       $ mySpacing 15
       $ ResizableTall 1 (3/100) (1/2) []
wide = renamed [Replace "Wide"]
       $ mySpacing 15
       $ Mirror (Tall 1 (3/100) (1/2))
full = renamed [Replace "Full"]
       $ mySpacing 0
       $ Full

myLayout = avoidStruts $ smartBorders myDefaultLayout
  where
    myDefaultLayout = tall ||| wide ||| full

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8ec07c" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = white . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (white    "[") (white    "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor color15 ""
    blue     = xmobarColor color05 ""
    white    = xmobarColor color08 ""
    yellow   = xmobarColor color04 ""
    red      = xmobarColor color02 ""
