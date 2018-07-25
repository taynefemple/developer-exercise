import React, { Component } from 'react';
import './App.css';
import Pagination from './Pagination'

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      allQuotes: [],
      selectedQuotes: [],
      value: 'All Quotes',
      currentPage: 1,
      quotesPerPage: 15,
      search: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
  }

  componentDidMount() {
    fetch('https://gist.githubusercontent.com/benchprep/dffc3bffa9704626aa8832a3b4de5b27/raw/b191cf3b6ea9cdcca8b363516ff969261398061f/quotes.json')
      .then(res => res.json())
      .then(allQuotes => this.setState({ allQuotes, selectedQuotes: allQuotes }))
  }

  handleClick(evt) {
    this.setState({ currentPage: +evt.target.id });
  }

  handleChange(evt) {
    let filteredQuotes;
    if (evt.target.value === 'quotes') {
      filteredQuotes = this.state.allQuotes
    }
    else {
      filteredQuotes = this.state.allQuotes.filter(quote => quote.theme === evt.target.value);
    }
    this.setState({ value: evt.target.value, currentPage: 1, selectedQuotes: filteredQuotes, search: '' })
  }

  handleSearch(evt) {
    let filteredQuotes;
    if (this.state.value === 'quotes') {
      filteredQuotes = this.state.allQuotes
    }
    else {
      filteredQuotes = this.state.allQuotes.filter(quote => quote.theme === this.state.value);
    }
    const searchedQuotes = filteredQuotes.filter(quote => quote.quote.toLowerCase().indexOf(evt.target.value) !== -1)
    this.setState({ search: evt.target.value, selectedQuotes: searchedQuotes })
  }

  render() {

    const { currentPage, quotesPerPage, selectedQuotes } = this.state;
    const indexOfLastQuote = currentPage * quotesPerPage;
    const indexOfFirstQuote = indexOfLastQuote - quotesPerPage;
    const currentQuotes = selectedQuotes.slice(indexOfFirstQuote, indexOfLastQuote);

    const renderQuotes = currentQuotes.map((quote) => {
      return (
        <tr key={quote.source}>
          <td>{quote.quote}</td>
          <td>{quote.context}</td>
          <td>{quote.source}</td>
        </tr>
      )
    });

    return (
      <div className="App">
        <header className="App-header">
          <h1 className="App-title">Quote Cheetah</h1>
          <h4 className="Sub-title">getting you quotes...<span>really fast</span></h4>
          <div className="selectors">
            <select className="dropdown" value={this.state.value} onChange={this.handleChange}>
              <option value="quotes">All Quotes</option>
              <option value="movies">Movie Quotes</option>
              <option value="games">Game Quotes</option>
            </select>
            <form>
              <input onChange={this.handleSearch} placeholder="Search Quotes" value={this.state.search} />
            </form>
          </div>
        </header>
        <div className="table">
          <table>
            <thead>
              <tr>
                <th>Quote</th>
                <th>Where's it from?</th>
                <th>Who said it?</th>
              </tr>
            </thead>
            <tbody>
              {renderQuotes}
            </tbody>
          </table>
        </div>
        <Pagination handleClick={this.handleClick} quotesPerPage={quotesPerPage} quotes={selectedQuotes} />
      </div>
    );
  }
}

export default App;
