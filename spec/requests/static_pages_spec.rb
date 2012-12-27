require 'spec_helper'

describe "Static pages" do
  subject { page }
  describe 'Home page' do
    describe 'when not signed in' do
      before { visit root_path }
      it { should have_selector('h1', text: 'wocky') }
      it { should have_link('Sign in', href: new_user_session_path) } 
    end

    describe 'when signed in' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in user
        visit root_path
      end
      it { should have_link('Sign out', href: destroy_user_session_path) }
    end
  end
end
