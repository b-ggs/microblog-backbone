var CommentList = Backbone.Collection.extend({
	url: '/comments/',
	comparator: function(comment){
		// https://gist.github.com/malandrew/950240
		if (comment.get("updated_at")) {
		   	var str = comment.get("updated_at");
		   	str = str.toLowerCase();
		   	str = str.split("");
		   	str = _.map(str, function(letter) { return String.fromCharCode(-(letter.charCodeAt(0))) });
		   	return str;
		};
  	}
});

var CommentItem = Backbone.Model.extend({

});

var CommentView = Backbone.View.extend({
	parseTime: function(s){
		var s1 = s.split('T');
		var s2 = s1[1].split('Z');
		return s1[0] + " " + s2[0];
	},
	template: _.template("<b><%= author %></b> on <%= this.parseTime(updated_at) %>: <p><%= text %></p>"),
	render: function(){
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	}
});

var CommentListView = Backbone.View.extend({
	el: '#postComments',
	preamble: "<h4>Comments</h4>",
	render: function(){
		this.reset();
		this.$el.append(this.preamble);
		this.collection.forEach(this.add, this);
	},
	reset: function(){
		this.$el.html("");
	},
	add: function(commentItem){
		var commentView = new CommentView({ model: commentItem });
		this.$el.append(commentView.render().el);
	}
});