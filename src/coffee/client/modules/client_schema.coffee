#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

angular = require 'angular'

############################################################################################################

module.exports = schema = angular.module 'schema', ['js-data']

schema.factory 'NutritionFactory', (DS)->
    return DS.defineResource require '../../model/nutrition'
