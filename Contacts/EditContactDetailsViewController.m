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
    
    self.view.accessibilityIdentifier = @"com.vc.contactsEdit";
    
    self.firstNameTextField.accessibilityIdentifier = @"com.textfield.firstName";
    self.lastNameTextField.accessibilityIdentifier = @"com.textfield.lastName";
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.firstNameTextField resignFirstResponder];
    [self.lastNameTextField resignFirstResponder];
    
    [super viewWillDisappear:animated];
}

- (IBAction)didCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didFinish:(id)sender
{
    if (self.firstNameTextField.text.length || self.lastNameTextField.text.length) {
        if ([self.delegate respondsToSelector:@selector(editContactDetailsViewController:didEndEditingContact:)]) {
            
            if (!self.contact) {
                self.contact = [[Contact alloc] init];
            }
            
            self.contact.firstName = self.firstNameTextField.text;
            self.contact.lastName = self.lastNameTextField.text;
            
            [self.delegate editContactDetailsViewController:self didEndEditingContact:self.contact];
            [self dismissViewControllerAnimated:YES completion:nil];
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
