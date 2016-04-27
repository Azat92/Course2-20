//
//  NetManager.m
//  Lesson20
//
//  Created by Azat Almeev on 27.04.16.
//  Copyright © 2016 Azat Almeev. All rights reserved.
//

#import "NetManager.h"

@interface NetManager ()
@property (nonatomic, readonly) NSURLSession *session;
@end

@implementation NetManager
@synthesize session = _session;

- (id)init
{
    @throw [NSException exceptionWithName:@"You could not create an instance of this class" reason:@"This class is designed under the singleton pattern" userInfo:nil];
}

- (instancetype)initSingleton
{
    self = [super init];
    if (!self)
        return nil;
    return self;
}

+ (instancetype)sharedInstance
{
    static id _singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[self alloc] initSingleton];
    });
    return _singleton;
}


- (NSURLSession *)session {
    if (!_session)
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    return _session;
}

- (void)loadRequestWithPath:(NSString *)path completion:(void (^)(id data, NSError *error))completion {
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    //...
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, error);
            });
        else {
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(json, nil);
            });
        }
    }] resume];
}

@end
