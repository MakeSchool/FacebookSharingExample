#import "MainScene.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@implementation MainScene {
  CCLabelTTF *_luckyNumberLabel;
}

-(void) didLoadFromCCB {
  NSInteger randomNumber = arc4random_uniform(99) + 1;
  _luckyNumberLabel.string = [NSString stringWithFormat:@"%li", (long)randomNumber];
}

//
// uncomment to add in FB login button -- needed for other features like
// OpenGraph posts
//
//-(void) onEnter {
//  [super onEnter];
//  
//  FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//  UIView *view = [CCDirector sharedDirector].view;
//  loginButton.center = ccpAdd(view.center, CGPointMake(0, 40));
//  [view addSubview:loginButton];
//}

-(void) shareToFacebook {
  FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
  
  // this should link to FB page for your app or AppStore link if published
  content.contentURL = [NSURL URLWithString:@"https://www.facebook.com/makeschool"];
  // URL of image to be displayed alongside post
  content.imageURL = [NSURL URLWithString:@"https://git.makeschool.com/MakeSchool-Tutorials/News/f744d331484d043a373ee2a33d63626c352255d4//663032db-cf16-441b-9103-c518947c70e1/cover_photo.jpeg"];
  // title of post
  content.contentTitle = [NSString stringWithFormat:@"My lucky number is %@!", _luckyNumberLabel.string];
  // description/body of post
  content.contentDescription = @"Check out My Lucky Number to get your own.";

  [FBSDKShareDialog showFromViewController:[CCDirector sharedDirector]
                                withContent:content
                                   delegate:nil];
}

@end
