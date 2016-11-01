//
//  PhoneDialer.h
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface PhoneDialer : CDVPlugin

- (void) call:(NSMutableArray *)arguments withDict:(NSMutableDictionary *) options;

- (void) dial:(NSMutableArray *)arguments withDict:(NSMutableDictionary *) options;

@end

