//
//  MTPath.m
//  MtZendoLib
//
//  Created by Victor Chen on 4/24/15.
//  Copyright (c) 2015 Digital Mt. Inc. All rights reserved.
//

#import "MTPath.h"

@implementation MTPath

+ (NSURL *)applicationDocumentsDirectoryPathURL {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.mtzendo.PIM" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
+ (NSString *)applicationDocumentsDirectoryPathString{
    
    return @"";
}

@end



