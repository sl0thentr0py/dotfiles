import GHC.IO.Handle
import qualified Data.List as L

import XMonad
import XMonad.Config.Desktop

import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing

import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.FadeInactive

import XMonad.Util.Run
import XMonad.Util.EZConfig


-- general
myTerminal = "urxvt"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myBorderWidth = 1
myModMask = mod1Mask
myNormalBorderColor  = "#262626"
myFocusedBorderColor = "#363636"

-- Layout definitions & modifiers
myLayout = desktopLayoutModifiers $ smartBorders $ spacingWithEdge space $ layouts
  where
     layouts = tiled ||| Full
     -- default
     tiled = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio = 2/3
     -- Percent of screen to increment by when resizing panes
     delta = 3/100
     -- spacing between windows
     space = 5


-- manage windows
myManageHook = composeAll
  [
    className =? "Firefox Developer Edition" --> doShift "2",
    className =? "dota2" --> doShift "8",
    className =? "vlc" --> doShift "7",
    className =? "Pavucontrol" --> doCenterFloat,
    className =? "Pinentry" --> doCenterFloat,
    isDialog --> doCenterFloat
  ]

-- event hook, change for ewmh
myEventHook = mempty

-- startup hook
myStartupHook = do
  setWMName "LG3D" -- for java applications
  startupHook desktopConfig
  -- setSupported
  spawn "picom --xrender-sync-fence"
  spawn "$HOME/.config/polybar/launch.sh"
  spawn "firefox"
  spawn myTerminal

-- Additional keybindings for media keys
addKeys = [ ("<XF86AudioLowerVolume>"        ,spawn "pulseaudio-ctl down 10")
          , ("<XF86AudioRaiseVolume>"        ,spawn "pulseaudio-ctl up 10"  )
          , ("<XF86AudioMute>"               ,spawn "pulseaudio-ctl mute"   )
          , ("<XF86MonBrightnessDown>"       ,spawn "light -U 5"            )
          , ("<XF86MonBrightnessUp>"         ,spawn "light -A 5"            )
          -- , ("<XF86AudioPlay>"               ,spawn "play-pause-mpd.sh"     )
          -- , ("<XF86AudioMicMute>"            ,spawn "play-pause-mpd.sh"     )
          -- , ("<XF86AudioPrev>"               ,spawn "mpc prev"     )
          -- , ("<XF86AudioNext>"               ,spawn "mpc next"     )
          -- , ("<XF86PowerOff>"                ,spawn "lock.sh" )
          ]

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.9

setSupported :: X ()
setSupported = withDisplay $ \dpy -> do
    r <- asks theRoot
    a <- getAtom "_NET_SUPPORTED"
    c <- getAtom "ATOM"
    supp <- mapM getAtom ["_NET_WM_STATE_HIDDEN"
                         ,"_NET_NUMBER_OF_DESKTOPS"
                         ,"_NET_CLIENT_LIST"
                         ,"_NET_CLIENT_LIST_STACKING"
                         ,"_NET_CURRENT_DESKTOP"
                         ,"_NET_DESKTOP_NAMES"
                         ,"_NET_ACTIVE_WINDOW"
                         ,"_NET_WM_DESKTOP"
                         ,"_NET_WM_STRUT"
                         ,"_NET_DESKTOP_VIEWPORT"
                         ]
    io $ changeProperty32 dpy r a c propModeReplace (fmap fromIntegral supp)

-- setDesktopViewports :: [String] -> X ()
-- setDesktopViewports names = withDisplay $ \dpy -> do
--     -- Names thereof
--     r <- asks theRoot
--     a <- getAtom "_NET_DESKTOP_NAMES"
--     c <- getAtom "UTF8_STRING"
--     let names' = map fromIntegral $ concatMap ((++[0]) . encode) names
--     io $ changeProperty8 dpy r a c propModeReplace names'


myConfig = desktopConfig {
    -- general
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    -- workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    -- keys               = myKeys,
    -- mouseBindings      = myMouseBindings,

    -- -- hooks, layouts
    layoutHook         = myLayout,
    manageHook         = myManageHook <+> manageHook desktopConfig,
    handleEventHook    = myEventHook <+> handleEventHook desktopConfig,
    startupHook        = myStartupHook,
    logHook            = myLogHook <+> logHook desktopConfig
} `additionalKeys`
      [ ((myModMask, xK_r        ), spawn "rofi -show combi -combi-modi \"run,drun\" -modi combi")
      , ((myModMask, xK_p        ), spawn "passmenu")
      , ((myModMask, xK_x        ), spawn "$HOME/.config/polybar/launch.sh")
      , ((myModMask, xK_z        ), spawn "killall -q polybar")
      , ((myModMask, xK_F2       ), spawn "pulseaudio-ctl down 10")
      , ((myModMask, xK_F3       ), spawn "pulseaudio-ctl up 10")
      , ((myModMask, xK_F4       ), spawn "pulseaudio-ctl mute")
      ] `additionalKeysP` addKeys

main = do
  xmonad $ myConfig
