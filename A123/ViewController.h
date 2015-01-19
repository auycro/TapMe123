//
//  ViewController.h
//  A123
//
//  Created by Gumpanat Keardkeawfa on 1/19/15.
//  Copyright (c) 2015 Auycro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

//@interface ViewController : UIViewController
@interface ViewController : UIViewController<UIAlertViewDelegate> {
}
@property (weak, nonatomic) IBOutlet UILabel *timer;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UIButton *tapMe;
@property NSTimer *timer1;

// Add these AVAudioPlayer objects!
@property AVAudioPlayer *buttonBeep;
@property AVAudioPlayer *secondBeep;
@property AVAudioPlayer *backgroundMusic;
- (IBAction)buttonPressed:(id)sender;
@end

