//
//  NSFileManager+Path.h
//  MtZendoLib
//
//  Created by Victor Chen on 4/27/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Path) {
    
}

+ (NSURL *)documentsDirectoryURL;
+ (NSString *)documentsDirectoryPath;


+ (NSURL *)libraryDirectoryURL;
+ (NSString *)libraryDirectoryPath;


+ (NSURL *)temporaryDirectoryURL;
+ (NSString *)temporaryDirectoryPath;

+ (double)availableDiskSpace;

/**
 Retrieve the path of files with specific extensions
 Sample usage:
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSArray *extensions = [NSArray arrayWithObjects:@"txt", @"png" nil];
 
    //returns all txt and png files in the document directory
    [NSFileManager filesOfDirectoryAtPath:documentsDirectory extensions:extensions];
 
 
 */
+ (NSArray *)filesOfDirectoryAtPath:(NSString *)strPath extensions:(NSArray *)aryExtensions;

@end
