App.Router.map ()->
  location: 'auto'
  rootURL: '/'
  @resource 'leads', path: '/', ->
    @route 'new'
    @resource 'lead', path: '/leads/:id', ->
      @route 'edit'
