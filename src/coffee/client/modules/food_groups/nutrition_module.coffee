#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

angular = require 'angular'
templates = require '../../templates'

############################################################################################################

nutrition = angular.module 'nutrition', ['schema', 'reflux']

require './nutrition_store'

# Controllers ##########################################################################

class NutritionController

    constructor: ($scope, NutritionStore, NutritionModelActions) ->
        @Nutrition = NutritionStore
        @nutrition = null
        @error = null
        @$scope = $scope

        NutritionStore.$listen $scope, (event, id)->
            $scope.nutritionData = NutritionStore.get()
        NutritionModelActions.load()

nutrition.controller 'NutritionController', NutritionController

nutrition.directive 'home', ->
    return {
        restrict: 'C'
        controller: 'NutritionController'
        scope: {}
        template: templates['home']
    }

# add more things to your module here...

