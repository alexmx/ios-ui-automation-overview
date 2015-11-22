var target = UIATarget.localTarget();
var app = target.frontMostApp();

target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);
app.navigationBar().rightButton().tap();
app.mainWindow().tableViews()["com.vc.contactsEdit"].cells()["First Name"].textFields()["com.textfield.firstName"].textFields()[0].tap();
app.keyboard().typeString("Jon\nSnow\n");
app.navigationBar().rightButton().tap();

// TBD: Add asserts