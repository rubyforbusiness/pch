


class StatusChangesController < ApplicationController
  before_action :set_status_change, only: %i[ show edit update destroy ]

  # GET /status_changes or /status_changes.json
  def index
    @status_changes = StatusChange.all

    respond_to do |format|
      format.html { render StatusChanges::IndexView.new(status_changes: @status_changes) }
      format.json
    end
  end

  # GET /status_changes/1 or /status_changes/1.json
  def show
    respond_to do |format|
      format.html { render StatusChanges::ShowView.new(status_change: @status_change) }
      format.json
    end
  end

  # GET /status_changes/new
  def new
    render StatusChanges::NewView.new(status_change: StatusChange.new)
  end

  # GET /status_changes/1/edit
  def edit
    render StatusChanges::EditView.new(status_change: @status_change)
  end

  # POST /status_changes or /status_changes.json
  def create
    @status_change = StatusChange.new(status_change_params)

    respond_to do |format|
      if @status_change.save
        format.html { redirect_to status_change_url(@status_change), notice: "Status change was successfully created." }
        format.json { render :show, status: :created, location: @status_change }
      else
        format.html { render StatusChanges::NewView.new(status_change: @status_change), status: :unprocessable_entity }
        format.json { render json: @status_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_changes/1 or /status_changes/1.json
  def update
    respond_to do |format|
      if @status_change.update(status_change_params)
        format.html { redirect_to status_change_url(@status_change), notice: "Status change was successfully updated." }
        format.json { render :show, status: :ok, location: @status_change }
      else
        format.html { render StatusChanges::EditView.new(status_change: @status_change),
          status: :unprocessable_entity }
        format.json { render json: @status_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_changes/1 or /status_changes/1.json
  def destroy
    @status_change.destroy!

    respond_to do |format|
      format.html { redirect_to status_changes_url, notice: "Status change was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_change
      @status_change = StatusChange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_change_params
      params.require(:status_change).permit(:from, :to, :project_id)
    end
end
