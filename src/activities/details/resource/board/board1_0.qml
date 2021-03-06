/* GCompris
 *
 * Copyright (C) 2015 Bruno Coudoin <bruno.coudoin@gcompris.net>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net> (GTK+ version)
 *   Pulkit Gupta <pulkitgenius@gmail.com> (Qt Quick port)
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
import QtQuick 2.6

QtObject {
   property string instruction: qsTr("Vincent van Gogh, Entrance Hall of Saint-Paul Hospital - 1889")
   property variant levels: [
      {
         "pixmapfile" : "image/VincentVanGogh0012_background.jpg",
         "type" : "SHAPE_BACKGROUND_IMAGE"
      },
      {
         "pixmapfile" : "image/VincentVanGogh0012_0.png",
         "x" : "0.543",
         "y" : "0.102",
         "dropAreaSize" : "8"
      },
      {
         "pixmapfile" : "image/VincentVanGogh0012_1.png",
         "x" : "0.601",
         "y" : "0.468",
         "dropAreaSize" : "8"
      }
   ]
}
