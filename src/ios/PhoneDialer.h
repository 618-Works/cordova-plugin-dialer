//
//  PhoneDialer.h
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface PhoneDialer : CDVPlugin

- (void) dialPhone:(NSMutableArray *)arguments withDict:(NSMutableDictionary *) options;

@end

