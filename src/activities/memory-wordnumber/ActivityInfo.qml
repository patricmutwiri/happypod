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
  name: "memory-wordnumber/MemoryWordnumber.qml"
  difficulty: 3
  icon: "memory-wordnumber/memory-wordnumber.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: false
  //: Activity title
  title: qsTr("Word-number memory game")
  //: Help title
  description: qsTr("Turn the cards over to match the number with the word matching it.")
//  intro: "Match the numeric with the word."
  //: Help goal
  goal: qsTr("
    * Matching numbers with their number names
    * Memory enhancement
    * Mouse/ touchpad movement –moving, clicking and revealing
    * Motor-coordination
    * Eye-hand coordination
    ")
  //: Help prerequisite
  prerequisite: qsTr("Reading")
  //: Help manual
  manual: qsTr("A set of blank cards is shown. Each card has a numeric figure or the numeric word name on the other side. Turn the cards over to match the numeric with its  numeric word name.")
  credit: ""
  section: "reading"
}
