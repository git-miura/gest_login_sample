user = User.first

Post.create!(title: "テストです1", comment: "テストテストテストテスト", user_id: user.id)
Post.create!(title: "テストです2", comment: "テストテストテストテスト", user_id: user.id)
Post.create!(title: "テストです3", comment: "テストテストテストテスト", user_id: user.id)
puts "初期データ投入成功"
