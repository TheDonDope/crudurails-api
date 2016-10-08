class ContactResource < JSONAPI::Resource
  attributes :first_name, :last_name, :birth_date, :email
end
