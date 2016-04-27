//
//  NetManager.h
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetManager : NSObject

+ (instancetype)sharedInstance;
- (void)loadRequestWithPath:(NSString *)path completion:(void (^)(id data, NSError *error))completion;

@end
