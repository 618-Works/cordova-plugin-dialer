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

    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
    }

    @Override  
    public boolean execute (String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        try{
            if (action.equals("dialPhone")) {
                this.dialPhone(args.getString(0), callbackContext);
            }

            callbackContext.success();
        } catch (Exception e){  
            callbackContext.error("can not call");  
        }  

        return true;
    }

    //拨打电话  
    private void dialPhone (String phonenumber, CallbackContext callbackContext) {  
        if (phonenumber != null && phonenumber.length() > 0) {  
            Intent i = new Intent();

            i.setAction(Intent.ACTION_CALL);
            i.setData(Uri.parse("tel:" + phonenumber));

            this.cordova.startActivityForResult(this, i, 0);
        } else {
            callbackContext.error("phone number can not be empty");  
        }
    }
}  