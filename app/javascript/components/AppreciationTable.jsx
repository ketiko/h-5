import React from 'react';
import qrcode from 'qrcode-js';

import Paper from 'material-ui/Paper';
import Table, { TableBody, TableCell, TableHead, TableRow } from 'material-ui/Table';
import Typography from 'material-ui/Typography';

const getGiveURL = token =>
  `${window.location.origin}/appreciations/${token}/give`;

const AppreciationTable = ({ appreciations }) => [
  <Typography type="headline" paragraph>Appreciations</Typography>,
  <Paper style={{ overflowX: 'auto' }}>
    <Table>
      <TableHead>
        <TableRow>
          <TableCell>Id</TableCell>
          <TableCell>User</TableCell>
          <TableCell>Points</TableCell>
          <TableCell>Token</TableCell>
          <TableCell>Given</TableCell>
          <TableCell>URL</TableCell>
          <TableCell>QR Code</TableCell>
        </TableRow>
      </TableHead>
      <TableBody>
        {appreciations.map(appreciation =>
          <TableRow id={appreciation.id}>
            <TableCell>{appreciation.id}</TableCell>
            <TableCell>{appreciation.user_id}</TableCell>
            <TableCell>{appreciation.points}</TableCell>
            <TableCell>{appreciation.token}</TableCell>
            <TableCell>{appreciation.given}</TableCell>
            <TableCell>{getGiveURL(appreciation.token)}</TableCell>
            <TableCell>
              <img src={qrcode.toDataURL(getGiveURL(appreciation.token), 4)} />
            </TableCell>
          </TableRow>
        )}
      </TableBody>
    </Table>
  </Paper>
];

export default AppreciationTable;
