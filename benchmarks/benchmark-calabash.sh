#!/bin/bash

START=$(date +%s)

xcodebuild -project "../Contacts.xcodeproj" \
    -scheme "Contacts-cal" \
    -sdk iphonesimulator \
    -derivedDataPath "../build" \
    build

cd "../calabash" && APP="../Build/Products/Debug-iphonesimulator/Contacts-cal.app" bundle exec cucumber

END=$(date +%s)
DIFF=$(echo "$END - $START" | bc)

echo "Time elapsed: $DIFF"