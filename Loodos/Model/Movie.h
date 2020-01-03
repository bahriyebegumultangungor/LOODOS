//
//  Movie.h
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 1.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *rated;
@property (nonatomic, strong) NSString *released;
@property (nonatomic, strong) NSString *runtime;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *director;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, strong) NSString *actors;
@property (nonatomic, strong) NSString *plot;

@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *awards;
@property (nonatomic, strong) NSString *poster;
@property (nonatomic, strong) NSArray *ratings;
@property (nonatomic, strong) NSString *metascore;
@property (nonatomic, strong) NSString *imdbRating;
@property (nonatomic, strong) NSString *imdbVotes;
@property (nonatomic, strong) NSString *imdbID;
@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) NSString *dvd;
@property (nonatomic, strong) NSString *boxOffice;
@property (nonatomic, strong) NSString *production;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *response;

@end

NS_ASSUME_NONNULL_END
