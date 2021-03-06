/* GCompris - ActivityInfo.qml
 *
 * Copyright (C) 2015 Bruno Coudoin <bruno.coudoin@gcompris.net>
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
  name: "erase_clic/EraseClic.qml"
  difficulty: 1
  icon: "erase_clic/erase_clic.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: false
  //: Activity title
  title: qsTr("Click or tap")
  //: Help title
  description: qsTr("Click or tap to erase the area and discover the background")
//  intro: "Click or tap on the transparent bricks and discover the hidden picture."
  //: Help goal
  goal: qsTr("
    * Mouse/ touchpad movement – moving 
    * Motor-coordination
    * Eye-hand coordination
    ")
  //: Help prerequisite
  prerequisite: qsTr("Mouse-manipulation")
  //: Help manual
  manual: qsTr("Click the mouse or touchpad on the rectangles until all the blocks disappear.")
  credit: ""
  section: "computer mouse"
}
