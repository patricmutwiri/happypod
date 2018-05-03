/* GCompris - ActivityInfo.qml
 *
 * Copyright (C) 2016 Bruno Coudoin <bruno.coudoin@gcompris.net>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 */
import GCompris 1.0

ActivityInfo {
  name: "tangram/Tangram.qml"
  difficulty: 3
  icon: "tangram/tangram.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: false
  //: Activity title
  title: qsTr("The tangram puzzle game")
  //: Help title
  description: qsTr("The objective is to form a given shape")
  // intro: "Click on each object to obtain the same figure. You can change their orientation by clicking on the arrows."
  //: Help goal
  goal: qsTr("
    * Mouse/touchpad movement-moving, clicking, rotating and dragging
    * Logical reasoning and critical thinking
    * Awareness of shapes and contour 
    * Object and background shadow identification
    * Motor-coordination
    * Eye-hand coordination
    ")
  //: Help prerequisite
  prerequisite: qsTr("Mouse-manipulation")
  //: Help manual
  manual: qsTr("Select the tangram you want to complete. Move the pieces by dragging them to the right positions. The symmetrical button appears on the piece that supports it - click and adjust to fit them in the right position. The rotation button appears on the piece - click on the rotation button or drag around it to rotate the piece to adjust to fit them in the right position.")
  credit: ""
  section: "puzzle"
  createdInVersion: 6000
}
