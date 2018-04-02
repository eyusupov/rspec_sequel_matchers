module RspecSequel
  module Matchers

    class HaveIndexMatcher < RspecSequel::Base
      def initialize(attribute, unique: false)
        super(attribute, unique: unique)
      end

      def description
        desc = "have "
        desc << "unique " if @options[:unique]
        desc << "index for #{@attribute.inspect} "
        desc << (@attribute.is_a?(Array) ? "columns" : "column")
        desc
      end

      def valid?(db, i, c, attribute, options)
        # check index existence
        columns = attribute.is_a?(Array) ? attribute : [attribute]
        index = db.indexes(c.table_name).detect { |k, v| v[:columns] == columns }
        if index.nil?
          @suffix << "but no index found"
          return false
        end
        unique = index[1][:unique]
        @suffix << (unique ? "but unique index found" : "but non-unique index found")
        unique == options[:unique]
      end
     
    end

    def have_index(*args)
      HaveIndexMatcher.new(*args)
    end
  end
end


