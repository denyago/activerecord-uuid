module ActiveRecord
  module Uuid
    module Relation
    private
  
      # Rather than monkey-patching ActiveRecord::Relation, subclass it with our own implementation
      # of the finder methods. This is the way FriendlyId does it, and should place nicely with it.
      def uuid_relation_class    
        @uuid_relation_class ||= Class.new(relation_without_uuid.class) do
          alias_method :find_one_without_uuid, :find_one
          alias_method :exists_without_uuid?, :exists?
          include Uuid::FinderMethods
        end
      end
    
      # Override the model's relation method to return our subclassed version.
      def relation
        relation = uuid_relation_class.new(self, arel_table)

        if finder_needs_type_condition?
          relation.where(type_condition).create_with(inheritance_column.to_sym => sti_name)
        else
          relation
        end
      end
    end
  end
end
