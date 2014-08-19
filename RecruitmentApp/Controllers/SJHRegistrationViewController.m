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

#import "MBProgressHUD.h"
#import "HMSegmentedControl.h"

#import "SJHRegistrationHelper.h"
#import "SJHRegistrationTextField.h"

#import "SJHPopoverContentViewController.h"

#import "SJHApiClient.h"

#import "SJHCoreDataHandler.h"
#import "SJHRecruit.h"

#define kMajorString @"Undecided/Undeclared", @"Aerospace Engineering", @"African American Studies", @"Anthropology", @"Art", @"Art History", @"Asian American Studies", @"Biochemistry and Molecular Biology", @"Biology/Education", @"Biological Sciences", @"Biomedical Engineering", @"Biomedical Engineering: Premedical", @"Business Administration", @"Business Economics", @"Business Information Management", @"Chemical Engineering", @"Chemistry", @"Chicano/Latino Studies", @"Chinese Studies", @"Civil Engineering", @"Classics", @"Cognitive Sciences", @"Comparative Literature", @"Computer Engineering", @"Computer Game Science", @"Computer Science", @"Computer Science and Engineering", @"Criminology, Law and Society", @"Dance", @"Developmental and Cell Biology", @"Drama", @"Earth System Science", @"East Asian Cultures", @"Ecology and Evolutionary Biology", @"Economics", @"Electrical Engineering", @"Engineering", @"English", @"Environmental Engineering", @"Environmental Science", @"European Studies", @"Film and Media Studies", @"French", @"Genetics", @"German Studies", @"Global Cultures", @"History", @"Human Biology", @"Informatics", @"International Studies", @"Japanese Language and Literature", @"Korean Literature and Culture", @"Literary Journalism", @"Materials Science Engineering", @"Mathematics", @"Mechanical Engineering", @"Microbiology and Immunology", @"Music", @"Music Theatre", @"Neurobiology", @"Nursing Science", @"Pharmaceutical Sciences", @"Philosophy", @"Physics", @"Political Science", @"Psychology", @"Psychology and Social Behavior", @"Public Health Policy", @"Public Health Sciences", @"Quantitative Economics", @"Religious Studies", @"Social Ecology", @"Social Policy and Public Service", @"Sociology", @"Software Engineering", @"Spanish", @"Urban Studies", @"Women’s Studies"
#define kYearString @"2015", @"2016", @"2017", @"2018", @"2019", @"2020"

@interface SJHRegistrationViewController () <UIPopoverControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UIPopoverController *popover;
@property (strong, nonatomic) NSArray *majorArray;
@property (strong, nonatomic) NSArray *yearArray;

@property (strong, nonatomic) HMSegmentedControl *genderControl;

@property (strong, nonatomic) MBProgressHUD *hud;
@property (strong, nonatomic) UIAlertView *alertView;

@end

@implementation SJHRegistrationViewController

static NSString * const kAlertTextUploadSuccess = @"We'll see you out on the water :)";
static NSString * const kAlertTextAlreadyRegistered = @"It looks like you're already registered.";


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
        
        self.genderControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"Male", @"Female"]];
        self.genderControl.backgroundColor = [UIColor clearColor];
        self.genderControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
        self.genderControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        self.genderControl.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:28.0f];
//        self.genderControl.selectionIndicatorColor = [UIColor colorWithRed:0 green:100/255.0 blue:164/255.0 alpha:1];
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
    self.genderControl.frame = self.genderSelect.bounds;
    [self.genderControl removeFromSuperview];
    [self.genderSelect addSubview:self.genderControl];
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
    //validate registration input
    if ([self checkFields]) {
        //Check if recruit has already been stored
        if (![[SJHCoreDataHandler dataHandler] recruitAlreadyStoredForEmail:self.emailTextField.text]) {
            self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            self.hud.labelText = @"Saving";
            
            //save data
            SJHRecruit *recruit = [[SJHCoreDataHandler dataHandler] newRecruit];
            [self storeRecruit:recruit];
            
            //Check if network is active
            if ([[[SJHApiClient sharedClient] reachabilityManager] isReachable]) {
                //try uploading recruit
                [[SJHApiClient sharedClient] recruitPOST:recruit success:^(NSURLSessionDataTask *task, id responseObject) {
                    recruit.isUploaded = [NSNumber numberWithBool:YES];
                    [[SJHCoreDataHandler dataHandler] saveContext];
                    [self.hud hide:YES];
                    self.alertView = [[UIAlertView alloc] initWithTitle:@"Thank You!" message:kAlertTextUploadSuccess delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    [self.alertView show];
                    
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                    if (response.statusCode == 499) {
                        //recruit already exists on the server
                        recruit.isUploaded = [NSNumber numberWithBool:YES];
                        [[SJHCoreDataHandler dataHandler] saveContext];
                        self.alertView = [[UIAlertView alloc] initWithTitle:@"Well Shoot!" message:kAlertTextAlreadyRegistered delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    }
                    else {
                        self.alertView = [[UIAlertView alloc] initWithTitle:@"Thank You!" message:kAlertTextUploadSuccess delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    }
                    [self.hud hide:YES];
                    
                    [self.alertView show];
                }];
            }
            else {
                [self.hud hide:YES afterDelay:0.5];
                self.alertView = [[UIAlertView alloc] initWithTitle:@"Thank You!" message:kAlertTextUploadSuccess delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [self.alertView show];
            }
        }
        else {
            //Report that user has been registered already
            self.alertView = [[UIAlertView alloc] initWithTitle:@"Well Shoot!!" message:kAlertTextAlreadyRegistered delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [self.alertView show];
        }
    }
}

- (BOOL)checkFields {
    BOOL fieldsAreValid = YES;
    if ([self.nameTextField.text length] <= 0) {
        [self.nameTextField wiggle];
        fieldsAreValid = NO;
    }
    
    if ([self.emailTextField.text length] <= 0) {
        [self.emailTextField wiggle];
        fieldsAreValid = NO;
    }
    
    if (![SJHRegistrationHelper isValidEmailAddress:self.emailTextField.text]) {
        [self.emailTextField wiggle];
        fieldsAreValid = NO;
    }
    
    return fieldsAreValid;
}

- (void)hideRegistrationView {
    //hide registration form
    [self.frostedViewController hideMenuViewControllerWithCompletionHandler:^{
        [self resetRegistrationForm];
    }];
}

- (IBAction)backgroundTouched:(id)sender {
    [self.nameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
}

- (IBAction)backButtonTouched:(id)sender {
    [self.nameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self hideRegistrationView];
}

- (void)resetRegistrationForm {
    self.nameTextField.text = @"";
    self.emailTextField.text = @"";
    self.yearTextField.text = @"";
    self.majorTextField.text = @"";
    [self.genderControl setSelectedSegmentIndex:0];
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
    
    [self.nameTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    
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

#pragma mark - CoreData

- (void)storeRecruit:(SJHRecruit *)recruit {
    recruit.name = self.nameTextField.text;
    recruit.email = self.emailTextField.text;
    recruit.year = [NSNumber numberWithInteger:[self.yearTextField.text integerValue]];
    recruit.major = self.majorTextField.text;
    recruit.isMale = [NSNumber numberWithBool:[self.genderControl selectedSegmentIndex] == 0];
    
    [[SJHCoreDataHandler dataHandler] saveContext];
}

#pragma mark - AlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([alertView.message isEqualToString:kAlertTextUploadSuccess]) {
        [self hideRegistrationView];
    }
    else if ([alertView.message isEqualToString:kAlertTextAlreadyRegistered]) {
        [self hideRegistrationView];
    }
}

@end
