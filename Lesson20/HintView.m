//
//  HintView.m
//  Lesson20
//
//  Created by Эдуард Рязапов on 13.06.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "HintView.h"
#import "HintViewController.h"

@interface HintViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImage;

@end

@implementation HintView

- (void)drawRect:(CGRect)rect {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    HintViewController *dtv = (HintViewController *)[mainStoryboard instantiateViewControllerWithIdentifier: @"hintView"];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0 alpha:0.6].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGRect destFrame = [dtv.view convertRect:dtv.posterImage.frame toView:nil];
    CGRect frame = CGRectMake(destFrame.origin.x - 4, destFrame.origin.y, destFrame.size.width, destFrame.size.height);
    CGContextClearRect(context, frame);
    CGContextDrawPath(context, kCGPathFill);
}
@end
