/* GCompris - DialogAbout.qml
 *
 * Copyright (C) 2016 Bruno Coudoin <bruno.coudoin@gcompris.net>
 *
 * Authors:
 *   Bruno Coudoin <bruno.coudoin@gcompris.net>
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

/**
 * GCompris' full screen about dialog.
 * @ingroup infrastructure
 *
 * @sa DialogBackground
 */
DialogBackground {
    visible: false
    title: qsTr("About Happy Pod")

    //: Replace this string with your names, one name per line.
    property string translators: qsTr("translator-credits") ===
                                 "translator-credits" ? "" : qsTr("translator-credits") + "<br/>"
    // Let's try to maitain here the contributor list sorted by number of commits
    // git shortlog -se | sort -nr | cut -c8- | sed 's/ <.*>/,/' | xargs
    property string developers: "Bruno Coudoin, Johnny Jazeix, Holger Kaelberer, Timothée Giet, Rajdeep Kaur, Siddhesh Suthar, Aruna Sankaranarayanan, Stephane Mankowski, Thibaut Romain, Akshat Tandon, Yuri Chornoivan, Manuel Tondeur, Ayush Agrawal, Pulkit Gupta, Stefan Toncu, Ilya Bizyaev, Bharath M S, Yuri Chornoivan, JB BUTET, Emmanuel Charruau, Divyam Madaan, Rudra Nil Basu, Arkit Vora, Luigi Toscano, Amit Tomar, Anu Mittal, Chaitanya KS, Imran Tatriev, Nitish Chauhan, Sergey Popov, Yask Srivastava, Shashwat Dixit, Sayan Biswas, Artur Puzio, Utkarsh Tiwari, Andrey Cygankov, Horia PELLE, Harpreet S, rahul yadav, Aseem Arora, Amit Sagtani, Patrick Mutwiri"

    property string gcVersion: ApplicationInfo.GCVersion
    property string qtVersion: ApplicationInfo.QTVersion
    property string gcVersionTxt: qsTr("Happy Pod %1").arg(gcVersion)
    property string qtVersionTxt: qsTr("Based on Qt %1").arg(qtVersion)

    content:
        qsTr("<b>Happy Pod</b> is a structured learning program that enables learners to develop 21st century digital skills.") +
        "<br /><br />" +
        qsTr("<b>Disclaimer</b>") +
        "<br /><br />" +
        qsTr("The user/the party shall take due and reasonable care to protect the "+
                "intellectual Property Rights and Software of Hubble and/or other entities in Hubble’s Group in any manner, "+
                "to any extent and under any circumstances whatsoever. "+
                "No part of this document may be copied or distributed without prior written permission. "+
                "All rights reserved.")
        .arg("https://www.ehubble.com/") +
        qsTr("Thanks and credit to the authors, designers, developers and gcompris.") +
        "<br/><b>" + "©2018 Hubble" + "</b>"
}
