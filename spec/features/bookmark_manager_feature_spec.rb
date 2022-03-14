feature 'display Bookmark Manager' do
  
  scenario 'visiting index page' do
    visit('/')
    expect(page).to(have_content('Bookmark Manager'))
  end

  scenario 'viewing bookmarks' do
    visit('/')
    click_on('View Bookmarks')
    expect(page).to(have_content("https://www.google.com"))
  end
  
end