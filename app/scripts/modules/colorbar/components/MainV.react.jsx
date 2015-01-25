var ItemRenderV = require("./ItemRenderV.react.jsx");

module.exports = React.createClass({
    getDefaultProps: function () {
        return {
            rows: null
        };
    },

    getInitialState: function () {
        return {};
    },

    __onItemRendererSelect: function (data) {
        alert(data.color);
    },

    render: function () {
        var _this = this;

        return (
            <div className='root'>
            {_.map(this.props.rows, function (row) {
                return <ItemRenderV key={row.color} data={row} onSelect={_this.__onItemRendererSelect} />;
            })}
            </div>
        );
    }
});