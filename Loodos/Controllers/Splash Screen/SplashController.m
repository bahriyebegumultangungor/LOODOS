//
//  SplashController.m
//  Loodos
//
//  Created by Bahriye Begüm ÜLTAN on 1.01.2020.
//  Copyright © 2020 Bahriye Begüm ÜLTAN GÜNGÖR. All rights reserved.
//

#import "SplashController.h"
#import <DGActivityIndicatorView/DGActivityIndicatorView.h>
#import "AppDelegate.h"
#import "MainMenuController.h"
#import "Reachability.h"
@import Firebase;

@interface SplashController ()

@end

@implementation SplashController

NSString *const kWelcomeMessageConfigKey = @"loodos_message";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.noInternetLabel.hidden = YES;
    [self testInternetConnection];
    [self displayWelcome];

    DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallBeat tintColor:[UIColor blackColor] size:34.0f];
    activityIndicatorView.frame = CGRectMake(self.view.frame.size.width/2 - 17 , self.view.frame.size.height/2 - 17, 35, 35);
    [self.view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
    self.remoteConfig = [FIRRemoteConfig remoteConfig];
    FIRRemoteConfigSettings *remoteConfigSettings = [[FIRRemoteConfigSettings alloc] init];
    remoteConfigSettings.minimumFetchInterval = 0;
    self.remoteConfig.configSettings = remoteConfigSettings;
    
    [self.remoteConfig setDefaultsFromPlistFileName:@"RemoteConfigDefaults"];
    [self fetchConfig];
}
- (void)fetchConfig {
    long expirationDuration = 3600;
    
    [self.remoteConfig fetchWithExpirationDuration:expirationDuration completionHandler:^(FIRRemoteConfigFetchStatus status, NSError *error) {
        if (status == FIRRemoteConfigFetchStatusSuccess) {
            NSLog(@"Config fetched!");
            [self.remoteConfig activateWithCompletionHandler:^(NSError * _Nullable error) {
            }];
        } else {
            NSLog(@"Config not fetched");
            NSLog(@"Error %@", error.localizedDescription);
        }
        [self displayWelcome];
    }];
}

- (void)displayWelcome {
    NSString *welcomeMessage = self.remoteConfig[kWelcomeMessageConfigKey].stringValue;
    self.loodosLabel.text = welcomeMessage;
}

- (void)testInternetConnection
{
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Yayyy, we have the interwebs!");
            [self performSelector:@selector(showMovie) withObject:nil afterDelay:3.0];
        });
    };
    
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Someone broke the internet :(");
            self.noInternetLabel.hidden = NO;
        });
    };
    [internetReachableFoo startNotifier];
}

-(void)showMovie{
    MainMenuController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"mainMenuController"];
    AppDelegate *apdel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [apdel changeRootViewController:controller];
}






@end
