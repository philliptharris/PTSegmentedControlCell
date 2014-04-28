//
//  MyTableViewController.m
//  PTSegmentedControlCell
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "MyTableViewController.h"

#import "PTSegmentedControlCell.h"

@interface MyTableViewController () <PTSegmentedControlCellDelegate>

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Option A: Register the class.
    [self.tableView registerClass:[PTSegmentedControlCell class] forCellReuseIdentifier:PTSegmentedControlCellReuseIdentifier];
    
    // Option B: Register the Nib.
//    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PTSegmentedControlCell class]) bundle:nil] forCellReuseIdentifier:PTSegmentedControlCellReuseIdentifier];
}

//===============================================
#pragma mark -
#pragma mark UITableViewDataSource
//===============================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PTSegmentedControlCell *cell = [tableView dequeueReusableCellWithIdentifier:PTSegmentedControlCellReuseIdentifier forIndexPath:indexPath];
    
    cell.delegate = self;
    
//    cell.segmentedControlItems = @[@"one", @"two", @"three"];
    cell.segmentedControlItems = @[@"First Name", @"Last Name"];
    
    NSString *userDefaultsIntegerKey = [NSString stringWithFormat:@"Feature %i", indexPath.row + 1];
    
    cell.userDefaultsIntegerKey = userDefaultsIntegerKey;
    
    cell.textLabel.text = userDefaultsIntegerKey;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//===============================================
#pragma mark -
#pragma mark PTSegmentedControlCellDelegate
//===============================================

- (void)segmentedControlCellValueDidChange:(PTSegmentedControlCell *)cell {
    
    NSLog(@"MyTableViewController | segmentedControlCellValueDidChange");
}

@end
