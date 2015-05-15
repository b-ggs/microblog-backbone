var microblog = new (Backbone.Router.extend({
	routes: {
		"": "index",
		"post/:postId": "show"
	},
	index: function(){
		var postList = new PostList();
		// postList.comparator = reverseSortBy(postList.comparator);
		var postListView;
		var postListRender = function(){
		    postListView = new PostListView({ collection: postList });
		    postListView.render();
		};
		postList.on('reset', postListRender);
		postList.fetch({
			success: function(){
				postListRender();
			}
		});
	},
	show: function(postId){
		var postItem = new PostItem({id: postId});
		var postFullViewRender = function(){
			var postFullView = new PostFullView({ model: postItem });
			postFullView.render();
		};
		postItem.fetch({
			success: function(){
				postFullViewRender();
			}
		});

		var commentList = new CommentList();
		commentList.url = "/comments/" + postId;
		var commentListRender = function(){
			var commentListView = new CommentListView({ collection: commentList });
			commentListView.render();
		};
		commentList.fetch({
			success: function(){
				commentListRender();
			}
		});

		var tagList = new TagList();
		tagList.url = "/tags/post/" + postId;
		var tagListRender = function(){
			var tagListView = new TagListView({ collection: tagList });
			tagListView.render();
		};
		tagList.fetch({
			success: function(){
				tagListRender();
			}
		});
	}
}));

$(document).ready(function(){
	Backbone.history.start();
})