import React from 'react';

import AppreciateCard from './AppreciateCard';

const AppreciationTable = ({ appreciations }) =>
  appreciations.map(appreciation =>
    <AppreciateCard appreciation={appreciation} />
  );

export default AppreciationTable;
