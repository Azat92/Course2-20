//
//  Film.m
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "Film.h"

@implementation Film

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"name" : @"nameRU",
              @"imageURL" : @"posterURL",
              @"premiereDate" : @"premiereRU" ,
              @"rating" : @"rating",
              @"length" : @"cinemaHallCount",
              @"fid" : @"id",
              @"country" : @"country",
              @"year":@"year"};
}

+ (NSValueTransformer *)premiereDateJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd.MM.yyyy";
        NSDate *date = [dateFormatter dateFromString:dateString];
        dateFormatter.dateStyle = NSDateFormatterLongStyle;
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru"];
        return [dateFormatter stringFromDate:date];
    } reverseBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return value;
    }];
}

@end
