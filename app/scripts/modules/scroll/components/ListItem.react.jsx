module.exports = React.createClass({
    render: function () {
        return <div className="infinite-list-item">
            List Item {this.props.key}
        </div>;
    }
});