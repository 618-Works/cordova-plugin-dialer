//
//  PhoneDialer.m
//

#import "PhoneDialer.h"

@implementation PhoneDialer

// make phone call
- (void) call: (CDVInvokedUrlCommand *) command
{
    NSString* number = [command.arguments objectAtIndex:0];
    UIDevice *device = [UIDevice currentDevice];
    
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];
    }
}


// ios does not support open dial, so we make the phone call here 
- (void) dial: (CDVInvokedUrlCommand *) command
{
    NSString* number = [command.arguments objectAtIndex:0];
    UIDevice *device = [UIDevice currentDevice];
    
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];
    }
}

@end
