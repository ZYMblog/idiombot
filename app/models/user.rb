class User < ActiveRecord::Base
    has_many :messages
    has_many :chats, through: :messages

    validates :username, presence: { message: "用户名不能为空"}
    validates :username, uniqueness: { message: "用户名已存在"}
    validates :password, presence: { message: "密码不能为空"}
    validates :password, length: { minimum: 6, message: "密码长度最短为6位"}

    validates :email, presence: { message: "邮箱不能为空"}
end
