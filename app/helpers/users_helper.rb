module UsersHelper
  def gravatar_for user, options = {size: Settings.user.default_gravatar_size}
    @temp_user = user
    gravatar_id = Digest::MD5.hexdigest @temp_user.email.downcase
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: @temp_user.name, class: "gravatar"
  end
end
