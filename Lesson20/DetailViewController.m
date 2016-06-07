//
//  DetailViewController.m
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "DetailViewController.h"
#import <UIImageView+WebCache.h>
#import "MBProgressHUD.h"
#import "NetManager.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UINavigationItem *filmNameNavigationItem;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *PGratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
@property (weak, nonatomic) IBOutlet UILabel *sloganLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [[NetManager sharedInstance] loadRequestWithPath:[NSString stringWithFormat:@"%@%@", @"http://api.kinopoisk.cf/getFilm?filmID=", self.film.ID] completion:^(id data, NSError *error) {
            if (data) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.film = [MTLJSONAdapter modelOfClass:[Film class] fromJSONDictionary:data error:nil];
                    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://st.kp.yandex.net/images/%@", self.film.imageURL]];
                    [self.posterImageView sd_setImageWithURL:url];
                    self.filmNameNavigationItem.title = self.film.name;
                    self.ratingLabel.text = self.film.rating;
                    self.PGratingLabel.text = self.film.ratingMPAA;
                    self.countryLabel.text = self.film.country;
                    self.sloganLabel.text = self.film.slogan;
                    self.genreLabel.text = self.film.genre;
                    self.descriptionTextView.text = self.film.filmDescription;
                    [hud hide:YES];
                });
            }
        }];
    });
}

- (IBAction)doneButtonDidClick:(id)sender {
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
