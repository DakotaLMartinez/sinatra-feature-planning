class EventsController < ApplicationController

  # GET: /events
  get "/events" do
    erb :"/events/index.html"
  end

  # GET: /events/new
  get "/events/new" do
    erb :"/events/new.html"
  end

  # POST: /events
  post "/events" do
    redirect "/events"
  end

  # GET: /events/5
  get "/events/:id" do
    erb :"/events/show.html"
  end

  # GET: /events/5/edit
  get "/events/:id/edit" do
    erb :"/events/edit.html"
  end

  # PATCH: /events/5
  patch "/events/:id" do
    redirect "/events/:id"
  end

  # DELETE: /events/5/delete
  delete "/events/:id/delete" do
    redirect "/events"
  end
end
