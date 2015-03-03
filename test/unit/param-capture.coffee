sinon = require 'sinon'

describe "param-capture", ->
    capture = require '../../lib/param-capture'
    next = null
    req = null
    res = null

    beforeEach ->
        next = sinon.stub()
        req =
            params: {}
        res = {}

    it "rejects values does not match the regexp", ->
        c = capture /foo/
        c req, res, next, 'fob', 'name'

        assert.calledOnce next
        assert.calledWith next, 'route'

    it "replaces the value in req params with the capture", ->
        c = capture /foo(.*)/
        c req, res, next, 'foobar', 'name'

        assert.calledOnce next
        assert.equal req.params.name[0], 'foobar'
        assert.equal req.params.name[1], 'bar'
