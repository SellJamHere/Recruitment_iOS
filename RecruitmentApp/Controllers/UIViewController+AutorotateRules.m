//
//  UIViewController+AutorotateRules.m
//  RecruitmentApp
//
//  Created by James Heller on 8/5/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "UIViewController+AutorotateRules.h"

@implementation UIViewController (AutorotateRules)

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeLeft;
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

@end
