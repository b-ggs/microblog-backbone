class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  end

  def reset
  	Post.destroy_all
  	Comment.destroy_all
  	Tag.destroy_all
  	PostTag.destroy_all

  	redirect_to '/populate'
  end

  def populate
    dummy_text = ["Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc", "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee", "The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words. If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages. It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is.The European languages are members of the same family. Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ in their grammar, their pronunciation and their most common words. Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators."]

    Post.create_post(
      "Josh Lowensohne",
      "PayPal stuck with $25 million in fines for signing users up to its credit program",
      dummy_text[0],
      Tag.create_tag_array([
        "tech",
        "money",
        "fine",
        "paypal"
      ]),
      Comment.create_comment_array([
        ["boggs", "comment"],
        ["boggs2", "comment2"]
      ])
    )

  	# Post.create(id: 1, author:'boggs', title:'Sample post rails', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 2, author:'boggs', title:'Sample post rails', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 3, author:'boggs', title:'Sample post miscellaneous', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 4, author:'boggs', title:'Sample post miscellaneous', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 5, author:'boggs', title:'Sample post technology', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 6, author:'boggs', title:'Sample post technology', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 7, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 8, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 9, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 10, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 11, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 12, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 13, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 14, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 15, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')
  	# Post.create(id: 16, author:'boggs', title:'Sample post', preview:'This is a preview.', text: 'This is the full content.')



  	# Comment.create(postid: 1, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 3, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 3, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 5, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 5, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 7, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 7, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 9, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 9, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 9, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 11, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 11, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 11, author:'test', text:'This is a comment.')
  	# Comment.create(postid: 11, author:'test', text:'This is a comment.')

  	# Tag.create(id: 1, name: 'miscellaneous')
  	# Tag.create(id: 2, name: 'technology')
  	# Tag.create(id: 3, name: 'rails')
  	# Tag.create(id: 4, name: 'test')

  	# PostTag.create(tagid:1, postid:3)
  	# PostTag.create(tagid:1, postid:4)
  	# PostTag.create(tagid:3, postid:1)
  	# PostTag.create(tagid:3, postid:2)
  	# PostTag.create(tagid:2, postid:5)
  	# PostTag.create(tagid:2, postid:6)

  	redirect_to '/'
  end
end
