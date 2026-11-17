import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import "../Themes"

Scope {
   id: root
   property bool failed
   property string errorString

   Connections {
      target: Quickshell

      function onReloadCompleted() {
	 Quickshell.inhibitReloadPopup()
	 root.failed = false
	 popupLoader.loading = true
      }

      function onReloadFailed(error: string) {
	 Quickshell.inhibitReloadPopup()
	 popupLoader.active = false

	 root.failed = true
	 root.errorString = error
	 popupLoader.loading = true
      }
   }

   LazyLoader {
      id: popupLoader

      PanelWindow {
	 id: popup

	 width: block.width
	 height: block.height

	 color: "transparent"
	 exclusionMode: ExclusionMode.Ignore 
	 BackgroundEffect.blurRegion: Region { item: block }
	 
	 Rectangle { 
	    id: block
	    height: layout.height + 60
	    width: layout.width + 20
	    radius: 10 
	    clip: true
	    color: Qt.alpha(Theme.white, 0.6)

	    border.width: 2
	    border.color: root.failed ? Theme.red : Theme.green

	    Rectangle {
	       id: bar
	       color: root.failed ? Theme.red : Theme.green
	       anchors.bottom: parent.bottom
	       anchors.left: parent.left
	       height: 14
	       bottomLeftRadius: block.radius

	       PropertyAnimation {
		  id: anim
		  target: bar
		  property: "width"
		  from: block.width
		  to: 0
		  duration: failed ? 10000 : 3000
		  onFinished: popupLoader.active = false
	       }
	    }

	    ColumnLayout {
	       id: layout
	       anchors.centerIn: parent
	       Text {
		  text: root.failed ? "Reload Failed" : "Reloaded Successful." 
		  font.family: Theme.fontFamily
		  font.pixelSize: Theme.fontSize - 5
		  color: Theme.bg
	       }

	       Text {
		  visible: root.errorString != ""
		  text: root.errorString	 
		  font.family: Theme.fontFamily
		  font.pixelSize: Theme.fontSize - 5
		  color: Theme.bg
	       }
	    }
	    Component.onCompleted: anim.start()
	 }
      }
   }
}
