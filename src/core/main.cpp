/* Happypod - main.cpp
 *
 * Copyright (C) 2014 Bruno Coudoin <bruno.coudoin@gcompris.net>
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
#include <QtDebug>
#include <QApplication>
#include <QQuickWindow>
#include <QQmlApplicationEngine>
#include <QStandardPaths>
#include <QObject>
#include <QTranslator>
#include <QCommandLineParser>
#include <QCursor>
#include <QPixmap>
#include <QSettings>
#include <QDateTime>
#include <QDate>
#include <QTime>
#include <QMessageBox>
#include <QInputDialog>
#include <QQuickItem>
#include <QtQml>

#include "ApplicationInfo.h"
#include "ActivityInfoTree.h"
#include "File.h"
#include "Directory.h"
#include "DownloadManager.h"
#include <iostream>
#include <string>
#include <stdlib.h>


bool loadAndroidTranslation(QTranslator &translator, const QString &locale)
{

    QFile file("assets:/gcompris_" + locale + ".qm");

    file.open(QIODevice::ReadOnly);
    QDataStream in(&file);
    uchar *data = (uchar*)malloc(file.size());

    if(!file.exists())
        qDebug() << "file assets:/" << locale << ".qm does not exist";

    in.readRawData((char*)data, file.size());

    if(!translator.load(data, file.size())) {
        qDebug() << "Unable to load translation for locale " <<
                    locale << ", use en_US by default";
        free(data);
        return false;
    }
    // Do not free data, it is still needed by translator
    return true;
}

// Return the locale
QString loadTranslation(QSettings &config, QTranslator &translator)
{
    QString locale;
    QString cache;

    // Get locale
    if(config.contains("General/locale")) {
        locale = config.value("General/locale").toString();
    } else {
        locale = GC_DEFAULT_LOCALE;
    }
    if(locale == GC_DEFAULT_LOCALE)
        locale = QString(QLocale::system().name() + ".UTF-8");

    if(locale == "C.UTF-8" || locale == "en_US.UTF-8")
        return "en_US";

    // Load translation
    // Remove .UTF8
    locale.remove(".UTF-8");

#if defined(Q_OS_ANDROID)
    if(!loadAndroidTranslation(translator, locale))
        loadAndroidTranslation(translator, ApplicationInfo::localeShort(locale));
#else

#if (defined(Q_OS_LINUX) || defined(Q_OS_UNIX))
    // only useful for translators: load from $application_dir/../share/... if exists as it is where kde scripts install translations
    if(translator.load("gcompris_qt.qm", QString("%1/../share/locale/%2/LC_MESSAGES").arg(QCoreApplication::applicationDirPath(), locale))) {
        qDebug() << "load translation for locale " << locale << " in " <<
            QString("%1/../share/locale/%2/LC_MESSAGES").arg(QCoreApplication::applicationDirPath(), locale);
    }
    else if(translator.load("gcompris_qt.qm", QString("%1/../share/locale/%2/LC_MESSAGES").arg(QCoreApplication::applicationDirPath(), locale.split('_')[0]))) {
        qDebug() << "load translation for locale " << locale << " in " <<
            QString("%1/../share/locale/%2/LC_MESSAGES").arg(QCoreApplication::applicationDirPath(), locale.split('_')[0]);
    }
    else
#endif
    if(!translator.load("gcompris_" + locale, QString("%1/%2/translations").arg(QCoreApplication::applicationDirPath(), GCOMPRIS_DATA_FOLDER))) {
        qDebug() << "Unable to load translation for locale " <<
                    locale << ", use en_US by default";
    }
#endif
    return locale;
}

int main(int argc, char *argv[])
{
    // Disable it because we already support HDPI display natively
    qunsetenv("QT_DEVICE_PIXEL_RATIO");

#if QT_VERSION >= QT_VERSION_CHECK(5, 8, 0)
    QString renderer = QString(GRAPHICAL_RENDERER);
    if(renderer == "software")
       QQuickWindow::setSceneGraphBackend(QSGRendererInterface::Software);
    else if(renderer == "opengl")
       QQuickWindow::setSceneGraphBackend(QSGRendererInterface::OpenGL);
#endif
    
    QApplication app(argc, argv);
    app.setOrganizationName("hubble");
    app.setApplicationName(GCOMPRIS_APPLICATION_NAME);
    app.setOrganizationDomain("kde.org");
    app.setApplicationVersion(ApplicationInfo::GCVersion());

#if defined(Q_OS_MAC)
    // Sandboxing on MacOSX as documented in:
    // http://doc.qt.io/qt-5/osx-deployment.html
    QDir dir(QGuiApplication::applicationDirPath());
    dir.cdUp();
    dir.cd("Plugins");
    QGuiApplication::setLibraryPaths(QStringList(dir.absolutePath()));
#endif

    // Local scope for config
    QSettings config(QStandardPaths::writableLocation(QStandardPaths::GenericConfigLocation) +
                     "/gcompris/" + GCOMPRIS_APPLICATION_NAME + ".conf",
                     QSettings::IniFormat);

    // Load translations
    QTranslator translator;
    loadTranslation(config, translator);
    // Apply translation
    app.installTranslator(&translator);

    QCommandLineParser parser;
    parser.setApplicationDescription("Happy pod is an educational software for children 2 to 10");
    parser.addHelpOption();
    parser.addVersionOption();
    QCommandLineOption exportActivitiesAsSQL("export-activities-as-sql", "Export activities as SQL");
    parser.addOption(exportActivitiesAsSQL);
	QCommandLineOption clDefaultCursor(QStringList() << "c" << "cursor",
                                       QObject::tr("Run Happypod with the default system cursor."));
	parser.addOption(clDefaultCursor);
    QCommandLineOption clNoCursor(QStringList() << "C" << "nocursor",
                                       QObject::tr("Run Happypod without cursor (touch screen mode)."));
    parser.addOption(clNoCursor);
    QCommandLineOption clFullscreen(QStringList() << "f" << "fullscreen",
                                       QObject::tr("Run Happypod in fullscreen mode."));
    parser.addOption(clFullscreen);
    QCommandLineOption clWindow(QStringList() << "w" << "window",
                                       QObject::tr("Run Happypod in window mode."));
    parser.addOption(clWindow);
    QCommandLineOption clSound(QStringList() << "s" << "sound",
                                       QObject::tr("Run Happypod with sound enabled."));
    parser.addOption(clSound);
    QCommandLineOption clMute(QStringList() << "m" << "mute",
                                       QObject::tr("Run Happypod without sound."));
    parser.addOption(clMute);
    QCommandLineOption clWithoutKioskMode(QStringList() << "disable-kioskmode",
                                       QObject::tr("Disable the kiosk mode (default)."));
    parser.addOption(clWithoutKioskMode);
    QCommandLineOption clWithKioskMode(QStringList() << "enable-kioskmode",
                                       QObject::tr("Enable the kiosk mode."));
    parser.addOption(clWithKioskMode);
    parser.process(app);

    ApplicationInfo::init();
    ActivityInfoTree::init();
    ApplicationSettings::init();
    File::init();
    Directory::init();
    DownloadManager::init();

    // Tell media players to stop playing, it's Happypod time
    ApplicationInfo::getInstance()->requestAudioFocus();

    // Must be done after ApplicationSettings is constructed because we get an
    // async callback from the payment system
    ApplicationSettings::getInstance()->checkPayment();

    // Getting fullscreen mode from config if exist, else true is default value
    bool isFullscreen = true;
    {
        if(config.contains("General/fullscreen")) {
            isFullscreen = config.value("General/fullscreen").toBool();
        }

		// Set the cursor image
		bool defaultCursor = false;
		if(config.contains("General/defaultCursor")) {
			defaultCursor = config.value("General/defaultCursor").toBool();
		}
		if(!defaultCursor && !parser.isSet(clDefaultCursor))
			QGuiApplication::setOverrideCursor(
						QCursor(QPixmap(":/gcompris/src/core/resource/cursor.svg"),
								0, 0));

		// Hide the cursor
		bool noCursor = false;
		if(config.contains("General/noCursor")) {
			noCursor = config.value("General/noCursor").toBool();
		}
		if(noCursor || parser.isSet(clNoCursor))
			QGuiApplication::setOverrideCursor(QCursor(Qt::BlankCursor));
    }

    //  Licensing -- Right place here
    //  ApplicationSettings::getInstance()->setExeCount(ApplicationSettings::getInstance()->exeCount() + 1);

    //  Copyright hack by patrick - First Run
    //  config.setValue("passcodex", "password");
    //  restartApp:
    //  QString passcode = "x";
    //  if(config.contains("passcode")) {
    //     passcode = config.value("passcode").toString();
    //  } else {
    //     passcode = "x";
    //  }

    //  QQmlApplicationEngine engine;

    //  if(ApplicationSettings::getInstance()->exeCount() <= 1) {
    //     if(passcode == "_hubble2018___") {
    //         ApplicationSettings::getInstance()->setExeCount(ApplicationSettings::getInstance()->exeCount() + 1);
    //         goto restartApp;
    //     } else {
    //         ApplicationSettings::getInstance()->setExeCount(0);
    //         engine.load(QUrl("qrc:/gcompris/src/core/virgin.qml"));
    //     }
    //  } else {
    //     ApplicationSettings::getInstance()->setExeCount(ApplicationSettings::getInstance()->exeCount() + 1);
    //  }

    //  if(passcode == "x") {
    //     qDebug() << "Pass coded not ";
    //     engine.load(QUrl("qrc:/gcompris/src/core/virgin.qml"));
    //  }

    restartApp:
    if(ApplicationSettings::getInstance()->exeCount() <= 1) {
        bool ok;
        QString passcode = QInputDialog::getText(0, "Input Password to Unlock App","Password:", QLineEdit::Password,"", &ok);
        if (ok && !passcode.isEmpty()) {
            if(passcode == "#hubble2018") {
                ApplicationSettings::getInstance()->setExeCount(ApplicationSettings::getInstance()->exeCount() + 1);
                QMessageBox::information (0, "Authentication Success",QString("Authentication Successful. Welcome to Happy Pod."));
                config.setValue("urn", QDate::currentDate());
                 goto restartApp;
            } else {
                QMessageBox::warning(0, "Happy Pod - Authentication Error",QString("Try Again"));
                goto restartApp;
            }
        } else {
            QMessageBox::warning(0, "Happy Pod - Warning",QString("Empty values not allowed"));
            goto restartApp;
        }
    } else {
        ApplicationSettings::getInstance()->setExeCount(ApplicationSettings::getInstance()->exeCount() + 1);
    }

    if(!config.contains("urn")) {
        ApplicationSettings::getInstance()->setExeCount(0);
        QMessageBox::warning(0, "Happy Pod - Warning",QString("Inconsistencies Detected"));
        goto restartApp;
    }


    if(parser.isSet(clFullscreen)) {
        isFullscreen = true;
    }
    if(parser.isSet(clWindow)) {
        isFullscreen = false;
    }
    if(parser.isSet(clMute)) {
        ApplicationSettings::getInstance()->setIsAudioEffectsEnabled(false);
        ApplicationSettings::getInstance()->setIsAudioVoicesEnabled(false);
    }
    if(parser.isSet(clSound)) {
        ApplicationSettings::getInstance()->setIsAudioEffectsEnabled(true);
        ApplicationSettings::getInstance()->setIsAudioVoicesEnabled(true);
    }
    if(parser.isSet(clWithoutKioskMode)) {
        ApplicationSettings::getInstance()->setKioskMode(false);
    }
    if(parser.isSet(clWithKioskMode)) {
        ApplicationSettings::getInstance()->setKioskMode(true);
    }

    // DRM HACK
    QDate startDate(2018, 4, 4);
    QDate endDate(2018, 5, 30);
    QDate date(2018,5,30); //die mf!
    QDate offlinetoday(QDate::currentDate());

    if(offlinetoday.daysTo(startDate) >= 1) {
        config.setValue("cache", startDate);
        config.setValue(BUILD_DATE, startDate);
    }

    if(!config.contains("cache")) {
        config.setValue("cache", startDate);
        config.setValue(BUILD_DATE, startDate);
    } else {
        startDate = config.value("cache").toDate();
    }
    QDate newstartDate(startDate);

    qDebug() << "current date to startdate" << offlinetoday.daysTo(startDate);

    //update startDate.
    if(startDate.daysTo(offlinetoday) >= 1) {
        startDate = startDate.addDays(startDate.daysTo(offlinetoday));
        newstartDate = startDate;
        config.setValue("cache", newstartDate);
        config.setValue(BUILD_DATE, newstartDate);
    } else { // Backdated
        qDebug() << "Date skewed to "<<offlinetoday<<" | Build Date "<<offlinetoday;
        //newstartDate = startDate;
        if(startDate.daysTo(offlinetoday) == 0) {
            config.setValue("cache", offlinetoday);
            config.setValue(BUILD_DATE, offlinetoday);
            if(config.contains("cache")) {
              newstartDate = config.value("cache").toDate();
            }
            if(!config.contains("cache") && !config.contains(BUILD_DATE)) {
              newstartDate = startDate;
            }
            if(!config.contains("cache") && config.contains(BUILD_DATE)) {
              newstartDate = config.value(BUILD_DATE).toDate();
            }
        } else {
            if(config.contains("cache")) {
              newstartDate = config.value("cache").toDate();
            }
            if(!config.contains("cache") && !config.contains(BUILD_DATE)) {
              newstartDate = startDate;
            }
            if(!config.contains("cache") && config.contains(BUILD_DATE)) {
              newstartDate = config.value(BUILD_DATE).toDate();
            }
        }
    }

    qDebug() << "From offdate to Today " << offlinetoday.daysTo(startDate);
    qDebug() << "Days from new-startDate " << newstartDate << " to endDate: " << newstartDate.daysTo(endDate);

    QDate currentdate(offlinetoday);

    qDebug() << "Days from today ("<< currentdate <<") to end of license("<< date <<"): " << currentdate.daysTo(date);

    QQmlApplicationEngine engine;

    if(currentdate.daysTo(date) > newstartDate.daysTo(date) || currentdate > date) {
        qDebug() << "backdated to: " << currentdate.toString("dd.MM.yyyy");
        engine.load(QUrl("qrc:/gcompris/src/core/login.qml"));
    } else{
         engine.load(QUrl("qrc:/gcompris/src/core/main.qml"));
    }

    QObject::connect(&engine, &QQmlApplicationEngine::quit, DownloadManager::getInstance(),
                     &DownloadManager::shutdown);
    // add import path for shipped qml modules:
#ifdef SAILFISHOS
    engine.addImportPath(QStringLiteral("%1/../share/%2/lib/qml")
                         .arg(QCoreApplication::applicationDirPath()).arg(GCOMPRIS_APPLICATION_NAME));
#else
    engine.addImportPath(QStringLiteral("%1/../lib/qml")
                         .arg(QCoreApplication::applicationDirPath()));
#endif

    if(parser.isSet(exportActivitiesAsSQL)) {
        ActivityInfoTree *menuTree(qobject_cast<ActivityInfoTree*>(ActivityInfoTree::menuTreeProvider(&engine, NULL)));
        menuTree->exportAsSQL();
        exit(0);
    }

    QObject *topLevel = engine.rootObjects().value(0);

    QQuickWindow *window = qobject_cast<QQuickWindow *>(topLevel);
    if (!window) {
		qWarning("Error: Your root item has to be a Window.");
		return -1;
	}

    ApplicationInfo::setWindow(window);

    window->setIcon(QIcon(QPixmap(QString::fromUtf8(":/gcompris/src/core/resource/happypod-icon.png"))));


    if(isFullscreen) {
        window->showFullScreen();
    }
    else {
        window->show();
    }

    return app.exec();
}
