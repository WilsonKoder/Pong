//
//  Game.m
//  pong
//
//  Created by MATTHEW KODER on 10/15/13.
//  Copyright (c) 2013 Wilson Koder. All rights reserved.
//

#import "Game.h"
#import <AVFoundation/AVFoundation.h>

@interface Game ()


@end
@implementation Game

@synthesize Ball;
@synthesize Computer;
@synthesize Player;

-(void)Collision{
    if (CGRectIntersectsRect(Ball.frame, Player.frame)) {
        Ball.center = CGPointMake(Ball.center.x, 528 - Ball.frame.size.height/2);
        //Y = arc4random() %10;
        Y = 0 - Y;
    }
    

    if (CGRectIntersectsRect(Ball.frame, Computer.frame)) {
        Ball.center = CGPointMake(Ball.center.x, 40 + Ball.frame.size.height/2);
        //Y = arc4random() %10;
        Y = 0 - Y;
        
    }



    if (CGRectIntersectsRect(Player.frame, Ball.frame)){
        NSString *music=[[NSBundle mainBundle]pathForResource:@"Collision" ofType:@"m4a"];
        audioPlayer2=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        audioPlayer2.delegate=self;
        audioPlayer2.numberOfLoops=0;
        [audioPlayer2 play];
    }

    if (CGRectIntersectsRect(Computer.frame, Ball.frame)){
        NSString *music=[[NSBundle mainBundle]pathForResource:@"Collision" ofType:@"m4a"];
        audioPlayer2=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        audioPlayer2.delegate=self;
        audioPlayer2.numberOfLoops=0;
        [audioPlayer2 play];
    }

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *Drag = [[event allTouches] anyObject];
    Player.center = [Drag locationInView:self.view];
    
    
    Player.center = CGPointMake(Player.center.x, 430);
    
    /*
     
     if (Player.center.y > 430) {
     Player.center = CGPointMake(Player.center.x, 430);
     }
     
     
     if (Player.center.y < 430) {
     Player.center = CGPointMake(Player.center.x, 430);
     }
     */
    
    if (Player.center.x < 30.0) {
        Player.center = CGPointMake(30, Player.center.y);
    }
    
    if (Player.center.x > 290.0) {
        Player.center = CGPointMake(290, Player.center.y);
    }
    
}



-(void)ComputerMovement{
    
    
    if (Computer.center.x - Ball.center.x > (100.0/speed)) {
        Computer.center = CGPointMake(Computer.center.x - 1.0*speed, Computer.center.y);
    }
    
    if (Computer.center.x - Ball.center.x < (100.0/speed)) {
        Computer.center = CGPointMake(Computer.center.x + 1.0*speed, Computer.center.y);
    }
    
    // Make computer stay in bound of the screen
    if (Computer.center.x < 30.0) {
        Computer.center = CGPointMake(30.0, Computer.center.y);
    }
    
    if (Computer.center.x > 290.0) {
        Computer.center = CGPointMake(290.0, Computer.center.y);
    }
    
    
}





-(IBAction)StartEasy:(id)sender{
    speed = 2;

    [self StartGame];
}

-(IBAction)StartHard:(id)sender{
    speed = 5;
    [self StartGame];
    
}

-(void)StartGame{
    
    StartEasy.hidden = YES;
    StartHard.hidden = YES;
    Exit.hidden = YES;
   
    Y = (double)(arc4random() % 11);
    Y = Y - 5.0;

    X = (double)(arc4random() % 11);
    X = X - 5.0;

    if (Y == 0) {
        Y = 1.0;
    }
    
    if (X == 0) {
        X = 1.0;
    }

    length = sqrt(pow(X,2.0) + pow(Y,2.0));
    Y = 3 * (Y / length);
    X = 3 * (X / length);
    //Y = speed * (Y / length);
    //X = speed * (X / length);
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
    
}

-(void)BallMovement{
    
    [self ComputerMovement];
    [self Collision];
    
    Ball.center = CGPointMake(Ball.center.x + X, Ball.center.y + Y);
    
    if (Ball.center.x < 15.0) {
        X = 0 - X;
    }
    
    if (Ball.center.x > 290.0) {
        X = 0 - X;
    }
    
    /*
     if (Ball.center.y < 18 || Ball.center.y > 445) {
         Y = 0 - Y;
         Y = -1 * Y;
     }
     */
    
    if (Ball.center.y < 15.0) {
        PlayerScoreNumber = PlayerScoreNumber + 1;
        PlayerScore.text = [NSString stringWithFormat:@"%i", PlayerScoreNumber];
        
        [timer invalidate];
        StartEasy.hidden = NO;
        StartHard.hidden = NO;
        
        Ball.center = CGPointMake(160, 265);
        Computer.center = CGPointMake(160, 32);
        
        if (PlayerScoreNumber == 10) {
            StartEasy.hidden = YES;
            StartHard.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"You Win!"];
        }
    } // end if Ball.center.y <0
    
    if (Ball.center.y > 553.0) {
        ComputerScoreNumber = ComputerScoreNumber + 1;
        ComputerScore.text = [NSString stringWithFormat:@"%i", ComputerScoreNumber];
        [timer invalidate];
        StartEasy.hidden = NO;
        StartHard.hidden = NO;
        
        Ball.center = CGPointMake(160, 265);
        Computer.center = CGPointMake(160, 32);
        
        if (ComputerScoreNumber == 10) {
            StartEasy.hidden = YES;
            StartHard.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"You Lose!"];
        }
    } // end if Ball.center.y > 580
    
} // end BallMovement




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [WinOrLose setFont:[UIFont fontWithName:@"FaceYourFears" size:36]];
    
    PlayerScoreNumber = 0;
    ComputerScoreNumber = 0;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end