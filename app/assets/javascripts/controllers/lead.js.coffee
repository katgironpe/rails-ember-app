App.LeadController = Ember.ObjectController.extend
  isEditing: false
  actions:
    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'leads'
    saveChanges: -> @get('model').save() if @get('model.isDirty')
    showUnsavedMessage: ( ->
        @get('isDirty') and !@get('isSaving')
      ).property('isDirty', 'isSaving')
