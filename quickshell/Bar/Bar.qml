import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "../Themes"
import "Workspaces"
import "Distro"
import "Time"

PanelWindow {
   anchors.top: true
   anchors.left: true
   anchors.right: true

   margins.top: 10
   margins.left: 15
   margins.right: 15

   implicitHeight: block.implicitHeight 
   implicitWidth: block.implicitWidth + 10
   
   color: "transparent"

   Rectangle {
      id: block
      implicitWidth: modules.implicitWidth + 25
      implicitHeight: modules.implicitHeight + 10
      anchors.centerIn: parent
      radius: 20
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
}
