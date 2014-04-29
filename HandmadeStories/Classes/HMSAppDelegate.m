//
//  HMSAppDelegate.m
//  HandmadeStories
//
//  Created by Matthew McGlincy on 4/28/14.
//
//

#import <DropboxSDK/DropboxSDK.h>
#import "HMSAppDelegate.h"

@implementation HMSAppDelegate

- (void)dropboxConnectionBuild {
  DBSession *dbSession = [[DBSession alloc] initWithAppKey:@"7rmbu9y4al1w5ub"
                                                 appSecret:@"x9j994lr4sny6fq"
                                                      root:kDBRootAppFolder];
  [DBSession setSharedSession:dbSession];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
  if ([[DBSession sharedSession] handleOpenURL:url]) {
    if ([[DBSession sharedSession] isLinked]) {
      NSLog(@"App linked successfully!");
      // At this point you can start making API calls
    }
    return YES;
  }
  // Add whatever other url handling code your app requires here
  return NO;
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [self dropboxConnectionBuild];
  //    [[DBSession sharedSession] unlinkAll];
  return YES;
}

@end
