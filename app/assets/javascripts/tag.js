var TagList = Backbone.Collection.extend({
	url: '/tags/'
	// comparator: function(tag){
	// 	// https://gist.github.com/malandrew/950240
	// 	if (tag.get("updated_at")) {
	// 	   	var str = Tag.get("updated_at");
	// 	   	str = str.toLowerCase();
	// 	   	str = str.split("");
	// 	   	str = _.map(str, function(letter) { return String.fromCharCode(-(letter.charCodeAt(0))) });
	// 	   	return str;
	// 	};
 //  	}
});

var TagItem = Backbone.Model.extend({

});

var TagView = Backbone.View.extend({
	template: _.template("<i>#<%= name %></i> "),
	render: function(){
		this.$el.html(this.template(this.model.toJSON()));
		return this;
	}
});

var TagListView = Backbone.View.extend({
	el: '#postTags',
	preamble: "<h4>Tags</h4>",
	render: function(){
		this.reset();
		this.$el.append(this.preamble);
		this.collection.forEach(this.add, this);
	},
	reset: function(){
		this.$el.html("");
	},
	add: function(tagItem){
		console.log(tagItem);
		var tagView = new TagView({ model: tagItem });
		this.$el.append(tagView.render().el);
	}
});