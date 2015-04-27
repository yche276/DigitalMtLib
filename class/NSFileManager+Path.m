//
//  NSFileManager+Path.m
//  MtZendoLib
//
//  Created by Victor Chen on 4/27/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "NSFileManager+Path.h"

@implementation NSFileManager (Path)

+ (NSURL *)documentsDirectoryURL{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

+ (NSString *)documentsDirectoryPath{
    return @"";
}

@end
