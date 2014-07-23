class ProspectsController < ApplicationController


  def index
    @prospects = Unirest.get("http://localhost:3001/prospects.json'", :headers => {"Accept"=>"application/json"}).body
  end
  def show
    @prospect = Unirest.get("http://localhost:3001/prospects/#{params[:id]}.json", :headers => {"Accept"=>"application/json"}).body
  end
  def create
      @prospect = Unirest.post("http://localhost:3001/prospects.json", headers:{"Accept"=>"application/json"}, 
        parameters:{:prospect =>
          {
            :first_name => params[:first_name],:last_name=>params[:last_name],:team=>params[:team],:position=>params[:position],:rank=>params[:rank]
            }
            }).body
 
    redirect_to prospects_path(@prospect["id"])                        
  end
  def update
  

  end

end
