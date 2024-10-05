


class AuditsController < ApplicationController
  before_action :set_audit, only: %i[ show edit update destroy ]

  # GET /audits or /audits.json
  def index
    @audits = Audit.all

    respond_to do |format|
      format.html { render Audits::IndexView.new(audits: @audits) }
      format.json
    end
  end

  # GET /audits/1 or /audits/1.json
  def show
    respond_to do |format|
      format.html { render Audits::ShowView.new(audit: @audit) }
      format.json
    end
  end

  # GET /audits/new
  def new
    render Audits::NewView.new(audit: Audit.new)
  end

  # GET /audits/1/edit
  def edit
    render Audits::EditView.new(audit: @audit)
  end

  # POST /audits or /audits.json
  def create
    @audit = Audit.new(audit_params)

    respond_to do |format|
      if @audit.save
        format.html { redirect_to audit_url(@audit), notice: "Audit was successfully created." }
        format.json { render :show, status: :created, location: @audit }
      else
        format.html { render Audits::NewView.new(audit: @audit), status: :unprocessable_entity }
        format.json { render json: @audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audits/1 or /audits/1.json
  def update
    respond_to do |format|
      if @audit.update(audit_params)
        format.html { redirect_to audit_url(@audit), notice: "Audit was successfully updated." }
        format.json { render :show, status: :ok, location: @audit }
      else
        format.html { render Audits::EditView.new(audit: @audit),
          status: :unprocessable_entity }
        format.json { render json: @audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audits/1 or /audits/1.json
  def destroy
    @audit.destroy!

    respond_to do |format|
      format.html { redirect_to audits_url, notice: "Audit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit
      @audit = Audit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def audit_params
      params.require(:audit).permit(:created_at, :auditable_id, :auditable_type)
    end
end
