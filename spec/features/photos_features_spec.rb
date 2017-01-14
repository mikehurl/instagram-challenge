require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photos' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(title: 'Test photo')
    end

    scenario 'display photo titles' do
      visit '/photos'
      expect(page).to have_content 'Test photo'
      expect(page).not_to have_content 'No photos yet'
    end
  end

end
