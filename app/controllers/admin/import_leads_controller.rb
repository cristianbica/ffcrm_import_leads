class Admin::ImportLeadsController < Admin::ApplicationController
  before_filter :require_user
  before_filter "set_current_tab('admin/import')"

  def index
    redirect_to :action => :new
  end

  def new
  end

  def create
    assigned = User.find(params[:import][:assigned_to])
    file = params[:import][:csv_file]
    make_contact =  params[:import][:make_contact]

    #TODO:
    tag_with =  params[:import][:tag_with]

    ImportLead.new(file).import_leads(assigned, make_contact)

    redirect_to new_admin_import_lead_path, :notice => "Leads successfully imported"
  end

end
