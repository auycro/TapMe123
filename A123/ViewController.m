//
//  ViewController.m
//  A123
//
//  Created by Gumpanat Keardkeawfa on 1/19/15.
//  Copyright (c) 2015 Auycro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property int testInt;
@property int seconds;

@end

@implementation ViewController

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self setupGame];
}

- (void)setupGame {
    //[self.backgroundMusic setVolume:0.3];
    //[self.backgroundMusic play];
    //Setup
    self.seconds = 10;
    self.testInt = 0;
    // 2
    self.timer.text = [NSString stringWithFormat:@"Time: %i", self.seconds];
    self.score.text = [NSString stringWithFormat:@"Score\n%i", self.testInt];
    // 3
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
}

- (IBAction)buttonPressed:(id)sender {
    //UIButton *button = sender;
    self.testInt++;
    self.score.text = [NSString stringWithFormat:@"Score: %i", self.testInt];
    NSLog(@"Pressed! %i time:,%i",self.testInt,self.seconds);
    [self.buttonBeep play];
}

- (void)subtractTime {
    // 1
    self.seconds--;
    self.timer.text = [NSString stringWithFormat:@"Time: %i",self.seconds];
    [self.secondBeep play];
    // 2
    if (self.seconds == 0) {
        [self.timer1 invalidate];

        // new code is here!
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                        message:[NSString stringWithFormat:@"You scored %i points", self.testInt]
                                                       delegate:self
                                              cancelButtonTitle:@"Play Again"
                                              otherButtonTitles:nil];
        
        [alert show];
    }
}

//Add Audio
- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 2
    NSError *error;
    
    // 3
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // 4
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    // 5
    return audioPlayer;
}

//Load First Screen
- (void)viewDidLoad {
    [super viewDidLoad];
    //Set bgColor
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    self.timer.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_timer.png"]];
    self.score.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    //Set up sound
    self.buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    self.secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    self.backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    //Initialise game variable
    [self setupGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
