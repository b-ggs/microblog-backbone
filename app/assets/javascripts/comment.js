var CommentList = Backbone.Collection.extend({
	url: '/comments_json',
	comparator: function(comment){
		return comment.get("updated_at");
	}
});

var CommentItem = Backbone.Model.extend({

});

var CommentView = Backbone.View.extend({
	template: _.template("<b><%= author %></b> on <%= updated_at %>: <p><%= text %></p>"),
	render: function(){
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	}
});

var CommentListView = Backbone.View.extend({
	el: '#postComments',
	render: function(){
		this.reset();
		this.$el.append("<h4>Comments</h4>");
		this.collection.forEach(this.add, this);
	},
	reset: function(){
		this.$el.html("");
	},
	add: function(commentItem){
		console.log(commentItem);
		var commentView = new CommentView({ model: commentItem });
		this.$el.append(commentView.render().el);
	}
});