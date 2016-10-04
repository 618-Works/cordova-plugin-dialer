//
//  PhoneDialer.m
//

#import "PhoneDialer.h"

@implementation PhoneDialer


- (void) dialPhone: (CDVInvokedUrlCommand *) command
{
    NSString* number = [command.arguments objectAtIndex:0];
    UIDevice *device = [UIDevice currentDevice];
    
    if ([[device model] isEqualToString:@"iPhone"] ) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];
    }
}

@end
