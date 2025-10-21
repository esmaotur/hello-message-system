class Api::V1::MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]
  before_action :set_conversation, only: [:create]

  # GET /api/v1/messages
  def index
    if params[:conversation_id]
      @messages = Conversation.find(params[:conversation_id]).messages
    elsif params[:user_id]
      @messages = User.find(params[:user_id]).messages
    else
      @messages = Message.all
    end
    
    render json: @messages, include: [:user, :category, :reactions]
  end

  # GET /api/v1/messages/:id
  def show
    render json: @message, include: [:user, :category, :conversation, :reactions]
  end

  # POST /api/v1/messages or /api/v1/conversations/:conversation_id/messages
  def create
    @message = Message.new(message_params)
    @message.conversation = @conversation if @conversation

    if @message.save
      render json: @message, status: :created, include: [:user, :category, :conversation]
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/messages/:id
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/messages/:id
  def destroy
    @message.destroy
    head :no_content
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id]) if params[:conversation_id]
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :category_id, :conversation_id)
  end
end