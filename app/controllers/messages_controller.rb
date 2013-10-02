class MessagesController < ApplicationController
  def create
    @message = Post.find(params[:post_id]).messages.new(message_params)
    @message.user_id = current_user.id
    @message.author = current_user.first_name + ' ' + current_user.last_name

    if @message.save
      flash[:success] = "Message has been added!"
    elsif 
      flash[:error] = @message.errors.full_messages
    end

    redirect_to blog_path(params[:blog_id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to blog_path(params[:blog_id])
  end

  private

      # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit([:author, :message, :post_id, :user_id])
    end

end
