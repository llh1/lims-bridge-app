require 'lims-laboratory-app/laboratory/plate'
require 'lims-laboratory-app/labels/labellable'

shared_context "a plate" do
  let(:plate_uuid) { "11111111-2222-3333-4444-555555555555" }
  let(:sample_uuids) {{
    "A1" => ["11111111-0000-0000-0000-111111111111"],
    "E5" => ["11111111-0000-0000-0000-333333333333"]
  }}
  let(:number_of_rows) { 8 }
  let(:number_of_columns) { 12 }
  let(:aliquot_quantity_1) { 100 }
  let(:aliquot_quantity_2) { 200 }
  let!(:plate) do
    Lims::LaboratoryApp::Laboratory::Plate.new(:number_of_rows => number_of_rows,  :number_of_columns => number_of_columns).tap do |plate|
      plate["A1"] << Lims::LaboratoryApp::Laboratory::Aliquot.new(:quantity => aliquot_quantity_1)
      plate["E5"] << Lims::LaboratoryApp::Laboratory::Aliquot.new(:quantity => aliquot_quantity_2)
    end
  end
end

shared_context "a transfered plate" do
  let(:transfered_sample_uuids) {{
    "A1" => ["11111111-0000-0000-0000-111111111111"],
    "A2" => ["11111111-0000-0000-0000-222222222222"],
    "B9" => ["11111111-0000-0000-0000-555555555555"],
    "E5" => ["11111111-0000-0000-0000-333333333333"]
  }}
  let(:transfered_plate) do
    Lims::LaboratoryApp::Laboratory::Plate.new(:number_of_rows => number_of_rows,  :number_of_columns => number_of_columns).tap do |plate|
      plate["A2"] << Lims::LaboratoryApp::Laboratory::Aliquot.new(:quantity => aliquot_quantity_1)
      plate["B9"] << Lims::LaboratoryApp::Laboratory::Aliquot.new(:quantity => aliquot_quantity_2)
      plate["E6"] << Lims::LaboratoryApp::Laboratory::Aliquot.new
    end
  end
end

shared_context "a labellable" do
  let(:barcode_type) { "sanger-barcode" }
  let(:barcode_value) { "ND0012345A" }
  let(:labellable) do
    Lims::LaboratoryApp::Labels::Labellable.new(:name => resource_uuid, :type => "resource").tap do |labellable|
      labellable["position"] = Lims::LaboratoryApp::Labels::Labellable::Label.new({
        :type => barcode_type,
        :value => barcode_value
      })
    end
  end
end
