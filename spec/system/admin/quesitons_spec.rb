require 'rails_helper'

RSpec.describe 'Admin::Questions', type: :system do
  describe "#index" do
    before do
      FactoryBot.create(:question, content: "content1", display_order: 1) 
      FactoryBot.create(:question, content: "content2", display_order: 2) 
      visit admin_questions_path
    end

    it 'list questions' do
      expect(page.all(".question-content").map(&:text)).to eq  ["content1", "content2"]
    end
  end

  describe "#show" do
    before do
      visit admin_questions_path
      FactoryBot.create(:question, content: "content1", display_order: 1) 
      click_link "Show"
    end
  end

  describe "#create" do
    before do
      visit admin_questions_path
      click_on "New Question"
    end
    context "valid" do
      before do
        fill_in "question_content", with: "my content"
        fill_in "question_right_answer", with: "999"
        fill_in "question_display_order", with: 1
      end
      it "Questions to be created " do
        expect { click_on "Create Question" }.to change { Question.count }.from(0).to(1)
        expect(current_path).to eq admin_question_path(Question.last)
      end
    end

    context "invalid" do
      before do
        fill_in "question_content", with: ""
        fill_in "question_right_answer", with: ""
        fill_in "question_display_order", with: ""
      end

      it "Questions to be created " do
        expect { click_on "Create Question" }.not_to change { Question.count }.from(0)
        expect(current_path).to eq admin_questions_path
        expect(page).to have_content "New Question"
      end
    end
  end

  describe "#destroy", js: true do
    before do
      FactoryBot.create(:question) 
      visit admin_questions_path
    end
 
    it "Questions to be created " do
      accept_confirm { click_link 'Destroy' }
      expect(page).to have_content "New Question"
      expect(Question.count).to eq 0
    end
  end
end
