require 'spec_helper'

describe Relationship do

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }

    it { expect(subject.follower).to eq(follower) }
    it { expect(subject.followed).to eq(followed) }

  end
  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end
end



=begin

    specify { expect(:follower).to eq follower }
    specify { expect(:followed).to eq followed }

      specify { expect(:follower).to  eq follower }
      specify { expect(:followed).to eq followed }

      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }

    its(:follower) { should eq follower }
    its(:followed) { should eq followed }

    it { (:follower)  should eq follower }
    it { (:followed)  should eq followed }

    it { expect(subject.follower).to eq(follower) }
    it { expect(subject.followed).to eq(followed) }
=end