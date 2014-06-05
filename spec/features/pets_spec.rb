require 'spec_helper'

feature 'CRUD favorite pets' do
  scenario 'User can create a list of pets' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a pet'
    fill_in 'Pet name', with: 'Fido'
    fill_in 'Owner', with: 'Fred'
    click_on 'Add pet'
    expect(page).to have_content 'Fido'
    expect(page).to have_content 'Fred'
  end
end