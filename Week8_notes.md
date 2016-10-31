# Week 8 = Ruby rubyonrails
## Monday
Controllers - routing determines controller to use.
The controller then makes snese of the requests and produces output.

Controllers are given the plural form of the model name.
eg. Photo model = Photos controller

Controlle ris a ruby class and inherits from ApplicationController.

Rails creates an instance of that controller and runs the method.

## Params
Parameters are used to pass data between actions. Either in post data( a form's data) or in the URL.

Eg. we can run a search by adding a paramter - eg ?search=books to the URL and use that in the action.

eg localhost:3000/course_applications/new?course=1
 in action,
 if params[:course]
 @course = Course.find(params[:course])

can pas in multople data = eg. applications/new?course=1&intake=3

in action
if params[:intake]
  @intake = Intake.find(params[:intake])

if params[:course]
  @course = Course.find(params[:course])

## Sessions
Session is created between an app and browser. A cookie is created so the app remembers who the user is.

## Flash
A flash is a message that's available on the next requests
def create
  flash[:notice] = "You have created a course."
  redirect_to root_url
end

will allow the flash[:notice] to be displayed when you're redirected to the toor URL


you can also:

`redirect_to root_url, notice: "You have successsfully logged out"`

`redirect_to root_url, alert: "You're stuck here"`

##Filters

Filters are like callbacks focontrollers
can be run before, after and around actions

`before_action :get_course, only: [:show, :edit, :update]`

` skip_before_action :authenticate_user!, except: :index `

##Router

The Rails router recognises URLs and displatches them to a controller's action.

eg.
'`get /patients/17`'

it aske the router to match it to a controller action.

`get '/patients/:id', to: 'patients#show'`

the request is displateched to the patient show controller action with {id: 17} in params

`@patient = patient.find(:id)`

`<%= link_to "Patient Record",` `patient_path(@patient) %>`

CRUD - create, read, update, destroy

Single routes

`get 'profile', to: 'users#show'`

## NEsted Routes

localhost/courses/3/modules/4

represented in routes like this

`resources :courses do
  resources :modules
end`

## Nested routes

multiple parameters for nester

eg

`course_module_path(@course, @path)`

`form_for([@course, @module])`

## Redirect vs render

redirect_to performs a new action
`root_path root_url :back action :index`

render loads new template
`:new :edit render js: "alert("Hello Rails")" render json: @product`

##Layout

Asset Path Tags

##javascript_include_tag
`<%= javascript_include_tag 'application' %>`

`<%= image_tag 'johnny.jpg' %>`

asset_path
<%= asset_path 'bg.jpg' %>

Partials help reuse the code
render

##yield

looks for content to insert

`<%= content_for?(:title) ?yield(:title) : "Page Title" %>`

`<% provide(:title, "Home") %>
<!DOCTYPE html>
<html>
  <head>
    <title><%= yield(:title) %> | Ruby on Rails Tutorial Sample App</title>
  </head>`
