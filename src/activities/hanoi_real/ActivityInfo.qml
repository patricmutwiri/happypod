/* GCompris - ActivityInfo.qml
 *
 * Copyright (C) 2015 Amit Tomar <a.tomar@outlook.com>
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
  name: "hanoi_real/HanoiReal.qml"
  difficulty: 5
  icon: "hanoi_real/hanoi_real.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: true
  //: Activity title
  title: qsTr("The Tower of Hanoi")
  //: Help title
  description: qsTr("Reproduce the tower on the right side")
  //intro: "Rebuild the model tower on the right support. Take care, no disc may be placed atop a smaller disc."
  //: Help goal
  goal: qsTr("The object of the game is to move the entire stack to another peg, obeying the following rules:
    only one disc may be moved at a time
    no disc may be placed atop a smaller disc
")
  //: Help prerequisite
  prerequisite: ""
  //: Help manual
  manual: qsTr("Drag and drop the top pieces only from one peg to another, to reproduce the initial left side tower on the right peg.")
  credit: qsTr("")
  section: "puzzle"
  createdInVersion: 4000
}
