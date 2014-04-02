//
//  VendorAddressSuggestion.h
//  
//
//  Created by Cosmin on 2/27/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kAddressNextRetrieve;
extern NSString * const kAddressNextFind;

@interface VendorAddressSuggestion : NSObject

@property (nonatomic, copy) NSString *cursor;
@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *highlight;
@property (nonatomic, copy) NSString *next;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *vendorAddressSuggestionId;


/// JSON Constructors
+ (VendorAddressSuggestion *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

/// Auto Complete String
- (NSString *)autocompleteString;

// Auto Complete Display String
- (NSString *)autocompleteDisplayString;

/// Checks if it is retrievable
- (BOOL)isRetrievable;

/// If next equals find
- (BOOL)hasNext;

@end
