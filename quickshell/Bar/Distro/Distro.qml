import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Themes"

Item {
   implicitHeight: block.implicitHeight
   implicitWidth: block.implicitWidth
   Rectangle {
      id: block
      implicitHeight: text.implicitHeight 
      implicitWidth: text.implicitWidth + 15
      color: Theme.blueDark
      radius: 20

      Text {
	 id: text
	 anchors.centerIn: parent
	 font.pixelSize: Theme.fontSize 
	 font.family: Theme.font 
	 color: Theme.white
	 text: ""
      }
   }
}
