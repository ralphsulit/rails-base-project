
require 'rails_helper'

RSpec.describe 'Admins', type: :request do
    admin = Admin.new(email:'admin@test.com', password: "TestPW123")
    admin.save

    user = User.new(email:'user@test.com', username: 'Test_subj', password: "TestPW123")
    user.save

    context 'Admin log in and out' do
        it 'success in sign in' do
            sign_in admin
            get root_path
            expect(response).to have_http_status(:ok)
          end
        
          it 'success in sign out' do
            sign_out admin
            get root_path
            expect(response).to have_http_status(:ok)
          end
    end
     
    context 'Admin only pages' do

      it 'Admin in client list page' do
        sign_in admin
        get admin_client_list_path
        expect(response).to have_http_status(:ok)
      end

      it 'Admin in master_log page' do
        sign_in admin
        get admin_log_book_path
        expect(response).to have_http_status(:ok)
      end

      it 'User in client list page' do
        sign_in user
        get admin_client_list_path
        expect(response).to have_http_status(:ok)
      end
    
    end

    
end