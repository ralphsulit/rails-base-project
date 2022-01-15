FactoryBot.define do
    factory :user do
        email {'tester@test.com'}
        username {'Test_subject'}
        password {'TestPW123'}
        confirmed { true }
    end

    factory :admin do
        email {'admin@test.com'}
        username {'Test_admin'}
        password {'TestPW123'}
    end

    factory :stock do
        ticker {'AAPL'}
        current_price { 150 }
        logo_url { 'html.url.com' }
        name {'Aaple'}
    end
end