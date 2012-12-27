require 'spec_helper'

describe "User Pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  describe 'user page' do
    before { visit user_path(user) } 
    it { should have_selector('h1', text: user.name) }
  end
end
