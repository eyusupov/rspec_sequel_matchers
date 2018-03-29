module RspecSequel
  module Matchers

    class HaveColumnMatcher < RspecSequel::Base
    def initialize(attribute, options={})
      super
      @type = options[:type]
      @options.reject! { |k| k == :type }
      @description = []
    end
      def description
        desc = "have a column #{@attribute.inspect}"
        desc << " with type #{@type}" if @type
        desc << " and options #{hash_to_nice_string @options}" unless @options.empty?
        desc
      end

      def valid?(db, i, c, attribute, options)

        # check column existence
        col = db.schema(c.table_name).detect{|col| col[0]==attribute}
        return false if col.nil?

        # check type
        type_matching = true
        if @type
          expected_type = db.send(:type_literal, {:type => @type}).to_s
          found = [col[1][:type].to_s, col[1][:db_type].to_s]
          @suffix << "(type found: #{found.uniq.join(", ")})"
          type_matching = found.include?(expected_type)
        end

        # check other options
        unmatched_options = {}
        @options.each do |option, expected|
          if col[1][option] != expected
            unmatched_options[option] = col[1][option]
          end
        end
        @suffix << "but options #{hash_to_nice_string unmatched_options} do not match" unless unmatched_options.empty?

        type_matching && unmatched_options.empty?
      end
    end

    def have_column(*args)
      HaveColumnMatcher.new(*args)
    end

  end
end
