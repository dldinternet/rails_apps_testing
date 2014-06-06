module Omniauth

  module Mock
    def auth_mock
      OmniAuth.config.mock_auth[:twitter] = {
        'provider' => 'twitter',
        'uid' => '123545',
        'user_info' => {
          'name' => 'mockuser',
          'image' => 'mock_user_thumbnail_url'
        },
        'credentials' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        }
      }
    end
  end

  module SessionHelpers
    def signin
      visit root_path
      page.should have_content("Sign in")
      click_link "Sign in"
      auth_mock
      fill_in 'user_email', with: 'test@example.com'
      click_button "Sign in"
    end
  end

end