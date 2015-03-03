module.exports = capture;

// attempt to match a named request parameter with the given regex and replace
// the value with the capture.  If it doesn't match routes using the parameter
// are rejected.
function capture(regex) {
    return function (req, res, next, val, name) {
        var capture;

        if (capture = regex.exec(val)) {
            req.params[name] = capture;
            next();
        } else {
            next('route');
        }
    };
}
