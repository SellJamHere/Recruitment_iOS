//
//  SJHRegistrationViewController.h
//  RecruitmentApp
//
//  Created by James Heller on 8/5/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SJHPopoverContentViewController, SJHRegistrationTextField;

@protocol SJHPopoverDismissDelegate <NSObject>

- (void)dismissPopoverWithContainer:(SJHPopoverContentViewController *)container;

@end

@interface SJHRegistrationViewController : UIViewController <UITextFieldDelegate, SJHPopoverDismissDelegate>

@property (weak, nonatomic) IBOutlet SJHRegistrationTextField *nameTextField;
@property (weak, nonatomic) IBOutlet SJHRegistrationTextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITextField *majorTextField;
@property (strong, nonatomic) IBOutlet UIView *genderSelect;



- (IBAction)comeSailingButtonTouched:(id)sender;
- (IBAction)backgroundTouched:(id)sender;


- (IBAction)backButtonTouched:(id)sender;
- (void)resetRegistrationForm;

@end
