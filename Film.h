//
//  Film.h
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Film : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *premiereDate;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *ratingMPAA;
@property (nonatomic, strong) NSString *filmLength;
@property (nonatomic, strong) NSString *filmDescription;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *slogan;

@end
