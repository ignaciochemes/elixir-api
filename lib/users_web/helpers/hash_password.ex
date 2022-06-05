defmodule HashPassword do
  def hashing_password(password) do
    hash = Bcrypt.hash_pwd_salt(password)
  end
end