/** 
 * PhoneDialer.m
 */

#import "PhoneDialer.h"

@implementation PhoneDialer

/**
 * make phone call
 * @return none 
 */
- (void) call: (CDVInvokedUrlCommand *) command
{
    [self.commandDelegate runInBackground:^{

        CDVPluginResult* pluginResult = nil;
        NSString* number = [command.arguments objectAtIndex:0];
        
        if (number != nil && [number length] > 0) {
            if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"CouldNotCallPhoneNumber"];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            }
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"NumberIsEmpty"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}



/**
 * open the dial 
 * @return none 
 */
- (void) dial: (CDVInvokedUrlCommand *) command
{
    [self.commandDelegate runInBackground:^{
        
        CDVPluginResult* pluginResult = nil;
        NSString* number = [command.arguments objectAtIndex:0];
                  
        if (number != nil && [number length] > 0) {
            if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"CouldNotCallPhoneNumber"];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            }
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"NumberIsEmpty"];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

@end
