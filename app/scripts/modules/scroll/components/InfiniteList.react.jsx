var ListItem = require("./ListItem.react.jsx");

module.exports = React.createClass({

    mixins: [Backbone.React.Component.mixin],

    getInitialState: function () {
        return {
            elements: this.buildElements(0, 10),
            isInfiniteLoading: false
        }
    },

    buildElements: function (start, end) {
        var elements = [];

        var model = new Backbone.Model({
            author: "Shane Xi",
            album: "IndulgeSmart"
        });

        for (var i = start; i < end; i++) {
            elements.push(<ListItem key={i} model={model}/>)
        }
        return elements;
    },

    handleInfiniteLoad: function () {
        var that = this;
        this.setState({
            isInfiniteLoading: true
        });
        setTimeout(function () {
            var elemLength = that.state.elements.length,
                newElements = that.buildElements(elemLength, elemLength + 1000);
            that.setState({
                isInfiniteLoading: false,
                elements: that.state.elements.concat(newElements)
            });
        }, 2500);
    },

    elementInfiniteLoad: function () {
        return <div className="item item-thumbnail-left">
            Loading...
        </div>;
    },

    render: function () {
        return <Infinite elementHeight={100}
            containerHeight={500}
            infiniteLoadBeginBottomOffset={200}
            onInfiniteLoad={this.handleInfiniteLoad}
            loadingSpinnerDelegate={this.elementInfiniteLoad()}
            isInfiniteLoading={this.state.isInfiniteLoading}
        >
            {this.state.elements}
        </Infinite>;
    }
});