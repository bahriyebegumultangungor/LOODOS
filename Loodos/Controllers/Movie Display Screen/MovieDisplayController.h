//
//  MovieDisplayController.h
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 2.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieDisplayController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSString *searchKey;
@property (nonatomic,strong) NSMutableArray *movie;
@property (nonatomic, strong) NSMutableData *downloadData;
@property (weak, nonatomic) IBOutlet UIView *noDataView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;


@end

NS_ASSUME_NONNULL_END
