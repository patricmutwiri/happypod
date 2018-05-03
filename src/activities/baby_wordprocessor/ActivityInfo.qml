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
  name: "baby_wordprocessor/BabyWordprocessor.qml"
  difficulty: 1
  icon: "baby_wordprocessor/baby_wordprocessor.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: false
  //: Activity title
  title: qsTr("A baby wordprocessor")
  //: Help title
  description: qsTr("A simplistic word processor to let the children play around with a keyboard and see letters.")
  //intro: "A simplistic word processor to play around with the keyboard"
  //: Help goal
  goal: qsTr("
    * Keyboard skills 
    * Recognition of letters and numbers on the keyboard
    * Motor-coordination
    * Eye-hand coordination
")
  //: Help prerequisite
  prerequisite: ""
  //: Help manual
  manual: qsTr("Type on the real or virtual keyboard like in a word processor.")
  credit: ""
  section: "computer keyboard reading"
  createdInVersion: 6000
}
