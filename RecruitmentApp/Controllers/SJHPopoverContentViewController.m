//
//  SJHPopoverViewController.m
//  RecruitmentApp
//
//  Created by James Heller on 8/6/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHPopoverContentViewController.h"

#import "SJHRegistrationViewController.h"

@interface SJHPopoverContentViewController ()

@end

@implementation SJHPopoverContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.textField.text = self.pickerData[0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonTouched:(id)sender {
    self.textField.text = self.pickerData[[self.pickerView selectedRowInComponent:0]];
    [self.popoverDismissDelegate dismissPopoverWithContainer:self];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.pickerData count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

#pragma mark UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.textField.text = self.pickerData[row];
}

//Appears pickerview doesn't work with attributed string anymore. Consider using UIView version instead

//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    NSString *title = self.pickerData[row];
//    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
////    NSDictionary *attriutes = @{NSFontAttributeName: font};
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title];
//    [string addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [title length])];
//
//    return string;
//}

@end
