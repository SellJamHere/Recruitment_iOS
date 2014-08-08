//
//  SJHPopoverViewController.h
//  RecruitmentApp
//
//  Created by James Heller on 8/6/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SJHPopoverDismissDelegate;

@interface SJHPopoverContentViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSArray *pickerData;
@property (weak, nonatomic) id<SJHPopoverDismissDelegate> popoverDismissDelegate;

@property (weak, nonatomic) UITextField *textField;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

- (IBAction)doneButtonTouched:(id)sender;

@end
