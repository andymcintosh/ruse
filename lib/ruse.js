var page = require('webpage').create(),
    address;

if (phantom.args.length === 0) {
    console.log('Usage: ruse.js <some URL>');
    phantom.exit();
} else {
    address = phantom.args[0];
    page.onConsoleMessage = function(msg) {
        if (msg.indexOf('::ruse::') != -1);
        console.log(page.content); 
        phantom.exit();
    }
    page.open(address);
}