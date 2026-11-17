import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Themes"

Rectangle {
   implicitHeight: text.implicitHeight
   implicitWidth: text.implicitWidth + 14
   radius: 7
   color: "transparent"

   border.color: Theme.grey 
   border.width: 2

   SystemClock {
      id: clock
      precision: SystemClock.Seconds
   }

   Text {
      id: text
      anchors.centerIn: parent
      font.family: Theme.fontFamily
      font.pixelSize: Theme.fontSize
      color: Theme.white
      text: Qt.formatDateTime(clock.date, "hh:mm")
   }
}

