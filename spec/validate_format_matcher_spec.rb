require File.dirname(__FILE__) + "/spec_helper"

describe "validate_format_matcher" do

  before :all do
    define_model :item do
      plugin :validation_helpers
      def validate
        validates_format /[abc]+/, :name, :allow_nil => true
      end
    end
  end

  subject{ Item }

  describe "arguments" do
    it "should require attribute" do
      lambda{
        @matcher = validate_format
      }.should raise_error(ArgumentError)
    end
    it "should require additionnal parameters" do
      lambda{
        @matcher = validate_format :name
      }.should raise_error(ArgumentError)
    end
    it "should refuse invalid additionnal parameters" do
      lambda{
        @matcher = validate_format :id, :name
      }.should raise_error(ArgumentError)
    end
    it "should accept valid additionnal parameters" do
      lambda{
        @matcher = validate_format /[abc]+/, :name
      }.should_not raise_error(ArgumentError)
    end
  end

  describe "messages" do
    describe "without option" do
      it "should contain a description" do
        @matcher = validate_format /[abc]+/, :name
        @matcher.description.should == "validate format of :name with /[abc]+/"
      end
      it "should set failure messages" do
        @matcher = validate_format /[abc]+/, :name
        @matcher.matches? subject
        @matcher.failure_message.should == "expected Item to validate format of :name with /[abc]+/"
        @matcher.negative_failure_message.should == @matcher.failure_message.gsub("to validate", "to not validate")
      end
    end
    describe "with options" do
      it "should contain a description" do
        @matcher = validate_format /[abc]+/, :name, :allow_nil => true
        @matcher.description.should == "validate format of :name with /[abc]+/ and option(s) :allow_nil => true"
      end
      it "should set failure messages" do
        @matcher = validate_format /[abc]+/, :price, :allow_nil => true
        @matcher.matches? subject
        @matcher.failure_message.should == "expected Item to validate format of :price with /[abc]+/ and option(s) :allow_nil => true"
        @matcher.negative_failure_message.should == @matcher.failure_message.gsub("to validate", "to not validate")
      end
      it "should explicit used options if different than expected" do
        @matcher = validate_format /[abc]+/, :name, :allow_blank => true
        @matcher.matches? subject
        @matcher.failure_message.should == "expected Item to validate format of :name with /[abc]+/ and option(s) :allow_blank => true but called with option(s) :allow_nil => true instead"
        @matcher.negative_failure_message.should == @matcher.failure_message.gsub("to validate", "to not validate")
      end
      it "should warn if invalid options are used" do
        @matcher = validate_format /[abc]+/, :name, :allow_anything => true
        @matcher.matches? subject
        @matcher.failure_message.should == "expected Item to validate format of :name with /[abc]+/ and option(s) :allow_anything => true but option :allow_anything is not valid"
        @matcher.negative_failure_message.should == @matcher.failure_message.gsub("to validate", "to not validate")
      end
    end
  end

  describe "matchers" do
    it{ should validate_format(/[abc]+/, :name) }
    it{ should validate_format(/[abc]+/, :name, :allow_nil => true) }
    it{ should_not validate_format(/[abc]+/, :price) }
    it{ should_not validate_format(/[abc]/, :name) }
    it{ should_not validate_format(/[abc]+/, :name, :allow_blank => true) }
  end

end