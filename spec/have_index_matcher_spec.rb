require File.dirname(__FILE__) + "/spec_helper"

describe "have_index_matcher" do

  before do
    define_model :item
    define_model :profile
  end

  subject { Item }

  describe "arguments" do
    it "should require attribute" do
      expect { have_index }.to raise_error
    end
    it "should accept column name" do
      expect { have_index :name }.not_to raise_error
    end
    it "should accept multiple column names" do
      expect { have_index [:name, :last_name] }.not_to raise_error
    end
    it "should accept unique option" do
      expect { have_index :name, unique: true }.not_to raise_error
    end
    it "should refuse invalid options" do
      expect { have_index :name, invalid: true }.to raise_error
    end
  end

  describe "messages" do
    describe "single column index" do
      let(:matcher) { have_index :created_at}

      it "should contain a description" do
        expect(matcher.description).to eq "have index for :created_at column"
      end

      it "should set failure message" do
        matcher.matches? subject
        expect(matcher.failure_message).to eq "expected Item to " + matcher.description + " but no index found"

      end

      context "with index" do
        let(:matcher) { have_index :name }
        it "should set negated failure message" do
          matcher.matches? subject
          expect(matcher.failure_message_when_negated).to eq "expected Item to not " + matcher.description + " but unique index found"
        end
      end
    end

    describe "unique single column index" do
      let(:matcher) { have_index :id, unique: true }

      it "should contain a description" do
        expect(matcher.description).to eq "have unique index for :id column"
      end

      it "should set failure messages" do
        matcher.matches? subject
        expect(matcher.failure_message).to eq "expected Item to " + matcher.description + " but no index found"
      end

      context "with unique index" do
        let(:matcher) { have_index :name, unique: true }
        it "should set negated failure message" do
          matcher.matches? subject
          expect(matcher.failure_message_when_negated).to eq "expected Item to not " + matcher.description + " but unique index found"
        end
      end

      context "with non-unique index" do
        let(:matcher) { have_index :price, unique: true }
        it "should set failure messages" do
          matcher.matches? subject
          expect(matcher.failure_message).to eq "expected Item to " + matcher.description + " but non-unique index found"
          expect(matcher.failure_message_when_negated).to eq "expected Item to not " + matcher.description + " but non-unique index found"
        end
      end
    end

    describe "multiple column non-unique index" do
      subject { Profile }
      let(:matcher) { have_index [:name, :last_name] }
      it "should contain a description" do
        expect(matcher.description).to eq "have index for [:name, :last_name] columns"
      end

      it "should set failure messages" do
        matcher.matches? subject
        expect(matcher.failure_message_when_negated).to eq "expected Profile to not " + matcher.description + " but non-unique index found"
      end
    end

    describe "multiple column unique index" do
      subject { Profile }
      describe "without unique index" do
        let(:matcher) { have_index [:name, :last_name], unique: true }
        it "should contain a description" do
          expect(matcher.description).to eq "have unique index for [:name, :last_name] columns"
        end

        it "should set failure messages" do
          matcher.matches? subject
          expect(matcher.failure_message).to eq "expected Profile to " + matcher.description + " but non-unique index found"
        end
      end

      describe "with unique index" do
        let(:matcher) { have_index [:name, :last_name, :email], unique: true }
        it "should contain a description" do
          expect(matcher.description).to eq "have unique index for [:name, :last_name, :email] columns"
        end

        it "should set failure messages" do
          matcher.matches? subject
          expect(matcher.failure_message_when_negated).to eq "expected Profile to not " + matcher.description + " but unique index found"
        end
      end
    end

    context 'without an index' do
      subject { Profile }
      let(:matcher) { have_index [:name, :email], unique: true }
      it "should set failure messages" do
        matcher.matches? subject
        expect(matcher.failure_message).to eq "expected Profile to " + matcher.description + " but no index found"
      end
    end
  end

  describe "matchers" do
    it { is_expected.to have_index :name, unique: true } 
    it { is_expected.to have_index :price }
    it { is_expected.not_to have_index :created_at }
    it { is_expected.not_to have_index :name } 
    it { is_expected.not_to have_index :id, unique: true } 
    it { is_expected.not_to have_index :price, unique: true } 

    context "multi-column index" do
      subject { Profile }

      it { is_expected.to have_index [:name, :last_name] }
      it { is_expected.not_to have_index [:name, :last_name], unique: true }
      it { is_expected.to have_index [:name, :last_name, :email], unique: true }
      it { is_expected.not_to have_index [:name, :email], unique: true }
    end
  end
end

