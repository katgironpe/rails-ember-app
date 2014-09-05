App.LeadsNewRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set 'fields', {}
