require 'spec_helper'

describe Track do
  let(:track) { FactoryGirl.create(:track) }
  subject { track }
  it { should respond_to(:name) }
  it { should respond_to(:artist) }
  it { should respond_to(:spotify_uri) }
  it { should respond_to(:user) }
end
