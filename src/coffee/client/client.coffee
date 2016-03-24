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

# Ensures that the JSData adapter is registered properly
window.DSLocalStorageAdapter = require 'js-data-localstorage'
require 'js-data-angular'

# Include the Reflux module
require './modules/reflux'

# Add 'require' statements for your other Angular module files here.
require './modules/sample_module'


# Add all your modules here.
MODULES = [
    'reflux'
    'sample'
]

############################################################################################################

angular.module 'app', MODULES
    .config ($locationProvider)->
        $locationProvider.html5Mode true

require './../read_only_view'
console.log "client is ready"
