//
//  XMGAudioTool.m
//  音效的播放
//
//  Created by zhangzhifu on 2017/3/2.
//  Copyright © 2017年 seemygo. All rights reserved.
//

#import "XMGAudioTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation XMGAudioTool

static NSMutableDictionary *_soundIDs;
static NSMutableDictionary *_players;

+ (void)initialize {
    _soundIDs = [NSMutableDictionary dictionary];
    _players = [NSMutableDictionary dictionary];
}

// 音效的播放
+ (void)playSoundWithSoundName:(NSString *)soundName {
    // 1. 定义systemSoundID
    SystemSoundID soundID = 0;
    
    // 2. 从字典中取对应的soundID,如果取出是nil,表示之前没有存在字典中
    soundID = [_soundIDs[soundName] unsignedIntValue];
    if (soundID == 0) {
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        
        if (url == NULL) {
            return;
        }
        
        AudioServicesCreateSystemSoundID(url, &soundID);
        
        // 将soundID存入字典中
        [_soundIDs setObject:@(soundID) forKey:soundName];
    }
    
    // 3. 播放音效
    AudioServicesPlayAlertSound(soundID);
}

// 音乐的播放
+ (void)playMusicWithMusicName:(NSString *)musicName {
    assert(musicName);
    
    // 1. 定义播放器
    AVAudioPlayer *player = nil;
    
    // 2. 从字典中去player,如果为nil,则创建对应的播放器
    player = _players[musicName];
    if (player == nil) {
        // 2.1 获取对应的音乐资源
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
        
        if (fileURL == nil) {
            return;
        }
        
        // 2.2 创建对应的播放器
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        
        // 2.3 将player存入到字典中
        [_players setObject:player forKey:musicName];
        
        // 2.4 准备播放
        [player prepareToPlay];
    }
    
    // 3. 播放音乐
    [player play];
}

+ (void)pauseMusicWithMusicName:(NSString *)musicName {
    // 1. 取出对应的播放器
    AVAudioPlayer *player = _players[musicName];
    
    // 2. 判断player是否为空
    if (player) {
        [player pause];
    }
}

+ (void)stopMusicWithMusicName:(NSString *)musicName {
    // 1. 取出对应的播放器
    AVAudioPlayer *player = _players[musicName];
    
    // 2. 判断player是否为空
    if (player) {
        [player stop];
        [_players removeObjectForKey:musicName];
        player = nil;
    }
}
@end
