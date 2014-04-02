//
//  VendorAddress.h
//  
//
//  Created by Cosmin on 2/27/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VendorAddress : NSObject

@property (nonatomic, copy) NSString *adminAreaCode;
@property (nonatomic, copy) NSString *adminAreaName;
@property (nonatomic, copy) NSString *barcode;
@property (nonatomic, copy) NSString *block;
@property (nonatomic, copy) NSString *buildingName;
@property (nonatomic, copy) NSString *buildingNumber;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *countryIso2;
@property (nonatomic, copy) NSString *countryIso3;
@property (nonatomic, copy) NSString *countryIsoNumber;
@property (nonatomic, copy) NSString *countryName;
@property (nonatomic, copy) NSString *dataLevel;
@property (nonatomic, copy) NSString *department;
@property (nonatomic, copy) NSString *district;
@property (nonatomic, copy) NSString *domesticId;
@property (nonatomic, copy) NSString *vendorAddressId;
@property (nonatomic, copy) NSString *label;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *languageAlternatives;
@property (nonatomic, copy) NSString *line1;
@property (nonatomic, copy) NSString *line2;
@property (nonatomic, copy) NSString *line3;
@property (nonatomic, copy) NSString *line4;
@property (nonatomic, copy) NSString *line5;
@property (nonatomic, copy) NSString *neighbourhood;
@property (nonatomic, copy) NSString *postalCode;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *provinceCode;
@property (nonatomic, copy) NSString *provinceName;
@property (nonatomic, copy) NSString *secondaryStreet;
@property (nonatomic, copy) NSString *sortingNumber1;
@property (nonatomic, copy) NSString *sortingNumber2;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *subBuilding;
@property (nonatomic, copy) NSString *type;

// JSON Constructors
+ (VendorAddress *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
