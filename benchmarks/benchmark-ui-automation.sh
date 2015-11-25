#!/bin/bash

START=$(date +%s)

xcodebuild -project "../Contacts.xcodeproj" \
    -scheme "Contacts" \
    -sdk iphonesimulator \
    -derivedDataPath "../build" \
    build

cd "../ui-automation" && ./run-tests.sh "../build/Products/Debug-iphonesimulator/Contacts-test.app" "iPhone 6 (9.1)"

echo "Time elapsed: $DIFF"