//
//  SJHCancelButton.m
//  RecruitmentApp
//
//  Created by James Heller on 8/19/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHCancelButton.h"

@implementation SJHCancelButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //// Color Declarations
    UIColor* color5 = [UIColor colorWithRed: 0.642 green: 0.642 blue: 0.642 alpha: 1];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(14.39, 14.39)];
    [bezierPath addCurveToPoint: CGPointMake(14.39, 35.61) controlPoint1: CGPointMake(8.54, 20.25) controlPoint2: CGPointMake(8.54, 29.75)];
    [bezierPath addCurveToPoint: CGPointMake(35.61, 35.61) controlPoint1: CGPointMake(20.25, 41.46) controlPoint2: CGPointMake(29.75, 41.46)];
    [bezierPath addCurveToPoint: CGPointMake(35.61, 14.39) controlPoint1: CGPointMake(41.46, 29.75) controlPoint2: CGPointMake(41.46, 20.25)];
    [bezierPath addCurveToPoint: CGPointMake(14.39, 14.39) controlPoint1: CGPointMake(29.75, 8.54) controlPoint2: CGPointMake(20.25, 8.54)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(37.02, 12.98)];
    [bezierPath addCurveToPoint: CGPointMake(37.02, 37.02) controlPoint1: CGPointMake(43.66, 19.62) controlPoint2: CGPointMake(43.66, 30.38)];
    [bezierPath addCurveToPoint: CGPointMake(12.98, 37.02) controlPoint1: CGPointMake(30.38, 43.66) controlPoint2: CGPointMake(19.62, 43.66)];
    [bezierPath addCurveToPoint: CGPointMake(12.98, 12.98) controlPoint1: CGPointMake(6.34, 30.38) controlPoint2: CGPointMake(6.34, 19.62)];
    [bezierPath addCurveToPoint: CGPointMake(37.02, 12.98) controlPoint1: CGPointMake(19.62, 6.34) controlPoint2: CGPointMake(30.38, 6.34)];
    [bezierPath closePath];
    [color5 setFill];
    [bezierPath fill];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(16, 15)];
    [bezier2Path addLineToPoint: CGPointMake(20, 15)];
    [color5 setFill];
    [bezier2Path fill];
    
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake(14, 17)];
    [bezier3Path addLineToPoint: CGPointMake(17, 14)];
    [bezier3Path addLineToPoint: CGPointMake(36, 33)];
    [bezier3Path addLineToPoint: CGPointMake(33, 36)];
    [bezier3Path addLineToPoint: CGPointMake(14, 17)];
    [bezier3Path closePath];
    [color5 setFill];
    [bezier3Path fill];
    
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = UIBezierPath.bezierPath;
    [bezier4Path moveToPoint: CGPointMake(36, 17)];
    [bezier4Path addLineToPoint: CGPointMake(33, 14)];
    [bezier4Path addLineToPoint: CGPointMake(14, 33)];
    [bezier4Path addLineToPoint: CGPointMake(17, 36)];
    [bezier4Path addLineToPoint: CGPointMake(36, 17)];
    [bezier4Path closePath];
    [color5 setFill];
    [bezier4Path fill];

}


@end
