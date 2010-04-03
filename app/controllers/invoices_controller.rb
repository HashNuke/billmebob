class InvoicesController < ApplicationController

  def index
    redirect_to :action=>"new"
  end

  def new
    @invoice = Invoice.new
    3.times {@invoice.items.build}
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.save
    redirect_to @invoice
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attributes(params[:invoice])
    redirect_to @invoice
  end

  def show
    @invoice = Invoice.find(params[:id])
    if(@invoice.template=="both")
      render :template => "invoices/templates/both.html.haml"
    end

    if(@invoice.template=="center")
      render :template => "invoices/templates/center.html.haml"
    end

    if(@invoice.template=="right")
      render :template => "invoices/templates/right.html.haml"
    end 
  end
  
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to :new
  end

  def about
    
  end

end
