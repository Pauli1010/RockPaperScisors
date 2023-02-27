# frozen_string_literal: true

class CompareInputs
  def initialize(user_input, throw)
    @user_input_index = GenerateThrow::CLASSIC_VALUES.index(user_input)
    @throw_index = GenerateThrow::CLASSIC_VALUES.index(throw)
  end

  def call
    return 'draw' if user_input_index == throw_index

    classic_values_compare
  end

  attr_reader :user_input_index, :throw_index

  private

  def classic_values_compare
    if throw_index < 2
      # throw_index = 'rock' or 'paper'
      (throw_index + 1) == user_input_index ? 'win' : 'loose'
    else
      # throw_index = 'scissors'
      user_input_index == 0 ? 'win' : 'loose'
    end
  end
end