import React from "react";

const keys = {
  LEFT: 37,
  UP: 38,
  RIGHT: 39,
  DOWN: 40,
};

class ThumbsUp extends React.Component {
  state = {
    level: 1
  };

  getLevelText = () => {
    switch (this.state.level) {
      case 1:
        return "Great Service";
      case 2:
        return "Excellent Service";
      default:
        return "Outstanding Service";
    }
  };

  setLevel = level => () => this.setState({ level });

  cycleLevel = up => {
    let newLevel;
    const { level } = this.state;

    if (up) {
      if (level < 3) newLevel = level + 1;
      else newLevel = 1;
    } else {
      if (level > 1) newLevel = level - 1;
      else newLevel = 3;
    }

    this.setState({ level: newLevel }, () => {
      this[`thumb${newLevel}`].focus();
    });
  }

  onKeyDown = e => {
    if (e.which === 37 || e.which === 40) this.cycleLevel(false);
    if (e.which === 38 || e.which === 39) this.cycleLevel(true);
  }

  render() {
    const { level } = this.state;
    return (
      <div className="thumbs-up__wrapper">
        <input type="hidden" name="likes" value={level} />
        <div className="thumbs-up__thumb-wrapper" role="radiogroup" onKeyDown={this.onKeyDown}>
          <div
            ref={ref => this.thumb1 = ref}
            className="thumbs-up__thumb thumbs-up__thumb--active"
            onClick={this.setLevel(1)}
            role="radio"
            tabIndex={level === 1 ? 0 : -1}
            aria-checked={level === 1}
          >
            <i className="material-icons">thumb_up</i>
          </div>
          <div
            ref={ref => this.thumb2 = ref}
            className={"thumbs-up__thumb" + ((level >= 2) ? " thumbs-up__thumb--active" : "")}
            onClick={this.setLevel(2)}
            role="radio"
            tabIndex={level === 2 ? 0 : -1}
            aria-checked={level === 2}
          >
            <i className="material-icons">thumb_up</i>
          </div>
          <div
            ref={ref => this.thumb3 = ref}
            className={"thumbs-up__thumb" + ((level >= 3) ? " thumbs-up__thumb--active" : "")}
            onClick={this.setLevel(3)}
            role="radio"
            tabIndex={level === 3 ? 0 : -1}
            aria-checked={level === 3}
          >
            <i className="material-icons">thumb_up</i>
          </div>
        </div>
        <div className="thumbs-up__level">{this.getLevelText()}</div>
      </div>
    );
  }
}

export default ThumbsUp;
