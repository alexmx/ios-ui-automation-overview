//
//  EditContactDetailsViewController.h
//  Contacts
//
//  Created by Alexandru Maimescu on 11/10/15.
//  Copyright © 2015 alexmx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@class EditContactDetailsViewController;

@protocol EditContactDetailsViewControllerDelegate <NSObject>

- (void)editContactDetailsViewController:(EditContactDetailsViewController *)editVC didEndEditingContact:(Contact *)contact;

@end

@interface EditContactDetailsViewController : UITableViewController

@property (nonatomic, strong) Contact *contact;
@property (nonatomic, weak) id<EditContactDetailsViewControllerDelegate> delegate;

- (instancetype)initWithContact:(Contact *)contact;

@end
