import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "../../Themes"

Rectangle { 
   implicitHeight: juan.implicitHeight
   implicitWidth: juan.implicitWidth
   radius: 20
   color: Theme.white

   Row {
      id: juan
      anchors.centerIn: parent
      leftPadding: 10
      rightPadding: 10

      Repeater {
         model: 9

	 Rectangle { 
	    implicitHeight: workspace.implicitHeight
	    implicitWidth: isActive ? 30 : 20
	    color: isActive ? Theme.blueDark : "transparent"
	    radius: 20

	    property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
	    property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

	    Text {
	       id: workspace
	       anchors.centerIn: parent
	       font.pixelSize: Theme.fontSize 
	       font.family: Theme.fontFamily
	       color: isActive ? Theme.white : Theme.greyDark
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

// HDSPTM ME MUERO DIOSSSSS
