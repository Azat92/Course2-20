//
//  DetailViewController.h
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//
#import "Film.h"
#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (nonatomic, strong) Film *model;
@end
