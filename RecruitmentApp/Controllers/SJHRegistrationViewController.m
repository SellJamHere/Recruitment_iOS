//
//  SJHRegistrationViewController.m
//  RecruitmentApp
//
//  Created by James Heller on 8/5/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHRegistrationViewController.h"

#import "UIViewController+AutorotateRules.h"
#import "UIViewController+REFrostedViewController.h"
#import "REFrostedViewController.h"

#import "SJHPopoverContentViewController.h"

#define kMajorString @"Aerospace Engineering", @"African American Studies", @"Anthropology", @"Art", @"Art History", @"Asian American Studies", @"Biochemistry and Molecular Biology", @"Biology/Education", @"Biological Sciences", @"Biomedical Engineering", @"Biomedical Engineering: Premedical", @"Business Administration", @"Business Economics", @"Business Information Management", @"Chemical Engineering", @"Chemistry", @"Chicano/Latino Studies", @"Chinese Studies", @"Civil Engineering", @"Classics", @"Cognitive Sciences", @"Comparative Literature", @"Computer Engineering", @"Computer Game Science", @"Computer Science", @"Computer Science and Engineering", @"Criminology, Law and Society", @"Dance", @"Developmental and Cell Biology", @"Drama", @"Earth System Science", @"East Asian Cultures", @"Ecology and Evolutionary Biology", @"Economics", @"Electrical Engineering", @"Engineering", @"English", @"Environmental Engineering", @"Environmental Science", @"European Studies", @"Film and Media Studies", @"French", @"Genetics", @"German Studies", @"Global Cultures", @"History", @"Human Biology", @"Informatics", @"International Studies", @"Japanese Language and Literature", @"Korean Literature and Culture", @"Literary Journalism", @"Materials Science Engineering", @"Mathematics", @"Mechanical Engineering", @"Microbiology and Immunology", @"Music", @"Music Theatre", @"Neurobiology", @"Nursing Science", @"Pharmaceutical Sciences", @"Philosophy", @"Physics", @"Political Science", @"Psychology", @"Psychology and Social Behavior", @"Public Health Policy", @"Public Health Sciences", @"Quantitative Economics", @"Religious Studies", @"Social Ecology", @"Social Policy and Public Service", @"Sociology", @"Software Engineering", @"Spanish", @"Undecided/Undeclared", @"Urban Studies", @"Women’s Studies"
#define kYearString @"2015", @"2016", @"2017", @"2018", @"2019", @"2020"

@interface SJHRegistrationViewController ()

@property (strong, nonatomic) UIPopoverController *popover;
@property (strong, nonatomic) NSArray *majorArray;
@property (strong, nonatomic) NSArray *yearArray;

@end

@implementation SJHRegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.majorArray = @[kMajorString];
        self.yearArray = @[kYearString];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"%@", NSStringFromCGSize(self.view.bounds.size));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.view.frame = CGRectMake(0, 0, 1024, 768);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self resetRegistrationForm];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)comeSailingButtonTouched:(id)sender {
    //save data
    
    //hide registration form
    [self.frostedViewController hideMenuViewControllerWithCompletionHandler:^{
        [self resetRegistrationForm];
    }];
}

- (void)resetRegistrationForm {
    self.nameTextField.text = @"";
    self.emailTextField.text = @"";
    self.yearTextField.text = @"";
    self.majorTextField.text = @"";
}

#pragma mark Popover

- (void)showPopoverForTextField:(UITextField *)textField withData:(NSArray *)dataArray {
    SJHPopoverContentViewController *popoverContent = [[self storyboard] instantiateViewControllerWithIdentifier:@"SJHPopoverContentViewController"];
    popoverContent.pickerData = dataArray;
    popoverContent.popoverDismissDelegate = self;
    popoverContent.textField = textField;
    
    self.popover = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    [self.popover presentPopoverFromRect:[textField convertRect:textField.bounds toView:self.view] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (void)dismissPopoverWithContainer:(SJHPopoverContentViewController *)container {
    UITextField *textField = container.textField;
    [self.popover dismissPopoverAnimated:YES];
    
    if (textField == self.yearTextField) {
        [self.majorTextField becomeFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == self.nameTextField || textField == self.emailTextField) {
        return YES;
    }
    
    if (textField == self.yearTextField) {
        //show year popup
        [self showPopoverForTextField:self.yearTextField withData:self.yearArray];
    }
    else if (textField == self.majorTextField) {
        //show major popup
        [self showPopoverForTextField:self.majorTextField withData:self.majorArray];
    }
    
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        if (nextTag == 1) {
            [nextResponder becomeFirstResponder];
        }
        else if (nextTag == 2) {
            [textField resignFirstResponder];
            [nextResponder becomeFirstResponder];
        }
    }
    else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

#pragma mark - UIPopoverControllerDelegate

- (BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController {
    
    return YES;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    
}

@end
