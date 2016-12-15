//
//  PhoneDialer.m
//

#import "PhoneDialer.h"

@implementation PhoneDialer

// make phone call
- (void) call: (CDVInvokedUrlCommand *) command
{
    [self.commandDelegate runInBackground:^{

        CDVPluginResult* pluginResult = nil;

        NSString* number = [command.arguments objectAtIndex:0];
        UIDevice *device = [UIDevice currentDevice];
        
        if ([[device model] isEqualToString:@"iPhone"]) {
            if (number != nil && [number length] > 0) {
                if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];) {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feature"];
                } else {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                }
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"empty"];
            }
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"empty"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}


// ios does not support open dial, so we make the phone call here 
- (void) dial: (CDVInvokedUrlCommand *) command
{
    [self.commandDelegate runInBackground:^{
        
        CDVPluginResult* pluginResult = nil;

        NSString* number = [command.arguments objectAtIndex:0];
        UIDevice *device = [UIDevice currentDevice];
        
        if ([[device model] isEqualToString:@"iPhone"]) {
            if (number != nil && [number length] > 0) {
                if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];) {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feature"];
                } else {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                }
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"empty"];
            }
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"empty"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

@end
