//
//  UpdateContactTests.m
//  Contacts
//
//  Created by Alex Maimescu on 11/18/15.
//  Copyright © 2015 alexmx. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UpdateContactTests : XCTestCase

@end

@implementation UpdateContactTests

- (void)setUp
{
    [super setUp];
    
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testUpdateContact
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Contacts"].buttons[@"Add"] tap];
    
    XCUIElement *comVcContactseditTable2 = app.tables[@"com.vc.contactsEdit"];
    XCUIElement *comTextfieldFirstnameTextField = comVcContactseditTable2.textFields[@"com.textfield.firstName"];
    [comTextfieldFirstnameTextField tap];
    [comTextfieldFirstnameTextField typeText:@"Jon"];
    
    XCUIElement *comTextfieldLastnameTextField = comVcContactseditTable2.textFields[@"com.textfield.lastName"];
    [comTextfieldLastnameTextField tap];
    [comTextfieldLastnameTextField typeText:@"Snow"];
    
    XCUIElement *doneButton = app.navigationBars[@"Edit Contact Details"].buttons[@"Done"];
    [doneButton tap];
    
    XCUIApplication *app2 = app;
    [app2.tables[@"com.vc.contactsList"].staticTexts[@"Jon Snow"] tap];
    
    XCUIElement *contactNavigationBar = app.navigationBars[@"Contact"];
    [contactNavigationBar.buttons[@"Edit"] tap];
    [comTextfieldFirstnameTextField tap];
    
    XCUIElement *comVcContactseditTable = app2.tables[@"com.vc.contactsEdit"];
    [comVcContactseditTable.buttons[@"Clear text"] tap];
    [comTextfieldFirstnameTextField typeText:@"Robb"];
    [comTextfieldLastnameTextField tap];
    [comTextfieldLastnameTextField tap];
    [comVcContactseditTable.buttons[@"Clear text"] tap];
    [comTextfieldLastnameTextField typeText:@"Stark"];
    [doneButton tap];
    [contactNavigationBar.buttons[@"Contacts"] tap];
    
    XCTAssertNotNil(app.tables[@"com.vc.contactsList"].cells[@"Robb Stark"]);
    XCTAssertEqual(app.tables[@"com.vc.contactsList"].cells.count, 1);
}

@end
