class TelegramController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    bot = Telegram.bots[:default]
    update = OpenStruct.new(params.to_unsafe_h)
    if update.message
      chat_id = update.message[:chat][:id]
      text = update.message[:text]

      case text
      when "/start"
        bot.send_message(chat_id: chat_id, text: "Hello, #{update.message[:from][:first_name]}! Welcome to the bot.")
      when "/help"
        bot.send_message(chat_id: chat_id, text: "Available commands:\n/start - Welcome message\n/help - Show this help")
      else
        bot.send_message(chat_id: chat_id, text: "I don't understand this command.")
      end
    end

    head :ok
  end
end
