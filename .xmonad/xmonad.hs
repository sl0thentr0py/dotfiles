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

import XMonad.Util.Run
import XMonad.Util.EZConfig


-- general
myTerminal = "urxvt"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myBorderWidth = 1
myModMask = mod4Mask
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
     ratio = 1/2
     -- Percent of screen to increment by when resizing panes
     delta = 3/100
     -- spacing between windows
     space = 2


-- manage windows
myManageHook = composeAll
  [
    className =? "Firefox" --> doShift "2",
    className =? "Pavucontrol" --> doCenterFloat
  ]

-- event hook, change for ewmh
myEventHook = mempty

-- startup hook
myStartupHook = do
  setWMName "LG3D" -- for java applications
  startupHook desktopConfig

-- loghook
-- Log Hook Definition: Custom Xmobar Output + Update Pointer Hook
myLogHook :: Handle -> X ()
myLogHook xmproc = dynamicLogWithPP xmobarPP
                     { ppOutput = hPutStrLn xmproc
                     , ppCurrent = xmobarColor "#83a598" "" . wrap "[" "]"   -- #9BC1B2 #69DFFA
                     , ppTitle = xmobarColor "#d3869b" "" . shorten 50       -- #9BC1B2 #69DFFA
                     -- , ppSort = fmap (.namedScratchpadFilterOutWorkspace) getSortByTag
                     , ppLayout = xmobarColor "#fabd2f" "" . myIcons
                     } -- >> updatePointer (0.75, 0.75) (0.75, 0.75)

-- icons
myIcons layout
    | is "SpacingWithEdge 2 Full"                     = "<icon=/home/neel/.xmonad/icons/layout-full.xbm/>"
    | is "SpacingWithEdge 2 Tall"                     = "<icon=/home/neel/.xmonad/icons/layout-tall-black.xbm/>"
    | otherwise = "<icon=/home/neel/.xmonad/icons/layout-gimp.xbm/>"
    where is = (`L.isInfixOf` layout)

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


myConfig xmproc = desktopConfig {
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
    logHook            = (myLogHook xmproc) <+> logHook desktopConfig
} `additionalKeys`
      [ ((mod4Mask, xK_r        ), spawn "rofi -show run")
      , ((mod4Mask, xK_p        ), spawn "passmenu")
      ] `additionalKeysP` addKeys

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad $ myConfig xmproc
