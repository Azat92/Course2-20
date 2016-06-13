//
//  HintForTableView.m
//  Lesson20
//
//  Created by Эдуард Рязапов on 13.06.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "HintForTableView.h"

@implementation HintForTableView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0 alpha:0.6].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
    UINavigationController *root = (id)[UIApplication sharedApplication].keyWindow.rootViewController;
    UITableViewController *rootTableVC = (id)root.viewControllers.firstObject;
    CGRect frame = [rootTableVC.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    CGRect destFrame = [rootTableVC.tableView convertRect:frame toView:self];
    CGContextClearRect(context, destFrame);
    CGContextDrawPath(context, kCGPathFill);
}

@end
