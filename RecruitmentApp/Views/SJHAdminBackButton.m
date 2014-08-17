//
//  SJHAdminBackButton.m
//  RecruitmentApp
//
//  Created by James Heller on 8/16/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHAdminBackButton.h"

@implementation SJHAdminBackButton

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
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Bezier Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 42.5, 33.84);
    CGContextRotateCTM(context, -90 * M_PI / 180);
    
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(17.5, 0)];
    [bezierPath addCurveToPoint: CGPointMake(17.5, 4.07) controlPoint1: CGPointMake(17.5, -0) controlPoint2: CGPointMake(17.5, 1.66)];
    [bezierPath addCurveToPoint: CGPointMake(6.44, 11.08) controlPoint1: CGPointMake(12.51, 7.23) controlPoint2: CGPointMake(6.44, 11.08)];
    [bezierPath addCurveToPoint: CGPointMake(17.5, 18.08) controlPoint1: CGPointMake(6.44, 11.08) controlPoint2: CGPointMake(12.51, 14.92)];
    [bezierPath addCurveToPoint: CGPointMake(17.5, 22.16) controlPoint1: CGPointMake(17.5, 20.49) controlPoint2: CGPointMake(17.5, 22.16)];
    [bezierPath addLineToPoint: CGPointMake(0, 11.08)];
    [bezierPath addLineToPoint: CGPointMake(17.5, 0)];
    [bezierPath addLineToPoint: CGPointMake(17.5, 0)];
    [bezierPath closePath];
    [UIColor.blackColor setFill];
    [bezierPath fill];
    
    CGContextRestoreGState(context);
    
    
    //// Back Drawing
    CGRect backRect = CGRectMake(0, 0, 249, 50);
    {
        NSString* textContent = @"Back";
        NSMutableParagraphStyle* backStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        backStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary* backFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-Light" size: 22], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: backStyle};
        
        [textContent drawInRect: CGRectOffset(backRect, 0, (CGRectGetHeight(backRect) - [textContent boundingRectWithSize: backRect.size options: NSStringDrawingUsesLineFragmentOrigin attributes: backFontAttributes context: nil].size.height) / 2) withAttributes: backFontAttributes];
    }
    
    
    //// Bezier 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 185.5, 33.84);
    CGContextRotateCTM(context, -90 * M_PI / 180);
    
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(17.5, 0)];
    [bezier2Path addCurveToPoint: CGPointMake(17.5, 4.07) controlPoint1: CGPointMake(17.5, -0) controlPoint2: CGPointMake(17.5, 1.66)];
    [bezier2Path addCurveToPoint: CGPointMake(6.44, 11.08) controlPoint1: CGPointMake(12.51, 7.23) controlPoint2: CGPointMake(6.44, 11.08)];
    [bezier2Path addCurveToPoint: CGPointMake(17.5, 18.08) controlPoint1: CGPointMake(6.44, 11.08) controlPoint2: CGPointMake(12.51, 14.92)];
    [bezier2Path addCurveToPoint: CGPointMake(17.5, 22.16) controlPoint1: CGPointMake(17.5, 20.49) controlPoint2: CGPointMake(17.5, 22.16)];
    [bezier2Path addLineToPoint: CGPointMake(0, 11.08)];
    [bezier2Path addLineToPoint: CGPointMake(17.5, 0)];
    [bezier2Path addLineToPoint: CGPointMake(17.5, 0)];
    [bezier2Path closePath];
    [UIColor.blackColor setFill];
    [bezier2Path fill];
    
    CGContextRestoreGState(context);
}


@end
