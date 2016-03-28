#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

angular        = require 'angular'
_              = require 'underscore'
{EVENT}        = require '../../../constants'

############################################################################################################

angular.module('toggle').factory 'ToggleActions', (reflux)->
    reflux.createActions ['open', 'close', 'toggle']

############################################################################################################

angular.module('toggle').factory 'ToggleStore', (ToggleActions, reflux)->
    reflux.createStore
        init: ->
            @_data = {}

        listenables: ToggleActions

        get: (id) ->
            if @_data[id] == undefined then @_data[id] = false
            return @_data[id]

        onOpen: (id) ->
            @_data[id] = true
            @trigger EVENT.CHANGE

        onClose: (id) ->
            @_data[id] = false
            @trigger EVENT.CHANGE

        onToggle: (id) ->
            @_data[id] = !@_data[id]
            @trigger EVENT.CHANGE
