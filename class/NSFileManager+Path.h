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

/**
 URL of Documents directory
 
 @return Documents directory URL
 */
+ (NSURL *)documentsDirectoryURL;

/**
 String of Documents directory
 
 @return Documents directory String
 */
+ (NSString *)documentsDirectoryPath;

/**
 URL of Library directory
 
 @return Library directory URL
 */
+ (NSURL *)libraryDirectoryURL;

/**
 String of Library directory
 
 @return Librar directory String
 */
+ (NSString *)libraryDirectoryPath;

/**
 URL of Temporary directory
 
 @return Temporary directory URL
 */
+ (NSURL *)temporaryDirectoryURL;
/**
 String of Temporary directory
 
 @return Temporary directory String
 */
+ (NSString *)temporaryDirectoryPath;

/**
 Available disk space
 
 @return the size of available disk space(MB)
 */
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
/*!
    File path in mail bundle
 */
+ (NSString *)mainBundlePathOfFileName:(NSString *)prmFilename type:(NSString *)prmType;
@end
