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

    context "layers" do
      subject { document.layers }

      its(:count) { should == 8 }

      context "first layer" do
        subject { document.layers.first }

        its(:number) { should == 91 }
        its(:name) { should == 'Nets' }
        its(:color) { should == 2 }
        its(:fill) { should == 1 }
        its(:visible) { should == true }
        its(:active) { should == true }
      end
    end
  end
end
