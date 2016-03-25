#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

express = require 'express'
constants  = require '../constants'
{Nutrition} = require './server_schema'
############################################################################################################

module.exports = router = express.Router()

# Add new routes to `router` here. Anything not described here will be assumed to be a static file request.

# Routes
######################################################################

router.get '/nutrition', (request, response) ->
    response.sendPromise ->
        Nutrition.findAll().then (items) ->
          return items
