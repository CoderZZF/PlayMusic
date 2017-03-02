//
//  ViewController.m
//  播放音乐
//
//  Created by zhangzhifu on 2017/3/2.
//  Copyright © 2017年 seemygo. All rights reserved.
//

#import "ViewController.h"
#import "XMGAudioTool.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
/** 播放器 */
@property (nonatomic, strong) AVAudioPlayer *player;
@end

@implementation ViewController

#pragma mark - 懒加载
- (AVAudioPlayer *)player {
    if (_player == nil) {
        // 取出资源的URL
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"1201111234.mp3" withExtension:nil];
        
        // 创建播放器
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        // 准备播放
        [self.player prepareToPlay];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)play {
    // 播放歌曲
//    [self.player play];
    [XMGAudioTool playMusicWithMusicName:@"1201111234.mp3"];
}

- (IBAction)pause {
//    [self.player pause];
    [XMGAudioTool pauseMusicWithMusicName:@"1201111234.mp3"];
}

- (IBAction)stop {
//    [self.player stop];
//    self.player = nil;
    [XMGAudioTool stopMusicWithMusicName:@"1201111234.mp3"];
}

- (IBAction)other {
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"120125029.mp3" withExtension:nil];
//    [self.player setValue:url forKeyPath:@"url"];
//    
//    [self.player play];
    [XMGAudioTool playMusicWithMusicName:@"120125029.mp3"];
}

@end
