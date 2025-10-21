class Api::V1::ReactionsController < ApplicationController
  before_action :set_reaction, only: [:show, :destroy]
  before_action :set_message, only: [:create]

  # GET /api/v1/reactions or /api/v1/messages/:message_id/reactions
  def index
    if params[:message_id]
      @reactions = Message.find(params[:message_id]).reactions
    else
      @reactions = Reaction.all
    end
    
    render json: @reactions, include: [:user, :message]
  end

  # GET /api/v1/reactions/:id
  def show
    render json: @reaction, include: [:user, :message]
  end

  # POST /api/v1/messages/:message_id/reactions
  def create
    @reaction = @message.reactions.new(reaction_params)

    if @reaction.save
      render json: @reaction, status: :created, include: [:user, :message]
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reactions/:id or /api/v1/messages/:message_id/reactions/:id
  def destroy
    @reaction.destroy
    head :no_content
  end

  private

  def set_reaction
    @reaction = Reaction.find(params[:id])
  end

  def set_message
    @message = Message.find(params[:message_id])
  end

  def reaction_params
    params.require(:reaction).permit(:reaction_type, :user_id)
  end
end
