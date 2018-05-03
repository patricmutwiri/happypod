/* GCompris - ActivityInfo.qml
 *
 * Copyright (C) 2016 Nitish Chauhan <nitish.nc18@gmail.com>
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
      name: "drawletters/Drawletters.qml"
      difficulty: 1
      icon: "drawletters/drawletters.svg"
      author: "HUBBLE INNOVATIONS LIMITED"
      demo: true
      //: Activity title
      title: qsTr("Draw Letters")
      //: Help title
      description: qsTr("Connect the dots to draw letters")
      //  intro: "Click on the selected points and draw the letter"
      //: Help goal
      goal: qsTr("
      * Joining of dots 
      * Mouse/touchpad movement-moving, clicking and dragging
      * Awareness of letters
      * Motor-coordination
      * Eye-hand coordination")
      //: Help prerequisite
      prerequisite: ""
      //: Help manual
      manual: qsTr("Draw the letters by clicking on each blue point in sequence. Each time a point is selected the next blue one appears.")
      credit: ""
      section: "reading"
      createdInVersion: 7000
}
