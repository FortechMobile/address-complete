//
//  FullAddressViewController.h
//  AddressCompleteDemo
//
//  Created by Cosmin Stirbu on 27/03/14.
//  Copyright (c) 2014 Fortech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VendorAddressSuggestion.h"

@interface FullAddressViewController : UITableViewController

/// Suggestion
@property (strong, nonatomic) VendorAddressSuggestion *suggetion;

@end
