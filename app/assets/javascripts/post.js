var PostList = Backbone.Collection.extend({
    url: '/posts',
    comparator: function(post){
        // https://gist.github.com/malandrew/950240
        if (post.get("updated_at")) {
            var str = post.get("updated_at");
            str = str.toLowerCase();
            str = str.split("");
            str = _.map(str, function(letter) { return String.fromCharCode(-(letter.charCodeAt(0))) });
            return str;
        };
    }
});

var PostItem = Backbone.Model.extend({
    urlRoot: '/posts/id'
});

var PostView = Backbone.View.extend({
    events: {
        "click h3": "viewBlogPost"
    },
    parseTime: function(s){
        var s1 = s.split('T');
        var s2 = s1[1].split('Z');
        return s1[0] + " " + s2[0];
    },
    viewBlogPost: function(e){
        microblog.navigate("post/" + this.model.id, {
            trigger: true
        });
    },
    template: _.template("<h3><%= title %></h3><i>by <%= author %> on <%= this.parseTime(updated_at) %></i><p><%= preview %></p>"),
    render: function(){
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    },
    
});

var PostFullView = Backbone.View.extend({
    el: '#postFull',
    parseTime: function(s){
        var s1 = s.split('T');
        var s2 = s1[1].split('Z');
        return s1[0] + " " + s2[0];
    },
    template: _.template("<h3><%= title %></h3><i>by <%= author %> on <%= this.parseTime(updated_at) %></i><p><%= text %></p>"),
    render: function(){
        $("#postList").hide();
        $("#postFull").show();
        $("#postTags").show();
        $("#postComments").show();
        this.$el.html(this.template(this.model.toJSON()));
    }
});

var PostListView = Backbone.View.extend({
    el: '#postList',
    render: function(){
        $("#postList").show();
        $("#postFull").hide();
        $("#postTags").hide();
        $("#postComments").hide();  
        this.reset();
        this.collection.forEach(this.add, this);
    },
    reset: function(){
        this.$el.html("");
    },
    add: function(postItem){
        var postView = new PostView({ model: postItem });
        this.$el.append(postView.render().el);
    }
});