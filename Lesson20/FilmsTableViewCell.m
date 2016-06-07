//
//  FilmsTableViewCell.m
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "FilmsTableViewCell.h"
#import "Film.h"
#import <UIImageView+WebCache.h>

@interface FilmsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *premiereLabel;
@property (weak, nonatomic) IBOutlet UILabel *lengthLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end

@implementation FilmsTableViewCell

- (void)setModel:(Film *)model {
    _model = model;
    self.nameLabel.text = model.name;
    self.premiereLabel.text = model.premiereDate;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://st.kp.yandex.net/images/%@", model.imageURL]];
    [self.posterImage sd_setImageWithURL:url];
    self.ratingLabel.text = model.rating;
    self.lengthLabel.text = model.filmLength;
}

@end
