module CheckButtonHelper

  def check_button(emoji_id, emoji_array , post)
      check_like = post.likes.find { |like| like.user_id == current_user.id && like.emoji_id == emoji_id}
      if check_like
        button_to "#{@emoji[emoji_array].symbol} #{post.likes.where(emoji_id: emoji_id).count}", post_like_path(post, check_like), params: {emoji_id: "#{@emoji[emoji_array].id}"}, method: :delete, class: "btn-emoji-delete"
      else
        button_to "#{@emoji[emoji_array].symbol} #{post.likes.where(emoji_id: emoji_id).count}", post_likes_path(post), method: :post, params: {emoji_id: "#{@emoji[emoji_array].id}"}, class: "btn-emoji-valid"
      end
  end


end
