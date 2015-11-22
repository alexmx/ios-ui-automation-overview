var target = UIATarget.localTarget();

target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().mainWindow().tableViews()["com.vc.contactsEdit"].cells()["First Name"].textFields()["com.textfield.firstName"].textFields()[0].tap();
target.frontMostApp().keyboard().typeString("Jon\nSnow\n");
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().mainWindow().tableViews()["com.vc.contactsList"].tapWithOptions({tapOffset:{x:0.38, y:0.15}});
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().mainWindow().tableViews()["com.vc.contactsEdit"].cells()["First Name"].textFields()["com.textfield.firstName"].textFields()[0].tap();
target.frontMostApp().keyboard().keys()["delete"].tapWithOptions({tapCount:3});
target.frontMostApp().keyboard().typeString("Robb\n");
target.frontMostApp().keyboard().keys()["delete"].tapWithOptions({tapCount:4});
target.frontMostApp().keyboard().typeString("Stark\n");
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().navigationBar().leftButton().tap();

// TBD: Add asserts