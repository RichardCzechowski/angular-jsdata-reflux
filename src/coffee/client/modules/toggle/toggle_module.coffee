#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

angular = require 'angular'
templates = require '../../templates'

############################################################################################################

toggle = angular.module 'toggle', ['schema', 'reflux']

require './toggle_store'

# Controllers ##########################################################################

class ToggleController

    constructor: ($scope, ToggleStore, ToggleActions) ->
        ToggleStore.$listen $scope, (event, id)->
            $scope.isOpen = ToggleStore.get($scope.id)

        $scope.toggleOpen = (id) ->
            $scope.id = id
            ToggleActions.toggle(id)

toggle.controller 'ToggleController', ToggleController

toggle.directive 'toggle', ->
    return {
        restrict: 'C'
        controller: 'ToggleController'
    }

# add more things to your module here...

