//
//  Game.h
//  pong
//
//  Created by MATTHEW KODER on 10/15/13.
//  Copyright (c) 2013 Wilson Koder. All rights reserved.
//

#import <UIKit/UIKit.h>

int Y;
int X;
int ComputerScoreNumber;
int PlayerScoreNumber;
float speed;

@interface Game : UIViewController

{
    
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

-(IBAction)StartEasy:(id)sender;
-(IBAction)StartHard:(id)sender;
-(void)StartGame;
-(void)BallMovement;
-(void)ComputerMovement;
-(void)Collision;

@end
