class CommentThreadsController < ApplicationController
  # GET /comment_threads
  # GET /comment_threads.xml
  def index
    sort = case params[:sort]
             when "title" then
               "title"
             when "owner" then
               "user_id"
             when "created_at" then
               "created_at"
             when "comments_count" then
               "comments_count"
             when "title_reverse" then
               "title DESC"
             when "owner_reverse" then
               "user_id DESC"
             when "created_at_reverse" then
               "created_at DESC"
             when "comments_count_reverse" then
               "comments_count DESC"
           end

#    if sort.starts_with? 'number_of_comments'
#      @comment_threads = CommentThread.all().sort_by { |t| -t.comments.size }
#
#      if sort.ends_with? 'DESC'
#        @comment_threads = @comment_threads.reverse
#      end
#
##      @comment_threads = CommentThread.all(:select => "#{CommentThread.table_name}.*, COUNT(#{Comment.table_name}.id) number_of_comments",
##                                           :joins => :comments,
##                                           :order => "number_of_comments DESC")
#
#    else
      @comment_threads = CommentThread.order(sort)
#    end


    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @comment_threads }
    end
  end

  # GET /comment_threads/1
  # GET /comment_threads/1.xml
  def show
    @comment_thread = CommentThread.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @comment_thread }
    end
  end

  # GET /comment_threads/new
  # GET /comment_threads/new.xml
  def new
    @comment_thread = CommentThread.new
    @comment_thread.user_id = 1

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @comment_thread }
    end
  end

  # GET /comment_threads/1/edit
  def edit
    @comment_thread = CommentThread.find(params[:id])
  end

  # POST /comment_threads
  # POST /comment_threads.xml
  def create
    @comment_thread = CommentThread.new(params[:comment_thread])

    respond_to do |format|
      if @comment_thread.save
        format.html { redirect_to(@comment_thread, :notice => 'Comment thread was successfully created.') }
        format.xml { render :xml => @comment_thread, :status => :created, :location => @comment_thread }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @comment_thread.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comment_threads/1
  # PUT /comment_threads/1.xml
  def update
    @comment_thread = CommentThread.find(params[:id])

    respond_to do |format|
      if @comment_thread.update_attributes(params[:comment_thread])
        format.html { redirect_to(@comment_thread, :notice => 'Comment thread was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @comment_thread.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_threads/1
  # DELETE /comment_threads/1.xml
  def destroy
    @comment_thread = CommentThread.find(params[:id])
    @comment_thread.destroy

    respond_to do |format|
      format.html { redirect_to(comment_threads_url) }
      format.xml { head :ok }
    end
  end

  def new_comment
    @comment = Comment.new
    @comment.user_id = 1
    @comment.comment_thread_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @comment }
    end
  end

  def create_comment
    @comment = Comment.new(params[:comment])
    @comment.user_id = 1
    @comment_thread = CommentThread.find(@comment.comment_thread_id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment_thread) }
        format.xml { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

end
