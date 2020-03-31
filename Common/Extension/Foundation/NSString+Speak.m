//
//  NSString+Speak.m
//  FuckingEnglish
//
//  Created by Thanh Vu on 3/31/20.
//  Copyright © 2020 fuxsociety. All rights reserved.
//

#import "NSString+Speak.h"
#import <AVFoundation/AVFoundation.h>
@implementation NSString (Speak)
- (void)slowSpeech {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    
    AVSpeechUtterance *speechutt = [AVSpeechUtterance speechUtteranceWithString:self];
    speechutt.volume=90.0f;
    speechutt.rate=0.50f;
    speechutt.pitchMultiplier=0.80f;
    [speechutt setRate:0.3f];
    speechutt.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-us"];
    [synthesizer speakUtterance:speechutt];
}

- (void)normalSpeech {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc] init];
    
    AVSpeechUtterance *speechutt = [AVSpeechUtterance speechUtteranceWithString:self];
    speechutt.volume=90.0f;
    speechutt.pitchMultiplier=0.80f;
    [speechutt setRate:0.45f];
    speechutt.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-us"];
    [synthesizer speakUtterance:speechutt];
}
@end
