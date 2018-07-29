require 'rails_helper'

RSpec.describe 'Questions', type: :system do
  describe "show default quiz" do
    let!(:question) { FactoryBot.create(:question, content: "How many vowels are there in the English alphabet", right_answer: 47, display_order: 1) }

    before { visit root_path }
    it 'show first question' do
      # Question編集画面を開く
      expect(page).to have_content question.content
    end
  end

  describe "can answer" do
    context "When answer is right" do
      context "When there is a next question" do
        let!(:question_1) { FactoryBot.create(:question, content: "How many vowels are there in the English alphabet", right_answer: 47, display_order: 1) }
        let!(:question_2) { FactoryBot.create(:question, content: "1.0 + 2.1 = ?", right_answer: 3.1, display_order: 2) }
        before do 
          visit root_path
          fill_in "questions_answer", with: 47
          click_on "Answer"
        end

        it 'show second question and show ok!!' do
          expect(current_path).to eq question_path(question_2)
          expect(page).to have_content "ok!!"
          expect(page).to have_content question_2.content
        end
      end

      context "When there is no next question" do
        let!(:question) { FactoryBot.create(:question, right_answer: 47) }
        before do 
          visit root_path
          fill_in "questions_answer", with: 47
          click_on "Answer"
        end
        it 'show Congratulations!!!!!!' do
          expect(page).to have_content "Congratulations!!!!"
          expect(current_path).to eq question_answers_path(question)
        end
      end
    end

    context "When answer is wrong" do
      let!(:question) { FactoryBot.create(:question, content: "1.0 + 2.1 = ?", right_answer: 3.1) }
      before do 
        visit root_path
        fill_in "questions_answer", with: 2
        click_on "Answer"
      end

      it 'show second question and show ok!!' do
        expect(current_path).to eq question_path(question)
        expect(page).to have_content "ng!!"
        expect(page).to have_content question.content
      end
    end
  end
end
