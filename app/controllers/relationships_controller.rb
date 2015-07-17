class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :find_user, only: [:create]
  before_action :find_Relationship, only: [:destroy]

  def create
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private

  def find_user
    @user = User.find(params[:followed_id])
  end

  def find_Relationship
    @user = Relationship.find(params[:id]).followed
  end

end
