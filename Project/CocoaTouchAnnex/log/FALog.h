//  Copyright (c) 2015 Richard Long 
//
//  Released under the MIT license ( http://opensource.org/licenses/MIT )
//
// vvv derived from https://github.com/rlong/jsonbroker.objective_c/blob/master/src/jsonbroker.library/common/log/FALog.h

#import <Foundation/Foundation.h>


@interface FALog : NSObject  {
}



#pragma mark -
#pragma mark Debug

#ifdef DEBUG
#define Log_isDebugEnabled() TRUE
#else
#define Log_isDebugEnabled() FALSE
#endif


+ (void)debug:(NSString *)message inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debug(message) [FALog debug:message inFunction:__func__]
#else
#define Log_debug(message)
#endif


+(void)debugBool:(BOOL)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugBool(value) [FALog debugBool:value withName:#value inFunction:__func__]
#else
#define Log_debugBool(value)
#endif



+ (void)debugData:(NSData *)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugData(value) [FALog debugData:value withName:#value inFunction:__func__]
#else
#define Log_debugData(value)
#endif


+ (void)debugDate:(NSDate *)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugDate(value) [FALog debugDate:value withName:#value inFunction:__func__]
#else
#define Log_debugDate(value)
#endif


+ (void)debugDouble:(double)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugDouble(value) [FALog debugFloat:value withName:#value inFunction:__func__]
#else
#define Log_debugDouble(value)
#endif


+(void)debugError:(NSError*)error withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugError(value) [FALog debugError:value withName:#value inFunction:__func__]
#else
#define Log_debugError(value)
#endif


+ (void)debugFloat:(double)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugFloat(value) [FALog debugFloat:value withName:#value inFunction:__func__]
#else
#define Log_debugFloat(value)
#endif


+(void)debugForFunction:(const char*)function format:(NSString *)format, ...;
#ifdef DEBUG
#define Log_debugFormat(...) [FALog debugForFunction:__func__ format:__VA_ARGS__]
#else
#define Log_debugFormat(...)
#endif


+ (void)debugInt:(long)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugInt(value) [FALog debugInt:value withName:#value inFunction:__func__]
#else
#define Log_debugInt(value)
#endif


+ (void)debugIp4Address:(in_addr_t)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugIp4Address(value) [FALog debugIp4Address:value withName:#value inFunction:__func__]
#else
#define Log_debugIp4Address(value)
#endif



+ (void)debugLong:(long)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugLong(value) [FALog debugInt:value withName:#value inFunction:__func__]
#else
#define Log_debugLong(value)
#endif

+ (void)debugLongLong:(long long)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugLongLong(value) [FALog debugLongLong:value withName:#value inFunction:__func__]
#else
#define Log_debugLongLong(value)
#endif


+ (void)debugPointer:(void*)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugPointer(value) [FALog debugPointer:value withName:#value inFunction:__func__]
#else
#define Log_debugPointer(value)
#endif

+ (void)debugString:(NSString *)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugString(value) [FALog debugString:value withName:#value inFunction:__func__]
#else
#define Log_debugString(value)
#endif

+ (void)debugUtf8String:(const char*)value withName:(const char*)name inFunction:(const char*)function;
#ifdef DEBUG
#define Log_debugUtf8String(value) [FALog debugUtf8String:value withName:#value inFunction:__func__]
#else
#define Log_debugUtf8String(value)
#endif

///////////////////////////////////////////////////////////

+(void)entered:(const char*)function;
#ifdef DEBUG
#define Log_enteredMethod() [FALog entered:__func__]
#else
#define Log_enteredMethod()
#endif


#pragma mark -
#pragma mark Information



+ (void)info:(NSString *)message inFunction:(const char*)function;
#define Log_info(message) [FALog info:message inFunction:__func__]


+(void)infoBool:(BOOL)value withName:(const char*)name inFunction:(const char*)function;
#define Log_infoBool(value) [FALog infoBool:value withName:#value inFunction:__func__]

+ (void)infoDouble:(double)value withName:(const char*)name inFunction:(const char*)function;
#define Log_infoDouble(value) [FALog infoFloat:value withName:#value inFunction:__func__]

+ (void)infoFloat:(double)value withName:(const char*)name inFunction:(const char*)function;
#define Log_infoFloat(value) [FALog infoFloat:value withName:#value inFunction:__func__]

+ (void)infoInt:(long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_infoInt(value) [FALog infoInt:value withName:#value inFunction:__func__]

+ (void)infoLong:(long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_infoLong(value) [FALog infoLong:value withName:#value inFunction:__func__]

+ (void)infoLongLong:(long long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_infoLongLong(value) [FALog infoLongLong:value withName:#value inFunction:__func__]

+(void)infoPointer:(void*)value withName:(const char*)name inFunction:(const char*)function;
#define Log_infoPointer(value) [FALog infoPointer:value withName:#value inFunction:__func__]

+ (void)infoString:(NSString*)value withName:(const char*)name inFunction:(const char*)function;
#define Log_infoString(value) [FALog infoString:value withName:#value inFunction:__func__]

+(void)infoInFunction:(const char*)function format:(NSString*)format, ...;
#define Log_infoFormat( ... ) [FALog infoInFunction:__func__ format:__VA_ARGS__]


#pragma mark -
#pragma mark Warning

+ (void)warn:(NSString *)message inFunction:(const char*)function;
#define Log_warn(message) [FALog warn:message inFunction:__func__]

+(void)warnBool:(BOOL)value withName:(const char*)name inFunction:(const char*)function;
#define Log_warnBool(value) [FALog warnBool:value withName:#value inFunction:__func__]

+ (void)warnCallTo:(NSString*)methodName failedWithErrno:(int)value inFunction:(const char*)function;
#define Log_warnCallFailed(methodName,errorCode) [FALog warnCallTo:methodName failedWithErrno:errorCode inFunction:__func__]


+ (void)warnDouble:(double)value withName:(const char*)name inFunction:(const char*)function;
#define Log_warnDouble(value) [FALog warnFloat:value withName:#value inFunction:__func__]

+(void)warnError:(NSError*)error withName:(const char*)name inFunction:(const char*)function;
#define Log_warnError(error) [FALog warnError:error withName:#error inFunction:__func__]

+ (void)warnException:(NSException *)e withName:(const char*)name inFunction:(const char*)function;
#define Log_warnException(exception) [FALog warnException:exception withName:#exception inFunction:__func__]

+ (void)warnFloat:(double)value withName:(const char*)name inFunction:(const char*)function;
#define Log_warnFloat(value) [FALog warnFloat:value withName:#value inFunction:__func__]

+ (void)warnInt:(long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_warnInt(value) [FALog warnInt:value withName:#value inFunction:__func__]

+ (void)warnLong:(long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_warnLong(value) [FALog warnLong:value withName:#value inFunction:__func__]

+ (void)warnLongLong:(long long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_warnLongLong(value) [FALog warnLongLong:value withName:#value inFunction:__func__]

+ (void)warnPointer:(void*)value withName:(const char*)name inFunction:(const char*)function;
#define Log_warnPointer(value) [FALog warnPointer:value withName:#value inFunction:__func__]

+ (void)warnString:(NSString *)value withName:(const char*)name inFunction:(const char*)function;
#define Log_warnString(value) [FALog warnString:value withName:#value inFunction:__func__]

+(void)warnInFunction:(const char*)function format:(NSString *)format, ...;
#define Log_warnFormat( ... ) [FALog warnInFunction:__func__ format:__VA_ARGS__]

#pragma mark -
#pragma mark Error

+ (void)error:(NSString *)message inFunction:(const char*)function;
#define Log_error(message) [FALog error:message inFunction:__func__]

+(void)errorBool:(BOOL)value withName:(const char*)name inFunction:(const char*)function;
#define Log_errorBool(value) [FALog errorBool:value withName:#value inFunction:__func__]

+ (void)errorCallTo:(NSString*)methodName failedWithErrno:(int)value inFunction:(const char*)function;
#define Log_errorCallFailed(methodName,errorCode) [FALog errorCallTo:methodName failedWithErrno:errorCode inFunction:__func__]

+ (void)errorDouble:(double)value withName:(const char*)name inFunction:(const char*)function;
#define Log_errorDouble(value) [FALog errorDouble:value withName:#value inFunction:__func__]

+(void)errorError:(NSError*)error withName:(const char*)name inFunction:(const char*)function;
#define Log_errorError(error) [FALog errorError:error withName:#error inFunction:__func__]

+ (void)errorException:(NSException *)e withName:(const char*)name inFunction:(const char*)function;
#define Log_errorException(exception) [FALog errorException:exception withName:#exception inFunction:__func__] 

+ (void)errorFloat:(double)value withName:(const char*)name inFunction:(const char*)function;
#define Log_errorFloat(value) [FALog errorFloat:value withName:#value inFunction:__func__]

+(void)errorInFunction:(const char*)function format:(NSString *)format, ...;
#define Log_errorFormat( ... ) [FALog errorInFunction:__func__ format:__VA_ARGS__]

+ (void)errorInt:(long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_errorInt(value) [FALog errorInt:value withName:#value inFunction:__func__]


+ (void)errorLong:(long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_errorLong(value) [FALog errorLong:value withName:#value inFunction:__func__]

+ (void)errorLongLong:(long long)value withName:(const char*)name inFunction:(const char*)function;
#define Log_errorLongLong(value) [FALog errorLongLong:value withName:#value inFunction:__func__]

+ (void)errorString:(NSString *)value withName:(const char*)name inFunction:(const char*)function;
#define Log_errorString(value) [FALog errorString:value withName:#value inFunction:__func__]

+ (void)errorUtf8String:(const char*)value withName:(const char*)name inFunction:(const char*)function;
#define Log_errorUtf8String(value) [FALog errorUtf8String:value withName:#value inFunction:__func__]

@end


// ^^^ derived from https://github.com/rlong/jsonbroker.objective_c/blob/master/src/jsonbroker.library/common/log/FALog.h

