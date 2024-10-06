


class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html { render Comments::IndexView.new(comments: @comments) }
      format.json
    end
  end

  # GET /comments/1 or /comments/1.json
  def show
    respond_to do |format|
      format.html { render Comments::ShowView.new(comment: @comment) }
      format.json
    end
  end

  # GET /comments/new
  def new
    project = Project.where(id: params[:project_id]).first
    render Comments::NewView.new(comment: Comment.new(project: project))
  end

  # GET /comments/1/edit
  def edit
    render Comments::EditView.new(comment: @comment)
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_conversation_history_url(@comment.project), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render Comments::NewView.new(comment: @comment), status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render Comments::EditView.new(comment: @comment),
          status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:text, :project_id)
    end
end
