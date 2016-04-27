//
//  Film.h
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Film : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *premiereDate;
@end
