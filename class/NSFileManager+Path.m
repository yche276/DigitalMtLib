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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    return documentPath;

    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

+ (NSURL *)libraryDirectoryURL{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject];
}
+ (NSString *)libraryDirectoryPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [paths objectAtIndex:0];
    return libraryPath;
}

+ (NSURL *)temporaryDirectoryURL{
    return [NSURL URLWithString:NSTemporaryDirectory()];
}
+ (NSString *)temporaryDirectoryPath{
    return NSTemporaryDirectory();
}

+ (double)availableDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:self.documentsDirectoryPath
                                                                                       error:nil];
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}

+ (NSArray *)filesOfDirectoryAtPath:(NSString *)strPath extensions:(NSArray *)aryExtensions{
    
    NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:strPath
                                                                               error:nil];
    return [dirContents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"pathExtension IN %@", aryExtensions]];
    
}

@end
