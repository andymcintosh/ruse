var page = require('webpage').create(),
    t, address, body;

if (phantom.args.length === 0) {
    console.log('Usage: loadspeed.js <some URL>');
    phantom.exit();
} else {
    t = Date.now();
    address = phantom.args[0];
    page.onConsoleMessage = function(msg) {
        body = page.evaluate(function() {
            return 
        });
        console.log(page.content);  
        phantom.exit();
    }
    page.open(address);
    // page.open(address, function (status) {
    //     if (status !== 'success') {
    //         console.log('FAIL to load the address');
    //     } else {
    //         body = page.evaluate(function() {
    //             // return document.body.innerHTML;
    //             window.addEventListener('phantom:exit', function() {
    //                 console.log("phantom exit");
    //             });
    //         });
    //         console.log(body);  

    //     }
    //     // phantom.exit();
    // });
}