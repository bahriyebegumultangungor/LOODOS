//
//  SearchController.m
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 2.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import "SearchController.h"
#import "MovieDisplayController.h"

@interface SearchController ()

@end

@implementation SearchController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self prepareUI];
    [self prepairNavBar];
    self.searchBar.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_searchBar becomeFirstResponder];
        [self getSearch];
        
    });
    [self prepairNavBar];
}

-(void)didPresentSearchController:(UISearchController *)searchController{
    [self.searchBar becomeFirstResponder];
    [self.view setNeedsLayout];
    [self.view updateConstraintsIfNeeded];
}

-(void)getSearch {
    self.words = [self.searchBar.text mutableCopy];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self getSearch];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    MovieDisplayController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"movieDisplayController"];
    controller.searchKey = searchBar.text;
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
}


-(void)keyboardWillHide:(NSNotification *)n{
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    self.keyboardOn = NO;
}

-(void)keyboardWillShow:(NSNotification *)n{
    if (self.keyboardOn) {
        return;
    }
    
    NSDictionary* userInfo = [n userInfo];
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    self.keyboardOn = YES;
}

-(void)prepareUI{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
}

-(void)prepairNavBar{
    self.navigationItem.title = @"LOODOS";
    UIBarButtonItem *bButton = [[UIBarButtonItem alloc]
                                initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    bButton.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.topItem.backBarButtonItem = bButton;
}







@end
