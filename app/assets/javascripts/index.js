var PostList = Backbone.Collection.extend({
    url: '/posts'
});

var PostItem = Backbone.Model.extend({

});

var PostView = Backbone.View.extend({
    template: _.template("<h3><%= title %><h3><p><%= text %></p>"),
    render: function(){
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    }
});

var PostListView = Backbone.View.extend({
    render: function(){
        this.collection.forEach(this.addOne, this);
    },

    addOne: function(postItem){
        var postView = new PostView({model: postItem});
        this.$el.append(postView.render().el);
        alert('wat');
    }
})

var postItem = new PostItem({});
postItem.url = '/posts/1';
postItem.fetch();
var postView = new PostView({model: postItem});
postView.render();
console.log(postView.el);

var postList = new PostList();
postList.fetch();

console.log(postList.length);

var postListView = new PostListView({collection: postList});
postListView.render();
console.log(postListView.el);
