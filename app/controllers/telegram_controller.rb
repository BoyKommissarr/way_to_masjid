require "telegram/bot"

class TelegramController < ApplicationController
  skip_before_action :verify_authenticity_token

  WEB_APP_URL = "https://primarily-credible-moray.ngrok-free.app/telegram_login"

  def webhook
    bot = Telegram::Bot::Client.new(Rails.application.credentials.telegram_bot_token)
    update = params[:telegram] || params
    message = update["message"]
    return unless message.present?

    chat_id = message["chat"]["id"]
    text = message["text"]

    case text
    when "/start"
      bot.api.send_message(chat_id: chat_id, text: "Hello, #{message['from']['first_name']}! Welcome to the bot.")
    when "/login"
      login_button = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
        keyboard: [
          [ Telegram::Bot::Types::KeyboardButton.new(text: "Login via Web", web_app: { url: WEB_APP_URL }) ]
        ],
        one_time_keyboard: true, resize_keyboard: true
      )
      bot.api.send_message(
        chat_id: chat_id,
        text: "Click the button below to login securely:",
        reply_markup: login_button
      )
    else
      bot.send_message(chat_id: chat_id, text: "I don't understand this command.")
    end

    head :ok
  end
end
