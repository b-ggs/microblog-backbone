var microblog = new (Backbone.Router.extend({
	routes: {
		"": "index",
		"post/:postId": "show"
	},
	index: function(){
		var postList = new PostList();
		postList.comparator = reverseSortBy(postList.comparator);
		var postListView;
		var postListRender = function(){
		    postListView = new PostListView({ collection: postList });
		    postListView.render();
		};
		postList.on('reset', postListRender);
		postList.fetch({
			success: function(){ postListRender() }
		});
	},
	show: function(postId){
		var postItem = new PostItem({id: postId});
		var postFullViewRender = function(){
			var postFullView = new PostFullView({ model: postItem });
			postFullView.render();
		};
		postItem.fetch({
			success: function(){ postFullViewRender() }
		});
		var commentList = new CommentList();
		commentList.comparator = reverseSortBy(postList.comparator);
		var commentListRender = function(){
			var commentListView = new CommentListView( {collection: commentList} );
			commentListView.render();
		};
		commentList.fetch({
			success: function(){ 
				console.log(commentList);
				commentListRender();
			}
		});
	}
}));

$(document).ready(function(){
	Backbone.history.start();
})