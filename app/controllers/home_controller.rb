class HomeController < ApplicationController
  before_action :authenticate_user! 	
  def index


    respond_to do |format|
      format.html{
            @tweet = Tweet.new
            @feed = current_user.feed.limit(10)

      }
      format.js{
            offset = params["offset"]
            if offset
              offset = offset.to_i
            else
              offset = 0
            end

            @new_offset = offset + 10
            @show_load_more = offset < current_user.feed.count
            @feed = current_user.feed.offset(offset).limit(10)
      }
    end

  end


  def users
  	@users = User.all
  end


  def follow
  	followee_id = params[:followee_id]
  	if current_user.can_follow followee_id
  		FollowMapping.create(:followee_id => followee_id, :follower_id => current_user.id)
  	else
  	end
  	return redirect_to '/users'
  end

  def un_follow
  	followee_id = params[:followee_id]
  	if current_user.can_un_follow followee_id
  		FollowMapping.where(:followee_id => followee_id, :follower_id => current_user.id).first.destroy
  	else
  	end
  	return redirect_to '/users'
  end


  def profile
  end

  def upload_image
  	uploaded_file = params[:image]
  	filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
  	filepath = Dir.pwd + "/public/uploads/" + filename
	File.open(filepath,'wb') do |file|
		file.write(uploaded_file.read())
	end

	current_user.profile_picture = filename
	current_user.save!
  	return redirect_to '/profile'
  end

  def ajax
  	render :json => {text: "text"}
  end




end
