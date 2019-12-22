//
//  ViewController.m
//  Lampu Merah
//
//  Created by Christian Stevanus on 21/12/19.
//  Copyright © 2019 Christian Stevanus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self scoreController];
    
}


- (IBAction)startGame:(id)sender {
    
    [self startGameSequence];
}

-(void)startGameSequence {
    
    if(scoreInt == 0) {
        
        timerInt = 3;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
        
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
        
        //disable button to avoid spam
        self.startButton.enabled = NO;
        [self.startButton setTitle:@"" forState:UIControlStateNormal];
        
    } else {
        
        [scoreTimer invalidate];
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
        
    }
    
    if(timerInt == 0) {
        
        scoreInt = 0;
        timerInt = 3;
    }
}

-(void)scoreController {
    
    scoreInt = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}

-(void)startTimer {
    
    timerInt -= 1;
    
    if(timerInt == 2) {
        
        self.traficLight.image = [UIImage imageNamed:@"trafficLight3"];
        
    }else if (timerInt == 1) {
        
        self.traficLight.image = [UIImage imageNamed:@"trafficLight2"];
        
    }else if (timerInt == 0) {
        
        self.traficLight.image = [UIImage imageNamed:@"trafficLight1"];
        [timer invalidate];
        
        //Start to increase score
        scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
        
        //Change label in button
        [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        //Enable button
        self.startButton.enabled = YES;
        
    }
}

-(void)scoreCounter {
    
    scoreInt += 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
    
}


@end
