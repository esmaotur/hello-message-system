class Api::V1::ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

  # GET /api/v1/conversations
  def index
    @conversations = Conversation.all
    render json: @conversations
  end

  # GET /api/v1/conversations/:id
  def show
    render json: @conversation, include: [:messages]
  end

  # POST /api/v1/conversations
  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      render json: @conversation, status: :created
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/conversations/:id
  def update
    if @conversation.update(conversation_params)
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/conversations/:id
  def destroy
    @conversation.destroy
    head :no_content
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:title)
  end
end
