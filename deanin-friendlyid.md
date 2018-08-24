<link rel="stylesheet" href="style.css">

# Deanin youtube channel - Pretty URLs With Friendly ID | Ruby On Rails 5.2 Tutorial
[from here](https://www.youtube.com/watch?v=uEw3Q5nLtPI)

- rails new friendlyid
- rails g scaffold Post title body:text
- rails db:migrate
- add the friendly id gem
- bundle
- rails g friendly_id
- rails db:migrate
- in the post.rb

```
  extend FriendlyId
  friendly_id :title, use: :slugged
```

- in posts controller update the find

```
    def set_post
      @post = Post.friendly.find(params[:id])
    end
```

- rails g migration add_slud_to_posts slug:string:uniq
- rails db:migrate
- rails s

## if you already had posts, before adding the friendly id gem

- go to rails c
- Post.find_each(&:save)

# the end