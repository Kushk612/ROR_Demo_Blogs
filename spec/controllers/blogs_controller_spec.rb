require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
    let(:user) {create(:user)}
    let(:blog) {create(:blog)}

    before(:each) {
        blog
        sign_in(user)
    }

    describe 'GET Index' do
        it 'able to get index' do
            get :index
            expect(response).to be_successful
        end
    end

    describe 'GET new' do
        it 'able to get new' do
            get :new
            expect(response).to be_successful
        end
    end

    describe 'GET show' do
        it 'able to get show' do
            get :show, params: { id: blog.id }
            expect(response).to be_successful
        end
    end
    
    describe 'GET edit' do
        it 'returns a successful response' do
            get :edit, params: { id: blog.id }
            expect(response).to be_successful
        end
    end

    describe 'post create' do
        it 'create the blog' do
            post :create, params: { blog: {title: "hi there", 
                                        decsription: blog.decsription}}
            expect(Blog.count).to eq(2)
            expect(Blog.last.title).to eq("hi there")
            expect(Blog.last.decsription).to eq(blog.decsription)
        end
        
        it 'not able create the blog if title is blank' do
            post :create, params: { blog: {title: "", 
                                        decsription: blog.decsription}}
            expect(Blog.count).to eq(1)
            expect(response).not_to be_successful
            expect(@controller.instance_variable_get(:@blog).errors.messages[:title]).to eq(["can't be blank"])
        end
        
        it 'not able create the blog if decsription is blank' do
            post :create, params: { blog: {title: blog.title, 
                                        decsription: ''}}
            expect(Blog.count).to eq(1)
            expect(response).not_to be_successful
            expect(@controller.instance_variable_get(:@blog).errors.messages[:decsription]).to eq(["can't be blank", "is too short (minimum is 250 characters)"])
        end
    end

    describe 'destory' do
        it 'destroy the blog' do
            delete :destroy, params: { id: blog.id }
            expect(Blog.count).to eq(0)
        end
    end

    describe 'update' do
        it 'update the blog' do
            patch :update, params: { id: blog.id, blog: { title: "updating the blog", 
                                                          decsription: blog.decsription}}
            expect(Blog.count).to eq(1)
            expect(Blog.last.title).to eq("updating the blog")
        end

        it 'not able to update the blog if the title is blank' do
            patch :update, params: { id: blog.id, blog: { title: "", 
                                                          decsription: blog.decsription}}
            expect(Blog.count).to eq(1)
            expect(response).not_to be_successful
            expect(@controller.instance_variable_get(:@blog).errors.messages[:title]).to eq(["can't be blank"])
        end

        it 'not able to update the blog if the decsription is blank' do
            patch :update, params: { id: blog.id, blog: { title: blog.title, 
                                                          decsription: ''}}
            expect(Blog.count).to eq(1)
            expect(response).not_to be_successful
            expect(@controller.instance_variable_get(:@blog).errors.messages[:decsription]).to eq(["can't be blank", "is too short (minimum is 250 characters)"])
        end
    end
end