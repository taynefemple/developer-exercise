import React from 'react';

const SearchBar = (props) => {

  const { onChange, search } = props;

  return (
    <form>
      <input onChange={onChange} placeholder="Search Quotes" value={search} />
    </form>
  )
};

export default SearchBar;
