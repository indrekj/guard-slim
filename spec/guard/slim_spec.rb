require "spec_helper"

describe Guard::Slim do
  subject { described_class.new(watchers, options) }

  let(:watchers) { [] }
  let(:options)  { {} }

  describe "#initialize" do
    context "when no options given" do
      it "uses defaults" do
        expect(subject.options).to eq(described_class::DEFAULTS)
      end
    end

    context "when options given" do
      let(:options) { {:run_all_at_start => true } }

      it "merges them with defaults" do
        options = subject.options

        expect(options[:run_all_at_start]).to be(true)
        expect(options[:input]).to eq("templates")
      end
    end
  end

  describe "#start" do
    context "by default" do
      it "does not call #run_all" do
        subject.should_not_receive(:run_all)
        subject.start
      end
    end

    context "when run_on_changes enabled" do
      let(:options) { {:all_on_start => true} }

      it "calls #run_all" do
        subject.should_receive(:run_all)
        subject.start
      end
    end
  end
end
