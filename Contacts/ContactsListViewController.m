//
//  ContactsListViewController.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/9/15.
//  Copyright (c) 2015 alexmx. All rights reserved.
//

#import "ContactsListViewController.h"
#import "ContactDetailsViewController.h"
#import "ContactCell.h"
#import "Contact.h"

@interface ContactsListViewController ()

@property NSMutableArray *contacts;

@end

@implementation ContactsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contacts = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        Contact *contact = [Contact new];
        contact.icon = [UIImage imageNamed:@"contact-icon"];
        contact.name = [NSString stringWithFormat:@"Contact %d", i];
        [self.contacts addObject:contact];
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Contact *contact = self.contacts[indexPath.row];
        [[segue destinationViewController] setContact:contact];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.contact = self.contacts[indexPath.row];
    
    return cell;
}

@end
