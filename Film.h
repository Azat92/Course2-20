//
//  Film.h
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Film : MTLModel <MTLJSONSerializing>
@property (nonnull, strong) NSString *name;
@property (nonnull, strong) NSString *imageURL;
@property (nonnull, strong) NSString *premiereDate;
@property (nonnull, strong) NSString *rating;
@property (nonnull, strong) NSString *length;
@property (nonnull, strong) NSString *fid;
@property (nonnull, strong) NSString *country;
@property (nonnull, strong) NSString *year;
@end
