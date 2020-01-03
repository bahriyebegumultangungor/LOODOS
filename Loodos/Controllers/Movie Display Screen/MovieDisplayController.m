//
//  MovieDisplayController.m
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 2.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import "MovieDisplayController.h"
#import "MovieDetailsController.h"
#import "MovieCell.h"
#import "Movie.h"

@interface MovieDisplayController ()

@end

@implementation MovieDisplayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loading.hidden = NO;

    [self prepareNavbar];
    [self prepareCollectionView];
    NSString *url =[NSString stringWithFormat:@"%@%@", @"http://www.omdbapi.com/?apikey=971e89a9&t=",self.searchKey];
    [self getData:url];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self prepareNavbar];
    [self.collectionView reloadData];
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
    self.loading.hidden = YES;

    if([dic valueForKey:@"Error"]){
        self.noDataView.hidden = NO;
        self.collectionView.hidden = YES;
    }
    
    else{
        self.noDataView.hidden = YES;
        self.collectionView.hidden = NO;
        
        self.movie = [[NSMutableArray alloc] init];
        
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
        
        [self.movie addObject:movie];
    }
   
    [self.collectionView reloadData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)erro{
    NSLog(@"Failed with error");
    self.noDataView.hidden = NO;
    self.collectionView.hidden = YES;
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
    return self.movie.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MovieCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCell" forIndexPath:indexPath];
    Movie *movie = [self.movie objectAtIndex:indexPath.row];
    [cell applyMovie:movie];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.frame.size.width, 170);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Movie *movie = [self.movie objectAtIndex:indexPath.row];
    MovieDetailsController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"movieDetailsController"];
    controller.movieInfo=movie;
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)prepareCollectionView{
    self.noDataView.hidden = YES;
    self.collectionView.refreshControl = [UIRefreshControl new];
    [self.collectionView.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"MovieCell"];
    [self.collectionView reloadData];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setMinimumInteritemSpacing:0.0f];
    [layout setMinimumLineSpacing:0.0f];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView setCollectionViewLayout:layout];
}

-(void)prepareNavbar{
    self.navigationItem.title = @"LOODOS";
    UIBarButtonItem *bButton = [[UIBarButtonItem alloc]
                                initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    bButton.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.topItem.backBarButtonItem = bButton;
}









@end
