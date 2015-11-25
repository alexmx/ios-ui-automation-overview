#!/bin/bash

START=$(date +%s)

xcodebuild -project "../Contacts.xcodeproj" \
    -scheme "Contacts" \
    -sdk iphonesimulator \
    -derivedDataPath "../build" \
    build

cd "../appium" && bundle exec cucumber

echo "Time elapsed: $DIFF"