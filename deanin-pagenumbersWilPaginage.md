<link rel="stylesheet" href="style.css">

# Deanin youtube channel - Page Numbers With Will Paginate (Covers Arrays) | Ruby On Rails 5.2
[from here](https://www.youtube.com/watch?v=nOe5Sd-f_Ig)

- rails new willPaginate
- add the will paginate gem
- bundle
- rails g scaffold Post title body:text
- rails db:migrate
- update the index action in post controller

```
  def index
    @posts = Post.paginate(page: params[:page])
  end
```

- in post.rb add:

```
self.per_page = 3
```

- in the index page add

```
<%= will_paginate(@posts) %>
```

- refresh and test out

# the end


