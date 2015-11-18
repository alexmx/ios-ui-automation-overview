//
//  ContactDetailsViewController.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/9/15.
//  Copyright (c) 2015 alexmx. All rights reserved.
//

#import "ContactDetailsViewController.h"
#import "EditContactDetailsViewController.h"

@interface ContactDetailsViewController () <EditContactDetailsViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *contactIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *contactNameLabel;

@end

@implementation ContactDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Update screen
    self.contact = self.contact;
    
    self.view.accessibilityIdentifier = @"com.vc.contactDetails";
    self.contactNameLabel.accessibilityIdentifier = @"com.label.contactDetails";
}

- (void)setContact:(Contact *)contact
{
    _contact = contact;
    
    self.contactIconImageView.image = self.contact.icon;
    self.contactNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.contact.firstName, self.contact.lastName];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showEditScreen"]) {
        UINavigationController *navC = segue.destinationViewController;
        EditContactDetailsViewController *editContactVC = [navC.viewControllers firstObject];
        editContactVC.contact = self.contact;
        editContactVC.delegate = self;
    }
}

#pragma mark - EditContactDetailsViewControllerDelegate

- (void)editContactDetailsViewController:(EditContactDetailsViewController *)editVC
                    didEndEditingContact:(Contact *)contact
{
    self.contact = contact;
}

@end
