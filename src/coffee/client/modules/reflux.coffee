angular = require 'angular'
reflux = require 'reflux-core'

##############################

refluxModule = angular.module 'reflux', []

refluxModule.factory 'reflux', ->
  # Reflux storeMethods is a mixin for the reflux store
  # In this instance, we create a $listen which allows angular to be aware of changes via an apply
  reflux.StoreMethods.$listen = ($scope, callback) ->
    @listen (event, id) ->
      $scope.$apply ->
        callback(event, id)

    return reflux
