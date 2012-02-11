require 'spec_helper'

describe "Micropost pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in(user) }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Submit" }.should_not change(Micropost, :count)
      end

      describe "error messages" do
        let(:error) { '1 error prohibited this micropost from being saved' }
        before { click_button "Submit" }
        it { should have_content(error) } 
      end
    end

    describe "with valid information" do

      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      it "should create a micropost" do
        expect { click_button "Submit" }.should change(Micropost, :count).by(1)
      end
    end
  end
end