//
//  MovieCell.m
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 2.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)applyMovie:(Movie *)movie{
    if([movie.title isEqualToString:@"N/A"]){
        self.movieNameLabel.text = @"-";
    }else{
        self.movieNameLabel.text = movie.title;
    }
    
    if([movie.year isEqualToString:@"N/A"]){
        self.movieYearLabel.text = @"-";
    }else{
        self.movieYearLabel.text = movie.year;
    }
    
    if([movie.genre isEqualToString:@"N/A"]){
        self.movieGenreLabel.text = @"-";
    }else{
        self.movieGenreLabel.text = movie.genre;
    }
    
    if([movie.imdbRating isEqualToString:@"N/A"]){
        self.imdbLabel.text = @"-";
    }else{
        self.imdbLabel.text = movie.imdbRating;
    }
    
    if([movie.poster isEqualToString:@"N/A"]){
        self.movieImage.image = [UIImage imageNamed:@"noImage"];
    }else{
        NSURL *url = [NSURL URLWithString:movie.poster];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        self.movieImage.image = img;
    }
}





@end
