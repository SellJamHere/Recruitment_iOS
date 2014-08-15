//
//  SJHSettingsButton.m
//  RecruitmentApp
//
//  Created by James Heller on 8/14/14.
//  Copyright (c) 2014 UCISailingTeam. All rights reserved.
//

#import "SJHSettingsButton.h"

@implementation SJHSettingsButton

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
    
    //// Color Declarations
    UIColor* color5 = [UIColor colorWithRed: 0.642 green: 0.642 blue: 0.642 alpha: 1];
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextSetAlpha(context, 0.4);
        CGContextBeginTransparencyLayer(context, NULL);
        
        
        //// Rectangle 7 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 25, 31.91);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle7Path = UIBezierPath.bezierPath;
        [rectangle7Path moveToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle7Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle7Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle7Path addLineToPoint: CGPointMake(0.56, -11.88)];
        [rectangle7Path addLineToPoint: CGPointMake(0.47, -12.07)];
        [rectangle7Path addLineToPoint: CGPointMake(0.27, -12.17)];
        [rectangle7Path addLineToPoint: CGPointMake(-0.22, -12.17)];
        [rectangle7Path addLineToPoint: CGPointMake(-0.41, -12.07)];
        [rectangle7Path addLineToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle7Path closePath];
        rectangle7Path.lineCapStyle = kCGLineCapRound;
        
        rectangle7Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle7Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 27.4, 31.5);
        CGContextRotateCTM(context, -20 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectanglePath = UIBezierPath.bezierPath;
        [rectanglePath moveToPoint: CGPointMake(-0.51, -11.88)];
        [rectanglePath addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectanglePath addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectanglePath addLineToPoint: CGPointMake(0.57, -11.88)];
        [rectanglePath addLineToPoint: CGPointMake(0.47, -12.08)];
        [rectanglePath addLineToPoint: CGPointMake(0.27, -12.18)];
        [rectanglePath addLineToPoint: CGPointMake(-0.22, -12.18)];
        [rectanglePath addLineToPoint: CGPointMake(-0.41, -12.08)];
        [rectanglePath addLineToPoint: CGPointMake(-0.51, -11.88)];
        [rectanglePath closePath];
        rectanglePath.lineCapStyle = kCGLineCapRound;
        
        rectanglePath.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectanglePath fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 2 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 29.5, 30.3);
        CGContextRotateCTM(context, -40 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle2Path = UIBezierPath.bezierPath;
        [rectangle2Path moveToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle2Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle2Path addLineToPoint: CGPointMake(1.04, -10.25)];
        [rectangle2Path addLineToPoint: CGPointMake(0.57, -11.88)];
        [rectangle2Path addLineToPoint: CGPointMake(0.47, -12.08)];
        [rectangle2Path addLineToPoint: CGPointMake(0.27, -12.18)];
        [rectangle2Path addLineToPoint: CGPointMake(-0.22, -12.18)];
        [rectangle2Path addLineToPoint: CGPointMake(-0.42, -12.08)];
        [rectangle2Path addLineToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle2Path closePath];
        rectangle2Path.lineCapStyle = kCGLineCapRound;
        
        rectangle2Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle2Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 3 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 31.06, 28.45);
        CGContextRotateCTM(context, -60 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle3Path = UIBezierPath.bezierPath;
        [rectangle3Path moveToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle3Path addLineToPoint: CGPointMake(-1.05, -10.25)];
        [rectangle3Path addLineToPoint: CGPointMake(1.04, -10.25)];
        [rectangle3Path addLineToPoint: CGPointMake(0.57, -11.87)];
        [rectangle3Path addLineToPoint: CGPointMake(0.47, -12.07)];
        [rectangle3Path addLineToPoint: CGPointMake(0.27, -12.17)];
        [rectangle3Path addLineToPoint: CGPointMake(-0.22, -12.17)];
        [rectangle3Path addLineToPoint: CGPointMake(-0.42, -12.07)];
        [rectangle3Path addLineToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle3Path closePath];
        rectangle3Path.lineCapStyle = kCGLineCapRound;
        
        rectangle3Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle3Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 4 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 31.89, 26.2);
        CGContextRotateCTM(context, -80 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle4Path = UIBezierPath.bezierPath;
        [rectangle4Path moveToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle4Path addLineToPoint: CGPointMake(-1.05, -10.25)];
        [rectangle4Path addLineToPoint: CGPointMake(1.04, -10.25)];
        [rectangle4Path addLineToPoint: CGPointMake(0.57, -11.87)];
        [rectangle4Path addLineToPoint: CGPointMake(0.47, -12.07)];
        [rectangle4Path addLineToPoint: CGPointMake(0.27, -12.16)];
        [rectangle4Path addLineToPoint: CGPointMake(-0.22, -12.16)];
        [rectangle4Path addLineToPoint: CGPointMake(-0.42, -12.07)];
        [rectangle4Path addLineToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle4Path closePath];
        rectangle4Path.lineCapStyle = kCGLineCapRound;
        
        rectangle4Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle4Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 5 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 31.88, 23.8);
        CGContextRotateCTM(context, -100 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle5Path = UIBezierPath.bezierPath;
        [rectangle5Path moveToPoint: CGPointMake(-0.51, -11.86)];
        [rectangle5Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle5Path addLineToPoint: CGPointMake(1.04, -10.25)];
        [rectangle5Path addLineToPoint: CGPointMake(0.57, -11.86)];
        [rectangle5Path addLineToPoint: CGPointMake(0.47, -12.06)];
        [rectangle5Path addLineToPoint: CGPointMake(0.27, -12.16)];
        [rectangle5Path addLineToPoint: CGPointMake(-0.22, -12.16)];
        [rectangle5Path addLineToPoint: CGPointMake(-0.42, -12.06)];
        [rectangle5Path addLineToPoint: CGPointMake(-0.51, -11.86)];
        [rectangle5Path closePath];
        rectangle5Path.lineCapStyle = kCGLineCapRound;
        
        rectangle5Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle5Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 6 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 31.05, 21.55);
        CGContextRotateCTM(context, -120 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle6Path = UIBezierPath.bezierPath;
        [rectangle6Path moveToPoint: CGPointMake(-0.51, -11.86)];
        [rectangle6Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle6Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle6Path addLineToPoint: CGPointMake(0.57, -11.86)];
        [rectangle6Path addLineToPoint: CGPointMake(0.47, -12.06)];
        [rectangle6Path addLineToPoint: CGPointMake(0.27, -12.16)];
        [rectangle6Path addLineToPoint: CGPointMake(-0.22, -12.16)];
        [rectangle6Path addLineToPoint: CGPointMake(-0.41, -12.06)];
        [rectangle6Path addLineToPoint: CGPointMake(-0.51, -11.86)];
        [rectangle6Path closePath];
        rectangle6Path.lineCapStyle = kCGLineCapRound;
        
        rectangle6Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle6Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 8 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 29.49, 19.71);
        CGContextRotateCTM(context, -140 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle8Path = UIBezierPath.bezierPath;
        [rectangle8Path moveToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle8Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle8Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle8Path addLineToPoint: CGPointMake(0.56, -11.87)];
        [rectangle8Path addLineToPoint: CGPointMake(0.47, -12.06)];
        [rectangle8Path addLineToPoint: CGPointMake(0.27, -12.16)];
        [rectangle8Path addLineToPoint: CGPointMake(-0.22, -12.16)];
        [rectangle8Path addLineToPoint: CGPointMake(-0.41, -12.06)];
        [rectangle8Path addLineToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle8Path closePath];
        rectangle8Path.lineCapStyle = kCGLineCapRound;
        
        rectangle8Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle8Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 9 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 27.39, 18.51);
        CGContextRotateCTM(context, -160 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle9Path = UIBezierPath.bezierPath;
        [rectangle9Path moveToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle9Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle9Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle9Path addLineToPoint: CGPointMake(0.56, -11.87)];
        [rectangle9Path addLineToPoint: CGPointMake(0.47, -12.07)];
        [rectangle9Path addLineToPoint: CGPointMake(0.27, -12.17)];
        [rectangle9Path addLineToPoint: CGPointMake(-0.22, -12.17)];
        [rectangle9Path addLineToPoint: CGPointMake(-0.41, -12.07)];
        [rectangle9Path addLineToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle9Path closePath];
        rectangle9Path.lineCapStyle = kCGLineCapRound;
        
        rectangle9Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle9Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 10 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 25, 18.09);
        CGContextRotateCTM(context, -180 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle10Path = UIBezierPath.bezierPath;
        [rectangle10Path moveToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle10Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle10Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle10Path addLineToPoint: CGPointMake(0.56, -11.88)];
        [rectangle10Path addLineToPoint: CGPointMake(0.47, -12.07)];
        [rectangle10Path addLineToPoint: CGPointMake(0.27, -12.17)];
        [rectangle10Path addLineToPoint: CGPointMake(-0.22, -12.17)];
        [rectangle10Path addLineToPoint: CGPointMake(-0.41, -12.07)];
        [rectangle10Path addLineToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle10Path closePath];
        rectangle10Path.lineCapStyle = kCGLineCapRound;
        
        rectangle10Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle10Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 11 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 22.6, 18.5);
        CGContextRotateCTM(context, -200 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle11Path = UIBezierPath.bezierPath;
        [rectangle11Path moveToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle11Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle11Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle11Path addLineToPoint: CGPointMake(0.57, -11.88)];
        [rectangle11Path addLineToPoint: CGPointMake(0.47, -12.08)];
        [rectangle11Path addLineToPoint: CGPointMake(0.27, -12.18)];
        [rectangle11Path addLineToPoint: CGPointMake(-0.22, -12.18)];
        [rectangle11Path addLineToPoint: CGPointMake(-0.41, -12.08)];
        [rectangle11Path addLineToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle11Path closePath];
        rectangle11Path.lineCapStyle = kCGLineCapRound;
        
        rectangle11Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle11Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 12 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 20.5, 19.7);
        CGContextRotateCTM(context, 140 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle12Path = UIBezierPath.bezierPath;
        [rectangle12Path moveToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle12Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle12Path addLineToPoint: CGPointMake(1.04, -10.25)];
        [rectangle12Path addLineToPoint: CGPointMake(0.57, -11.88)];
        [rectangle12Path addLineToPoint: CGPointMake(0.47, -12.08)];
        [rectangle12Path addLineToPoint: CGPointMake(0.27, -12.18)];
        [rectangle12Path addLineToPoint: CGPointMake(-0.22, -12.18)];
        [rectangle12Path addLineToPoint: CGPointMake(-0.42, -12.08)];
        [rectangle12Path addLineToPoint: CGPointMake(-0.51, -11.88)];
        [rectangle12Path closePath];
        rectangle12Path.lineCapStyle = kCGLineCapRound;
        
        rectangle12Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle12Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 13 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 18.94, 21.55);
        CGContextRotateCTM(context, 120 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle13Path = UIBezierPath.bezierPath;
        [rectangle13Path moveToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle13Path addLineToPoint: CGPointMake(-1.05, -10.25)];
        [rectangle13Path addLineToPoint: CGPointMake(1.04, -10.25)];
        [rectangle13Path addLineToPoint: CGPointMake(0.57, -11.87)];
        [rectangle13Path addLineToPoint: CGPointMake(0.47, -12.07)];
        [rectangle13Path addLineToPoint: CGPointMake(0.27, -12.17)];
        [rectangle13Path addLineToPoint: CGPointMake(-0.22, -12.17)];
        [rectangle13Path addLineToPoint: CGPointMake(-0.42, -12.07)];
        [rectangle13Path addLineToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle13Path closePath];
        rectangle13Path.lineCapStyle = kCGLineCapRound;
        
        rectangle13Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle13Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 14 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 18.11, 23.8);
        CGContextRotateCTM(context, 100 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle14Path = UIBezierPath.bezierPath;
        [rectangle14Path moveToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle14Path addLineToPoint: CGPointMake(-1.05, -10.25)];
        [rectangle14Path addLineToPoint: CGPointMake(1.04, -10.25)];
        [rectangle14Path addLineToPoint: CGPointMake(0.57, -11.87)];
        [rectangle14Path addLineToPoint: CGPointMake(0.47, -12.07)];
        [rectangle14Path addLineToPoint: CGPointMake(0.27, -12.16)];
        [rectangle14Path addLineToPoint: CGPointMake(-0.22, -12.16)];
        [rectangle14Path addLineToPoint: CGPointMake(-0.42, -12.07)];
        [rectangle14Path addLineToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle14Path closePath];
        rectangle14Path.lineCapStyle = kCGLineCapRound;
        
        rectangle14Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle14Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 15 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 18.12, 26.2);
        CGContextRotateCTM(context, 80 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle15Path = UIBezierPath.bezierPath;
        [rectangle15Path moveToPoint: CGPointMake(-0.51, -11.86)];
        [rectangle15Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle15Path addLineToPoint: CGPointMake(1.04, -10.25)];
        [rectangle15Path addLineToPoint: CGPointMake(0.57, -11.86)];
        [rectangle15Path addLineToPoint: CGPointMake(0.47, -12.06)];
        [rectangle15Path addLineToPoint: CGPointMake(0.27, -12.16)];
        [rectangle15Path addLineToPoint: CGPointMake(-0.22, -12.16)];
        [rectangle15Path addLineToPoint: CGPointMake(-0.42, -12.06)];
        [rectangle15Path addLineToPoint: CGPointMake(-0.51, -11.86)];
        [rectangle15Path closePath];
        rectangle15Path.lineCapStyle = kCGLineCapRound;
        
        rectangle15Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle15Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 16 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 18.95, 28.45);
        CGContextRotateCTM(context, 60 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle16Path = UIBezierPath.bezierPath;
        [rectangle16Path moveToPoint: CGPointMake(-0.51, -11.86)];
        [rectangle16Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle16Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle16Path addLineToPoint: CGPointMake(0.57, -11.86)];
        [rectangle16Path addLineToPoint: CGPointMake(0.47, -12.06)];
        [rectangle16Path addLineToPoint: CGPointMake(0.27, -12.16)];
        [rectangle16Path addLineToPoint: CGPointMake(-0.22, -12.16)];
        [rectangle16Path addLineToPoint: CGPointMake(-0.41, -12.06)];
        [rectangle16Path addLineToPoint: CGPointMake(-0.51, -11.86)];
        [rectangle16Path closePath];
        rectangle16Path.lineCapStyle = kCGLineCapRound;
        
        rectangle16Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle16Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 17 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 20.51, 30.29);
        CGContextRotateCTM(context, 40 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle17Path = UIBezierPath.bezierPath;
        [rectangle17Path moveToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle17Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle17Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle17Path addLineToPoint: CGPointMake(0.56, -11.87)];
        [rectangle17Path addLineToPoint: CGPointMake(0.47, -12.06)];
        [rectangle17Path addLineToPoint: CGPointMake(0.27, -12.16)];
        [rectangle17Path addLineToPoint: CGPointMake(-0.22, -12.16)];
        [rectangle17Path addLineToPoint: CGPointMake(-0.41, -12.06)];
        [rectangle17Path addLineToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle17Path closePath];
        rectangle17Path.lineCapStyle = kCGLineCapRound;
        
        rectangle17Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle17Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Rectangle 18 Drawing
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 22.61, 31.49);
        CGContextRotateCTM(context, 20 * M_PI / 180);
        CGContextScaleCTM(context, 1.8, 1.8);
        
        UIBezierPath* rectangle18Path = UIBezierPath.bezierPath;
        [rectangle18Path moveToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle18Path addLineToPoint: CGPointMake(-1.04, -10.25)];
        [rectangle18Path addLineToPoint: CGPointMake(1.03, -10.25)];
        [rectangle18Path addLineToPoint: CGPointMake(0.56, -11.87)];
        [rectangle18Path addLineToPoint: CGPointMake(0.47, -12.07)];
        [rectangle18Path addLineToPoint: CGPointMake(0.27, -12.17)];
        [rectangle18Path addLineToPoint: CGPointMake(-0.22, -12.17)];
        [rectangle18Path addLineToPoint: CGPointMake(-0.41, -12.07)];
        [rectangle18Path addLineToPoint: CGPointMake(-0.51, -11.87)];
        [rectangle18Path closePath];
        rectangle18Path.lineCapStyle = kCGLineCapRound;
        
        rectangle18Path.lineJoinStyle = kCGLineJoinRound;
        
        [color5 setFill];
        [rectangle18Path fill];
        
        CGContextRestoreGState(context);
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
        [bezier2Path moveToPoint: CGPointMake(21.59, 21.46)];
        [bezier2Path addCurveToPoint: CGPointMake(21.59, 28.53) controlPoint1: CGPointMake(19.63, 23.41) controlPoint2: CGPointMake(19.63, 26.58)];
        [bezier2Path addCurveToPoint: CGPointMake(28.69, 28.53) controlPoint1: CGPointMake(23.55, 30.48) controlPoint2: CGPointMake(26.73, 30.48)];
        [bezier2Path addCurveToPoint: CGPointMake(28.69, 21.46) controlPoint1: CGPointMake(30.65, 26.58) controlPoint2: CGPointMake(30.65, 23.41)];
        [bezier2Path addCurveToPoint: CGPointMake(21.59, 21.46) controlPoint1: CGPointMake(26.73, 19.51) controlPoint2: CGPointMake(23.55, 19.51)];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(34.01, 16.16)];
        [bezier2Path addCurveToPoint: CGPointMake(34.01, 33.83) controlPoint1: CGPointMake(38.91, 21.04) controlPoint2: CGPointMake(38.91, 28.95)];
        [bezier2Path addCurveToPoint: CGPointMake(16.27, 33.83) controlPoint1: CGPointMake(29.11, 38.71) controlPoint2: CGPointMake(21.17, 38.71)];
        [bezier2Path addCurveToPoint: CGPointMake(16.27, 16.16) controlPoint1: CGPointMake(11.37, 28.95) controlPoint2: CGPointMake(11.37, 21.04)];
        [bezier2Path addCurveToPoint: CGPointMake(34.01, 16.16) controlPoint1: CGPointMake(21.17, 11.28) controlPoint2: CGPointMake(29.11, 11.28)];
        [bezier2Path closePath];
        [color5 setFill];
        [bezier2Path fill];
        
        
        CGContextEndTransparencyLayer(context);
        CGContextRestoreGState(context);
    }
}

@end
