class TransactionsController < ApplicationController
    before_action :set_user
    before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  
    def index
      @transactions = @user.transactions
    end
  
    def show
    end
  
    def new
      @transaction = @user.transactions.new
    end
  
    def edit
    end
  
    def create
      @transaction = @user.transactions.new(transaction_params)
      if @transaction.save
        redirect_to user_transactions_path(@user), notice: 'Transaction was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @transaction.update(transaction_params)
        redirect_to user_transactions_path(@user), notice: 'Transaction was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @transaction.destroy
      redirect_to user_transactions_path(@user), notice: 'Transaction was successfully destroyed.'
    end
  
    private
      def set_user
        @user = User.find(params[:user_id])
      end
  
      def set_transaction
        @transaction = @user.transactions.find(params[:id])
      end
  
      def transaction_params
        params.require(:transaction).permit(:amount, :user_id, :country)
      end
  end
  