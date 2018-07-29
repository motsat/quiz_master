require 'rails_helper'

RSpec.describe Question, type: :model do

  describe "#next_question" do
    let!(:question_second_order) { FactoryBot.create(:question, display_order: 2) }
    let!(:question_first_order) { FactoryBot.create(:question, display_order: 1) }
    let!(:question_last_order) { FactoryBot.create(:question, display_order: 4) }
    let!(:question_third_order) { FactoryBot.create(:question, display_order: 3) }

    example "get next question in order" do
      expect(question_first_order.next_question).to eq question_second_order
      expect(question_second_order.next_question).to eq question_third_order
      expect(question_third_order.next_question).to eq question_last_order
    end
 
    example "get nil if next question is nothing" do
      expect(question_last_order.next_question).to be_nil
    end
  end
end
