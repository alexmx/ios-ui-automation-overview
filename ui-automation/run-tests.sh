#!/bin/sh

XCODE_PATH=`xcode-select -print-path`
TRACETEMPLATE="/Applications/Xcode.app/Contents/Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.xrplugin/Contents/Resources/Automation.tracetemplate"
APP_LOCATION=$1
DEVICE_ID=$2

if [ ! $# -gt 1 ]; then
	echo "You must specify the app location and the test file."
	echo "\t (optionally supply unique device ID of physical iOS device)"
	echo "\t eg. ./run-tests.sh suite.js <xcodeproject directory>/build/Products/Debug-iphonesimulator/app.app <device-udid>"
	exit -1
fi

# If running on device, only need name of app, full path not important
if [ ! "$DEVICE_ID" = "" ]; then
  RUN_ON_SPECIFIC_DEVICE_OPTION="$DEVICE_ID"
  APP_LOCATION=`basename $APP_LOCATION`
fi

# Create junit reporting directory
if [ ! -d "test-reports" ]; then
  mkdir test-reports
fi

# Run all specs
for script in specs/*
do
    if [[ -f $script ]]; then
      echo $script
      instruments -w "$RUN_ON_SPECIFIC_DEVICE_OPTION" \
        -t $TRACETEMPLATE \
        $APP_LOCATION \
        -e UIASCRIPT $script \
        -e UIARESULTSPATH /var/tmp | grep "<"  > test-reports/test-results.xml
    fi
done

# cleanup the tracefiles produced from instruments
rm -rf *.trace

# fail script if any failures have been generated
if [ `grep "<failure>" test-reports/test-results.xml | wc -l` -gt 0 ]; then
  echo 'Build Failed'
  exit -1
else
  echo 'Build Passed'
  exit 0
fi


