import Quickshell
import QtQuick
import QtQuick.Layouts

import "../../Themes"

Rectangle {
   implicitHeight: text.implicitHeight
   implicitWidth: text.implicitWidth + 14
   color: "transparent"
   radius: 7

   border { color: Theme.grey; width: 2}

   SystemClock {
      id: clock
      precision: SystemClock.Seconds
   }

   Text {
      id: text
      anchors.centerIn: parent
      color: Theme.white
      font { family: Theme.fontFamily; pixelSize: Theme.fontSize ; }
      text: Qt.formatDateTime(clock.date, "hh:mm")
   }
}

