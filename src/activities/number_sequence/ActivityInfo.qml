/* GCompris - ActivityInfo.qml
 *
 * Copyright (C) 2015 Emmanuel Charruau <echarruau@gmail.com>
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
  name: "number_sequence/NumberSequence.qml"
  difficulty: 2
  icon: "number_sequence/number_sequence.svg"
  author: "Emmanuel Charruau &lt;echarruau@gmail.com&gt;"
  demo: true
  //: Activity title
  title: qsTr("Number sequence")
  //: Help title
  description: qsTr("Touch the numbers in the right sequence.")
//  intro: "Draw the picture by touching each number in the right sequence."
  //: Help goal
  goal: qsTr("
    * Mouse/ touchpad movement - moving and clicking
    * Joining dots using number sequence
    * Motor-coordination
    * Eye-hand coordination
    ")
  //: Help prerequisite
  prerequisite: ""
  //: Help manual
  manual: qsTr("Click the numbers in the right sequence to draw the picture.")
  credit: ""
  section: "math numeration"
}
