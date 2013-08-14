require 'spec_helper'

describe 'assignment' do
  class User < ActiveRecord::Base
    include ActiveRecord::Uuid
  end

  context 'create' do
    let(:uuid) { '69173460-746a-11e2-bcfd-0800200c9a66' }

    describe "when initialized with a uuid" do
      subject{ User.create(name: 'Taylor', uuid: uuid) }

      it 'saves the specified uuid' do
        subject.uuid.should == uuid
      end
    end

    describe "when initialized without a uuid" do
      subject{ User.create(name: 'Nick') }

      it 'generates a uuid' do
        subject.uuid.should_not be_empty
      end

    end
  end

  context 'modifying a uuid' do
    let(:uuid) { '9c51c130-7477-11e2-bcfd-0800200c9a66' }
    subject{ User.create(name: 'Nick') }

    it 'doesn\'t allow UUID to be changed on update' do
      subject.uuid = uuid
      subject.valid?.should == false
      subject.errors[:uuid].should include "Change of uuid not allowed."
    end
  end
end
