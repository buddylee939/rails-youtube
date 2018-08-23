<link rel="stylesheet" href="style.css">

# Deanin youtube channel - Ruby on Rails 5 Absolute Beginner - https://www.youtube.com/watch?v=tVVQLMKCpj0

- rails new absolute-beginner
- rails g controller Posts
- in posts controller, create index action
- in routes

```
get 'posts', to: 'posts#index'
```

- create posts/index.html
- rails g model Post title:string body:text
- rails db:migrate
- in routes

```
get 'posts/new', to: 'posts#new'
```

- in posts controller

```
def new
end
```

- create posts/new
- add the gem 'simple_form'

### in terminal type: bundle list to see all the gems installed in alphabetical order 

- rails g simple_form:install
- add the form to /new

```
<h1>Create new post</h1>

<%= simple_form_for(@post) do |f| %>
  <%= f.input :title %>
  <%= f.input :body %>
  <%= f.submit %>
<% end %>
```

- in routes

```
post 'posts', to: 'posts#create'
```

- in post controller

```
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'You created a post!'
    else
      render 'new', alert: 'Your post was not created.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
```

-  update index action in controller

```
  def index
    @posts = Post.all
  end
```

- in index page

```

```

- in routes

```
get 'posts/:id', to: 'posts#show', as: :post
```

- for edit, in routes type

```
get 'posts/:id/edit', to: 'posts#edit', as: :edit_post
```

- for update, in routes

```
patch 'posts/:id', to: "posts#update"
```

- for destroy, in routes

```
delete 'posts/:id', to: 'posts#destroy', as: :delete_post
```

## the routes with each route for each resource for post

- it has to be in this order, if we put the show before new like in the controller, it will give an error trying to find the post with :id
- 
```
Rails.application.routes.draw do
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  get 'posts/:id/edit', to: 'posts#edit', as: :edit_post
  patch 'posts/:id', to: "posts#update"
  get 'posts/:id', to: 'posts#show', as: :post
  delete 'posts/:id', to: 'posts#destroy', as: :delete_post
end
```


