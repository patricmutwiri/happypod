/* GCompris - ActivityIngo.qml
 *
 * Copyright (C) 2014 Pulkit Gupta <pulkitgenius@gmail.com>
 *
 * Authors:
 *   Pulkit Gupta <pulkitgenius@gmail.com>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program; if not, see <http://www.gnu.org/licenses/>.
 */
import GCompris 1.0

ActivityInfo {
  name: "tic_tac_toe/TicTacToe.qml"
  difficulty: 2
  icon: "tic_tac_toe/tic_tac_toe.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: true
  //: Activity title
  title: qsTr("Tic Tac Toe (against Tux)")
  //: Help title
  description: qsTr("Place three marks in a row")
//  intro: "Click on the square which you wish to mark and try to mark 3 consecutive squares before Tux."
  //: Help goal
  goal: qsTr("Place three respective marks in any horizontal, vertical, or diagonal row to win the game")
  //: Help prerequisite
  prerequisite: ""
  //: Help manual
  manual: qsTr("Play with the computer. Take turns to click on the square which you want to mark. First player to create a line of 3 marks wins")
  credit: ""
  section: "strategy"
  createdInVersion: 4000
}
