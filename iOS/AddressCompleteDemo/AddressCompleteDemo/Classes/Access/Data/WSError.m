//
//  WSError.m
//  Circular
//
//  Created by Mircea Benta on 8/10/09.
//  Copyright 2009 MyWebGrocer. All rights reserved.
//

#import "WSError.h"


@implementation WSError

@synthesize errorCode;
@synthesize errorDescription;

- (id) initWithCode:(int)aCode andDescription:(NSString *)aDescription{
	self = [super init];
	if (self != nil) {
		errorCode = aCode;
		errorDescription = [aDescription copy];
	}
	return self;
}

- (id)initWithOperation:(AFHTTPRequestOperation *)operation message:(NSString *)message
{
    self = [super init];
    if (self) {
        // Check if Internet connection error
        if (operation.response == nil) {
            errorDescription = operation.error.localizedDescription;
            errorCode = - 1;
        } else {
            errorCode = operation.response.statusCode;
            
            // Try to parse operation.responseData - maybe the WebService Replied with an Error
            NSString *wsMessage = [self parseWSMessage:operation.responseData];
            
            if (wsMessage == nil) {
                // If no response was provided from the Web Service
                if (message == nil) {
                    // Default error message
                    message = NSLocalizedString(@"message.genericConnectionError", nil);
                }
                errorDescription = message;
            } else {
                errorDescription = wsMessage;
            }
        }
    }
    return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%d - %@", errorCode, errorDescription];
}

// This method should be implemented by you
- (NSString *)parseWSMessage:(NSData *)content {
    return nil;
}

@end
