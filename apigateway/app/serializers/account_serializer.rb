class AccountSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :role, :created_at, :updated_at, :last_login
end
