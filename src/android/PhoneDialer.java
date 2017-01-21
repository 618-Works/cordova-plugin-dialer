package org.apache.cordova.dialer;  

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;

import org.json.JSONArray;  
import org.json.JSONException;  

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
  
public class PhoneDialer extends CordovaPlugin {

    /**
     * make phone call 
     * @param { CordovaInterface } cordova instance
     * @param { CordovaWebView } web view instance
     * @return none 
     */
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
    }


    /**
     * execute
     * @param { String } action
     * @param { JSONArray } arguments
     * @param { CallbackContext } callback context     
     * @return none 
     */
    @Override  
    public boolean execute (String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        try{
            if (action.equals("call")) {
                this.call(args.getString(0), callbackContext);
            } else if(action.equals("dial")) {
                this.dial(args.getString(0), callbackContext);
            }

            callbackContext.success();
        } catch (Exception e){  
            callbackContext.error("unexpected error");  
        }  

        return true;
    }

    /**
     * make phone call 
     * @param { String } phone number
     * @param { CallbackContext } callback context
     * @return none 
     */
    private void call (String phonenumber, CallbackContext callbackContext) {  
        if (phonenumber != null && phonenumber.length() > 0) {  
            Intent i = new Intent();

            i.setAction(Intent.ACTION_CALL);
            i.setData(Uri.parse("tel:" + phonenumber));

            this.cordova.startActivityForResult(this, i, 0);
        } else {
            callbackContext.error("phone number can not be empty");  
        }
    }

    /**
     * open the dial 
     * @param { String } phone number
     * @param { CallbackContext } callback context
     * @return none 
     */
    private void dial (String phonenumber, CallbackContext callbackContext) {  
        if (phonenumber != null && phonenumber.length() > 0) {  
            Intent i = new Intent();

            i.setAction(Intent.ACTION_DIAL);
            i.setData(Uri.parse("tel:" + phonenumber));

            this.cordova.startActivityForResult(this, i, 0);
        } else {
            callbackContext.error("phone number can not be empty");  
        }
    }    
}  