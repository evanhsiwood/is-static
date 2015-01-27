var ListItem = require("./ListItem.react.jsx");
var Restaurants = require("../collections/Restaurants");

module.exports = React.createClass({

    getInitialState: function () {
        return {
            elements: this.buildElements(0, 10),
            isInfiniteLoading: false
        }
    },

    buildElements: function (start, end) {
        var elements = [];

        var collection = new Restaurants();
        collection.fetch();

        collection.each(function (model) {
            elements.push(<ListItem key={model.cid} model={model}/>)
        });

        return elements;
    },

    handleInfiniteLoad: function () {
        var that = this;
        this.setState({
            isInfiniteLoading: true
        });
        setTimeout(function () {
            var elemLength = that.state.elements.length,
                newElements = that.buildElements(elemLength, elemLength + 10);
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