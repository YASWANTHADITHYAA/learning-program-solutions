import React from 'react';

function IndianPlayers() {
  const players = ['Sachin1', 'Dhoni2', 'Virat3', 'Rohit4', 'Yuvaraj5', 'Raina6'];

  const odd = players.filter((_, index) => index % 2 === 0);
  const even = players.filter((_, index) => index % 2 !== 0);

  const T20 = ['Mr. First Player', 'Mr. Second Player', 'Mr. Third Player'];
  const Ranji = ['Mr. Fourth Player', 'Mr. Fifth Player', 'Mr. Sixth Player'];

  const mergedPlayers = [...T20, ...Ranji];

  return (
    <div>
      <h2>Odd Players</h2>
      <ul>
        {odd.map((p, i) => (
          <li key={i}>{['First', 'Third', 'Fifth'][i]} : {p}</li>
        ))}
      </ul>

      <h2>Even Players</h2>
      <ul>
        {even.map((p, i) => (
          <li key={i}>{['Second', 'Fourth', 'Sixth'][i]} : {p}</li>
        ))}
      </ul>

      <h2>List of Indian Players Merged:</h2>
      <ul>
        {mergedPlayers.map((p, i) => (
          <li key={i}>{p}</li>
        ))}
      </ul>
    </div>
  );
}

export default IndianPlayers;
