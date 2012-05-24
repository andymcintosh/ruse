class DemoController < ApplicationController
	def index
    # TODO: determine if bot by checking user agent
    bot = params[:bot]

    # if its a bot, route the page through Ruse
    if bot
      # TODO: construct url from env params
      ruse('http://localhost/demo')
    else
      render :text => "Wait for it...", :layout => 'application'
    end
	end

  def sample_data 
    results = {
      msg: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend dolor vel orci pellentesque convallis non vulputate justo. Praesent sit amet augue lacus. Donec egestas sapien in arcu sagittis a ullamcorper justo sodales. Etiam sit amet volutpat ligula. Vestibulum elementum odio quis mauris vulputate volutpat. Phasellus lobortis metus a arcu molestie ultricies. Nullam pharetra, lorem ac congue lobortis, ante nibh adipiscing nulla, ut gravida ligula neque non metus." 
    }

    sleep(1.second);

    render :json => results
  end
end
