#!/bin/bash

START=$(date +%s)

xcodebuild -project "../Contacts.xcodeproj" \
    -scheme "Contacts" \
    -sdk iphonesimulator \
    -derivedDataPath "../build" \
    build

cd "../appium" && bundle exec cucumber

END=$(date +%s)
DIFF=$(echo "$END - $START" | bc)

echo "Time elapsed: $DIFF"