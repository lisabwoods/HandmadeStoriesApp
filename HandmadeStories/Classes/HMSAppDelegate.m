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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [[UIApplication sharedApplication] setStatusBarHidden:YES];
  [self dropboxConnectionBuild];
  return YES;
}

- (void)dropboxConnectionBuild {
  // "Handmade Stories" app under Lisa Wood's dropbox account
  DBSession *dbSession = [[DBSession alloc] initWithAppKey:@"zg24chusfngrojm"
                                                 appSecret:@"pogrpd3cjnn13do"
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

@end
