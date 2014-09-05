# Rails and Ember App


## Some known best practices

1. Use nested module/class definitions instead of compact style.

Preferred:

```ruby
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

