# frozen_string_literal: true

describe "have_modal" do
  before do
    visit "/dialog.html"
  end

  it "matches using a custom matcher" do
    expect(page).to have_modal "Modal title"
  end

  it "matches using a negated custom matcher" do
    expect(page).to have_no_modal "foo"
  end
end
