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
    @invoice = Invoice.find(params[:invoice])
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update_attributes(params[:invoice])
  end

  def show
  end
  
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to :new
  end

  def about
    
  end

end
