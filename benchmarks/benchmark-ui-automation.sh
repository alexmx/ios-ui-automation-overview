#!/bin/bash

START=$(date +%s)

xcodebuild -project "../Contacts.xcodeproj" \
    -scheme "Contacts" \
    -sdk iphonesimulator \
    -derivedDataPath "../build" \
    build

cd "../ui-automation" && ./run-tests.sh "../build/Products/Debug-iphonesimulator/Contacts-test.app" "iPhone 5s (9.1)"

END=$(date +%s)
DIFF=$(echo "$END - $START" | bc)

echo "Time elapsed: $DIFF"