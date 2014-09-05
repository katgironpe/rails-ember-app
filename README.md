# Rails and Ember.js App


## Some known best practices


### Use nested module/class definitions instead of compact style.

Preferred:

```ruby
# app/controllers/api/v1/leads_controller.rb
module Api
  module V1
    class LeadsController < ApplicationController
      respond_to :json
    end
  end
end
```

Not preferred:

```ruby
# app/controllers/api/v1/leads_controller.rb
class Api::V1::LeadsController < ApplicationController
  respond_to :json
  # methods
end
```

The routes should look like:

```ruby
# config/routes.rb

namespace :api, defaults: { format: 'json' } do
  scope module: :v1 do
    resources :leads
  end
end
```

If you're not going to use modules, it would look like:

```ruby
# config/routes.rb

namespace :api do
  namespace :v1 do
    resources :leads
  end
end
```

### A JSON API document should be identified by the media type `application/vnd.api+json`

We achieve this by autoloading a module:

```ruby
# lib/api_constraints.rb 
class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.myapp.v#{@version}")
  end
end
```

And updating routes to use this module:

```ruby
namespace :api, defaults: { format: 'json' } do
  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
    resources :leads
  end
end
```

Making this work with Ember.js is simple.
Simply include `headers` on `app/assets/javascripts/store.js.coffee`

```coffee
DS.RESTAdapter.reopen
  namespace: 'api'
  headers: {
    "Accept": "application/vnd.myapp.v1+json"
  }
```

## Resources

* <a href="http://ember.vicramon.com/creating-the-rails-api" target="_blank">Vic Ramon's Ember tutorial</a>
* <a href="https://github.com/json-api/json-api" target="_blank">JSON API</a>
