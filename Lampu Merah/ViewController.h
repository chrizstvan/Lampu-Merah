//
//  ViewController.h
//  Lampu Merah
//
//  Created by Christian Stevanus on 21/12/19.
//  Copyright © 2019 Christian Stevanus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *timer;
    NSTimer *scoreTimer;
    
    int timerInt;
    int scoreInt;
}

@property (weak, nonatomic) IBOutlet UIImageView *traficLight;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startGame:(id)sender;

@end

