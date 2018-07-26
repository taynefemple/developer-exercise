import React from 'react';

const Pagination = (props) => {
  const { quotes, quotesPerPage, handleClick } = props;

  const pageNumbers = [];
  for (let i = 1; i <= Math.ceil(quotes.length / quotesPerPage); i++) {
    pageNumbers.push(i);
  }

  const renderPageNumbers = pageNumbers.map(number =>
    <button key={number} id={number} onClick={handleClick}>{number}</button>);

  return (
    <div id="page-numbers">
      <span>Pages: </span>
      {renderPageNumbers}
    </div>
  );
};

export default Pagination;
