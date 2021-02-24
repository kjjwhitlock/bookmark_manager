feature 'Adding a bookmark' do
  scenario 'user adds a bookmark URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testsite.com')
    click_button('Submit')

    expect(page).to have_content('http://www.testsite.com')
  end
end
