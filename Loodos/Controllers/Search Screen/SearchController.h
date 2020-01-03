//
//  SearchController.h
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 2.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchController : UIViewController  <UISearchControllerDelegate,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic,strong) UISearchController *searchControl;
@property (nonatomic,strong) NSMutableArray *words;
@property BOOL keyboardOn;
@property CGFloat keyboardHeight;
@property int contentHeight;


@end

NS_ASSUME_NONNULL_END
