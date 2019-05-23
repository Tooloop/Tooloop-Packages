#!/bin/bash

gsettings set org.onboard theme '/home/tooloop/.config/onboard/theme/Tooloop.theme'
gsettings set org.onboard layout '/home/tooloop/.config/onboard/layout/Tooloop.onboard'

# gsettings set org.onboard use-system-defaults false
# gsettings set org.onboard show-tooltips true
# gsettings set org.onboard show-status-icon true
# gsettings set org.onboard key-label-overrides "['LWIN:😀:super', 'RWIN:😀:super']"
# gsettings set org.onboard start-minimized false
# gsettings set org.onboard system-theme-tracking-enabled false
# gsettings set org.onboard schema-version '2.3'
# gsettings set org.onboard key-label-font 'Clear Sans'
# gsettings set org.onboard system-theme-associations "{'Tooloop':'/home/tooloop/.config/onboard/Tooloop.theme'}"
# gsettings set org.onboard snippets "[]"
# gsettings set org.onboard status-icon-provider 'GtkStatusIcon'
# gsettings set org.onboard xembed-onboard false

gsettings set org.onboard.auto-show enabled false
# gsettings set org.onboard.auto-show hide-on-key-press-pause 1800.0
# gsettings set org.onboard.auto-show reposition-method-docked 'prevent-occlusion'
# gsettings set org.onboard.auto-show reposition-method-floating 'prevent-occlusion'
# gsettings set org.onboard.auto-show hide-on-key-press true
# gsettings set org.onboard.auto-show widget-clearance (25.0, 55.0, 25.0, 40.0)

gsettings set org.onboard.keyboard sticky-key-release-delay 0.0
gsettings set org.onboard.keyboard key-synth 'XTest'
gsettings set org.onboard.keyboard input-event-source 'XInput'
gsettings set org.onboard.keyboard touch-feedback-enabled false
gsettings set org.onboard.keyboard touch-input 'multi'
gsettings set org.onboard.keyboard default-key-action 'delayed-stroke'
gsettings set org.onboard.keyboard inter-key-stroke-delay 0.0
gsettings set org.onboard.keyboard modifier-update-delay 1.0
gsettings set org.onboard.keyboard audio-feedback-place-in-space false
gsettings set org.onboard.keyboard audio-feedback-enabled false
gsettings set org.onboard.keyboard sticky-key-behavior "{'all': 'dblclick'}"
gsettings set org.onboard.keyboard touch-feedback-size 0
gsettings set org.onboard.keyboard sticky-key-release-on-hide-delay 5.0
# gsettings set org.onboard.keyboard key-press-modifiers @a{ss} {}
gsettings set org.onboard.keyboard show-click-buttons false
gsettings set org.onboard.keyboard show-secondary-labels true
gsettings set org.onboard.keyboard long-press-delay 0.4


gsettings set org.onboard.typing-assistance active-language ''
gsettings set org.onboard.typing-assistance auto-capitalization false
gsettings set org.onboard.typing-assistance spell-check-backend 'hunspell'
gsettings set org.onboard.typing-assistance auto-correction false
# gsettings set org.onboard.typing-assistance recent-languages @as []
gsettings set org.onboard.typing-assistance max-recent-languages 5
gsettings set org.onboard.typing-assistance.word-suggestions enabled false
gsettings set org.onboard.typing-assistance.word-suggestions learning-behavior-paused 'nothing'
gsettings set org.onboard.typing-assistance.word-suggestions accent-insensitive true
gsettings set org.onboard.typing-assistance.word-suggestions delayed-word-separators-enabled false
gsettings set org.onboard.typing-assistance.word-suggestions delayed-word-separators-enabled false
gsettings set org.onboard.typing-assistance.word-suggestions pause-learning-locked false
gsettings set org.onboard.typing-assistance.word-suggestions max-word-choices 5
gsettings set org.onboard.typing-assistance.word-suggestions show-context-line false
gsettings set org.onboard.typing-assistance.word-suggestions auto-learn true
gsettings set org.onboard.typing-assistance.word-suggestions punctuation-assistance true
gsettings set org.onboard.typing-assistance.word-suggestions wordlist-buttons "['previous-predictions', 'next-predictions', 'language', 'hide']"
gsettings set org.onboard.typing-assistance.word-suggestions stealth-mode false

gsettings set org.onboard.window enable-inactive-transparency false
gsettings set org.onboard.window window-decoration false
gsettings set org.onboard.window inactive-transparency 50.0
gsettings set org.onboard.window docking-monitor 'monitor1'
gsettings set org.onboard.window docking-enabled true
gsettings set org.onboard.window force-to-top true
gsettings set org.onboard.window transparent-background false
gsettings set org.onboard.window window-handles ''
gsettings set org.onboard.window window-state-sticky true
gsettings set org.onboard.window docking-edge 'bottom'
gsettings set org.onboard.window transparency 0.0
gsettings set org.onboard.window background-transparency 0.0
gsettings set org.onboard.window keep-aspect-ratio true
gsettings set org.onboard.window docking-shrink-workarea true
gsettings set org.onboard.window inactive-transparency-delay 1.0

gsettings set org.onboard.window.portrait dock-width 900
gsettings set org.onboard.window.portrait width 900
gsettings set org.onboard.window.portrait dock-expand false
gsettings set org.onboard.window.portrait dock-height 320
gsettings set org.onboard.window.portrait height 320
gsettings set org.onboard.window.portrait x 100
gsettings set org.onboard.window.portrait y 50

gsettings set org.onboard.window.landscape dock-width 900
gsettings set org.onboard.window.landscape width 900
gsettings set org.onboard.window.landscape dock-expand false
gsettings set org.onboard.window.landscape dock-height 320
gsettings set org.onboard.window.landscape height 320
gsettings set org.onboard.window.landscape x 100
gsettings set org.onboard.window.landscape y 50

gsettings set org.onboard.icon-palette in-use true
gsettings set org.onboard.icon-palette window-handles ''
gsettings set org.onboard.icon-palette.landscape width 128
gsettings set org.onboard.icon-palette.landscape height 128
gsettings set org.onboard.icon-palette.landscape x 0
gsettings set org.onboard.icon-palette.landscape y 0
gsettings set org.onboard.icon-palette.portrait width 128
gsettings set org.onboard.icon-palette.portrait height 128
gsettings set org.onboard.icon-palette.portrait x 0
gsettings set org.onboard.icon-palette.portrait y 0

gsettings set org.onboard.lockdown disable-quit true
gsettings set org.onboard.lockdown disable-preferences true
gsettings set org.onboard.lockdown disable-touch-handles true
gsettings set org.onboard.lockdown disable-hover-click true
gsettings set org.onboard.lockdown disable-keys "[['CTRL', 'LALT', 'F[0-9]+']]"
gsettings set org.onboard.lockdown disable-click-buttons true
gsettings set org.onboard.lockdown disable-dwell-activation true

gsettings set org.onboard.scanner enabled false
# gsettings set org.onboard.scanner backtrack 5
# gsettings set org.onboard.scanner device-name 'Default'
# gsettings set org.onboard.scanner interval-fast 0.050000000000000003
# gsettings set org.onboard.scanner feedback-flash true
# gsettings set org.onboard.scanner mode 'Autoscan'
# gsettings set org.onboard.scanner interval 1.2
# gsettings set org.onboard.scanner alternate false
# gsettings set org.onboard.scanner device-button-map {1: 0, 3: 5}
# gsettings set org.onboard.scanner user-scan false
# gsettings set org.onboard.scanner device-detach false
# gsettings set org.onboard.scanner device-key-map @a{ii} {}
# gsettings set org.onboard.scanner cycles 2

gsettings set org.onboard.universal-access drag-threshold -1
gsettings set org.onboard.universal-access hide-click-type-window true
gsettings set org.onboard.universal-access enable-click-type-window-on-exit true