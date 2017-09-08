//
//  ObjectArchiveManager.h
//  CommonArchive
//
//  Created by huihong on 2017/9/8.
//  Copyright © 2017年 huihong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectArchiveManager : NSObject

+ (void)encoderObject:(id)obj encoder:(NSCoder *)encoder;
+ (void)decoderObject:(id)obj decoder:(NSCoder *)decoder;

@end
