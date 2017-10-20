import React from 'react';
import PropTypes from 'prop-types';
import { get } from 'lodash';

import Button from 'material-ui/Button';
import TextField from 'material-ui/TextField';
import Typography from 'material-ui/Typography';

import AuthenticityToken from './AuthenticityToken';

class AppreciationForm extends React.Component {
  render() {
    const {
      action,
      appreciation,
      csrf_token,
      edit = false,
      errors
    } = this.props;

    return (
      <form method="POST" action={action}>
        <Typography type="headline">{edit ? 'Edit' : 'New'} Appreciation</Typography>
        {edit &&
          <input type="hidden" name="_method" value="patch" />
        }
        <AuthenticityToken token={csrf_token} />
        <TextField
          defaultValue={get(appreciation, 'user_id')}
          error={get(errors, 'user_id.length') > 0 || get(errors, 'user.length') > 0}
          helperText={get(errors, 'user_id.0') || get(errors, 'user.0')}
          name="appreciation[user_id]"
          label="User ID"
          margin="normal"
          required
        />
        <br />
        <TextField
          defaultValue={get(appreciation, 'points')}
          error={get(errors, 'points.length') > 0}
          helperText={get(errors, 'points.0')}
          name="appreciation[points]"
          label="Points"
          margin="normal"
          required
          type="number"
        />
        <br />
        <TextField
          defaultValue={get(appreciation, 'token')}
          error={get(errors, 'token.length') > 0}
          helperText={get(errors, 'token.0')}
          name="appreciation[token]"
          label="Token"
          margin="normal"
          required
        />
        <br />
        <Button
          raised
          color="primary"
          type="submit"
        >
          {edit ? 'Update' : 'Create'} Appreciation
        </Button>
      </form>
    );
  }
}

export default AppreciationForm;
