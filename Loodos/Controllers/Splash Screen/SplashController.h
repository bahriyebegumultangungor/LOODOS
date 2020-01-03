//
//  SplashController.h
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 1.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@import Firebase;

NS_ASSUME_NONNULL_BEGIN

@interface SplashController : UIViewController
{
    Reachability *internetReachableFoo;
}
@property (weak, nonatomic) IBOutlet UILabel *noInternetLabel;
@property (weak, nonatomic) IBOutlet UILabel *loodosLabel;
@property (nonatomic, strong) FIRRemoteConfig *remoteConfig;



@end

NS_ASSUME_NONNULL_END
