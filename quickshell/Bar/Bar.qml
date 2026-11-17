import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import "../Themes"
import "Workspaces"
import "Distro"
import "Time"

PanelWindow {
   anchors.top: true
   anchors.left: true
   anchors.right: true

   margins.top: 6
   margins.bottom: -10
   margins.left: 20
   margins.right: 20
   
   implicitHeight: block.implicitHeight + 15
   implicitWidth: block.implicitWidth + 10
   
   color: "transparent"

   Rectangle {
      id: block
      implicitWidth: modules.implicitWidth + 25
      implicitHeight: modules.implicitHeight + 13
      anchors.centerIn: parent
      radius: Infinity 
      color: Qt.alpha(Theme.bg, 1)

      RowLayout {
	 id: modules
	 anchors.centerIn: parent
	 spacing: 9

	 Distro {}
	 Time {}
	 Workspaces {}
      }
   }

   MultiEffect {
      source: block
      anchors.fill: block

      shadowEnabled: true
      shadowColor: "#121212"
      shadowBlur: 0.8
      shadowHorizontalOffset: 0
      shadowVerticalOffset: 0
   }
}
