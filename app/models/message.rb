class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  validates :content, presence: true

  def as_json(options = {})
    nickname = user.nickname
    {
      id: id,
      author: nickname,
      content: content,
      created_at: created_at,
      channel: channel.name
    }
  end
end
