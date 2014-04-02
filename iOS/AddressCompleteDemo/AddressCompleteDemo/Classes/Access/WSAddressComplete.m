//
//  WSAddressComplete.m
//  AddressCompleteDemo
//
//  Created by Cosmin Stirbu on 27/03/14.
//  Copyright (c) 2014 Fortech. All rights reserved.
//

#import "WSAddressComplete.h"
#import "AFNetworking.h"


#define ERROR_TAG @"Error"

static NSString * const kSearchFor = @"Everything";
static NSString * const kLanguagePreference = @"EN";


static NSString * const kAPIToken = @"USE_YOUR_OWN_TOKEN";
static NSString * const kSuggestionsURL = @"https://ws1.postescanada-canadapost.ca/AddressComplete/Interactive/Find/v2.00/json.ws";
static NSString * const kFullAddressURL = @"https://ws1.postescanada-canadapost.ca/AddressComplete/Interactive/Retrieve/v2.00/json.ws";

@implementation WSAddressComplete

+ (instancetype)sharedInstance {
    static WSAddressComplete *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)requestAddressSuggestionsForSearchTerm:(NSString *)searchTerm lastId:(NSString *)lastId  countryCode:(NSString *)countryCode completionBlock:(void(^)(NSArray *suggestions, WSError *error))completionBlock {
    
    // AFNetworking Manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // Request Parameters
    NSDictionary *parameters = @{ @"key" : kAPIToken, @"SearchTerm" : searchTerm, @"Country" : countryCode, @"SearchFor" : kSearchFor, @"LanguagePreference" : kLanguagePreference, @"LastId" : lastId };
    
    [manager GET: kSuggestionsURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *addressSuggestions = (NSArray *)responseObject;
        if ([addressSuggestions count] > 0) {
            NSMutableArray *suggestions = [NSMutableArray new];
            for (NSDictionary *suggestion in addressSuggestions) {
                if (suggestion[ERROR_TAG] == nil) {
                    VendorAddressSuggestion *addressSuggestion = [VendorAddressSuggestion instanceFromDictionary:suggestion];
                    [suggestions addObject:addressSuggestion];
                }
            }
            completionBlock(suggestions, nil);
        } else {
            completionBlock(nil, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(nil, [[WSError alloc] initWithOperation:operation message:nil]);
    }];
}

- (void)requestFullAddressForSuggestion:(VendorAddressSuggestion *)suggestion completionBlock:(void (^)(VendorAddress *, WSError *))completionBlock {
    
    // AFNetworking Manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // Request Parameters
    NSDictionary *parameters = @{ @"key" : kAPIToken, @"id" : suggestion.vendorAddressSuggestionId, @"LanguagePreference" : kLanguagePreference };
    
    [manager GET:kFullAddressURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSArray class]]) {
            completionBlock([VendorAddress instanceFromDictionary:[responseObject firstObject]], nil);
        } else {
            completionBlock(nil, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock(nil, [[WSError alloc] initWithOperation:operation message:nil]);
    }];
}

@end
