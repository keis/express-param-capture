# express-param-capture

[![NPM Version][npm-image]](https://npmjs.org/package/express-param-capture)
[![Build Status][travis-image]](https://travis-ci.org/keis/express-param-capture)
[![Coverage Status][coveralls-image]](https://coveralls.io/r/keis/express-param-capture?branch=master)

Process request parameters with regexp and use the resulting capturing group in
the routes.

like [express-params](https://www.npmjs.com/package/express-params) but works
properly in recent express releases where the use of `app.param(fun)` has been
deprecated.

# Usage

    app = express()
    capture = require('express-param-capture')

    app.param('locale', capture(/([a-z]{2})_([A-Z]{2})/));
    app.get('/:locale', function (req, res) {
        res.status(200).send(req.params.locale[1] + ' - ' + req.params.locale[2]);
    });


[npm-image]: https://img.shields.io/npm/v/exress-param-capture.svg?style=flat
[travis-image]: https://img.shields.io/travis/keis/express-param-capture.svg?style=flat
[coveralls-image]: https://img.shields.io/coveralls/keis/express-param-capture.svg?style=flat
