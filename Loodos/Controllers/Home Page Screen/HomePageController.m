//
//  HomePageController.m
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 1.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import "HomePageController.h"
#import "MovieDetailsController.h"
#import "Movie.h"
#import "MovieCell.h"

@interface HomePageController ()

@end

@implementation HomePageController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.loading.hidden = NO;

    [self prepareCollectionView];
    NSString *url = @"http://www.omdbapi.com/?apikey=971e89a9&t=joker";
    [self getData:url];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)getData:(NSString *)address{
    NSURL *url = [NSURL URLWithString:address];
    NSURLRequest *req = [[NSURLRequest alloc]initWithURL:url];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:req delegate:self];
}

# pragma urlconnection delegate
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:self.downloadData options:0 error:nil];
    NSLog(@"Finished loading.");
    self.loading.hidden =YES;

    self.data = [[NSMutableArray alloc] init];
    Movie *movie = [[Movie alloc] init];
    movie.title = [dic valueForKey:@"Title"];
    movie.year = [dic valueForKey:@"Year"];
    movie.imdbRating = [dic valueForKey:@"imdbRating"];
    movie.genre =[dic valueForKey:@"Genre"];
    movie.poster =[dic valueForKey:@"Poster"];
    movie.director =[dic valueForKey:@"Director"];
    movie.actors =[dic valueForKey:@"Actors"];
    movie.plot =[dic valueForKey:@"Plot"];
    movie.runtime =[dic valueForKey:@"Runtime"];
    movie.country =[dic valueForKey:@"Country"];
    movie.language =[dic valueForKey:@"Language"];
    movie.awards =[dic valueForKey:@"Awards"];
    [self.data addObject:movie];
    [self.collectionView reloadData];
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)erro{
    NSLog(@"Failed with error");
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)sources{
    [self.downloadData appendData:sources];
    NSLog(@"Did receive data");
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response{
    self.downloadData = [[NSMutableData alloc ] init];
    NSLog(@"Did receive response");
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma collectionview delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCell" forIndexPath:indexPath];
    Movie *movie = [self.data objectAtIndex:indexPath.row];
    [cell applyMovie:movie];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Movie *movie = [self.data objectAtIndex:indexPath.row];
    MovieDetailsController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"movieDetailsController"];
    controller.movieInfo=movie;
    [self.navigationController pushViewController:controller animated:YES];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.frame.size.width, 170);
}

-(void)prepareCollectionView{
    self.navigationItem.title = @"LOODOS";
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"MovieCell"];
}












@end
