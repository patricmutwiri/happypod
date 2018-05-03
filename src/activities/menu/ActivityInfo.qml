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
  name: "menu/Menu.qml"
  icon: ""
  //difficulty: 0
  //: Activity title
  title: qsTr("Happy Pod Main Menu")
  //: Help title
  description: qsTr("Select an activity to run it.")
  //: Help goal
  // goal: qsTr("Happy Pod is a high quality suite, including a large number of activities for children aged 3 to 8.")
  //: Help prerequisite
  //prerequisite: qsTr("Some of the activities are game orientated, but nonetheless still educational.")
  //: Help manual
  manual: qsTr("Select an icon to enter an activity or to display a list of activities in a category.
At the bottom of the screen is the Happy Pod control bar. Notice that you can hide or show the bar by touching its anchor.
The following icons are displayed:
(note that each icon is displayed only if available in the current activity)
    
    Home - Exit an activity, go back to menu (Ctrl+W and escape key)
    Arrows - Display the current level. Click to select another level
    Question Mark - Help
    Reload - Start the activity from the beginning again
    Tool - The configuration menu
    G - About Happy Pod
    Quit - Quit Happy Pod (Ctrl+Q)

Shortcuts:
    Ctrl+B Show or Hide the control bar
    Ctrl+F Toggle full screen
    Ctrl+M Toggle mute for the background music
    Ctrl+S Toggle the activity section bar
    " )
}
