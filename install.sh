#!/bin/sh

flutter create -t module fluter
cd fluter
flutter build ios --simulator --debug

cd ..
cp -r ./fluter/.ios/Flutter/App.framework ./iOSFlutterDemo/Flutter/App.framework
cp -r ./fluter/.ios/Flutter/engine/Flutter.framework ./iOSFlutterDemo/Flutter/
cp -r ./fluter/.ios/Flutter/flutter_assets ./iOSFlutterDemo/Flutter/
