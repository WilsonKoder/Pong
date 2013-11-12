//
//  AppDelegate.h
//  pong
//
//  Created by MATTHEW KODER on 10/15/13.
//  Copyright (c) 2013 Wilson Koder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, AVAudioPlayerDelegate> {
    AVAudioPlayer *audioPlayer1;
    AVAudioPlayer *audioPlayer2;
}

@property (strong, nonatomic) UIWindow *window;

@end
