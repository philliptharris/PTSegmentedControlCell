//
//  PTSegmentedControlCell.h
//  PTSegmentedControlCell
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PTSegmentedControlCellDelegate;

extern NSString * const PTSegmentedControlCellReuseIdentifier;

@interface PTSegmentedControlCell : UITableViewCell

@property (nonatomic, weak) id <PTSegmentedControlCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)segmentedControlValueDidChange:(id)sender;

/// Optional. Use this if you want the cell to bind the selected segment to a key in NSUserDefaults.
@property (nonatomic, strong) NSString *userDefaultsIntegerKey;

@property (nonatomic, strong) NSArray *segmentedControlItems;

@end


@protocol PTSegmentedControlCellDelegate <NSObject>

@optional

- (void)segmentedControlCellValueDidChange:(PTSegmentedControlCell *)cell;

@end