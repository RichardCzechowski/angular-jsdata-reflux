#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

# Allow Node.js-style `global` in addition to `window`
if typeof(global) is 'undefined'
    window.global = window

angular = require 'angular'

# Load JSData libraries. The core library must be first.
require 'js-data'
require 'js-data-sql'
require 'js-data-angular'

# Include the Reflux module
require './modules/reflux'

# Add 'require' statements for your other Angular module files here.
require './modules/client_schema'
require './modules/mixins/mixins_module'
require './modules/nutrition_module'
require './modules/nutrition_store'


# Add all your modules here.
MODULES = [
    'reflux'
    'mixins'
    'nutrition'
]

############################################################################################################

angular.module 'app', MODULES
    .config ($locationProvider)->
        $locationProvider.html5Mode true

require './../read_only_view'
console.log "client is ready"
