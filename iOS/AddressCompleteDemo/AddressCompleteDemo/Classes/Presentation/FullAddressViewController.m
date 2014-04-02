//
//  FullAddressViewController.m
//  AddressCompleteDemo
//
//  Created by Cosmin Stirbu on 27/03/14.
//  Copyright (c) 2014 Fortech. All rights reserved.
//

#import "FullAddressViewController.h"
#import "VendorAddress.h"
#import "AddressCompleteManager.h"
#import "WSError.h"

@interface FullAddressViewController ()

/// Address Line 1
@property (weak, nonatomic) IBOutlet UILabel *addressLine1;

/// Address Line 2
@property (weak, nonatomic) IBOutlet UILabel *addressLine2;

/// City
@property (weak, nonatomic) IBOutlet UILabel *city;

/// Region
@property (weak, nonatomic) IBOutlet UILabel *region;

/// Postal Code
@property (weak, nonatomic) IBOutlet UILabel *postalCode;


@end

@implementation FullAddressViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Request the full address for the current suggestion
    [[AddressCompleteManager sharedInstance] requestFullAddressForSuggestion:self.suggetion target:self successSelector:@selector(fullAddressSuccess:) errorSelector:@selector(fullAddressError:)];
}

#pragma mark - Address Full Callbacks

- (void)fullAddressSuccess:(VendorAddress *)address {
    self.addressLine1.text = address.line1;
    self.addressLine2.text = address.line2;
    self.city.text = address.city;
    self.region.text = address.provinceName;
    self.postalCode.text = address.postalCode;
}

- (void)fullAddressError:(WSError *)error {
    // Display Error
}

@end
