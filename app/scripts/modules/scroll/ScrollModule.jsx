module.exports = Marionette.Module.extend({
    initialize: function () {
        console.log('Initializing ScrollModule');
        this.startWithParent = true
    },

    onStart: function () {
        var InfiniteList = require("./components/InfiniteList.react.jsx");
        React.render(<InfiniteList/>, document.getElementById('scroll'));
        console.log('Starting ScrollModule');
    },

    onStop: function () {
        console.log('Stopping ScrollModule');
    }
});
