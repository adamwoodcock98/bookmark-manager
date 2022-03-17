feature 'delete bookmark' do

  scenario "deleting a bookmark" do
    Bookmark.add('Makers', 'http://www.makersacademy.com/')
    visit('/bookmarks')
    first('.bookmark').click_on 'View'
    expect(page).to have_content 'Makers'
    expect(page).to have_content 'http://www.makersacademy.com/'
    click_on('Delete')
    expect(page).to_not have_link('Makers', href:'http://www.makersacademy.com/')
  end 

end 

feature 'update bookmark' do

  before do
    add_test_websites
    visit('/bookmarks')
    first('.bookmark').click_on 'View'
    click_on 'Update'
  end
  
  scenario 'update page has UI elements' do
    expect(current_path).to eq '/bookmarks/view/update'
    expect(page).to have_content 'Title:' 
    expect(page).to have_content 'URL:'
  end

  scenario 'updating changes the bookmark' do
    expect(page).to have_field('title', with: "Makers")
    expect(page).to have_field('url', with: "http://www.makersacademy.com/")
    fill_in('title', with: "Makers Academy")
    fill_in('url', with: "http://www.makers.tech")
    click_on 'Save changes'
    expect(page).to have_link("Makers Academy", href:"http://www.makers.tech")
  end

end