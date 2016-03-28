#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

angular = require 'angular'
_       = require '../../../underscore'

############################################################################################################

angular.module('nutrition').factory 'NutritionModelActions', (addModelStoreMixinActions)->
    return addModelStoreMixinActions {}

############################################################################################################

angular.module('nutrition').factory 'NutritionStore', (
    NutritionFactory, NutritionModelActions, ModelStoreMixin, reflux
)->
    reflux.createStore

        listenables: NutritionModelActions

        mixins: [ModelStoreMixin]

        # ModelStoreMixin Methods ######################################################

        _loadModel: (id)->
            return NutritionFactory.findAll()
