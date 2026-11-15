import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "../../Themes"

Rectangle { 
   implicitHeight: juan.implicitHeight
   implicitWidth: juan.implicitWidth
   color: Theme.grey
   radius: 20

   Row {
      id: juan
      spacing: 10
      anchors.centerIn: parent
      leftPadding: 10
      rightPadding: 10

      Repeater {
         model: 9

	 Rectangle { 
	    implicitHeight: workspace.implicitHeight
	    implicitWidth: isActive ? workspace.implicitWidth + 20: workspace.implicitWidth

	    color: isActive ? Theme.blueDark : "transparent"
	    radius: 20

	    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
	    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

	    Text {
	       id: workspace
	       anchors.centerIn: parent
	       color: isActive ? Theme.white : Theme.greyDark
	       font { pixelSize: Theme.fontSize; family: Theme.fontFamily }
	       text: index + 1
	    }
	    MouseArea {
	       anchors.fill: parent
	       onClicked: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${index + 1} })`)
	    }
	 }
      }
   }
}
