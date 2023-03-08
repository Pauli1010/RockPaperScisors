# frozen_string_literal: true

RSpec.describe CompareInputs do
  subject { described_class.new(user_input, sys_throw) }
  exclamations = Array.new(15, '!').join('')
  skip_message = "#{exclamations} Those are doubled tests as an example #{exclamations}"

  shared_examples "a proper comparison of inputs" do |user_input, sys_throw, compare_result|
    let(:user_input) { user_input }
    let(:sys_throw) { sys_throw }

    it "and returns '#{compare_result}' for user input: '#{user_input}' and system throw: '#{sys_throw}'" do
      expect(subject.call).to eql compare_result
    end
  end

  # draw
  it_behaves_like 'a proper comparison of inputs', 'rock', 'rock', 'draw'
  it_behaves_like 'a proper comparison of inputs', 'paper', 'paper', 'draw'
  it_behaves_like 'a proper comparison of inputs', 'scissors', 'scissors', 'draw'
  # user wins
  it_behaves_like 'a proper comparison of inputs', 'rock', 'scissors', 'win'
  it_behaves_like 'a proper comparison of inputs', 'scissors', 'paper', 'win'
  it_behaves_like 'a proper comparison of inputs', 'paper', 'rock', 'win'
  # system wins
  it_behaves_like 'a proper comparison of inputs', 'scissors', 'rock', 'loose'
  it_behaves_like 'a proper comparison of inputs', 'paper', 'scissors', 'loose'
  it_behaves_like 'a proper comparison of inputs', 'rock', 'paper', 'loose'
  # wrong inputs
  it_behaves_like 'a proper comparison of inputs', 'rocck', 'paper', nil
  it_behaves_like 'a proper comparison of inputs', 'rock', 'ppaper', nil
  it_behaves_like 'a proper comparison of inputs', 'rocck', 'rocck', nil

  # classic tests - doubled tests for draw
  context "when inputs are equal", skip: skip_message do
    describe "and they are 'rock'" do
      let(:user_input) { 'rock' }
      let(:sys_throw) { 'rock' }

      it "returns draw" do
        expect(subject.call).to eql 'draw'
      end
    end

    describe "and they are 'paper'" do
      let(:user_input) { 'paper' }
      let(:sys_throw) { 'paper' }

      it "returns draw" do
        expect(subject.call).to eql 'draw'
      end
    end

    describe "and they are 'scissors'" do
      let(:user_input) { 'scissors' }
      let(:sys_throw) { 'scissors' }

      it "returns draw" do
        expect(subject.call).to eql 'draw'
      end
    end
  end
end