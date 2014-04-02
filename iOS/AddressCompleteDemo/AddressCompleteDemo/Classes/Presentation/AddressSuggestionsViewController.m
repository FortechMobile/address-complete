//
//  AddressSuggestionsViewController.m
//  AddressCompleteDemo
//
//  Created by Cosmin Stirbu on 27/03/14.
//  Copyright (c) 2014 Fortech. All rights reserved.
//

#import "AddressSuggestionsViewController.h"
#import "AddressCompleteManager.h"
#import "WSError.h"
#import "VendorAddress.h"
#import "VendorAddressSuggestion.h"
#import "FullAddressViewController.h"

/// "Hardcoded" Country Code
static NSString * const kCountryCode = @"CA";

@interface AddressSuggestionsViewController ()

/// Suggestions
@property (strong, nonatomic) NSArray *suggestions;

/// SearchBar
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

/// TableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/// Selected Suggestion
@property (weak, nonatomic) VendorAddressSuggestion *selectedSuggestion;

@end

@implementation AddressSuggestionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Private Methods

- (void)lookUpSuggestions {
    [[AddressCompleteManager sharedInstance] requestAddressSuggestionsForSearchTerm:self.searchBar.text lastId:@"" countryCode:kCountryCode target:self successSelector:@selector(suggestionsSuccess:) errorSelector:@selector(suggestionsError:)];
}

#pragma mark - UISearch Bar Delegate Methods

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//    [NSObject cancelPreviousPerformRequestsWithTarget:self];
//    [self performSelector:@selector(lookUpSuggestions) withObject:nil afterDelay:0.3];
    
    [self lookUpSuggestions];
}

#pragma mark - UITableView Data Source & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.suggestions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuggestionIdentifier"];
    cell.textLabel.text = ((VendorAddressSuggestion *)self.suggestions[indexPath.row]).autocompleteDisplayString;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    VendorAddressSuggestion *suggestion = self.suggestions[indexPath.row];
    
    if ([suggestion isRetrievable]) {
        // Navigate
        self.selectedSuggestion = suggestion;
        [self performSegueWithIdentifier:@"SuggestionFullAddressSegue" sender:nil];
    } else if ([suggestion hasNext]) {
        // Get more suggestions based on the pressed suggestion
        [[AddressCompleteManager sharedInstance] requestAddressSuggestionsForSearchTerm:self.searchBar.text lastId:suggestion.vendorAddressSuggestionId countryCode:kCountryCode target:self successSelector:@selector(suggestionsSuccess:) errorSelector:@selector(suggestionsError:)];
    }
    
    self.searchBar.text = suggestion.autocompleteString;
    
}

#pragma mark - Suggestions Callback

- (void)suggestionsSuccess:(NSArray *)suggestions {
    self.suggestions = suggestions;
    [self.tableView reloadData];
}

- (void)suggestionsError:(WSError *)error {
    // Display Error
    self.suggestions = nil;
    [self.tableView reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FullAddressViewController *fullAddressViewController = (FullAddressViewController *)segue.destinationViewController;
    fullAddressViewController.suggetion = self.selectedSuggestion;
}


@end
