# frozen_string_literal: true

class CompareInputs
  def initialize(user_input, throw)
    @valid_values = GenerateThrow::CLASSIC_VALUES.include?(user_input) && GenerateThrow::CLASSIC_VALUES.include?(throw)
    @user_input_index = GenerateThrow::CLASSIC_VALUES.index(user_input)
    @throw_index = GenerateThrow::CLASSIC_VALUES.index(throw)
  end

  # Public method
  # Determines the result of comparison
  # Returns:
  # - nil if given values are invalid
  # - String: 'draw', 'win' or 'loose' when values can be compared
  def call
    return nil unless valid_values
    return 'draw' if user_input_index == throw_index

    classic_values_compare
  end

  attr_reader :user_input_index, :throw_index, :valid_values

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