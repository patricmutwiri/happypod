/* GCompris - ActivityInfo.qml
 *
 * Copyright (C) 2015 Holger Kaelberer <holger.k@elberer.de>
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
  name: "gletters/Gletters.qml"
  difficulty: 2
  icon: "gletters/gletters.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: true
  //: Activity title
  title: qsTr("Simple Letters")
  //: Help title
  description: qsTr("Type the falling letters before they reach the ground")
//  intro: "Type the letters on your keyboard before they reach the ground."
  //: Help goal
  goal: qsTr("
    * Keyboard skills
    * Recognition of the alphabet and number keys on the keyboard 
    * Use and identification of the Shift and Caps Lock keys on the keyboard
    * Motor-coordination
    * Eye-hand coordination
    ")
  //: Help prerequisite
  prerequisite: ""
  //: Help manual
  manual: qsTr("Type the falling letters or numbers before they reach the ground using the real or virtual keyboard.")
  credit: ""
  section: "computer keyboard reading"
}
