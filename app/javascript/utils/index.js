export const getName = user =>
  `${user.first_name} ${(user.last_name || ' ')[0]}.`;