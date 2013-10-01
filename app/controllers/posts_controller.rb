class PostsController < ApplicationController
  
  before_filter :authenticate, :except => [:index, :show, :rss, :about]

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find(:all, :order => "created_at DESC")
    @theTags = Post.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
  
  # GET /posts/1
  # GET /posts/1.xml
  def show
    @posts = Post.find(:all)
    @post = Post.find(params[:id])
    @theTags = Post.find(:all)
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  # GET /posts/new
  # GET /posts/new.xml
  def new
    @posts = Post.find(:all)
    @post = Post.new
    @theTags = Post.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @posts = Post.find(:all)
    @post = Post.find(params[:id])
    @theTags = Post.find(:all)
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @posts = Post.new
    @theTags = Post.find(:all)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    @theTags = Post.find(:all)

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @theTags = Post.find(:all)
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  def rss
    @posts = Post.find( :all, :order => "id DESC", :limit => 10 )

    render :layout => false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  def about
    @posts = Post.find( :all )
    @theTags = Post.find( :all )
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
end
