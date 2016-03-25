#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

angular = require 'angular'
templates = require '../templates'

############################################################################################################

nutrition = angular.module 'nutrition', ['schema']

# Controllers ##########################################################################

class NutritionController

    constructor: ($scope, NutritionFactory) ->
        @Nutrition = NutritionFactory
        @nutrition = null
        @error = null
        @$scope = $scope

        @refresh()

    refresh: ->
        @Nutrition.findAll()
            .then (nutrition) =>
                @nutrition = nutrition
                @$scope.nutrition = nutrition[0] #test
                console.log @$scope
                @$scope.$applyAsync()
            .catch (error) =>
                errorText = if error.data? then "#{error.data}" else "#{error}"
                console.error "Could not fetch nutrition: #{errorText}"
                @$scope.error = errorText

nutrition.controller 'NutritionController', NutritionController

nutrition.directive 'sampleGreeting', ->
    return {
        restrict: 'C'
        controller: 'NutritionController'
        scope: {}
        template: templates['sample-greeting']
    }

# add more things to your module here...

