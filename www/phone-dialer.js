var exec = require('cordova/exec');

var PhoneDialer = function() {}

/**
 * 打开电话拨号盘
 */
PhoneDialer.prototype.dial = function(phone_number, onSuccess, onError) {
    exec(onSuccess, onError, "PhoneDialer", "dialPhone", [phone_number]);
};

module.exports = new PhoneDialer();
