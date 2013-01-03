require 'spec_helper'

describe 'finders' do
  class User < ActiveRecord::Base
    include ActiveRecord::Uuid
  end

  subject(:user) { User.create(name: 'Taylor') }

  it 'finds by primary key' do
    User.find(user.id).should == user
  end

  it 'finds by UUID' do
    User.find(user.uuid).should == user
  end
end
