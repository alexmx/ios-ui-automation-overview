var target = UIATarget.localTarget();

target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().mainWindow().tableViews()["com.vc.contactsEdit"].cells()["First Name"].textFields()["com.textfield.firstName"].textFields()[0].tap();
target.frontMostApp().keyboard().typeString("Jon\nSnow");
target.frontMostApp().keyboard().typeString("\n");
target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().mainWindow().tableViews()["com.vc.contactsList"].cells()["com.cell.contactsList"].tap();
target.frontMostApp().mainWindow().tableViews()["com.vc.contactsList"].cells()["com.cell.contactsList"].tap();

// TBD: Add asserts