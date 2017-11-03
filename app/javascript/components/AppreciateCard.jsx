import React from "react";
import qrcode from 'qrcode-js';

import { getName } from '../utils';

const getGiveURL = token =>
  `${window.location.origin}/appreciations/${token}/give`;

const AppreciateCard = ({ appreciation }) => (
  <div className="appreciate-card__wrapper">
    <div className="appreciate-card__container">
      <div className="appreciate-card__thanks-container">
        <div className="appreciate-card__border">
          <img src={appreciation.user.avatar_url} className="appreciate-card__avatar" />
          <div style={{ textAlign: "center" }}>
            <div className="appreciate-card__name">{getName(appreciation.user)}</div>
            <div className="appreciate-card__position">
              Housekeeper at Hilton Salt Lake City
            </div>
          </div>
          <div className="appreciate-card__title">SAY THANKS</div>
          <hr className="appreciate-card__rule" />
          <div className="appreciate-card__description">
            {getName(appreciation.user)} assisted you during your stay at the Salt Lake City Hilton.
            Want to appreciate {appreciation.user.first_name}’s hard work? Use your phone to scan the QR
            code to give him a quick appreciation.
          </div>
          <img src="/images/hilton.png" style={{ width: '60px', height: '40px' }} />
        </div>
      </div>
      <div className="appreciate-card__qr">
        <img src={qrcode.toDataURL(getGiveURL(appreciation.token), 4)} />
      </div>
    </div>
  </div>
);

export default AppreciateCard;
