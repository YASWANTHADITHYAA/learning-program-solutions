import React, { useState } from "react";

function GuestPage({ onLogin }) {
  return (
    <div>
      <h1>Please sign up.</h1>
      <button onClick={onLogin}>Login</button>
    </div>
  );
}

function UserPage({ onLogout }) {
  return (
    <div>
      <h1>Welcome back</h1>
      <button onClick={onLogout}>Logout</button>
    </div>
  );
}

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLoginClick = () => setIsLoggedIn(true);
  const handleLogoutClick = () => setIsLoggedIn(false);

  let content;
  if (isLoggedIn) {
    content = <UserPage onLogout={handleLogoutClick} />;
  } else {
    content = <GuestPage onLogin={handleLoginClick} />;
  }

  return <div>{content}</div>;
}

export default App;
