feature 'display Bookmark Manager' do
  
  scenario 'visiting index page' do
    visit('/')
    expect(page).to(have_content('Bookmark Manager'))
  end

  scenario 'viewing bookmarks' do
    visit('/bookmarks')
    # click_on('View Bookmarks')
    expect(page).to(have_content("https://www.kathleen.com"))
    expect(page).to(have_content("https://www.christian.com"))
  end
  
end