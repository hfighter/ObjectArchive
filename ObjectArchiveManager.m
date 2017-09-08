//
//  ObjectArchiveManager.m
//  CommonArchive
//
//  Created by huihong on 2017/9/8.
//  Copyright © 2017年 huihong. All rights reserved.
//

#import "ObjectArchiveManager.h"
#import <objc/runtime.h>

@implementation ObjectArchiveManager

+ (void)encoderObject:(id)obj encoder:(NSCoder *)encoder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([obj class], &count);
    for (int i = 0; i < count; i ++) {
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        id value = [obj valueForKey:ivarName];
        [encoder encodeObject:value forKey:ivarName];
    }
    free(ivars);
}

+ (void)decoderObject:(id)obj decoder:(NSCoder *)decoder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([obj class], &count);
    for (int i = 0; i < count; i ++) {
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
        id value = [decoder decodeObjectForKey:ivarName];
        [obj setValue:value forKey:ivarName];
    }
    free(ivars);
}

@end
