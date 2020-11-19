class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
    @email = Email.find(params[:id])
    respond_to do |format|
            format.html {}
            format.js {}
    end
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(object: Faker::Cosmere.knight_radiant, body: Faker::ChuckNorris.fact, read: false)

    respond_to do |format|
      if @email.save
        format.html {redirect_to emails_path, notice: 'Email was successfully created.' }
        format.js {}
      else
        format.html { render :new }
        
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html {redirect_to @email, notice: 'Email was successfully updated.' }
        format.js {}
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy

    respond_to do |format|
      format.html {redirect_to emails_path, notice: 'Email was successfully destroyed.' }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:object, :body)
    end
end
