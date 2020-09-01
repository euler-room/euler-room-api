class UserSerializer < SerializerBase

  attributes :first_name,
             :last_name,
             :email,
             :username,
             :auth_token

  attribute :cover_letter_orientation do |object|
    object.cover_letter.orientation
  end

  attribute :cover_letter_url do |object|
    object.cover_letter.url
  end

end
