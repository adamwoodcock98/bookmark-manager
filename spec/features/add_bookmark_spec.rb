feature 'add bookmark' do

  scenario 'adding a new bookmark' do
    visit('/bookmarks/add')
    fill_in 'url', with: 'http://www.test.com'
    fill_in 'title', with: 'Test'
    click_on 'Submit'
    expect(page).to have_link("Test", href:"http://www.test.com")
  end

end
