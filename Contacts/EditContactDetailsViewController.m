//
//  EditContactDetailsViewController.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/10/15.
//  Copyright © 2015 alexmx. All rights reserved.
//

#import "EditContactDetailsViewController.h"

@interface EditContactDetailsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@end

@implementation EditContactDetailsViewController

- (instancetype)initWithContact:(Contact *)contact
{
    if (self = [super init]) {
        _contact = contact;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.contact) {
        self.firstNameTextField.text = self.contact.firstName;
        self.lastNameTextField.text = self.contact.lastName;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.firstNameTextField resignFirstResponder];
    [self.lastNameTextField resignFirstResponder];
    
    [super viewWillDisappear:animated];
}

- (IBAction)didFinish:(id)sender
{
    if (self.firstNameTextField.text.length || self.lastNameTextField.text.length) {
        if ([self.delegate respondsToSelector:@selector(editContactDetailsViewController:didEndEditingContact:)]) {
            [self.delegate editContactDetailsViewController:self didEndEditingContact:self.contact];
        }
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return (textField == self.firstNameTextField) ?
        [self.lastNameTextField becomeFirstResponder] : [textField resignFirstResponder];
}

@end
