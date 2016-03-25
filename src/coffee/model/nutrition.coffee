#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

_ = require 'underscore'

############################################################################################################

module.exports =
    idAttribute: 'NDB_No'
    name:     'nutrition'
    endpoint: '/nutrition'
    table:    'FOOD_DES'
    # methods: You can extend this with methods like .toJSON, etc.
