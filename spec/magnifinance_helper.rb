module MagnifinanceHelper

  DEFAULT_EMAIL = 'user@example.org'.freeze
  DEFAULT_TOKEN = 'login@token'

  def get_fixture(fixture_path)
    File.load("spec/fixtures/#{fixture_path}")
  end

  def mock_payload(payload)
    {
      authentication: {
        login_email: DEFAULT_EMAIL,
        login_token: DEFAULT_TOKEN
      }
    }.merge(payload)
  end
end
