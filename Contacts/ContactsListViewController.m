//
//  ContactsListViewController.m
//  Contacts
//
//  Created by Alexandru Maimescu on 11/9/15.
//  Copyright (c) 2015 alexmx. All rights reserved.
//

#import "ContactsListViewController.h"
#import "ContactDetailsViewController.h"
#import "EditContactDetailsViewController.h"
#import "ContactCell.h"
#import "Contact.h"

@interface ContactsListViewController () <EditContactDetailsViewControllerDelegate>

@property (nonatomic, strong)  NSMutableArray *contacts;

@end

@implementation ContactsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.view.accessibilityIdentifier = @"com.vc.contactsList";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Accessors

- (NSMutableArray *)contacts
{
    if (!_contacts) {
        _contacts = [NSMutableArray array];
    }
    
    return _contacts;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Contact *contact = self.contacts[indexPath.row];
        [[segue destinationViewController] setContact:contact];
    } else if ([[segue identifier] isEqualToString:@"showEditScreen"]) {
        UINavigationController *navC = segue.destinationViewController;
        EditContactDetailsViewController *editContactVC = [navC.viewControllers firstObject];
        editContactVC.delegate = self;
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
    cell.isAccessibilityElement = YES;
    cell.accessibilityIdentifier = @"com.cell.contactsList";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.contacts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - EditContactDetailsViewControllerDelegate

- (void)editContactDetailsViewController:(EditContactDetailsViewController *)editVC
                    didEndEditingContact:(Contact *)contact
{
    [self.contacts addObject:contact];
    [self.tableView reloadData];
}

@end
