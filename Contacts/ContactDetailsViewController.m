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
    
    self.contactIconImageView.image = self.contact.icon;
    self.contactNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.contact.firstName, self.contact.lastName];
}

#pragma mark - EditContactDetailsViewControllerDelegate

- (void)editContactDetailsViewController:(EditContactDetailsViewController *)editVC
                    didEndEditingContact:(Contact *)contact
{

}

@end
