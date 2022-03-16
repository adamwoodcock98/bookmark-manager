feature 'display Bookmark Manager' do
  
  scenario 'visiting index page' do
    visit('/')
    expect(page).to(have_content('Bookmark Manager'))
  end

  scenario 'viewing bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com/');")

    visit('/bookmarks')
    # click_on('View Bookmarks')
    expect(page).to(have_content("http://www.makersacademy.com/"))
    expect(page).to(have_content("http://www.google.com/"))
    expect(page).to(have_content("http://www.destroyallsoftware.com"))
  end
  
  
end

feature 'add bookmark' do

  scenario 'adding a new bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks/add')
    expect(page).to_not(have_content("http://www.test.com"))
    fill_in 'url', with: 'http://www.test.com'
    fill_in 'title', with: 'Test'
    click_on 'Submit'
    expect(page).to(have_content("http://www.test.com"))
    # expect(page).to(have_content("Test"))
  end

end