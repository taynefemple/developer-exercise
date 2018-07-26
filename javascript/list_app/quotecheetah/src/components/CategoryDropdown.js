import React from 'react';

const CategoryDropdown = (props) => {

  const { category, onSelect } = props;

  return (
    <select className="dropdown" value={category} onChange={onSelect}>
      <option value="quotes">All Quotes</option>
      <option value="movies">Movie Quotes</option>
      <option value="games">Game Quotes</option>
    </select>
  );
};

export default CategoryDropdown;
