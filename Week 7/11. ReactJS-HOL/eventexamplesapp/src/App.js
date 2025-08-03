import React, { Component } from 'react';

class CurrencyConvertor extends Component {
  constructor(props) {
    super(props);
    this.state = {
      amount: '',
      currency: 'Euro'
    };
    
  }

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const conversionRate = 80; // 1 Euro = 80 INR
    const result = this.state.amount * conversionRate;
    alert(`Converting to ${this.state.currency} Amount is ${result}`);
  };

  render() {
    return (
      <div>
        <h2 style={{ color: 'green' }}>Currency Convertor!!!</h2>
        <form onSubmit={this.handleSubmit}>
          <div>
            <label>Amount: </label>
            <input
              type="text"
              name="amount"
              value={this.state.amount}
              onChange={this.handleChange}
            />
          </div>
          <div>
            <label>Currency: </label>
            <select
              name="currency"
              value={this.state.currency}
              onChange={this.handleChange}
            >
              <option value="Euro">Euro</option>
              {/* Add more currencies if needed */}
            </select>
          </div>
          <button type="submit">Submit</button>
        </form>
      </div>
    );
  }
}

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 1
    };
  }

  increment = () => {
    this.setState({ count: this.state.count + 1 });
    this.sayHello();
  };

  sayHello = () => {
  alert('Hello! Button clicked.');
};

  decrement = () => {
    this.setState({ count: this.state.count - 1 });
  };

  sayWelcome = (msg) => {
    alert(msg);
  };

  handleClick = (event) => {
    alert("I was clicked");
    console.log(event); // Synthetic Event
  };

  render() {
    return (
      <div style={{ padding: '20px' }}>
        <p>{this.state.count}</p>
        <button onClick={this.increment}>Increment</button>
        <button onClick={this.decrement}>Decrement</button>
        <br /><br />
        <button onClick={() => this.sayWelcome("Welcome!")}>Say welcome</button>
        <br /><br />
        <button onClick={this.handleClick}>Click on me</button>

        <br /><br />
        <CurrencyConvertor />
      </div>
    );
  }
}

export default App;
