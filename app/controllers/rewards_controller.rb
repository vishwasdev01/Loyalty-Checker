class RewardsController < ApplicationController
    before_action :set_user
    before_action :set_reward, only: [:show, :edit, :update, :destroy]
  
    def index
      @rewards = @user.rewards
    end
  
    def show
    end
  
    def new
      @reward = @user.rewards.new
    end
  
    def edit
    end
  
    def create
      @reward = @user.rewards.new(reward_params)
      if @reward.save
        redirect_to user_rewards_path(@user), notice: 'Reward was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @reward.update(reward_params)
        redirect_to user_rewards_path(@user), notice: 'Reward was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @reward.destroy
      redirect_to user_rewards_path(@user), notice: 'Reward was successfully destroyed.'
    end
  
    private
      def set_user
        @user = User.find(params[:user_id])
      end
  
      def set_reward
        @reward = @user.rewards.find(params[:id])
      end
  
      def reward_params
        params.require(:reward).permit(:name, :valid_until, :user_id)
      end
  end
  