class CommentsController < ApplicationController

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = 1
    @comment_thread = CommentThread.find(@comment.comment_thread_id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment_thread) }
        format.xml { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { redirect_to(@comment_thread) }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    @comment_thread = CommentThread.find(@comment.comment_thread_id)

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment_thread) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @comment_thread = CommentThread.find(@comment.comment_thread_id)

    respond_to do |format|
      format.html { redirect_to(@comment_thread) }
      format.xml { head :ok }
      format.js
    end
  end

end
