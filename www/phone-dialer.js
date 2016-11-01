var exec = require('cordova/exec');

var PhoneDialer = function() {}

/**
 * @des make phone call
 * params { number } phone number
 * params { function } success callback
 * params { function } error callback
 * return none
 */
PhoneDialer.prototype.dial = function(phone_number, onSuccess, onError) {
    exec(onSuccess, onError, "PhoneDialer", "call", [phone_number]);
};

/**
 * @des open the dial 
 * params { number } phone number
 * params { function } success callback
 * params { function } error callback
 * return none 
 */
PhoneDialer.prototype.openDial = function(phone_number, onSuccess, onError) {
    exec(onSuccess, onError, "PhoneDialer", "dial", [phone_number]);
};

module.exports = new PhoneDialer();
