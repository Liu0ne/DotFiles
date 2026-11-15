import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Themes"

Item {
   implicitWidth: block.implicitWidth
   implicitHeight: block.implicitHeight
   Rectangle {
      id: block
      implicitWidth: text.implicitWidth + 15
      implicitHeight: text.implicitHeight 
      color: Theme.blueDark
      radius: 20

      Text {
	 id: text
	 anchors.centerIn: parent
	 color: Theme.white
	 font { pixelSize: Theme.fontSize; family: Theme.font }
	 text: ""
      }
   }
}
