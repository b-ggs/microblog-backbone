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
    parseTime: function(s){
        var s1 = s.split('T');
        var s2 = s1[1].split('Z');
        return s1[0] + " " + s2[0];
    },
    // template: _.template("<h3><%= title %></h3><i>by <%= author %> on <%= this.parseTime(updated_at) %></i><p><%= preview %></p>"),
    template: _.template('<div class="col s12 m6"><div class="card "><div class="card-content black-text"><span class="card-title black-text"><%= title %></span><p><%= preview %></p></div><div class="card-action"><a href="#post/<%= id %>">View Post</a></div></div></div>'),
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
    // template: _.template("<h3><%= title %></h3><i>by <%= author %> on <%= this.parseTime(updated_at) %></i><p><%= text %></p>"),
    template: _.template('<div class="col s12 m6"><div class="card "><div class="card-content black-text"><span class="card-title black-text"><%= title %></span><p><%= text %></p></div><div class="card-action"><a href="#post/<%= id %>">View Post</a></div></div></div>'),
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
        this.$el.append('<h4>All Posts</h4>');
        // this.$el.append('<div class="row">');
        this.collection.forEach(this.add, this);
        // this.$el.append('</div>');
    },
    reset: function(){
        this.$el.html("");
    },
    add: function(postItem){
        var postView = new PostView({ model: postItem });
        this.$el.append(postView.render().el);
    }
});