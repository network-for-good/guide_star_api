# frozen_string_literal: true

module GuideStarStubs
  def stub_search(search_terms, status_code, response_body)
    stub_request(:post, "https://apidata.guidestar.org/essentials/v2/")
      .with(
        body: "{\"search_terms\":\"#{search_terms}\"}"
      )
      .to_return(status: status_code, body: response_body, headers: {})
  end

  def stub_search_with_term_that_returns_no_results(search_terms)
    stub_search(search_terms, 404, search_with_no_results_response)
  end

  def stub_search_with_term_that_returns_a_single_result(search_terms)
    stub_search(search_terms, 200, search_with_a_single_result_response(search_terms))
  end

  def search_with_no_results_response
    {
      "code" => 404,
      "message" => "Oops! We didn't find anything on that query, try again with a different query!",
      "took" => 24,
      "errors" => []
    }.to_json
  end

  def search_with_a_single_result_response(ein = "68-0480736")
    { "code" => 200,
      "message" => "Request was processed successfully!",
      "took" => 26,
      "errors" => [],
      "data" =>
      { "took" => 24,
        "total_hits" => 1,
        "hits" =>
        [{ "organization_id" => "8055506",
           "bridge_id" => "3218321200",
           "ein" => ein,
           "organization_name" => "Network for Good, Inc.",
           "also_known_as" => "NFG",
           "mission" =>
           "To increase charitable giving from individuals and decrease the cost of fundraising for non-profits by providing the public with an easy, safe and efficient way to give to the charity of their choice and by enabling non-profits to engage supporters through low-cost online fundraising and communication tools.",
           "address_line_1" => "1140 Connecticut Ave NW Ste 700",
           "address_line_2" => "",
           "city" => "Washington",
           "state" => "DC",
           "zip" => "20036",
           "county" => "District of Columbia",
           "msa" => "DC - Washington, DC-MD-VA",
           "lat_long" => ",",
           "ntee_code" => "T50 Philanthropy / Charity / Voluntarism Promotion (General)",
           "profile_level" => "GOLD",
           "public_report" => "https://www.guidestar.org/profile/68-0480736",
           "subsection_code" => "501(c)(3) Public Charity",
           "number_of_employees" => "0",
           "form_type" => "990",
           "website_url" => "www.networkforgood.org",
           "logo_url" => "https://www.guidestar.org/ViewEdoc.aspx?eDocId=4806773&approved=True",
           "foundation_code" => "15",
           "parent_orgs" => "",
           "bmf_gross_receipts" => "488489600",
           "bmf_assets" => "177657638",
           "form990_total_revenue" => "488489600",
           "form990_total_expenses" => "488381333",
           "form990_total_assets" => "177657638",
           "contact_email" => "customerservice@networkforgood.org",
           "contact_name" => "Mr. Scott Case",
           "contact_phone" => "(888) 284-7978",
           "contact_title" => "President and Board Chair",
           "properties" =>
           { "parent" => false,
             "subordinate" => false,
             "independent" => true,
             "national_hq" => false,
             "revoked" => false,
             "defunct_or_merged" => false,
             "audit_a133_performed" => false,
             "bmf_status" => true,
             "pub78_verified" => true,
             "allow_online_giving" => true } }] } }.to_json
  end
end
