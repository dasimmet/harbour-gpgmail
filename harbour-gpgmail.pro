# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-gpgmail

CONFIG += sailfishapp_qml

SOURCES +=

OTHER_FILES += qml/harbour-gpgmail.qml \
    qml/cover/CoverPage.qml \
    qml/MainPage.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/EncryptPage.qml \
    qml/pages/SendPage.qml \
    qml/pages/FetchkeyPage.qml \
    rpm/harbour-gpgmail.changes.in \
    rpm/harbour-gpgmail.spec \
    rpm/harbour-gpgmail.yaml \
    harbour-gpgmail.desktop \
    qml/cover/coveractions.py \
    qml/pyLib/gnupg.py \
    qml/pyLib/LICENSE-python-gnupg.txt
