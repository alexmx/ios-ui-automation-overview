#!/bin/bash

START=$(date +%s)

xcodebuild -project "../Contacts.xcodeproj" \
    -scheme "Contacts" \
    -sdk iphonesimulator \
    -derivedDataPath "../build" \
    -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.1' \
    test

END=$(date +%s)
DIFF=$(echo "$END - $START" | bc)

echo "Time elapsed: $DIFF"