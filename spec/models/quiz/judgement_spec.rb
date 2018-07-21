require 'rails_helper'

RSpec.describe Quiz::Judgement do
  describe "#right?" do
    subject { Quiz::Judgement.new(question, user_answer).right? }
    context "right answer" do
      it { }
    end
    context "not right answer" do
      context  "different number" do
        it { is_expected.to eq false }
      end
    end
  end
end

