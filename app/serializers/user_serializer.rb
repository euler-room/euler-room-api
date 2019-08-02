class UserSerializer < SerializerBase
  attributes :first_name,
             :last_name,
             :email,
             :username,
             :auth_token,
             :cover_letter_url
end
