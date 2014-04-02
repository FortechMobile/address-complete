//
//  AddressCompleteManager.m
//  Circular
//
//  Created by Cosmin Stirbu on 2/27/14.
//  Copyright (c) 2014 MyWebGrocer. All rights reserved.
//

#import "AddressCompleteManager.h"
#import "WSAddressComplete.h"

@interface AddressCompleteManager()

/// Last search term
@property (nonatomic, strong) NSString *lastSearchTerm;

@end

@implementation AddressCompleteManager

static AddressCompleteManager *instanceManager = nil;

+ (instancetype)sharedInstance {
	@synchronized(self){
		if(instanceManager == nil) {
			return [[self alloc] init];
		}
	}
	return instanceManager;
}

- (void)requestAddressSuggestionsForSearchTerm:(NSString *)searchTerm lastId:(NSString *)lastId countryCode:(NSString *)countryCode target:(id)target successSelector:(SEL)successSelector errorSelector:(SEL)errorSelector {
    
    self.lastSearchTerm = [searchTerm copy];
    
    [[WSAddressComplete sharedInstance] requestAddressSuggestionsForSearchTerm:searchTerm lastId:(NSString *)lastId  countryCode:countryCode completionBlock:^(NSArray *suggestions, WSError *error) {
        if ([self.lastSearchTerm isEqualToString:searchTerm]) {
            if (suggestions != nil) {
                [target performSelector:successSelector withObject:suggestions];
            } else {
                [target performSelector:errorSelector withObject:error];
            }
        }
    }];
}

- (void)requestFullAddressForSuggestion:(VendorAddressSuggestion *)suggestion target:(id)target successSelector:(SEL)successSelector errorSelector:(SEL)errorSelector {
    
    [[WSAddressComplete sharedInstance] requestFullAddressForSuggestion:suggestion completionBlock:^(VendorAddress *address, WSError *error) {
        if (address != nil) {
            [target performSelector:successSelector withObject:address];
        } else {
            [target performSelector:errorSelector withObject:error];
        }
    }];
}

@end
