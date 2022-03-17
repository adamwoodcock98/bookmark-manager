feature 'display Bookmark Manager' do
  
  scenario 'visiting index page' do
    visit('/')
    expect(page).to(have_content('Bookmark Manager'))
  end

  scenario 'viewing bookmarks' do
    add_test_websites

    visit('/bookmarks')
    # click_on('View Bookmarks')
    expect(page).to have_link("Makers", href:"http://www.makersacademy.com/")
    expect(page).to have_link("Google", href:"http://www.google.com/")
    expect(page).to have_link("Destroy", href:"http://www.destroyallsoftware.com")
  end
  
end
