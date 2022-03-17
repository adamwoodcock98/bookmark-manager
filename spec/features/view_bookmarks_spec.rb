feature 'delete bookmark' do

  scenario "deleting a bookmark" do
    Bookmark.add('Makers', 'http://www.makersacademy.com/')
    visit('/bookmarks')
    click_on('View')
    click_on('Delete')
    expect(page).to_not have_link('Makers', href:'http://www.makersacademy.com/')
  end 

end 