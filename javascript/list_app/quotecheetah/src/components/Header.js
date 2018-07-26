import React from 'react';
import CategoryDropdown from './CategoryDropdown'
import SearchBar from './SearchBar'


const Header = (props) => {

  const { category, search, onChange, onSelect } = props;

  return (
    <header className="App-header">
      <h1 className="App-title">Quote Cheetah</h1>
      <h4 className="Sub-title">getting you quotes...<span>really fast</span></h4>
      <div className="selectors">
        <CategoryDropdown
          onSelect={onSelect} category={category} />
        <SearchBar
          onChange={onChange} search={search} />
      </div>
    </header>
  );
};

export default Header;
