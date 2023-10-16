require 'rails_helper'

RSpec.describe Blog, type: :model do
  # before(:each) {}

  describe 'able to Create blog with all attributes' do    
    it 'creates a blog' do
      Blog.create(
        title: "abc",
        decsription: "Lusum have created a range of basketballs which are suitable for use in 
        schools and clubs, working hard with leading manufacturers to produce high quality balls 
        at an affordable price. The brand developers at Lusum have worked with leading manufacturers 
        within basketball to produce basketballs which not only look great but are manufactured to 
        the highest of specifications, whilst also remaining affordable for all budgets. Lusum have 
        for years been 'Investing in Sports Performance' by producing high quality products, using 
          the same materials and factories other leading brands use but without the inflated price. 
          Meaning you get the best balls without breaking the bank."
          )
          expect(Blog.count).to eq(1)
        end
      end
      
  describe 'able to Create blog with all attributes' do    
    it 'should not create a blog without title' do
      blog = Blog.create(title: ' ',
      decsription: "Lusum have created a range of basketballs which are suitable for use in 
      schools and clubs, working hard with leading manufacturers to produce high quality balls 
      at an affordable price. The brand developers at Lusum have worked with leading manufacturers 
      within basketball to produce basketballs which not only look great but are manufactured to 
      the highest of specifications, whilst also remaining affordable for all budgets. Lusum have 
      for years been 'Investing in Sports Performance' by producing high quality products, using 
      the same materials and factories other leading brands use but without the inflated price. 
      Meaning you get the best balls without breaking the bank.")
      expect(Blog.count).to eq(0)
      expect(blog.errors.messages[:title]).to eq(["can't be blank"])
    end

    it 'should not create a blog without description' do
      blog = Blog.create(title: 'blog creating',
      decsription: " ")
      expect(Blog.count).to eq(0)
      expect(blog.errors.messages[:decsription]).to eq(["can't be blank", "is too short (minimum is 250 characters)"])
    end
    
    it 'should not create a blog without title and description' do
        blog = Blog.create(
        title: ' ',
        decsription: " ")
        expect(Blog.count).to eq(0)
        expect(blog.errors.messages[:title]).to eq(["can't be blank"])
        expect(blog.errors.messages[:decsription]).to eq(["can't be blank", "is too short (minimum is 250 characters)"])
    end

    it 'should not create a blog with short description less than 250 words' do
      blog = Blog.create(
        title: 'blog creating',
      decsription: "Meaning you get the best balls without breaking the bank.")
      expect(Blog.count).to eq(0)
      expect(blog.errors.messages[:decsription]).to eq(['is too short (minimum is 250 characters)'])
    end
  end
end
