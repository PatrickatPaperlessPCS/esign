class DocumentsController < ApplicationController
  before_filter :authenticate_user!, except: [:edit, :update]
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = current_user.documents.order("created_at DESC").paginate(:page => params[:page], :per_page => 15)
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render    :pdf => "file.pdf",
                  :template => 'documents/show.html.erb',
                  :javascript_delay => '5000',
                  :page_size =>        'Letter',
               margin:  {   top:               5,                     # default 10 (mm)
                            bottom:            5,
                            left:              0,
                            right:             0 }                  
       end        
     end  
  end

  # GET /documents/new
  def new
      if current_user.documents.count >= 10 && !current_user.subscribed
        redirect_to new_charge_path
      else
        @document = Document.new
        @document.user_id = current_user.id
        @available_templates = @current_user.templates.map{|tmplt| [tmplt.name, tmplt.id]}

      end
  end
  # GET /documents/1/edit
  def edit
    # Remove and edit this so that it validates against the token and id
    #if @document.signature.present?
    #redirect_to pages_error_path
  #else
    @document = Document.find_by(authentication_token: params[:authentication_token], id: params[:id])
    #end
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = @document = Document.new(document_params)
    @document.user_id = current_user.id
    #@document.template_name = @template.name --- Save template name
    respond_to do |format|
      if @document.save
        DocumentMailer.email(@document).deliver_later
        format.html { redirect_to documents_path, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
        #DocumentMailer.reminder(@document).deliver_later <-- Decided this wasn't a critical function
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        DocumentMailer.update(@document).deliver_later
        # TODO: replace root_path with pages_thankyou_path
        format.html { redirect_to "http://esignhealth.com", notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:template_id, :recipient, :user_id, :signature, :dynamic_textfields_attributes => [:text, :left, :top])
    end
end
