require 'securerandom'

module ActiveRecord
  module Uuid
    module Model
      def self.included(model)
        model.instance_eval do
          # This should never be user-assigned
          begin
            attr_protected :uuid
          rescue Exception => e
            puts "Got error #{e} when tried to protect :uuid from mass-assignament"
          end
          # Validate on update since uuid won't exist yet on creation
          validates :uuid, :presence => true, :uniqueness => true, :on => :update
          validate :uuid_not_changed
          before_create :assign_uuid
        end
      end

    private

      def assign_uuid
        write_attribute(:uuid, SecureRandom.uuid) unless uuid
      end

      def uuid_not_changed
        if uuid_changed? && self.persisted?
          errors.add(:uuid, "Change of uuid not allowed.")
        end
      end
    end
  end
end
