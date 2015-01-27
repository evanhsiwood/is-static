module.exports = React.createClass({

    mixins: [Backbone.React.Component.mixin],

    render: function () {
        return (
            <a className="item item-thumbnail-left">
                <img />
                <h2>{this.props.name}</h2>
                <p>{this.props.type}</p>
                <p>{this.props.area}</p>
                <p>{this.props.address}</p>
            </a>
        );
    }
});