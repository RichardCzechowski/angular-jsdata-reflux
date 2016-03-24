- Start with Andrew’s angular client starter project
  * https://github.com/aminer-looker/starter-project
  * Follow install steps
- Install js-data and reflux via npm
  * `npm install js-data --save`
  * `npm install js-data-angular --save`
  * `npm install js-data-localstorage --save`
  * `npm install reflux-core --save`
- Create an angular reflux listener module (reflux.coffee)
  * Wrap reflux to allow angular to update in response to store changes
- Create a readOnlyView (read_only_view.coffee)
  * A readOnlyview is an immutable representation of a piece of data. It should be immutable and throw errors when attempts to change it are made
  * In order to change a readOnlyView, the user must use a reflux action to call for a change in the model's store
