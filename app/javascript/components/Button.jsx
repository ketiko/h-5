import React from 'react';
import PropTypes from 'prop-types';

const styles = {
  button: {
    background: '#ffffff',
    border: '1px solid #efefef',
    borderRadius: '20px',
    color: '#000',
    display: 'inline-block',
    padding: '10px 15px',
    textDecoration: 'none',
    transition: 'background 0.5s',
  },
  hover: {
    background: '#efefef',
  }
};

class Button extends React.Component {
  static propTypes = {
    href: PropTypes.string,
    label: PropTypes.string.isRequired,
    type: PropTypes.oneOf(['button', 'link']).isRequired,
  };

  static defaultProps = {
    type: 'link',
  };

  state = {
    hovering: false,
  };

  onMouseChange = hovering => () => this.setState({ hovering });

  render() {
    const { hovering } = this.state;
    const { label, type, ...props } = this.props;
    const tag = {
      Button: type === 'link' ? 'a' : 'button',
    };

    return (
      <tag.Button
        style={hovering ? { ...styles.button, ...styles.hover } : styles.button}
        onMouseEnter={this.onMouseChange(true)}
        onMouseLeave={this.onMouseChange(false)}
        {...props}
      >
        {label}
      </tag.Button>
    );
  }
}

export default Button;
