
class FakeEmail
  include HTTParty

  query = {
      "sender": "yuqi.qian@outlook.com",
      "subject": "This is the first topic send by Yuqi"
    }
  url = 'http://localhost:3000/incoming'

  def SendEmail
    HTTParty.post(url, query: query)
  end

end

FakeEmail.SendEmail