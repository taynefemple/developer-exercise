import React from 'react';

const RenderQuotes = (props) => {

  const { currentPage, quotesPerPage, selectedQuotes } = props;

  const indexOfLastQuote = currentPage * quotesPerPage;
  const indexOfFirstQuote = indexOfLastQuote - quotesPerPage;
  const currentQuotes = selectedQuotes.slice(indexOfFirstQuote, indexOfLastQuote);

  return (
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
          {currentQuotes.map((quote) => {
            return (
              <tr key={quote.source}>
                <td>{quote.quote}</td>
                <td>{quote.context}</td>
                <td>{quote.source}</td>
              </tr>
            )
          })}
        </tbody>
      </table>
    </div>
  )
};

export default RenderQuotes;
