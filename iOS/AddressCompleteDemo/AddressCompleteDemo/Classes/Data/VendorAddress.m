//
//  VendorAddress.m
//  
//
//  Created by Cosmin on 2/27/14.
//  Copyright (c) 2014. All rights reserved.
//

#import "VendorAddress.h"

@implementation VendorAddress

+ (VendorAddress *)instanceFromDictionary:(NSDictionary *)aDictionary {

    VendorAddress *instance = [[VendorAddress alloc] init];
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

    if ([key isEqualToString:@"AdminAreaCode"]) {
        [self setValue:value forKey:@"adminAreaCode"];
    } else if ([key isEqualToString:@"AdminAreaName"]) {
        [self setValue:value forKey:@"adminAreaName"];
    } else if ([key isEqualToString:@"Barcode"]) {
        [self setValue:value forKey:@"barcode"];
    } else if ([key isEqualToString:@"Block"]) {
        [self setValue:value forKey:@"block"];
    } else if ([key isEqualToString:@"BuildingName"]) {
        [self setValue:value forKey:@"buildingName"];
    } else if ([key isEqualToString:@"BuildingNumber"]) {
        [self setValue:value forKey:@"buildingNumber"];
    } else if ([key isEqualToString:@"City"]) {
        [self setValue:value forKey:@"city"];
    } else if ([key isEqualToString:@"Company"]) {
        [self setValue:value forKey:@"company"];
    } else if ([key isEqualToString:@"CountryIso2"]) {
        [self setValue:value forKey:@"countryIso2"];
    } else if ([key isEqualToString:@"CountryIso3"]) {
        [self setValue:value forKey:@"countryIso3"];
    } else if ([key isEqualToString:@"CountryIsoNumber"]) {
        [self setValue:value forKey:@"countryIsoNumber"];
    } else if ([key isEqualToString:@"CountryName"]) {
        [self setValue:value forKey:@"countryName"];
    } else if ([key isEqualToString:@"DataLevel"]) {
        [self setValue:value forKey:@"dataLevel"];
    } else if ([key isEqualToString:@"Department"]) {
        [self setValue:value forKey:@"department"];
    } else if ([key isEqualToString:@"District"]) {
        [self setValue:value forKey:@"district"];
    } else if ([key isEqualToString:@"DomesticId"]) {
        [self setValue:value forKey:@"domesticId"];
    } else if ([key isEqualToString:@"Id"]) {
        [self setValue:value forKey:@"vendorAddressId"];
    } else if ([key isEqualToString:@"Label"]) {
        [self setValue:value forKey:@"label"];
    } else if ([key isEqualToString:@"Language"]) {
        [self setValue:value forKey:@"language"];
    } else if ([key isEqualToString:@"LanguageAlternatives"]) {
        [self setValue:value forKey:@"languageAlternatives"];
    } else if ([key isEqualToString:@"Line1"]) {
        [self setValue:value forKey:@"line1"];
    } else if ([key isEqualToString:@"Line2"]) {
        [self setValue:value forKey:@"line2"];
    } else if ([key isEqualToString:@"Line3"]) {
        [self setValue:value forKey:@"line3"];
    } else if ([key isEqualToString:@"Line4"]) {
        [self setValue:value forKey:@"line4"];
    } else if ([key isEqualToString:@"Line5"]) {
        [self setValue:value forKey:@"line5"];
    } else if ([key isEqualToString:@"Neighbourhood"]) {
        [self setValue:value forKey:@"neighbourhood"];
    } else if ([key isEqualToString:@"PostalCode"]) {
        [self setValue:value forKey:@"postalCode"];
    } else if ([key isEqualToString:@"Province"]) {
        [self setValue:value forKey:@"province"];
    } else if ([key isEqualToString:@"ProvinceCode"]) {
        [self setValue:value forKey:@"provinceCode"];
    } else if ([key isEqualToString:@"ProvinceName"]) {
        [self setValue:value forKey:@"provinceName"];
    } else if ([key isEqualToString:@"SecondaryStreet"]) {
        [self setValue:value forKey:@"secondaryStreet"];
    } else if ([key isEqualToString:@"SortingNumber1"]) {
        [self setValue:value forKey:@"sortingNumber1"];
    } else if ([key isEqualToString:@"SortingNumber2"]) {
        [self setValue:value forKey:@"sortingNumber2"];
    } else if ([key isEqualToString:@"Street"]) {
        [self setValue:value forKey:@"street"];
    } else if ([key isEqualToString:@"SubBuilding"]) {
        [self setValue:value forKey:@"subBuilding"];
    } else if ([key isEqualToString:@"Type"]) {
        [self setValue:value forKey:@"type"];
    }
}


@end
