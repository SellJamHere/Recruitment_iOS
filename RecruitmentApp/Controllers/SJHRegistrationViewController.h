//
//  SJHRegistrationViewController.h
//  RecruitmentApp
//
//  Created by James Heller on 8/5/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SJHPopoverContentViewController;

@protocol SJHPopoverDismissDelegate <NSObject>

- (void)dismissPopoverWithContainer:(SJHPopoverContentViewController *)container;

@end

@interface SJHRegistrationViewController : UIViewController <UITextFieldDelegate, UIPopoverControllerDelegate, SJHPopoverDismissDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;
@property (weak, nonatomic) IBOutlet UITextField *majorTextField;


- (IBAction)comeSailingButtonTouched:(id)sender;

- (void)resetRegistrationForm;

@end
