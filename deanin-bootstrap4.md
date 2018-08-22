<link rel="stylesheet" href="style.css">

# Deanin youtube channel - Bootstrap 4

- rails new bootstrap-demo
- in gemfile

```
gem 'bootstrap'
gem 'jquery-rails'
gem 'simple_form'
gem 'popper_js'
gem 'tether-rails'
```

- in app.js

```
//= require jquery3
//= require jquery_ujs
//= require popper
//= require tether
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .
```

- rails g simple_form:install --bootstrap

```
 Inside your views, use the 'simple_form_for' with the Bootstrap form
  class, '.form-inline', as the following:

    = simple_form_for(@user, html: { class: 'form-inline' }) do |form|
```

- rename app.scss

```
/*this is the 'require tree'*/
@import '/*';
@import 'bootstrap';
@import 'tether';
```

- rails g scaffold Poem title:string body:text
- rails db:migrate
- rails s
- localhost/poems/new
- create shared folder, _nav.html.erb partial
- add navbar

```
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
```

- 
