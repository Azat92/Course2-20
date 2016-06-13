//
//  HintViewController.m
//  Lesson20
//
//  Created by Эдуард Рязапов on 13.06.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "HintViewController.h"

@interface HintViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *posterImage;

@end

@implementation HintViewController

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
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
