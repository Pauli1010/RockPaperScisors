# frozen_string_literal: true

class GenerateThrow
  CLASSIC_VALUES = %w(rock paper scissors)

  def initialize(params = {})
    @variation = params[:variation].presence || 3
  end

  # Public method
  # Generates throw
  # Returns String: 'rock', 'paper' or 'scissors'
  def call
    case variation
    when 3
      CLASSIC_VALUES[rand(variation)]
    else
      nil
    end
  end

  attr_reader :variation
end