# frozen_string_literal: true

# ThrowsController handles all the actions for the RockPaperScissors game
class ThrowsController < ApplicationController
  def index; end

  def create
    @value = params[:value]

    @throw = GenerateThrow.new.call
    @result = ::CompareInputs.new(@value, @throw).call
    # render plain: "moje: #{@value}, wylosowane: #{throw}, wynik: #{result}"

    respond_to do |format|
      format.html { render 'bet_result' }
      format.js
    end
  end
end
