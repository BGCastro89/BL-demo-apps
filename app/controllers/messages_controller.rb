#Controller!
class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  #READ
  def show
    @message = Message.find(params[:id])

    puts "<<<<<<<<<<<<<<<<<<<<<<1"
    puts params[:id]
    puts @message
    puts ">>>>>>>>>>>>>>>>>>>>>>1"

  end

  #CREATE
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    puts "<<<<<<<<<<<<<<<<<<<<<<2"
    puts message_params
    puts @message
    puts ">>>>>>>>>>>>>>>>>>>>>>2"


    #     service = MessageUpdater.new(
    #   body: message_params[:body],
    #   title: message_params[:title]
    # )
    if @message.save
      redirect_to @message
    else
      render :new
    end
  end

  #UPDATE
  def edit
    @message = Message.find(params[:id])
  end
  
  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      redirect_to @message
    else
      render :edit
    end
  end

    # DELETE
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to root_path
  end

  private
    def message_params
      params.require(:message).permit(:title,:body)
    end
  end