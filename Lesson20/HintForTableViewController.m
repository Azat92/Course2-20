//
//  HintForTableViewController.m
//  Lesson20
//
//  Created by Эдуард Рязапов on 13.06.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "HintForTableViewController.h"

@implementation HintForTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self.view setNeedsDisplay];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UINavigationController *root = (id)[UIApplication sharedApplication].keyWindow.rootViewController;
    UITableViewController *rootTableVC = (id)root.viewControllers.firstObject;
    CGRect frame = [rootTableVC.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (point.x >= frame.origin.x && point.x <= frame.size.width &&
        point.y >= (frame.origin.y + root.navigationBar.frame.size.height) && point.y <= (frame.origin.y + frame.size.height + root.navigationBar.frame.size.height)) {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
