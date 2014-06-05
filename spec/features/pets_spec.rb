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

  scenario 'User can update a pet from list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a pet'
    fill_in 'Pet name', with: 'Fido'
    fill_in 'Owner', with: 'Fred'
    click_on 'Add pet'
    expect(page).to have_content 'Fido'
    expect(page).to have_content 'Fred'
    click_on 'Fido'
    click_on 'Edit pet'
    fill_in 'Pet name', with: 'Susu'
    fill_in 'Owner', with: 'Suzy'
    click_on 'Update pet'
    expect(page).to have_content 'Susu'
    expect(page).to have_content 'Suzy'
    expect(page).to_not have_content 'Fido'
    expect(page).to_not have_content 'Fred'
  end
end