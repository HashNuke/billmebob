class InvoicesController < ApplicationController

  def index
    redirect_to :action=>"new"
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(params[:invoice])
  end

  def edit
    @invoice = Invoice.find(params[:invoice])
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attributes(params[:invoice])
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
  end

  def about
    
  end

end
