//
//  RemoveContactTests.m
//  Contacts
//
//  Created by Alex Maimescu on 11/18/15.
//  Copyright © 2015 alexmx. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RemoveContactTests : XCTestCase

@end

@implementation RemoveContactTests

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

- (void)testRemoveContact
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *contactsNavigationBar = app.navigationBars[@"Contacts"];
    [contactsNavigationBar.buttons[@"Add"] tap];
    
    XCUIElement *comVcContactseditTable = app.tables[@"com.vc.contactsEdit"];
    XCUIElement *comTextfieldFirstnameTextField = comVcContactseditTable.textFields[@"com.textfield.firstName"];
    [comTextfieldFirstnameTextField tap];
    [comTextfieldFirstnameTextField typeText:@"Jon"];
    
    XCUIElement *comTextfieldLastnameTextField = comVcContactseditTable.textFields[@"com.textfield.lastName"];
    [comTextfieldLastnameTextField tap];
    [comTextfieldLastnameTextField tap];
    [comTextfieldLastnameTextField typeText:@"Snow"];
    [app.navigationBars[@"Edit Contact Details"].buttons[@"Done"] tap];
    [contactsNavigationBar.buttons[@"Edit"] tap];
    
    XCUIElement *comVcContactslistTable = app.tables[@"com.vc.contactsList"];
    [comVcContactslistTable.buttons[@"Delete Jon Snow"] tap];
    [comVcContactslistTable.buttons[@"Delete"] tap];
    
    XCTAssertEqual(app.tables[@"com.vc.contactsList"].cells.count, 0);
}

@end
