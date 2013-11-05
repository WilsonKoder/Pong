//
//  Game.m
//  pong
//
//  Created by MATTHEW KODER on 10/15/13.
//  Copyright (c) 2013 Wilson Koder. All rights reserved.
//

#import "Game.h"

@interface Game ()


@end
@implementation Game

-(void)Collision{
    if (CGRectIntersectsRect(Ball.frame, Player.frame)) {
        Y = arc4random() %5;
        Y = 0-Y;
    }
    
    if (CGRectIntersectsRect(Ball.frame, Computer.frame)) {
        Y = arc4random() %5;
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
    
    if (Player.center.x < 30) {
        Player.center = CGPointMake(30, Player.center.y);
    }
    
    if (Player.center.x > 290) {
        Player.center = CGPointMake(290, Player.center.y);
    }
     
}


-(void)ComputerMovement{
    
    
    if (Computer.center.x > Ball.center.x) {
        Computer.center = CGPointMake(Computer.center.x - 2, Computer.center.y);
    }
    
    if (Computer.center.x < Ball.center.x) {
        Computer.center = CGPointMake(Computer.center.x + 2, Computer.center.y);
    }
    
    if (Computer.center.x < 30) {
        Computer.center = CGPointMake(30, Computer.center.y);
    }
    
    if (Computer.center.x > 290) {
        Computer.center = CGPointMake(290, Computer.center.y);
    }
    
    
}





-(IBAction)StartEasy:(id)sender{
    speed = 0.01;
    [self StartGame];
}

-(IBAction)StartHard:(id)sender{
    speed = 0.005;
    [self StartGame];
    
}

-(void)StartGame{
    
    StartEasy.hidden = YES;
    StartHard.hidden = YES;
    Exit.hidden = YES;
    
    Y = arc4random() %11;
    Y = Y - 5;
    
    X = arc4random() %11;
    X = X - 5;
    
    if (Y == 0) {
        Y = 1;
    }
    
    if (X == 0) {
        X = 1;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
    
}

-(void)BallMovement{
    
    [self ComputerMovement];
    [self Collision];
    
    Ball.center = CGPointMake(Ball.center.x + X, Ball.center.y + Y);
    
    if (Ball.center.x < 15) {
        X = 0 - X;
    }
    
    if (Ball.center.x > 290) {
        X = 0 - X;
    }
    
    if (Ball.center.y < 18 || Ball.center.y > 445) {
       // Y = 0 - Y;
        Y = -1 * Y;
    }
    
    
    if (Ball.center.y < 0) {
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

    if (Ball.center.y > 580) {
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