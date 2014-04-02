//
//  VendorAddressSuggestion.m
//  
//
//  Created by Cosmin on 2/27/14.
//  Copyright (c) 2014. All rights reserved.
//

#import "VendorAddressSuggestion.h"

NSString * const kAddressNextRetrieve = @"Retrieve";
NSString * const kAddressNextFind = @"Find";

@implementation VendorAddressSuggestion

+ (VendorAddressSuggestion *)instanceFromDictionary:(NSDictionary *)aDictionary {

    VendorAddressSuggestion *instance = [[VendorAddressSuggestion alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:@"Cursor"]) {
        [self setValue:value forKey:@"cursor"];
    } else if ([key isEqualToString:@"Description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"Highlight"]) {
        [self setValue:value forKey:@"highlight"];
    } else if ([key isEqualToString:@"Next"]) {
        [self setValue:value forKey:@"next"];
    } else if ([key isEqualToString:@"Text"]) {
        [self setValue:value forKey:@"text"];
    } else if ([key isEqualToString:@"Id"]) {
        [self setValue:value forKey:@"vendorAddressSuggestionId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}

- (NSString *)autocompleteString {
    return self.text;
}

- (NSString *)autocompleteDisplayString {
    if ([self.descriptionText isEqualToString:@""]) {
        return self.text;
    } else {
        return [NSString stringWithFormat:@"%@ (%@)", self.text, self.descriptionText];
    }
}

- (BOOL)isRetrievable {
    return [self.next caseInsensitiveCompare:kAddressNextRetrieve] == NSOrderedSame;
}

- (BOOL)hasNext {
    return [self.next caseInsensitiveCompare:kAddressNextFind] == NSOrderedSame;
}


@end
