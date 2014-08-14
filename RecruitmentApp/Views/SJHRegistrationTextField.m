//
//  SJHRegistrationTextField.m
//  RecruitmentApp
//
//  Created by James Heller on 8/14/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHRegistrationTextField.h"

#import <QuartzCore/QuartzCore.h>

@interface SJHRegistrationTextField ()

@property BOOL lock;

@end

@implementation SJHRegistrationTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        _lock = NO;
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (void)wiggle {
    if (!_lock) {
        _lock = YES;
        
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [[UIColor redColor] CGColor];
        
        CGFloat initialX = self.frame.origin.x;
        [UIView animateWithDuration:0.10 animations:^{
            self.frame = CGRectMake(initialX - 10, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.10 animations:^{
                self.frame = CGRectMake(initialX + 10, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.10 animations:^{
                    self.frame = CGRectMake(initialX - 10, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.10 animations:^{
                        self.frame = CGRectMake(initialX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                    } completion:^(BOOL finished) {
                        double delayInSeconds = 1;
                        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                            self.layer.borderColor = [[UIColor clearColor] CGColor];
                            _lock = NO;
                        });
                    }];
                }];
            }];
        }];
    }
}
@end
