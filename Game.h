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

@interface Game : UIViewController

{
    
    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    IBOutlet UIImageView *Player;
    IBOutlet UIImageView *Computer;

    NSTimer *timer;
    
}

-(IBAction)StartButton:(id)sender;
-(void)BallMovement;
-(void)ComputerMovement;



@end
