import React from "react";

import Card from "material-ui/Card";
import AuthenticityToken from "./AuthenticityToken";
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
          {!appreciation.given && `Say Thanks to ${getName(appreciation.user)}`}
          {appreciation.given && `${getName(appreciation.user)} has been Thanked`}
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
          <ThumbsUp defaultValue={appreciation.likes} />
          <div className="appreciate-form__label">Leave a comment:</div>
          <textarea
            defaultValue={appreciation.comments}
            className="appreciate-form__input"
            name="comments"
            rows={10}
            style={{ width: "calc(100% - 18px)" }}
            disabled={appreciation.given}
          />
          <div
            className="appreciate-form__label"
            style={{ display: "flex", alignItems: "center", flexWrap: "wrap" }}
          >
            {appreciation.given ? "Thanked by:" : "Include Your Name:"}
            <input
              defaultValue={appreciation.giver_name}
              className="appreciate-form__input"
              style={{ marginLeft: 10 }}
              type="text"
              name="giver_name"
              disabled={appreciation.given}
            />
          </div>
          {!appreciation.given && (
            <div className="appreciate-form__actions">
              <button className="appreciate-form__button" type="submit">
                Submit
              </button>
            </div>
          )}
        </div>
      </div>
    </Card>
  </form>
);

export default AppreciateForm;
