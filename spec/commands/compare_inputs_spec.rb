# frozen_string_literal: true

RSpec.describe 'CompareInputs' do
  subject { CompareInputs.new(user_input, sys_throw) }

  context "when inputs are equal" do
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