# Map the CRUD actions (create, read, update, delete) to their matching Sinatra routes and HTTP verbs. For example: In a blog app, displaying the content of one particular blog post corresponds to the "Read" CRUD action and the show RESTful route. The matching route would be an HTTP Get request to '/posts/:id' where the id is that particular post's id i.e. '/posts/6' .
# Build an HTML form to create a new blog post. Then, build a form to edit a post. What are the differences between the two? What routes do they send requests to? What type of requests should each form make?
# Revisit your CRUD action-to-route map. What view files, if any, does each action/route correspond to?
# Write out the Active Record code to preform CRUD actions on a Post model.
# Let's think about the domain model for a To-Do list application. Let's say you have a List model and an Item model.
# What is the relationship between a list and an item?
# A user needs to be able to visit your app, create a new list and then add items to that list. What route would bring the user to the the page to make a new list? What route would take them to the page to make a new item?
# How and where would you write the code that associates a new item to its list?

# our pseudo schema:
# table_name	columns
# posts			:id, :title, :author, :date, :body

class ApplicationController < Sinatra::Base

    get '/posts' do
        @posts = Post.all    
		erb :index	
	end

    get '/posts/new' do
        erb :new
    end
	
	post '/posts' do
		@post = Post.new(params["post"])
		redirect to "/posts/#{@post.id}"
	end
	
    get '/posts/:id' do
        @post = Post.find(params[:id])
        erb :show
    end

    get '/posts/:id/edit' do
       @post = Post.find(params[:id])
       erb :edit
	end
	
	patch '/posts/:id' do
        post = Post.find(params[:id])
        post.update(params["post"])
        redirect to "/posts/#{@post.id}"
	end

	delete '/posts/:id' do
        Post.destroy(params[:id])
        redirect to "/posts"
	end

end
