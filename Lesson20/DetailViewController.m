//
//  DetailViewController.m
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "DetailViewController.h"
#import <UIImageView+WebCache.h>
@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLAbel;
@property (weak, nonatomic) IBOutlet UILabel *ratLabel;
@property (weak, nonatomic) IBOutlet UILabel *lengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dageLength;
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UILabel *year;



@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLAbel.text = self.model.name;
    self.dageLength.text = self.model.premiereDate;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://st.kp.yandex.net/images/film_big/%@.jpg", self.model.fid]];
    [self.posterImage sd_setImageWithURL:url];
    self.lengthLabel.text = self.model.length;
    self.ratLabel.text = self.model.rating;
    self.country.text = self.model.country;
    self.year.text = self.model.year;
   
}

- (IBAction)doneButtonDidClick:(id)sender {
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
