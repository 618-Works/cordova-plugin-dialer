var exec = require('cordova/exec');

var PhoneDialer = function() {}

/**
 * make phone call
 * @params { number } phone number
 * @params { function } success callback
 * @params { function } error callback
 * @return none
 */
PhoneDialer.prototype.call = function(phone_number, onSuccess, onError) {
    exec(onSuccess, onError, "PhoneDialer", "call", [phone_number]);
};

/**
 * open the dial 
 * @params { number } phone number
 * @params { function } success callback
 * @params { function } error callback
 * @return none 
 */
PhoneDialer.prototype.dial = function(phone_number, onSuccess, onError) {
    exec(onSuccess, onError, "PhoneDialer", "dial", [phone_number]);
};

module.exports = new PhoneDialer();
