/*
 *  DebugLog.m
 *  DebugLog
 *
 *  Created by Victor Chen on 3/22/09.
 *  Copyright (c) 2013 Mt. Zendo Inc. All rights reserved.
 *
 */

#include "DLog.h"

void _DebugLog(const char *file, int lineNumber, const char *funcName, NSString *format,...) {
	va_list ap;
	
	va_start (ap, format);
	if (![format hasSuffix: @"\n"]) 
		format = [format stringByAppendingString: @"\n"];
	
	NSString *body =  [[NSString alloc] initWithFormat: format arguments: ap];
	va_end (ap);
	const char *threadName = [[[NSThread currentThread] name] UTF8String];
	NSString *fileName=[[NSString stringWithUTF8String:file] lastPathComponent];
	
#ifdef LOG_VERBOSE
    if (threadName) {
        fprintf(stderr,"%s %s (%s, %d): %s",threadName,funcName,[fileName UTF8String],lineNumber,[body UTF8String]);
    } else {
        fprintf(stderr,"%p %s (%s, %d): %s",[NSThread currentThread],funcName,[fileName UTF8String],lineNumber,[body UTF8String]);
    }
#else
    if(threadName)
        fprintf(stderr,"%s (%s, %s, %d): %s",threadName,[fileName UTF8String],funcName,lineNumber,[body UTF8String]);
    else
        fprintf(stderr,"(%s, %s, %d): %s",[fileName UTF8String],funcName,lineNumber,[body UTF8String]);
#endif
	
//	[body release];	
}

