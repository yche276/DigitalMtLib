/*
 *  DebugLog.h
 *  DebugLog
 *
 *  Created by Victor Chen on 3/22/09.
 *  Copyright (c) 2013 Mt. Zendo Inc. All rights reserved.
 *
 */



#define LOG_INFO                0
#define LOG_WARNING             1
#define LOG_ERROR               2
#define LOG_DEBUG               3

#ifdef DEBUG

# define DLog(level, args...) _DebugLog(level, __FILE__,__LINE__,__PRETTY_FUNCTION__,args);
//# define DLog(args...) _DebugLog(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
#else
# define DLog(x...)
#endif

#define DTrace DLog(@"")

void _DebugLog(int prmLevel, const char *file, int lineNumber, const char *funcName, NSString *format,...);
