//
//  EditContactDetailsViewController.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/10/15.
//  Copyright © 2015 alexmx. All rights reserved.
//

#import "EditContactDetailsViewController.h"

@interface EditContactDetailsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@end

@implementation EditContactDetailsViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [self.firstNameTextField resignFirstResponder];
    [self.lastNameTextField resignFirstResponder];
    
    [super viewWillDisappear:animated];
}

@end
