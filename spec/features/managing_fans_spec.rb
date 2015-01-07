require 'rails_helper'

describe 'the company view', type: :feature do
  let!(:fan) { Fan.create(name: 'Josh', email: "belieb_me333@example.com") }

  describe 'phone numbers' do
    before(:each) do
      visit fans_path
    end

    it 'shows the fan' do
      expect(page).to have_content(fan.name)
    end

    it 'has a delete link for the fan' do
      expect(page).to have_link('Delete', href: fan_path(fan))
    end

    it 'deletes the fan' do
      expect(Fan.count).to eq(1)
      expect(page).to have_link('Delete', href: fan_path(fan))
      page.click_link('Delete')
      expect(page).to_not have_content(fan.name)
      expect(Fan.count).to eq(0)
    end
  end
end
