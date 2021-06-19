#!/bin/sh
for i in phonon #kauth kbookmarks kcodecs kcompletion kconfig kconfigwidgets kcrash kdbusaddons kglobalaccel kguiaddons ki18n kiconthemes kio kitemmodels kitemviews kjobwidgets knotifications kservice ktextwidgets kwidgetsaddons kwindowsystem kxmlgui solid sonnet
do
cp -r kf5-karchive kf5-$i
mv kf5-$i/kf5-karchive.mk kf5-$i/kf5-$i.mk
UPPER=`echo $i | tr '[:lower:]' '[:upper:]'`
sed -i "s/KARCHIVE/$UPPER/g" kf5-$i/Config.in
sed -i "s/karchive/$i/g" kf5-$i/Config.in
sed -i "s/KARCHIVE/$UPPER/g" kf5-$i/kf5-$i.mk
sed -i "s/karchive/$i/g" kf5-$i/kf5-$i.mk
done
