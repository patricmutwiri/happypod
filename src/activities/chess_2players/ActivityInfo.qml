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
  name: "chess_2players/Chess2Players.qml"
  difficulty: 6
  icon: "chess_2players/chess_2players.svg"
  author: "HUBBLE INNOVATIONS LIMITED"
  demo: false
  //: Activity title
  title: qsTr("Play chess against your friend")
  //: Help title
  description: ""
  //intro: "play chess against your friend"
  //: Help goal
  goal: ""
  //: Help prerequisite
  prerequisite: ""
  //: Help manual
  manual: qsTr("In this activity you discover the chess game by playing against a friend. It displays the possible target position for any selected piece which helps the children understand how pieces moves.
\nYou can achieve a mate sooner if follow these simple rules:
    Trying to drive opponent's King in the corner.
<b>Explanation</b>: this way opponent's piece would have only 3 directions to move instead of 8 from a best position.
    'Making a trap'. Use your pawns as baits.
<b>Explanation</b>: this way you can lure the opponent out of his 'comfort zone'.
    Be patient enough.
<b>Explanation</b>: don't rush too quick, be patient. Let yourself think a little bit and try to predict your opponent's future moves, so you can catch him on it or secure your pieces from his attacks.")
  credit: ""
  section: "strategy"
  createdInVersion: 5000
}
