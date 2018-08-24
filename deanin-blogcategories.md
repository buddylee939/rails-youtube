<link rel="stylesheet" href="style.css">

# Deanin youtube channel - Make Your First Category System For Rails Blog App Fast | Ruby On Rails
[from here](https://www.youtube.com/watch?v=_xKglx3ox0Q)

- rails new blogCategories
- add simple form
- rails g simple_form:install
- rails g scaffold Post title body:text category_id:integer
- rails g scaffold Category name description:text display_in_navbar:boolean
- in the migration file for category update code

```
t.boolean :display_in_navbar, default: true
```

- rails db:migrate
- in posts index add link to new category

```
<h1>Posts | <%= link_to 'New Category', new_category_path %></h1>
```

- create 3 categories, 1 disply in navbar, 2 not
- in category.rb: has_many :posts, in post.rb: belongs_to :category
- update post index category with

```
<td><%= post.category.name %></td>
```

- in index page, add the category links

```
<h2>All Categories</h2>
<% Category.all.each do |cat| %>
  <%= link_to cat.name, posts_path(category: cat.name) %> <br>
<% end %>
<br>
<br>
<br>
<br>
<hr>
<h2>Categories only in navbar</h2>
<% Category.where(display_in_navbar: true).each do |cat| %>
  <%= link_to cat.name, posts_path(category: cat.name) %>
<% end %>
```

- update the index action in the posts controller

```
  def index
    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @posts = Post.where(category: @category)
    else      
      @posts = Post.all
    end
  end
```


## how I seeded it

```
Post.destroy_all
Category.destroy_all
ranNum = 0
bool = true
8.times do |cat|
  ranNum = rand(1..2)
  if ranNum == 1
    bool = true
  else
    bool = false
  end
  Category.create!(
    name: Faker::Vehicle.manufacture,
    description: Faker::Lorem.paragraphs(3),
    display_in_navbar: bool
  )
end

puts "8 categories created"

20.times do |post|
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs(10),
    category_id: rand(1..8)
  )
end

puts "20 posts created"
```

# the end