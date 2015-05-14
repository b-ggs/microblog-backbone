var PostList = Backbone.Collection.extend({
    url: '/posts_json',
    comparator: function(post){
        return post.get("updated_at"); 
    }
});

var PostItem = Backbone.Model.extend({
    urlRoot: '/posts_json'
});

var PostView = Backbone.View.extend({
    events: {
        "click h3": "viewBlogPost"
    },
    viewBlogPost: function(e){
        microblog.navigate("post/" + this.model.id, {
            trigger: true
        })
    },
    template: _.template("<h3><%= title %></h3><i>by <%= author %> on <%= updated_at %></i><p><%= preview %></p>"),
    render: function(){
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    },
    
});

var PostFullView = Backbone.View.extend({
    el: '#postFull',
    template: _.template("<h3><%= title %></h3><i>by <%= author %> on <%= updated_at %></i><p><%= text %></p>"),
    render: function(){
        $("#postList").hide();
        $("#postFull").show();
        $("#postComments").show();
        console.log(this.model);
        this.$el.html(this.template(this.model.toJSON()));
    }
});

var PostListView = Backbone.View.extend({
    el: '#postList',
    render: function(){
        $("#postList").show();
        $("#postFull").hide();
        $("#postComments").hide();  
        this.reset();
        this.collection.forEach(this.add, this);
    },
    reset: function(){
        this.$el.html("");
    },
    add: function(postItem){
        console.log(postItem);
        var postView = new PostView({ model: postItem });
        this.$el.append(postView.render().el);
    }
});