//
//  SJHImageSlideShowViewController.h
//  RecruitmentApp
//
//  Created by James Heller on 8/5/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KASlideShow;

@interface SJHImageSlideShowViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIControl *touchView;
@property (weak, nonatomic) IBOutlet KASlideShow *slideShowContainerView;

- (IBAction)viewTouched:(id)sender;

@end
