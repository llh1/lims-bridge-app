require 'lims-bridge-app/spec_helper'

shared_context "gel message" do
  let(:message) do
    %Q{{"gel":{"actions":{"read":"http://localhost:9292/8a08b680-5a88-0131-9748-282066132de2","create":"http://localhost:9292/8a08b680-5a88-0131-9748-282066132de2","update":"http://localhost:9292/8a08b680-5a88-0131-9748-282066132de2","delete":"http://localhost:9292/8a08b680-5a88-0131-9748-282066132de2"},"uuid":"8a08b680-5a88-0131-9748-282066132de2","number_of_rows":8,"number_of_columns":12,"windows":{"A1":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-0000-0000-0000-111111111111","create":"http://localhost:9292/11111111-0000-0000-0000-111111111111","update":"http://localhost:9292/11111111-0000-0000-0000-111111111111","delete":"http://localhost:9292/11111111-0000-0000-0000-111111111111"},"uuid":"11111111-0000-0000-0000-111111111111","name":"Sample 1"},"quantity":10,"type":"DNA","unit":"mole"}],"A2":[],"A3":[],"A4":[],"A5":[],"A6":[],"A7":[],"A8":[],"A9":[],"A10":[],"A11":[],"A12":[],"B1":[],"B2":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-0000-0000-0000-222222222222","create":"http://localhost:9292/11111111-0000-0000-0000-222222222222","update":"http://localhost:9292/11111111-0000-0000-0000-222222222222","delete":"http://localhost:9292/11111111-0000-0000-0000-222222222222"},"uuid":"11111111-0000-0000-0000-222222222222","name":"Sample 2"},"quantity":20,"type":"RNA","unit":"mole"},{"quantity":20,"type":"solvent","unit":"ul"}],"B3":[],"B4":[],"B5":[],"B6":[],"B7":[],"B8":[],"B9":[],"B10":[],"B11":[],"B12":[],"C1":[],"C2":[],"C3":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-0000-0000-0000-333333333333","create":"http://localhost:9292/11111111-0000-0000-0000-333333333333","update":"http://localhost:9292/11111111-0000-0000-0000-333333333333","delete":"http://localhost:9292/11111111-0000-0000-0000-333333333333"},"uuid":"11111111-0000-0000-0000-333333333333","name":"Sample 3"},"quantity":30,"type":"DNA","out_of_bounds":{"concentration":33.33},"unit":"mole"}],"C4":[],"C5":[],"C6":[],"C7":[],"C8":[],"C9":[],"C10":[],"C11":[],"C12":[],"D1":[],"D2":[],"D3":[],"D4":[],"D5":[],"D6":[],"D7":[],"D8":[],"D9":[],"D10":[],"D11":[],"D12":[],"E1":[],"E2":[],"E3":[],"E4":[],"E5":[],"E6":[],"E7":[],"E8":[],"E9":[],"E10":[],"E11":[],"E12":[],"F1":[],"F2":[],"F3":[],"F4":[],"F5":[],"F6":[],"F7":[],"F8":[],"F9":[],"F10":[],"F11":[],"F12":[],"G1":[],"G2":[],"G3":[],"G4":[],"G5":[],"G6":[],"G7":[],"G8":[],"G9":[],"G10":[],"G11":[],"G12":[],"H1":[],"H2":[],"H3":[],"H4":[],"H5":[],"H6":[],"H7":[],"H8":[],"H9":[],"H10":[],"H11":[],"H12":[]}},"action":"create_gel","date":"2014-01-08 11:47:13 UTC","user":"llh1@sanger.ac.uk"}}
  end
end

shared_context "gel image message" do
  let(:gel_image_message) do
    %Q{{"gel_image":{"actions":{"read":"http://localhost:9292/49ac7f40-5a94-0131-974a-282066132de2","create":"http://localhost:9292/49ac7f40-5a94-0131-974a-282066132de2","update":"http://localhost:9292/49ac7f40-5a94-0131-974a-282066132de2","delete":"http://localhost:9292/49ac7f40-5a94-0131-974a-282066132de2"},"uuid":"49ac7f40-5a94-0131-974a-282066132de2","gel_uuid":"11111111-2222-3333-4444-666666666666","image":"image"},"action":"create_gel_image","date":"2014-01-08 11:47:13 UTC","user":"llh1@sanger.ac.uk"}}
  end

  let(:create_gel_image_message) do
    %Q{{"create_gel_image":{"actions":{},"user":"llh1@sanger.ac.uk","application":"test","result":{"gel_image":{"actions":{"read":"http://localhost:9292/016ea8f0-5a96-0131-974a-282066132de2","create":"http://localhost:9292/016ea8f0-5a96-0131-974a-282066132de2","update":"http://localhost:9292/016ea8f0-5a96-0131-974a-282066132de2","delete":"http://localhost:9292/016ea8f0-5a96-0131-974a-282066132de2"},"uuid":"016ea8f0-5a96-0131-974a-282066132de2","gel_uuid":"11111111-2222-3333-4444-666666666666","image":"image","filename":null, "scores":{"A1":"pass", "B2":"fail", "C3":"degraded", "D4":"partially degraded"}}}, "gel_image":null, "gel_uuid":"11111111-2222-3333-4444-666666666666", "scores":{"A1":"pass", "B2":"fail", "C3":"degraded", "D4":"partially degraded"}},"action":"create_gel_image","date":"2014-01-08 11:47:13 UTC","user":"llh1@sanger.ac.uk"}}
  end

  let(:update_action_message) do
    %Q{{"update_gel_image_score":{"actions":{},"user":"llh1@sanger.ac.uk","application":"test","result":{"gel_image":{"actions":{"read":"http://localhost:9292/016ea8f0-5a96-0131-974a-282066132de2","create":"http://localhost:9292/016ea8f0-5a96-0131-974a-282066132de2","update":"http://localhost:9292/016ea8f0-5a96-0131-974a-282066132de2","delete":"http://localhost:9292/016ea8f0-5a96-0131-974a-282066132de2"},"uuid":"016ea8f0-5a96-0131-974a-282066132de2","gel_uuid":"11111111-2222-3333-4444-666666666666","image":"image","filename":null, "scores":{"A1":"pass", "B2":"fail", "C3":"degraded", "D4":"partially degraded"}}}, "gel_image":null, "gel_uuid":"11111111-2222-3333-4444-666666666666", "scores":{"A1":"pass", "B2":"fail", "C3":"degraded", "D4":"partially degraded"}},"action":"update_gel_image_score","date":"2014-01-08 11:47:13 UTC","user":"llh1@sanger.ac.uk"}}
  end
end

shared_context "labellable message" do
  let(:labellable_message) do
    %Q{{"labellable":{"actions":{"read":"http://localhost:9292/506eacc0-5a9d-0131-974c-282066132de2","create":"http://localhost:9292/506eacc0-5a9d-0131-974c-282066132de2","update":"http://localhost:9292/506eacc0-5a9d-0131-974c-282066132de2","delete":"http://localhost:9292/506eacc0-5a9d-0131-974c-282066132de2"},"uuid":"506eacc0-5a9d-0131-974c-282066132de2","name":"4fefaa90-5a9d-0131-974c-282066132de2","type":"resource","labels":{"position 1":{"value":"ND00000A","type":"sanger-barcode"},"position 2":{"value":"NC00000B","type":"ean13-barcode"}}},"action":"create_labellable","date":"2014-01-08 14:15:56 UTC","user":"llh1@sanger.ac.uk"}}
  end

  let(:bulk_create_labellable_message) do
    %Q{{"bulk_create_labellable":{"actions":{},"user":"llh1@sanger.ac.uk","application":"test","result":{"labellables":[{"actions":{"read":"http://localhost:9292/8ccd5e70-5aa0-0131-974c-282066132de2","create":"http://localhost:9292/8ccd5e70-5aa0-0131-974c-282066132de2","update":"http://localhost:9292/8ccd5e70-5aa0-0131-974c-282066132de2","delete":"http://localhost:9292/8ccd5e70-5aa0-0131-974c-282066132de2"},"uuid":"8ccd5e70-5aa0-0131-974c-282066132de2","name":"11111111-0000-0000-0000-111111111111","type":"resource","labels":{"front barcode":{"value":"1234-ABC","type":"sanger-barcode"}}},{"actions":{"read":"http://localhost:9292/8ccd84e0-5aa0-0131-974c-282066132de2","create":"http://localhost:9292/8ccd84e0-5aa0-0131-974c-282066132de2","update":"http://localhost:9292/8ccd84e0-5aa0-0131-974c-282066132de2","delete":"http://localhost:9292/8ccd84e0-5aa0-0131-974c-282066132de2"},"uuid":"8ccd84e0-5aa0-0131-974c-282066132de2","name":"11111111-0000-0000-0000-222222222222","type":"resource","labels":{"front barcode":{"value":"5678-DEF","type":"ean13-barcode"}}}]},"labellables":[{"name":"11111111-0000-0000-0000-111111111111","type":"resource","labels":{"front barcode":{"value":"1234-ABC","type":"sanger-barcode"}}},{"name":"11111111-0000-0000-0000-222222222222","type":"resource","labels":{"front barcode":{"value":"5678-DEF","type":"ean13-barcode"}}}]},"action":"bulk_create_labellable","date":"2014-01-08 14:39:06 UTC","user":"llh1@sanger.ac.uk"}}
  end

  let(:create_label_message) do
    %Q{{"create_label":{"actions":{},"user":"llh1@sanger.ac.uk","application":"test","result":{"labellable":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-4444-555555555555","create":"http://localhost:9292/11111111-2222-3333-4444-555555555555","update":"http://localhost:9292/11111111-2222-3333-4444-555555555555","delete":"http://localhost:9292/11111111-2222-3333-4444-555555555555"},"uuid":"11111111-2222-3333-4444-555555555555","name":"11111111-2222-3333-4444-666666666666","type":"resource","labels":{"position 1":{"value":"2d-barcode-1234","type":"2d-barcode"}}}},"labellable_uuid":"11111111-2222-3333-4444-555555555555","type":"2d-barcode","value":"2d-barcode-1234","position":"position 1"},"action":"create_label","date":"2014-01-08 16:25:53 UTC","user":"llh1@sanger.ac.uk"}}
  end

  let(:update_label_message) do
    %Q{{"update_label":{"actions":{},"user":"user","application":"application","result":{"labellable":{"actions":{"read":"http://example.org/11111111-2222-3333-4444-555555555555","update":"http://example.org/11111111-2222-3333-4444-555555555555","delete":"http://example.org/11111111-2222-3333-4444-555555555555","create":"http://example.org/11111111-2222-3333-4444-555555555555"},"uuid":"11111111-2222-3333-4444-555555555555","name":"11111111-2222-3333-4444-000000000000","type":"resource","labels":{"rearbarcode":{"value":"5678DEF","type":"sanger-barcode"}}}},"labellable_uuid":"11111111-2222-3333-4444-555555555555","existing_position":"frontbarcode","new_label":{"position":"rearbarcode","type":"sanger-barcode","value":"5678DEF"}},"action":"update_label","date":"2014-01-08 16:25:53 UTC","user":"llh1@sanger.ac.uk"}}
  end

  let(:bulk_update_label_message) do
    %Q{{"bulk_update_label":{"actions":{},"user":"user@example.com","application":"application_id","result":{"labellables":[{"actions":{"read":"http://example.org/11111111-2222-3333-4444-555555555555","create":"http://example.org/11111111-2222-3333-4444-555555555555","update":"http://example.org/11111111-2222-3333-4444-555555555555","delete":"http://example.org/11111111-2222-3333-4444-555555555555"},"uuid":"11111111-2222-3333-4444-555555555555","name":"11111111-2222-3333-4444-000000000000","type":"resource","labels":{"sanger_id":{"value":"s1","type":"sanger-barcode"},"lot_no":{"value":"1","type":"text"},"barcode":{"value":"123","type":"sanger-barcode"}}}]},"by":"uuid","labels":{"11111111-2222-3333-4444-000000000000":{"lot_no":{"value":"1","type":"text"},"barcode":{"value":"123","type":"sanger-barcode"}}}},"action":"bulk_update_label","date":"2014-01-08 16:25:53 UTC","user":"llh1@sanger.ac.uk"}}
  end
end

shared_context "order message" do
  let(:order_message) do
    %Q{{"order":{"actions":{"read":"http://localhost:9292/a8665420-5b74-0131-978c-282066132de2","create":"http://localhost:9292/a8665420-5b74-0131-978c-282066132de2","update":"http://localhost:9292/a8665420-5b74-0131-978c-282066132de2","delete":"http://localhost:9292/a8665420-5b74-0131-978c-282066132de2"},"uuid":"a8665420-5b74-0131-978c-282066132de2","pipeline":"pipeline 1","status":"draft","parameters":{},"state":{},"cost_code":"cost code","creator":{"actions":{"read":"http://localhost:9292/66666666-2222-4444-9999-000000000000","create":"http://localhost:9292/66666666-2222-4444-9999-000000000000","update":"http://localhost:9292/66666666-2222-4444-9999-000000000000","delete":"http://localhost:9292/66666666-2222-4444-9999-000000000000"},"uuid":"66666666-2222-4444-9999-000000000000"},"study":{"actions":{"read":"http://localhost:9292/55555555-2222-3333-6666-777777777777","create":"http://localhost:9292/55555555-2222-3333-6666-777777777777","update":"http://localhost:9292/55555555-2222-3333-6666-777777777777","delete":"http://localhost:9292/55555555-2222-3333-6666-777777777777"},"uuid":"55555555-2222-3333-6666-777777777777"},"items":{"test":[{"uuid":"a7efcf80-5b74-0131-978c-282066132de2","status":"done","batch":null}],"test2":[{"uuid":"a7efcf80-5b74-0131-978c-282066132de2","status":"pending","batch":null}]}},"action":"update_order","date":"2014-01-09 15:57:26 UTC","user":"user"}}
  end
end

shared_context "plate message" do
  let(:plate_message) do
    %Q{{"plate":{"actions":{"read":"http://localhost:9292/e475ccc0-5b77-0131-978c-282066132de2","create":"http://localhost:9292/e475ccc0-5b77-0131-978c-282066132de2","update":"http://localhost:9292/e475ccc0-5b77-0131-978c-282066132de2","delete":"http://localhost:9292/e475ccc0-5b77-0131-978c-282066132de2"},"uuid":"e475ccc0-5b77-0131-978c-282066132de2","type":null,"number_of_rows":8,"number_of_columns":12,"wells":{"A1":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-4444-555555555555","create":"http://localhost:9292/11111111-2222-3333-4444-555555555555","update":"http://localhost:9292/11111111-2222-3333-4444-555555555555","delete":"http://localhost:9292/11111111-2222-3333-4444-555555555555"},"uuid":"11111111-2222-3333-4444-555555555555","name":"Sample 1"},"quantity":1,"type":"Sample type","unit":"mole"}],"A2":[],"A3":[],"A4":[],"A5":[],"A6":[],"A7":[],"A8":[],"A9":[],"A10":[],"A11":[],"A12":[],"B1":[],"B2":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-4444-666666666666","create":"http://localhost:9292/11111111-2222-3333-4444-666666666666","update":"http://localhost:9292/11111111-2222-3333-4444-666666666666","delete":"http://localhost:9292/11111111-2222-3333-4444-666666666666"},"uuid":"11111111-2222-3333-4444-666666666666","name":"Sample 2"},"quantity":2,"type":"Sample type 2","unit":"mole"},{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-4444-777777777777","create":"http://localhost:9292/11111111-2222-3333-4444-777777777777","update":"http://localhost:9292/11111111-2222-3333-4444-777777777777","delete":"http://localhost:9292/11111111-2222-3333-4444-777777777777"},"uuid":"11111111-2222-3333-4444-777777777777","name":"Sample 3"},"quantity":3,"type":"Sample type 3","unit":"mole"}],"B3":[],"B4":[],"B5":[],"B6":[],"B7":[],"B8":[],"B9":[],"B10":[],"B11":[],"B12":[],"C1":[],"C2":[],"C3":[],"C4":[],"C5":[],"C6":[],"C7":[],"C8":[],"C9":[],"C10":[],"C11":[],"C12":[],"D1":[],"D2":[],"D3":[],"D4":[],"D5":[],"D6":[],"D7":[],"D8":[],"D9":[],"D10":[],"D11":[],"D12":[],"E1":[],"E2":[],"E3":[],"E4":[],"E5":[],"E6":[],"E7":[],"E8":[],"E9":[],"E10":[],"E11":[],"E12":[],"F1":[],"F2":[],"F3":[],"F4":[],"F5":[],"F6":[],"F7":[],"F8":[],"F9":[],"F10":[],"F11":[],"F12":[],"G1":[],"G2":[],"G3":[],"G4":[],"G5":[],"G6":[],"G7":[],"G8":[],"G9":[],"G10":[],"G11":[],"G12":[],"H1":[],"H2":[],"H3":[],"H4":[],"H5":[],"H6":[],"H7":[],"H8":[],"H9":[],"H10":[],"H11":[],"H12":[]}},"action":"create","date":"2014-01-09 16:20:35 UTC","user":"user"}}
  end

  let(:transfer_plate_message) do
    %Q{{"plate_transfer":{"actions":{},"user":"user","application":"application","result":{"plate":{"actions":{"read":"http://localhost:9292/8283b500-5b7d-0131-978c-282066132de2","create":"http://localhost:9292/8283b500-5b7d-0131-978c-282066132de2","update":"http://localhost:9292/8283b500-5b7d-0131-978c-282066132de2","delete":"http://localhost:9292/8283b500-5b7d-0131-978c-282066132de2"},"uuid":"8283b500-5b7d-0131-978c-282066132de2","type":null,"number_of_rows":8,"number_of_columns":12,"wells":{"A1":[],"A2":[],"A3":[],"A4":[],"A5":[],"A6":[],"A7":[],"A8":[],"A9":[],"A10":[],"A11":[],"A12":[],"B1":[],"B2":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":10.0,"type":"new type","unit":"mole"},{"quantity":20.0,"type":"new type","unit":"mole"}],"B3":[],"B4":[],"B5":[],"B6":[],"B7":[],"B8":[],"B9":[],"B10":[],"B11":[],"B12":[],"C1":[],"C2":[],"C3":[],"C4":[],"C5":[],"C6":[],"C7":[],"C8":[],"C9":[],"C10":[],"C11":[],"C12":[],"D1":[],"D2":[],"D3":[],"D4":[],"D5":[],"D6":[],"D7":[],"D8":[],"D9":[],"D10":[],"D11":[],"D12":[],"E1":[],"E2":[],"E3":[],"E4":[],"E5":[],"E6":[],"E7":[],"E8":[],"E9":[],"E10":[],"E11":[],"E12":[],"F1":[],"F2":[],"F3":[],"F4":[],"F5":[],"F6":[],"F7":[],"F8":[],"F9":[],"F10":[],"F11":[],"F12":[],"G1":[],"G2":[],"G3":[],"G4":[],"G5":[],"G6":[],"G7":[],"G8":[],"G9":[],"G10":[],"G11":[],"G12":[],"H1":[],"H2":[],"H3":[],"H4":[],"H5":[],"H6":[],"H7":[],"H8":[],"H9":[],"H10":[],"H11":[],"H12":[]}}},"source":{"plate":{"actions":{"read":"http://localhost:9292/82805a60-5b7d-0131-978c-282066132de2","create":"http://localhost:9292/82805a60-5b7d-0131-978c-282066132de2","update":"http://localhost:9292/82805a60-5b7d-0131-978c-282066132de2","delete":"http://localhost:9292/82805a60-5b7d-0131-978c-282066132de2"},"uuid":"82805a60-5b7d-0131-978c-282066132de2","type":null,"number_of_rows":8,"number_of_columns":12,"wells":{"A1":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":0.0,"type":"DNA","unit":"mole"},{"quantity":0.0,"type":"solvent","unit":"ul"}],"A2":[],"A3":[],"A4":[],"A5":[],"A6":[],"A7":[],"A8":[],"A9":[],"A10":[],"A11":[],"A12":[],"B1":[],"B2":[],"B3":[],"B4":[],"B5":[],"B6":[],"B7":[],"B8":[],"B9":[],"B10":[],"B11":[],"B12":[],"C1":[],"C2":[],"C3":[],"C4":[],"C5":[],"C6":[],"C7":[],"C8":[],"C9":[],"C10":[],"C11":[],"C12":[],"D1":[],"D2":[],"D3":[],"D4":[],"D5":[],"D6":[],"D7":[],"D8":[],"D9":[],"D10":[],"D11":[],"D12":[],"E1":[],"E2":[],"E3":[],"E4":[],"E5":[],"E6":[],"E7":[],"E8":[],"E9":[],"E10":[],"E11":[],"E12":[],"F1":[],"F2":[],"F3":[],"F4":[],"F5":[],"F6":[],"F7":[],"F8":[],"F9":[],"F10":[],"F11":[],"F12":[],"G1":[],"G2":[],"G3":[],"G4":[],"G5":[],"G6":[],"G7":[],"G8":[],"G9":[],"G10":[],"G11":[],"G12":[],"H1":[],"H2":[],"H3":[],"H4":[],"H5":[],"H6":[],"H7":[],"H8":[],"H9":[],"H10":[],"H11":[],"H12":[]}}},"target":{"plate":{"actions":{"read":"http://localhost:9292/8283b500-5b7d-0131-978c-282066132de2","create":"http://localhost:9292/8283b500-5b7d-0131-978c-282066132de2","update":"http://localhost:9292/8283b500-5b7d-0131-978c-282066132de2","delete":"http://localhost:9292/8283b500-5b7d-0131-978c-282066132de2"},"uuid":"8283b500-5b7d-0131-978c-282066132de2","type":null,"number_of_rows":8,"number_of_columns":12,"wells":{"A1":[],"A2":[],"A3":[],"A4":[],"A5":[],"A6":[],"A7":[],"A8":[],"A9":[],"A10":[],"A11":[],"A12":[],"B1":[],"B2":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":10.0,"type":"new type","unit":"mole"},{"quantity":20.0,"type":"new type","unit":"mole"}],"B3":[],"B4":[],"B5":[],"B6":[],"B7":[],"B8":[],"B9":[],"B10":[],"B11":[],"B12":[],"C1":[],"C2":[],"C3":[],"C4":[],"C5":[],"C6":[],"C7":[],"C8":[],"C9":[],"C10":[],"C11":[],"C12":[],"D1":[],"D2":[],"D3":[],"D4":[],"D5":[],"D6":[],"D7":[],"D8":[],"D9":[],"D10":[],"D11":[],"D12":[],"E1":[],"E2":[],"E3":[],"E4":[],"E5":[],"E6":[],"E7":[],"E8":[],"E9":[],"E10":[],"E11":[],"E12":[],"F1":[],"F2":[],"F3":[],"F4":[],"F5":[],"F6":[],"F7":[],"F8":[],"F9":[],"F10":[],"F11":[],"F12":[],"G1":[],"G2":[],"G3":[],"G4":[],"G5":[],"G6":[],"G7":[],"G8":[],"G9":[],"G10":[],"G11":[],"G12":[],"H1":[],"H2":[],"H3":[],"H4":[],"H5":[],"H6":[],"H7":[],"H8":[],"H9":[],"H10":[],"H11":[],"H12":[]}}},"transfer_map":{"A1":"B2"},"aliquot_type":"new type"},"action":"plate_transfer","date":"2014-01-09 17:00:49 UTC","user":"user"}}
  end

  let(:transfer_plates_to_plates_message) do
    %Q{{"transfer_plates_to_plates":{"actions":{},"user":"user","application":"application","result":{"sources":[{"plate":{"actions":{"read":"http://localhost:9292/8c243f30-5c2b-0131-979c-282066132de2","create":"http://localhost:9292/8c243f30-5c2b-0131-979c-282066132de2","update":"http://localhost:9292/8c243f30-5c2b-0131-979c-282066132de2","delete":"http://localhost:9292/8c243f30-5c2b-0131-979c-282066132de2"},"uuid":"8c243f30-5c2b-0131-979c-282066132de2","type":null,"number_of_rows":8,"number_of_columns":12,"wells":{"A1":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":5.0,"type":"DNA","unit":"mole"},{"quantity":10.0,"type":"solvent","unit":"ul"}],"A2":[],"A3":[],"A4":[],"A5":[],"A6":[],"A7":[],"A8":[],"A9":[],"A10":[],"A11":[],"A12":[],"B1":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-222222222222","create":"http://localhost:9292/11111111-2222-3333-0000-222222222222","update":"http://localhost:9292/11111111-2222-3333-0000-222222222222","delete":"http://localhost:9292/11111111-2222-3333-0000-222222222222"},"uuid":"11111111-2222-3333-0000-222222222222","name":"Sample 2"},"quantity":10.0,"type":"DNA","unit":"mole"},{"quantity":10.0,"type":"solvent","unit":"ul"}],"B2":[],"B3":[],"B4":[],"B5":[],"B6":[],"B7":[],"B8":[],"B9":[],"B10":[],"B11":[],"B12":[],"C1":[],"C2":[],"C3":[],"C4":[],"C5":[],"C6":[],"C7":[],"C8":[],"C9":[],"C10":[],"C11":[],"C12":[],"D1":[],"D2":[],"D3":[],"D4":[],"D5":[],"D6":[],"D7":[],"D8":[],"D9":[],"D10":[],"D11":[],"D12":[],"E1":[],"E2":[],"E3":[],"E4":[],"E5":[],"E6":[],"E7":[],"E8":[],"E9":[],"E10":[],"E11":[],"E12":[],"F1":[],"F2":[],"F3":[],"F4":[],"F5":[],"F6":[],"F7":[],"F8":[],"F9":[],"F10":[],"F11":[],"F12":[],"G1":[],"G2":[],"G3":[],"G4":[],"G5":[],"G6":[],"G7":[],"G8":[],"G9":[],"G10":[],"G11":[],"G12":[],"H1":[],"H2":[],"H3":[],"H4":[],"H5":[],"H6":[],"H7":[],"H8":[],"H9":[],"H10":[],"H11":[],"H12":[]}}}],"targets":[{"plate":{"actions":{"read":"http://localhost:9292/8c27b680-5c2b-0131-979c-282066132de2","create":"http://localhost:9292/8c27b680-5c2b-0131-979c-282066132de2","update":"http://localhost:9292/8c27b680-5c2b-0131-979c-282066132de2","delete":"http://localhost:9292/8c27b680-5c2b-0131-979c-282066132de2"},"uuid":"8c27b680-5c2b-0131-979c-282066132de2","type":null,"number_of_rows":8,"number_of_columns":12,"wells":{"A1":[],"A2":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":5.0,"type":"DNA","unit":"mole"},{"quantity":10.0,"type":"solvent","unit":"ul"}],"A3":[],"A4":[],"A5":[],"A6":[],"A7":[],"A8":[],"A9":[],"A10":[],"A11":[],"A12":[],"B1":[],"B2":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-222222222222","create":"http://localhost:9292/11111111-2222-3333-0000-222222222222","update":"http://localhost:9292/11111111-2222-3333-0000-222222222222","delete":"http://localhost:9292/11111111-2222-3333-0000-222222222222"},"uuid":"11111111-2222-3333-0000-222222222222","name":"Sample 2"},"quantity":10.0,"type":"DNA","unit":"mole"},{"quantity":10.0,"type":"solvent","unit":"ul"}],"B3":[],"B4":[],"B5":[],"B6":[],"B7":[],"B8":[],"B9":[],"B10":[],"B11":[],"B12":[],"C1":[],"C2":[],"C3":[],"C4":[],"C5":[],"C6":[],"C7":[],"C8":[],"C9":[],"C10":[],"C11":[],"C12":[],"D1":[],"D2":[],"D3":[],"D4":[],"D5":[],"D6":[],"D7":[],"D8":[],"D9":[],"D10":[],"D11":[],"D12":[],"E1":[],"E2":[],"E3":[],"E4":[],"E5":[],"E6":[],"E7":[],"E8":[],"E9":[],"E10":[],"E11":[],"E12":[],"F1":[],"F2":[],"F3":[],"F4":[],"F5":[],"F6":[],"F7":[],"F8":[],"F9":[],"F10":[],"F11":[],"F12":[],"G1":[],"G2":[],"G3":[],"G4":[],"G5":[],"G6":[],"G7":[],"G8":[],"G9":[],"G10":[],"G11":[],"G12":[],"H1":[],"H2":[],"H3":[],"H4":[],"H5":[],"H6":[],"H7":[],"H8":[],"H9":[],"H10":[],"H11":[],"H12":[]}}}]},"transfers":[{"source_uuid":"8c243f30-5c2b-0131-979c-282066132de2","target_uuid":"8c27b680-5c2b-0131-979c-282066132de2","source_location":"A1","target_location":"A2","fraction":0.5},{"source_uuid":"8c243f30-5c2b-0131-979c-282066132de2","target_uuid":"8c27b680-5c2b-0131-979c-282066132de2","source_location":"B1","target_location":"B2","fraction":0.5}]},"action":"transfer_plates_to_plates","date":"2014-01-10 13:46:37 UTC","user":"user"}}
  end
end

shared_context "sample message" do
  let(:sample_message) do
    %Q{{"sample":{"actions":{"read":"http://localhost:9292/c20b3b60-5c2f-0131-97a0-282066132de2","create":"http://localhost:9292/c20b3b60-5c2f-0131-97a0-282066132de2","update":"http://localhost:9292/c20b3b60-5c2f-0131-97a0-282066132de2","delete":"http://localhost:9292/c20b3b60-5c2f-0131-97a0-282066132de2"},"uuid":"c20b3b60-5c2f-0131-97a0-282066132de2","state":"draft","supplier_sample_name":"supplier sample name","gender":"Male","sanger_sample_id":"StudyX-506","sample_type":"Cell Pellet","scientific_name":"homo sapiens","common_name":"man","hmdmc_number":"123456","ebi_accession_number":"accession number","sample_source":"sample source","mother":"mother","father":"father","sibling":"sibling","gc_content":"gc content","public_name":"public name","cohort":"cohort","storage_conditions":"storage conditions","taxon_id":9606,"volume":100,"date_of_sample_collection":"2013-06-24T00:00:00+01:00","is_sample_a_control":true,"is_re_submitted_sample":false,"dna":{"pre_amplified":false,"date_of_sample_extraction":"2013-06-02T00:00:00+00:00","extraction_method":"extraction method","concentration":120,"sample_purified":false,"concentration_determined_by_which_method":"method"},"rna":{"pre_amplified":true,"date_of_sample_extraction":"2013-06-02T00:00:00+00:00","extraction_method":"extraction method","concentration":120,"sample_purified":true,"concentration_determined_by_which_method":"method"},"cellular_material":{"lysed":true},"genotyping":{"country_of_origin":"england","geographical_region":"europe","ethnicity":"english"}},"action":"create_sample","date":"2014-01-10 14:16:45 UTC","user":"user"}}
  end

  let(:bulk_create_sample_message) do
    %Q{{"bulk_create_sample":{"actions":{},"user":"user","application":"application","result":{"samples":[{"actions":{"read":"http://localhost:9292/4d8bc240-5c3f-0131-97af-282066132de2","create":"http://localhost:9292/4d8bc240-5c3f-0131-97af-282066132de2","update":"http://localhost:9292/4d8bc240-5c3f-0131-97af-282066132de2","delete":"http://localhost:9292/4d8bc240-5c3f-0131-97af-282066132de2"},"uuid":"4d8bc240-5c3f-0131-97af-282066132de2","state":"published","supplier_sample_name":"supplier sample name","gender":"Male","sanger_sample_id":"StudyX-513","sample_type":"RNA","scientific_name":"homo sapiens","common_name":"man","hmdmc_number":"123456","ebi_accession_number":"accession number","sample_source":"sample source","mother":"mother","father":"father","sibling":"sibling","gc_content":"gc content","public_name":"public name","cohort":"cohort","storage_conditions":"storage conditions","taxon_id":9606,"volume":100,"date_of_sample_collection":"2013-06-24T00:00:00+01:00","is_sample_a_control":false,"is_re_submitted_sample":true,"dna":{"pre_amplified":false,"date_of_sample_extraction":"2013-06-02T00:00:00+00:00","extraction_method":"extraction method","concentration":120,"sample_purified":false,"concentration_determined_by_which_method":"method"},"cellular_material":{"lysed":false,"extraction_process":"DNA & RNA Manual"},"genotyping":{"country_of_origin":"england","geographical_region":"europe","ethnicity":"english"}},{"actions":{"read":"http://localhost:9292/4d8c4bd0-5c3f-0131-97af-282066132de2","create":"http://localhost:9292/4d8c4bd0-5c3f-0131-97af-282066132de2","update":"http://localhost:9292/4d8c4bd0-5c3f-0131-97af-282066132de2","delete":"http://localhost:9292/4d8c4bd0-5c3f-0131-97af-282066132de2"},"uuid":"4d8c4bd0-5c3f-0131-97af-282066132de2","state":"published","supplier_sample_name":"supplier sample name","gender":"Male","sanger_sample_id":"StudyX-514","sample_type":"RNA","scientific_name":"homo sapiens","common_name":"man","hmdmc_number":"123456","ebi_accession_number":"accession number","sample_source":"sample source","mother":"mother","father":"father","sibling":"sibling","gc_content":"gc content","public_name":"public name","cohort":"cohort","storage_conditions":"storage conditions","taxon_id":9606,"volume":100,"date_of_sample_collection":"2013-06-24T00:00:00+01:00","is_sample_a_control":false,"is_re_submitted_sample":true,"dna":{"pre_amplified":false,"date_of_sample_extraction":"2013-06-02T00:00:00+00:00","extraction_method":"extraction method","concentration":120,"sample_purified":false,"concentration_determined_by_which_method":"method"},"cellular_material":{"lysed":false,"extraction_process":"DNA & RNA Manual"},"genotyping":{"country_of_origin":"england","geographical_region":"europe","ethnicity":"english"}}]},"volume":100,"date_of_sample_collection":"2013-06-24","is_sample_a_control":false,"is_re_submitted_sample":true,"hmdmc_number":"123456","ebi_accession_number":"accession number","sample_source":"sample source","mother":"mother","father":"father","sibling":"sibling","gc_content":"gc content","public_name":"public name","cohort":"cohort","storage_conditions":"storage conditions","dna":{"pre_amplified":false,"date_of_sample_extraction":"2013-06-02","extraction_method":"extraction method","concentration":120,"sample_purified":false,"concentration_determined_by_which_method":"method"},"rna":null,"cellular_material":{"lysed":false,"extraction_process":"DNA & RNA Manual"},"genotyping":{"country_of_origin":"england","geographical_region":"europe","ethnicity":"english"},"common_name":"man","gender":"Male","sample_type":"RNA","taxon_id":9606,"supplier_sample_name":"supplier sample name","scientific_name":"homo sapiens","quantity":2,"state":"published","sanger_sample_id_core":"StudyX"},"action":"bulk_create_sample","date":"2014-01-10 16:08:01 UTC","user":"user"}}
  end
end

shared_context "tube_rack message" do
  let(:tube_rack_message) do
    %Q{{"tube_rack":{"actions":{"read":"http://localhost:9292/e1c6ef60-5c41-0131-97bc-282066132de2","create":"http://localhost:9292/e1c6ef60-5c41-0131-97bc-282066132de2","update":"http://localhost:9292/e1c6ef60-5c41-0131-97bc-282066132de2","delete":"http://localhost:9292/e1c6ef60-5c41-0131-97bc-282066132de2"},"uuid":"e1c6ef60-5c41-0131-97bc-282066132de2","number_of_rows":8,"number_of_columns":12,"tubes":{"A1":{"actions":{"read":"http://localhost:9292/e1a9f730-5c41-0131-97bc-282066132de2","create":"http://localhost:9292/e1a9f730-5c41-0131-97bc-282066132de2","update":"http://localhost:9292/e1a9f730-5c41-0131-97bc-282066132de2","delete":"http://localhost:9292/e1a9f730-5c41-0131-97bc-282066132de2"},"uuid":"e1a9f730-5c41-0131-97bc-282066132de2","type":null,"max_volume":null,"aliquots":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":10,"type":"DNA","unit":"mole"},{"quantity":100,"type":"solvent","unit":"ul"}]}}},"action":"create","date":"2014-01-10 16:26:29 UTC","user":"user"}}
  end

  let(:tube_rack_move_message) do
    %Q{{"tube_rack_move":{"actions":{},"user":"user","application":"application","result":[{"tube_rack":{"actions":{"read":"http://localhost:9292/7d2fdd60-5c43-0131-97bc-282066132de2","create":"http://localhost:9292/7d2fdd60-5c43-0131-97bc-282066132de2","update":"http://localhost:9292/7d2fdd60-5c43-0131-97bc-282066132de2","delete":"http://localhost:9292/7d2fdd60-5c43-0131-97bc-282066132de2"},"uuid":"7d2fdd60-5c43-0131-97bc-282066132de2","number_of_rows":8,"number_of_columns":12,"tubes":{"A2":{"actions":{"read":"http://localhost:9292/7cda9420-5c43-0131-97bc-282066132de2","create":"http://localhost:9292/7cda9420-5c43-0131-97bc-282066132de2","update":"http://localhost:9292/7cda9420-5c43-0131-97bc-282066132de2","delete":"http://localhost:9292/7cda9420-5c43-0131-97bc-282066132de2"},"uuid":"7cda9420-5c43-0131-97bc-282066132de2","type":null,"max_volume":null,"aliquots":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":10,"type":"DNA","unit":"mole"},{"quantity":100,"type":"solvent","unit":"ul"}]},"B2":{"actions":{"read":"http://localhost:9292/7cdccd20-5c43-0131-97bc-282066132de2","create":"http://localhost:9292/7cdccd20-5c43-0131-97bc-282066132de2","update":"http://localhost:9292/7cdccd20-5c43-0131-97bc-282066132de2","delete":"http://localhost:9292/7cdccd20-5c43-0131-97bc-282066132de2"},"uuid":"7cdccd20-5c43-0131-97bc-282066132de2","type":null,"max_volume":null,"aliquots":[]}}}}],"moves":[{"source_uuid":"7cfb5530-5c43-0131-97bc-282066132de2","source_location":"A1","target_uuid":"7d2fdd60-5c43-0131-97bc-282066132de2","target_location":"A2"},{"source_uuid":"7cfb5530-5c43-0131-97bc-282066132de2","source_location":"B1","target_uuid":"7d2fdd60-5c43-0131-97bc-282066132de2","target_location":"B2"}]},"action":"tube_rack_move","date":"2014-01-10 16:37:59 UTC","user":"user"}}
  end

  let(:tube_rack_transfer_message) do
    %Q{{"tube_rack_transfer":{"actions":{},"user":"user","application":"application","result":{"tube_rack":{"actions":{"read":"http://localhost:9292/ec85e490-5c44-0131-97bc-282066132de2","create":"http://localhost:9292/ec85e490-5c44-0131-97bc-282066132de2","update":"http://localhost:9292/ec85e490-5c44-0131-97bc-282066132de2","delete":"http://localhost:9292/ec85e490-5c44-0131-97bc-282066132de2"},"uuid":"ec85e490-5c44-0131-97bc-282066132de2","number_of_rows":8,"number_of_columns":12,"tubes":{"B1":{"actions":{"read":"http://localhost:9292/ec20a2e0-5c44-0131-97bc-282066132de2","create":"http://localhost:9292/ec20a2e0-5c44-0131-97bc-282066132de2","update":"http://localhost:9292/ec20a2e0-5c44-0131-97bc-282066132de2","delete":"http://localhost:9292/ec20a2e0-5c44-0131-97bc-282066132de2"},"uuid":"ec20a2e0-5c44-0131-97bc-282066132de2","type":null,"max_volume":null,"aliquots":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":10,"type":"DNA","unit":"mole"},{"quantity":100,"type":"solvent","unit":"ul"}]}}}},"source":{"tube_rack":{"actions":{"read":"http://localhost:9292/ec507670-5c44-0131-97bc-282066132de2","create":"http://localhost:9292/ec507670-5c44-0131-97bc-282066132de2","update":"http://localhost:9292/ec507670-5c44-0131-97bc-282066132de2","delete":"http://localhost:9292/ec507670-5c44-0131-97bc-282066132de2"},"uuid":"ec507670-5c44-0131-97bc-282066132de2","number_of_rows":8,"number_of_columns":12,"tubes":{"A1":{"actions":{"read":"http://localhost:9292/ec1c3a80-5c44-0131-97bc-282066132de2","create":"http://localhost:9292/ec1c3a80-5c44-0131-97bc-282066132de2","update":"http://localhost:9292/ec1c3a80-5c44-0131-97bc-282066132de2","delete":"http://localhost:9292/ec1c3a80-5c44-0131-97bc-282066132de2"},"uuid":"ec1c3a80-5c44-0131-97bc-282066132de2","type":null,"max_volume":null,"aliquots":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":0,"type":"DNA","unit":"mole"},{"quantity":0,"type":"solvent","unit":"ul"}]}}}},"target":{"tube_rack":{"actions":{"read":"http://localhost:9292/ec85e490-5c44-0131-97bc-282066132de2","create":"http://localhost:9292/ec85e490-5c44-0131-97bc-282066132de2","update":"http://localhost:9292/ec85e490-5c44-0131-97bc-282066132de2","delete":"http://localhost:9292/ec85e490-5c44-0131-97bc-282066132de2"},"uuid":"ec85e490-5c44-0131-97bc-282066132de2","number_of_rows":8,"number_of_columns":12,"tubes":{"B1":{"actions":{"read":"http://localhost:9292/ec20a2e0-5c44-0131-97bc-282066132de2","create":"http://localhost:9292/ec20a2e0-5c44-0131-97bc-282066132de2","update":"http://localhost:9292/ec20a2e0-5c44-0131-97bc-282066132de2","delete":"http://localhost:9292/ec20a2e0-5c44-0131-97bc-282066132de2"},"uuid":"ec20a2e0-5c44-0131-97bc-282066132de2","type":null,"max_volume":null,"aliquots":[{"sample":{"actions":{"read":"http://localhost:9292/11111111-2222-3333-0000-111111111111","create":"http://localhost:9292/11111111-2222-3333-0000-111111111111","update":"http://localhost:9292/11111111-2222-3333-0000-111111111111","delete":"http://localhost:9292/11111111-2222-3333-0000-111111111111"},"uuid":"11111111-2222-3333-0000-111111111111","name":"Sample 1"},"quantity":10,"type":"DNA","unit":"mole"},{"quantity":100,"type":"solvent","unit":"ul"}]}}}},"transfer_map":{"A1":"B1"}},"action":"tube_rack_transfer","date":"2014-01-10 16:48:15 UTC","user":"user"}}
  end
end