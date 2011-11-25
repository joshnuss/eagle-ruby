require 'spec_helper'

describe Eagle::Drawing do
  context "parsing" do
    let(:document) { Eagle::Drawing.parse(File.read(File.dirname(__FILE__) + '/sample.sch.xml')) }
    subject { document }

    its(:version) { should == '5.91' }

    context "grid" do
      subject { document.grid }

      its(:distance) { should == 0.1 }
      its(:unit_distance) { should == 'inch' }
      its(:unit) { should == 'inch' }
      its(:style) { should == 'lines' }
      its(:multiple) { should == 1 }
      its(:display) { should == false }
      its(:alternate_distance) { should == 0.01 }
      its(:alternate_unit_distance) { should == 'inch' }
      its(:alternate_unit) { should == 'inch' }
    end

    context "settings" do
      specify { document.settings[:alwaysvectorfont].should == 'no' }
      specify { document.settings['alwaysvectorfont'].should == 'no' }
      specify { document.settings[:verticaltext].should == 'up' }
    end

    context "layers" do
      subject { document.layers }

      its(:count) { should == 45 }

      context "first layer" do
        subject { document.layers.first }

        its(:number) { should == 1 }
        its(:name) { should == 'Top' }
        its(:color) { should == 4 }
        its(:fill) { should == 1 }
        its(:visible) { should == false }
        its(:active) { should == false }
      end
    end

    context "parts" do
      subject { document.parts }

      its(:count) { should == 2 }

      context "first part" do
        subject { document.parts[1] }

        its(:name) { should == 'IC1' }
        its(:library) { should == '74xx-us' }
        its(:deviceset) { should == '74*595' }
        its(:device) { should == 'D' }
        its(:technology) { should == 'LS' }
      end
    end
  end
end
