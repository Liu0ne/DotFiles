import Quickshell.Wayland
import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
   anchors.top: true
   anchors.bottom: true
   anchors.left: true
   anchors.right: true

   WlrLayershell.layer: WlrLayer.Background
   exclusionMode: ExclusionMode.Ignore

   Image {
      anchors.fill: parent
      fillMode: Image.PreserveAspectCrop
      source: "Wallpapers/5.png"
   }
}
