//
//  MovieDetailsController.m
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 2.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import "MovieDetailsController.h"
#import "MovieDetailsCell.h"

@interface MovieDetailsController ()

@end

@implementation MovieDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loading.hidden = NO;

    [self prepareCollectionView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self Navbar];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    self.loading.hidden = YES;

    MovieDetailsCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"MovieDetailsCell" forIndexPath:indexPath];
    
    if([self.movieInfo.poster isEqualToString:@"N/A"]){
        cell.moviePoster.image = [UIImage imageNamed:@"noImage"];
    }
    else{
        NSURL *url = [NSURL URLWithString:self.movieInfo.poster];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        cell.moviePoster.image = img;
    }
    
    if([self.movieInfo.title isEqualToString:@"N/A"]){
        cell.movieNameLabel.text = @"-";
    }else{
        cell.movieNameLabel.text = self.movieInfo.title;
    }
    
    if([self.movieInfo.imdbRating isEqualToString:@"N/A"]){
        cell.imdbLabel.text = @"-";
    }else{
        cell.imdbLabel.text = self.movieInfo.imdbRating;
    }
    
    if([self.movieInfo.genre isEqualToString:@"N/A"]){
        cell.genreLabel.text = @"-";
    }else{
        cell.genreLabel.text = self.movieInfo.genre;
    }
    
    if([self.movieInfo.year isEqualToString:@"N/A"]){
        cell.yearLabel.text = @"-";
    }else{
        cell.yearLabel.text = self.movieInfo.year;
    }
    
    if([self.movieInfo.director isEqualToString:@"N/A"]){
        cell.directorLabel.text = @"-";
    }else{
        cell.directorLabel.text = self.movieInfo.director;
    }
    
    if([self.movieInfo.actors isEqualToString:@"N/A"]){
        cell.actorsLabel.text = @"-";
    }else{
        cell.actorsLabel.text = self.movieInfo.actors;
    }
    
    if([self.movieInfo.plot isEqualToString:@"N/A"]){
        cell.plotLabel.text = @"-";
    }else{
        cell.plotLabel.text = self.movieInfo.plot;
    }
    
    if([self.movieInfo.runtime isEqualToString:@"N/A"]){
        cell.runtimeLabel.text = @"-";
    }else{
        cell.runtimeLabel.text = self.movieInfo.runtime;
    }
    
    if([self.movieInfo.country isEqualToString:@"N/A"]){
        cell.countryLabel.text = @"-";
    }else{
        cell.countryLabel.text = self.movieInfo.country;
    }
    
    if([self.movieInfo.language isEqualToString:@"N/A"]){
        cell.languageLabel.text = @"-";
    }else{
        cell.languageLabel.text = self.movieInfo.language;
    }
    
    if([self.movieInfo.awards isEqualToString:@"N/A"]){
        cell.awardsLabel.text = @"-";
    }else{
        cell.awardsLabel.text = self.movieInfo.awards;
    }
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.width, 1000);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

-(void)prepareCollectionView{
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieDetailsCell" bundle:nil] forCellWithReuseIdentifier:@"MovieDetailsCell"];

    self.collectionView.delegate = self;
    [self.collectionView reloadData];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setMinimumInteritemSpacing:0.0f];
    [layout setMinimumLineSpacing:0.0f];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:layout];
}

-(void)Navbar{
    self.navigationItem.title = @"LOODOS";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    backButton.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.topItem.backBarButtonItem = backButton;
}







@end
