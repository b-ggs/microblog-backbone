var PostTagList = Backbone.Collection.extend({
    url: '/posts/tag/',
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

var PostTagListView = Backbone.View.extend({
    el: '#postList',
    tag: null,
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
        this.$el.append("<h4>Posts tagged #" + this.tag + "</h4>")
    },
    add: function(postItem){
        var postView = new PostView({ model: postItem });
        this.$el.append(postView.render().el);
    }
});