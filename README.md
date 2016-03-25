- Start with Andrew’s angular client starter project
  * https://github.com/aminer-looker/starter-project
  * Follow install steps
- Create a Mysql database of your choosing
  * I used https://github.com/nmaster/usdanl-sr28-mysql to create a db of nutrition facts
- Install js-data and reflux via npm
  * `npm install --save when`
  * `npm install --save mysql knex js-data js-data-sql`
  * `npm install js-data-angular --save`
  * `npm install reflux-core --save`
- In server.coffee, make sure the 'when' library is loaded before jsData
- Create an angular reflux listener module (reflux.coffee)
  * Wrap reflux to allow angular to update in response to store changes
- Create a readOnlyView (read_only_view.coffee)
  * A readOnlyview is an immutable representation of a piece of data. It should be immutable and throw errors when attempts to change it are made
  * In order to change a readOnlyView, the user must use a reflux action to call for a change in the model's store
- In client.coffee, require any new modules, js-data, etc.
  * Ex: `require 'js-data'`
  * Add new modules to the MODULES array
- Add your server schema (server_schema.coffee)
  * This adds a count method to your resources
- Configure your store (server.coffee  _configureStore)
  * This is your connection to your database
- Add global events (constants.coffee)
  * This creates some standard event strings available throughout the app
- Define a model for your resource (nutrition.coffee)
- Add resource to server_schema `exports.Nutrition = store.defineResource require '../model/nutrition'`
- Add a route `router.get '/nutrition', (req, res) -> ...`
- You should now be able to navigate to your endpoints `Ex: http://localhost:8080/nutrition` and see the JSON for your response.
