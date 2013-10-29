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






-(IBAction)StartButton:(id)sender{
    
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
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
    
}

-(void)BallMovement{
    
    [self ComputerMovement];
    
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
    
    
}


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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
