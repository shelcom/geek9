require "rails_helper"

RSpec.feature "todo list work", :type => :feature do
  before do 
  visit "/todo_lists/new"
  fill_in "Title", with: title
  click_button "Create Todo list"
  end
  
  scenario "User visit home" do
    visit "/"
	expect(page).to have_text("Todo List")
  end

  scenario "when url have edit" do
  	visit "/"
  	expect(page).to have_link("Edit", :href=>edit_todo_list_path(TodoList.last))
  end
  
  scenario "when click edit" do
  	visit "/"
  	find("a[href='#{edit_todo_list_path(TodoList.last)}']").click
  	expect(page).to have_text("Editing Todo List")
  end
  
  scenario "when click show" do
  	visit "/"
  	click_link "Show"
  	expect(page).to have_button("Create Todo item")
  end

  scenario "when click destroy" do
  	visit "/"
  	click_link "Destroy"
  	expect(page).to have_text("Todo list was successfully destroyed.")
  end

end