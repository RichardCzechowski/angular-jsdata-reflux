- Start with Andrew’s angular client starter project
  * https://github.com/aminer-looker/starter-project
  * Follow install steps
- Create a Mysql database of your choosing
  * I used https://github.com/nmaster/usdanl-sr28-mysql to create a db of nutrition facts
- Install js-data and reflux via npm
  * `npm install --save when`
  * `npm install --save mysql knex js-data js-data-sql`
  * `npm install --save js-data-angular`
  * `npm install --save react reflux-core`
- In server.coffee, make sure the 'when' library is loaded before jsData
- In client.coffee, require any new modules, js-data, etc.
  * Ex: `require 'js-data'`
  * Add new modules to the MODULES array
- Add your server schema (server_schema.coffee)
  * This adds a count method to your resources
- Configure your store (server.coffee  _configureStore)
  * This is your connection to your database
- Define a model for your resource (nutrition.coffee)
  * Add resource to server_schema `exports.Nutrition = store.defineResource require '../model/nutrition'`
  * Add a route `router.get '/nutrition', (req, res) -> ...`
  * You should now be able to navigate to your endpoints `Ex: http://localhost:8080/nutrition` and see the JSON for your response.
  * Create a file called client_schema.coffee and define a client side resource there
  * NOTE: The `idAttribute` property needs to reflect the id column of your database, for the nutrition database this is `NDB_No`
- Add a module for your endpoint
  * See nutrition_module.coffee
  * Include that module in client.coffee
  * You can now use this module to display your data in your template
- At this point JS-DATA is pretty much implemented, now we will implement Reflux
  * Initially did these next four steps earlier, thinking I'd be implementing reflux simultaneously, so they are out of order in the commits.
- Create an angular reflux listener module (reflux.coffee)
  * Wrap reflux to allow angular to update in response to store changes
- Create a readOnlyView (read_only_view.coffee)
  * A readOnlyview is an immutable representation of a piece of data. It should be immutable and throw errors when attempts to change it are made
  * In order to change a readOnlyView, the user must use a reflux action to call for a change in the model's store
- Create a mixin module to store mixins (mixins_module.coffee)
- Create a little mixin for underscore too (underscore.coffee)
- Create a Model store mixin so that we have a set of default getters and setters for our models
- Add global events (constants.coffee)
  * This creates some standard event strings available throughout the app
- Create a store to house the direct js-data calls that we had previously made from nutrition_module.coffee
  * The store needs to subscribe to a list of events (NutritionModelActions)
  * The store gets the mixin that we created to flesh out it's actions
  * Throw an ng-repeat into our template so we can see the results
