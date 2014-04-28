//
//  PTSegmentedControlCell.m
//  PTSegmentedControlCell
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "PTSegmentedControlCell.h"

NSString * const PTSegmentedControlCellReuseIdentifier = @"PTSegmentedControlCellReuseIdentifier";

@implementation PTSegmentedControlCell

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [self commonInit];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self commonInit];
        
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
        [_segmentedControl addTarget:self action:@selector(segmentedControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
        self.accessoryView = _segmentedControl;
    }
    return self;
}

- (void)commonInit {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

//===============================================
#pragma mark -
#pragma mark Setters
//===============================================

- (void)setSegmentedControlItems:(NSArray *)segmentedControlItems {
    
    _segmentedControlItems = segmentedControlItems;
    
    [self.segmentedControl removeAllSegments];
    
    [segmentedControlItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self.segmentedControl insertSegmentWithTitle:obj atIndex:idx animated:NO];
    }];
    
    [self.segmentedControl sizeToFit];
}

- (void)setUserDefaultsIntegerKey:(NSString *)userDefaultsIntegerKey {
    
    _userDefaultsIntegerKey = userDefaultsIntegerKey;
    
    self.segmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:userDefaultsIntegerKey];
}

//===============================================
#pragma mark -
#pragma mark Actions
//===============================================

- (IBAction)segmentedControlValueDidChange:(id)sender {
    
    NSLog(@"PTSegmentedControlCell | segmentedControlValueDidChange");
    
    if ([self.delegate respondsToSelector:@selector(segmentedControlCellValueDidChange:)]) {
        [self.delegate segmentedControlCellValueDidChange:self];
    }
    
    if (self.userDefaultsIntegerKey) {
        [[NSUserDefaults standardUserDefaults] setInteger:self.segmentedControl.selectedSegmentIndex forKey:self.userDefaultsIntegerKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
