//
//  WSError.h
//  Circular
//
//  Created by Mircea Benta on 8/10/09.
//  Copyright 2009 MyWebGrocer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

@interface WSError : NSObject

@property (nonatomic, assign) int errorCode;
@property (nonatomic, copy) NSString* errorDescription;


- (id) initWithCode:(int)aCode andDescription:(NSString *)aDescription;

- (id)initWithOperation:(AFHTTPRequestOperation *)operation message:(NSString *)message;

@end
