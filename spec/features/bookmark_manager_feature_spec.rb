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

  scenario 'adding a new bookmark and get confirmation' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    visit('/bookmarks')

    expect(page).to_not(have_content("http://www.test.com"))

    fill_in 'url', with: 'http://www.test.com'
    click_on 'Add Bookmark'

    expect(page).to(have_content("http://www.test.com"))
  end

end