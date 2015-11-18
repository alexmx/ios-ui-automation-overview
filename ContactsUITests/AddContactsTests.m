//
//  AddContactsTests.m
//  Contacts
//
//  Created by Alex Maimescu on 11/18/15.
//  Copyright © 2015 alexmx. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AddContactsTests : XCTestCase

@end

@implementation AddContactsTests

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

- (void)testAddContact
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Contacts"].buttons[@"Add"] tap];
    
    XCUIElement *comVcContactseditTable = app.tables[@"com.vc.contactsEdit"];
    XCUIElement *comTextfieldFirstnameTextField = comVcContactseditTable.textFields[@"com.textfield.firstName"];
    [comTextfieldFirstnameTextField tap];
    [comTextfieldFirstnameTextField typeText:@"Jon"];
    
    XCUIElement *comTextfieldLastnameTextField = comVcContactseditTable.textFields[@"com.textfield.lastName"];
    [comTextfieldLastnameTextField tap];
    [comTextfieldLastnameTextField tap];
    [comTextfieldLastnameTextField typeText:@"Snow"];
    [app.navigationBars[@"Edit Contact Details"].buttons[@"Done"] tap];
    
    XCTAssertNotNil(app.tables[@"com.vc.contactsList"].cells[@"Jon Snow"]);
    XCTAssertEqual(app.tables[@"com.vc.contactsList"].cells.count, 1);
}

@end
