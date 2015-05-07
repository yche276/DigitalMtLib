/*
 *  DebugLog.m
 *  DebugLog
 *
 *  Created by Victor Chen on 3/22/09.
 *  Copyright (c) 2013 Mt. Zendo Inc. All rights reserved.
 *
 */
#import <UIKit/UIKit.h>
#include "DLog.h"

void _DebugLog(const char *file, int lineNumber, const char *funcName, NSString *format,...) {
	va_list ap;
	va_start (ap, format);
//	if (![format hasSuffix: @"\n"]) 
//		format = [format stringByAppendingString: @"\n"];
	
	NSString *body =  [[NSString alloc] initWithFormat: format arguments: ap];
	va_end (ap);
	const char *threadName = [[[NSThread currentThread] name] UTF8String];
	NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
//    NSString *logLevel = @"";
//    
//    switch (prmLevel) {
//        case LOG_INFO:
//        {
//            logLevel = @"INFO";
//        }
//            break;
//        case LOG_WARNING:
//        {
//            logLevel = @"WARNING";
//        }
//            break;
//        case LOG_ERROR:
//        {
//            logLevel = @"ERROR";
//        }
//            break;
//        case LOG_DEBUG:
//        {
//            logLevel = @"DEBUG";
//        }
//            break;
//        default:
//        {
//            NSLog(@"sadfsfasfasdfasdf, %d", prmLevel);
//        }
//            break;
//    }
    
    
	
#ifdef LOG_VERBOSE
//    if (threadName) {
//        fprintf(stderr,"%s: %s [%s %s %s, %d]\n",[logLevel UTF8String], [body UTF8String], threadName,funcName,[fileName UTF8String],lineNumber);
//    } else {
//        fprintf(stderr,"%s: %s [%p %s %s, %d]\n",[logLevel UTF8String], [body UTF8String], [NSThread currentThread],funcName,[fileName UTF8String],lineNumber);
//    }
#else
    if(threadName) {
        fprintf(stderr,"(%s %s, %s, %d) %s \n",threadName,[fileName UTF8String],funcName,lineNumber,[body UTF8String]);
    }
    else{
        fprintf(stderr,"(%s, %s, %d) %s \n",[fileName UTF8String],funcName,lineNumber, [body UTF8String]);
    }
#endif
	
//	[body release];	
}

