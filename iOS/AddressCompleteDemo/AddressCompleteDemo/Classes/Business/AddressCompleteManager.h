//
//  AddressCompleteManager.h
//  Circular
//
//  Created by Cosmin Stirbu on 2/27/14.
//  Copyright (c) 2014 MyWebGrocer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VendorAddressSuggestion.h"

extern NSString * const kAddressNextRetrieve;
extern NSString * const kAddressNextFind;

@interface AddressCompleteManager : NSObject

// Singleton Instance
+ (instancetype)sharedInstance;

/// Fetches the suggestions for a passed searchTerm and countryCode. If multiple request are made, it returns the result only for the last searchTerm used.
- (void)requestAddressSuggestionsForSearchTerm:(NSString *)searchTerm lastId:(NSString *)lastId countryCode:(NSString *)countryCode target:(id)target successSelector:(SEL)successSelector errorSelector:(SEL)errorSelector;

/// For a retrievable suggestion it requests the full address.
- (void)requestFullAddressForSuggestion:(VendorAddressSuggestion *)suggestion target:(id)target successSelector:(SEL)successSelector errorSelector:(SEL)errorSelector;

@end
