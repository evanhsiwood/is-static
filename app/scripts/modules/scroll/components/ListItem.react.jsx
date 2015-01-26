module.exports = React.createClass({

    mixins: [Backbone.React.Component.mixin],

    render: function () {
        return (
            <a className="item item-thumbnail-left">
                <img />
                <h2>{this.props.author}</h2>
                <p>{this.props.album}</p>
            </a>
        );
    }
});