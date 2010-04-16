class InvoicesController < ApplicationController

  def index
    redirect_to :root
  end

  def new
    @invoice = Invoice.new
    3.times {@invoice.items.build}
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    if @invoice.issued_on.nil?
      @invoice.issued_on=Date.today.to_s
    end
    
    @invoice.shorturl = Digest::SHA1.hexdigest(@invoice.id.to_s + DateTime.now.to_s)

    if @invoice.save
      redirect_to "/"+@invoice.shorturl
    else
      if @invoice.items.length==0
        3.times {@invoice.items.build}
      end
      render "new"
    end
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
    @invoice = Invoice.where({:shorturl => params[:shorturl]}).first
    if @invoice.nil?
      render "invalid.html.haml", :layout=>false
    else
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
  end


  
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to :root
  end

  def about
    
  end


  private
  
  def validate_shortlink(s)
    cval = (s=~/\A(?!(invoices|invoice|bill|bills|product|products|item|items)\Z).*\Z/i)
    if cval==nil
      return -1
    else
      return 0
    end
  end

end
