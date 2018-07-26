import React, { Component } from 'react';
import './public/stylesheets/App.css';
import { Pagination, Header, RenderQuotes } from './components/index';

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      allQuotes: [],
      selectedQuotes: [],
      category: 'All Quotes',
      currentPage: 1,
      quotesPerPage: 15,
      search: '',
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleClick = this.handleClick.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
  }

  componentDidMount() {
    const url = 'https://gist.githubusercontent.com/benchprep/dffc3bffa9704626aa8832a3b4de5b27/raw/b191cf3b6ea9cdcca8b363516ff969261398061f/quotes.json';

    fetch(url)
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
      filteredQuotes = this.state.allQuotes.filter(quote => quote.theme === evt.target.value)
    }

    this.setState({ category: evt.target.value, currentPage: 1, selectedQuotes: filteredQuotes, search: '' });
  }

  handleSearch(evt) {
    let filteredQuotes;

    if (this.state.category === 'quotes') {
      filteredQuotes = this.state.allQuotes
    }
    else {
      filteredQuotes = this.state.allQuotes.filter(quote => quote.theme === this.state.category)
    }

    const searchedQuotes = filteredQuotes.filter(quote => quote.quote.toLowerCase().indexOf(evt.target.value) !== -1);
    this.setState({ search: evt.target.value, selectedQuotes: searchedQuotes });
  }

  render() {

    const { currentPage, quotesPerPage, selectedQuotes } = this.state;

    return (

      <div className="App">
        <Header
          onSelect={this.handleChange} category={this.state.category} onChange={this.handleSearch} search={this.state.search} />
        <RenderQuotes
          currentPage={currentPage} quotesPerPage={quotesPerPage} selectedQuotes={selectedQuotes} />
        <Pagination
          handleClick={this.handleClick} quotesPerPage={quotesPerPage} quotes={selectedQuotes} />
      </div>
    );
  }
}

export default App;
