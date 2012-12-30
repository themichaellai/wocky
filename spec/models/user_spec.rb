require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  subject { user }
  it { should respond_to(:name) }
  it { should respond_to(:tracks) }
end
