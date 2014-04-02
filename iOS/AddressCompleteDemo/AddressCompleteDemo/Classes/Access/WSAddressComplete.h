//
//  WSAddressComplete.h
//  AddressCompleteDemo
//
//  Created by Cosmin Stirbu on 27/03/14.
//  Copyright (c) 2014 Fortech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VendorAddressSuggestion.h"
#import "VendorAddress.h"
#import "WSError.h"

@interface WSAddressComplete : NSObject

// Singleton Instance
+ (instancetype)sharedInstance;

/// Fetches the suggestions for a passed searchTerm and countryCode.
- (void)requestAddressSuggestionsForSearchTerm:(NSString *)searchTerm lastId:(NSString *)lastId  countryCode:(NSString *)countryCode completionBlock:(void(^)(NSArray *suggestions, WSError *error))completionBlock;

/// Fetches the full address for a retriveable suggestion
- (void)requestFullAddressForSuggestion:(VendorAddressSuggestion *)suggestion completionBlock:(void(^)(VendorAddress *address, WSError *error))completionBlock;

@end
