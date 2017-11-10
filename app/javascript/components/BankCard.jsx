import React from 'react';
import { getName } from '../utils';

class BankCard extends React.Component {
  componentDidMount() {
    window.setTimeout(this.refresh, 15000)
  }

  refresh = () => {
    window.location = window.location;
  }

  render() {
    const { total, user } = this.props;
    return (
      <div className="bank-card__wrapper">
        <div className="bank-card__border">
          <img className="bank-card__avatar" src={user.avatar_url} />
          <div className="bank-card__name">
            {getName(user)}
          </div>
          <div className="bank-card__position">
            {getName(user)} Housekeeper at Hilton Salt Lake City
          </div>
          <hr className="bank-card__hr" />
          <div className="bank-card__title">
            Points Earned
          </div>
          <div className="bank-card__total">
            {total}
          </div>
        </div>
      </div>
    );
  }
}

export default BankCard;