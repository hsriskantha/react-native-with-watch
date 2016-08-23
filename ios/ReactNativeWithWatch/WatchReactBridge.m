//
//  WatchReactBridge.m
//  ReactNativeWithWatch
//

#import "RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(Watch, NSObject)

RCT_EXTERN_METHOD(sendMessage:(NSString*)title body: (NSString*) body);

@end
