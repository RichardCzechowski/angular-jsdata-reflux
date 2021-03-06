#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

JsData = require 'js-data'
_      = require '../underscore'

############################################################################################################

exports.store = store = new JsData.DS()

exports.installExtensions = ->
    adapter = store.getAdapter 'sql'

    # Adds a "count" method to each Resource instance
    store.defaults.count = (applyFilter)->
        query = adapter.query.count('id as count').from(@table)
        if _.isFunction applyFilter then applyFilter query

        query.then (resultSet)->
            return resultSet[0].count

exports.Nutrition = store.defineResource require '../model/nutrition'
