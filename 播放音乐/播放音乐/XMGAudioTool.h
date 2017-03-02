//
//  XMGAudioTool.h
//  音效的播放
//
//  Created by zhangzhifu on 2017/3/2.
//  Copyright © 2017年 seemygo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGAudioTool : NSObject

// 音乐操作
+ (void)playMusicWithMusicName:(NSString *)musicName;
+ (void)pauseMusicWithMusicName:(NSString *)musicName;
+ (void)stopMusicWithMusicName:(NSString *)musicName;

+ (void)playSoundWithSoundName:(NSString *)soundName;

@end
