# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

App.Store = DS.Store.extend()
App.ApplicationAdapter = DS.ActiveModelAdapter.extend()

DS.RESTAdapter.reopen
  namespace: 'api'
  headers: {
    "Accept": "application/vnd.myapp.v1+json"
  }
