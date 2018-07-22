require 'rails_helper'

RSpec.describe Quiz::Judgement do
  describe "#right?" do
    subject { Quiz::Judgement.new(question, answer).right? }

    context "right answer type is number" do
      let(:question) { FactoryBot.build(:question, right_answer: right_answer) } 

      context "right answer" do
        context "number" do
          let(:answer) { '5' } 
          let(:right_answer) { '5' } 
          it { is_expected.to eq true }
        end

        context "number as words" do
          context "answer is words and right_answer is number" do
            let(:answer) { 'five' } 
            let(:right_answer) { '5' } 
            it { is_expected.to eq true }
          end
          context "right_answer is words and answer is number" do
            let(:answer) { '5' } 
            let(:right_answer) { 'five' } 
            it { is_expected.to eq true }
          end
        end

        context "without number and number words string" do
          let(:right_answer) { 'Triceratops' } 
          let(:answer) { 'triceratops' } 
          it { is_expected.to eq true }
        end

        context "mix number and words and other" do
          let(:right_answer) { '1.5 and fifteen' } 
          let(:answer) { 'One Point Five and 15' } 
          it { is_expected.to eq true }
        end
      end

      context "incorrect answer" do

        context "number" do
          let(:right_answer) { '5' } 
          let(:answer) { '4' } 
          it { is_expected.to eq false }
        end

        context "number as words" do
          let(:right_answer) { '5' } 
          let(:answer) { 'six' } 
          it { is_expected.to eq false }
        end

        context "without number and number words string" do
          let(:right_answer) { 'Triceratops' } 
          let(:answer) { 'Pikachu' } 
          it { is_expected.to eq false }
        end

        context "mix number and words and other" do
          let(:right_answer) { '1.4 and fifteen' } 
          let(:answer) { 'One Point Five and 15' } 
          it { is_expected.to eq false }
        end
      end
    end
  end
end

