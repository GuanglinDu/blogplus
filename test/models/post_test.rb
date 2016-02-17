require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should not save post without title" do
    post = Post.new
    assert_not post.save, "Should not be saved if the post has no title"
  end

  test "the minimum title length is 5" do
    post = posts(:one)
    post.title = "abcd"
    assert post.invalid?, "Title less than 5 chars is invalid"
    assert post.errors[:title].any?

    post.title = "abcde"
    assert post.valid?, "Should be valid"
    assert_equal 0, post.errors.count
    assert post.save, "Should be saved successfully"
  end
end
