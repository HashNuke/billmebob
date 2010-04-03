class DownloadsController < ApplicationController

  def index
    #response.headers['Content-Type'] = "application/octet-stream"
    #response.headers['Content-Disposition'] = "attachment; filename=test.pdf"
    #response.headers['Cache-Control'] =  "private"
    #response.headers['X-Accel-Redirect'] = "/media/pt1/apps/billmebob/public/pdfs/protected/test.pdf"
    #render :nothing=>true
    x_accel_redirect "/media/pt1/apps/pdfs/protected/test.pdf", :type=>"application/pdf"
  end

end
