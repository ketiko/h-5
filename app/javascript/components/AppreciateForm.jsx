import React from 'react';

import Card from 'material-ui/Card';

const AppreciateForm = ({}) => (
  <div className="appreciate-form__wrapper">
    <Card className="appreciate-form__header">
      <img src="/images/hilton-blue.png" style={{ width: '80px' }} />
    </Card>
    <Card className="appreciate-form__body">
      <div className="appreciate-form__hero">
        <img className="appreciate-form__avatar" src="/images/steve.png" />
        <div className="appreciate-form__thanks">Say Thanks to Steve P.</div>
      </div>
      <div className="appreciate-form__content">
        Content
      </div>
    </Card>
  </div>
);

export default AppreciateForm;
