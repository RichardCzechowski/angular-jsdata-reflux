#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

express    = require 'express'
http       = require 'http'
middleware = require './middleware'
routes     = require './routes'
schema     = require './server_schema'
SqlAdapter = require 'js-data-sql'
w          = require 'when'
_          = require '../underscore'

############################################################################################################

module.exports = class Server

    constructor: (port)->
        if not port? then throw new Error 'port is mandatory'
        if not _.isNumber port then throw new Error 'port must be a number'
        @port = parseInt port

        app = express()
        app.disable 'etag'

        middleware.installBefore app
        app.use routes
        middleware.installAfter app

        @httpServer = http.createServer app
        @store      = @_configureStore()

    start: ->
        w.promise (resolve, reject)=>
            @httpServer.once 'error', (error)-> reject error
            @httpServer.listen @port, =>
                console.log "server listening on port #{@port}\n\n"
                resolve this

    stop: ->
        w.promise (resolve, reject)=>
            console.log "server is shutting down"
            @httpServer.close() =>
                resolve this

# Private Methods ##################################################################

    _configureStore: ->
        adapter = new SqlAdapter
            client: 'mysql'
            connection:
                host: 'localhost'
                database: 'usdanlsr28'
                user: 'root'
                password: 'root'
            debug: false

        schema.store.registerAdapter 'sql', adapter, default:true
        schema.installExtensions()
        return schema.store

############################################################################################################

if require.main is module
    port = parseInt process.argv[2]
    port = if _.isNaN port then 8080 else port

    server = new Server port
    server.start()

    process.on 'SIGINT', ->
        server.stop().finally ->
            process.exit()
