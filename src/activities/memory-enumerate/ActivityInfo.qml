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
  name: "memory-enumerate/MemoryEnumerate.qml"
  difficulty: 2
  icon: "memory-enumerate/memory-enumerate.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: false
  //: Activity title
  title: qsTr("Enumeration memory game")
  //: Help title
  description: qsTr("Turn the cards over to match the number with the drawn picture.")
//  intro: "Match a number card with a card displaying the same number of butterflies."
  //: Help goal
  goal: qsTr("
    * Mouse/ touchpad movement – moving, clicking and revealing
    * Match objects and number
    * Memory enhancement
    * Motor-coordination
    * Eye-hand coordination
    ")
  //: Help prerequisite
  prerequisite: ""
  //: Help manual
  manual: qsTr("Turn the card over to match the number with the drawn pictures.")
  credit: ""
  section: "math numeration"
}
