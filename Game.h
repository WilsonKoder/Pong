//
//  Game.h
//  pong
//
//  Created by MATTHEW KODER on 10/15/13.
//  Copyright (c) 2013 Wilson Koder. All rights reserved.
//
//safasftgdagdfhdfgadfsd

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

double X;
double Y;
double length;

int ComputerScoreNumber;
int PlayerScoreNumber;
float speed;

@interface Game : UIViewController <UIApplicationDelegate, AVAudioPlayerDelegate>

{

        AVAudioPlayer *audioPlayer2;
    
        IBOutlet UIImageView *Ball;
        IBOutlet UIButton *StartEasy;
        IBOutlet UIButton *StartHard;
        IBOutlet UIImageView *Player;
        IBOutlet UIImageView *Computer;
    
        IBOutlet UILabel *PlayerScore;
        IBOutlet UILabel *ComputerScore;
        IBOutlet UILabel *WinOrLose;
        IBOutlet UIButton *Exit;
    
        NSTimer *timer;
    }

@property (nonatomic, retain) UIImageView *Player;
@property (nonatomic, retain) UIImageView *Computer;
@property (nonatomic, retain) UIImageView *Ball;


-(IBAction)StartEasy:(id)sender;
-(IBAction)StartHard:(id)sender;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)StartGame;
-(void)BallMovement;
-(void)ComputerMovement;
-(void)Collision;

@end