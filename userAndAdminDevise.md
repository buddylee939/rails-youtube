<link rel="stylesheet" href="style.css">

# Deanin youtube channel - User And Admin Accounts With Devise | Authentication Ruby On Rails 5.2 Tutorial
[from here](https://www.youtube.com/watch?v=7v2EMmfBJL8)

- rails new userAdminDevise
- add the devise gem
- bundle
- rails g devise:install
- do the todos
- add the alerts to a shared/alerts partial and render on layouts/app
- rails g devise User
- rails db:migrate
- rails g devise:views
- rails g controller Pages home
- in routes: root 'pages#home'
- in the pages/home add the links

```
<h1>Pages#home</h1>

<% if current_user %>
  <%= link_to 'Sign Out', destroy_user_session_path, method: :delete %>
<% else %>
  <%= link_to 'Sign Up', new_user_registration_path %>
  <%= link_to 'Sign In', new_user_session_path %>
<% end %>
```

- rails g migration add_admin_to_user admin:boolean
- go to the migration file and update the code

```
add_column :users, :admin, :boolean, default: false
```

- rails db:migrate
- rails c
- u = User.first (user admin should be false)
- u.admin = true
- u.save
- rails g scaffold Posts title body:text user_id:integer
- rails db:migrate
- in the home page add the link

```
<%= link_to 'Posts', posts_path %>
```

- get rid of user_id field in form
- get rid of user_id in posts controller, params
- update the create action with the user

```
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
```

- add the before action authenticate

```
before_action :authenticate_user!, except: [:show, :index]
```

- in post.rb

```
has_many :posts
```

- in user.rb

```
belongs_to :user
```

- in posts controller, update new and create actions

```
  def new
    @post = current_user.posts.build
  end
  def create
    @post = current_user.posts.build(post_params)
    # @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
```

- in show add the user email

```
<p>
  <strong>User:</strong>
  <%= @post.user.email.split('@')[0].capitalize %>
</p>
```

- or create a method in the user.rb

```
  def username
    return self.email.split('@')[0].capitalize
  end
```

- then change in show page

```
<p>
  <strong>User:</strong>
  <%= @post.user.username %>
</p>
```

- to allow only admins to edit and destroy posts in the index page update the code with an if 

```
<% if current_user && current_user.admin %>
  <td><%= link_to 'Edit', edit_post_path(post) %></td>
  <td><%= link_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' } %></td>
<% end %>
```    
