import React from "react";

import Card from "material-ui/Card";
import AuthenticityToken from './AuthenticityToken';
import ThumbsUp from "./ThumbsUp";

import { getName } from "../utils";

const AppreciateForm = ({ appreciation, token }) => (
  <form className="appreciate-form__wrapper" method="POST">
    <AuthenticityToken token={token} />
    <Card className="appreciate-form__header">
      <img src="/images/hilton-blue.png" style={{ width: "80px" }} />
    </Card>
    <Card className="appreciate-form__body">
      <div className="appreciate-form__hero">
        <img
          className="appreciate-form__avatar"
          src={appreciation.user.avatar_url}
        />
        <div className="appreciate-form__thanks">
          Say Thanks to {getName(appreciation.user)}
        </div>
        <div className="appreciate-form__position">
          Housekeeper at Hilton Salt Lake City
        </div>
      </div>
      <div className="appreciate-form__content-wrapper">
        <div className="appreciate-form__content">
          <div className="appreciate-form__label">
            How many thumbs up do you give {appreciation.user.first_name}?
          </div>
          <ThumbsUp />
          <div className="appreciate-form__label">Leave a comment:</div>
          <textarea
            className="appreciate-form__input"
            name="comments"
            rows={10}
            style={{ width: "calc(100% - 18px)" }}
          />
          <div
            className="appreciate-form__label"
            style={{ display: "flex", alignItems: "center", flexWrap: 'wrap' }}
          >
            Include Your Name:
            <input
              className="appreciate-form__input"
              style={{ marginLeft: 10 }}
              type="text"
              name="giver_name"
            />
          </div>
          <div className="appreciate-form__actions">
            <button className="appreciate-form__button" type="submit">
              Submit
            </button>
          </div>
        </div>
      </div>
    </Card>
  </form>
);

export default AppreciateForm;
