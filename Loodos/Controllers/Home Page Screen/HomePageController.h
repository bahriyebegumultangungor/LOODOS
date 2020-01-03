//
//  HomePageController.h
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 1.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageController : ViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableData *downloadData;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;





@end

NS_ASSUME_NONNULL_END
