import React from 'react';

const AuthenticityToken = ({ token }) => (
  <input type="hidden" name="authenticity_token" value={token} />
);

export default AuthenticityToken;
