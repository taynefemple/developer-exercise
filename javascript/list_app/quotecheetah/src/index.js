import React from 'react';
import ReactDOM from 'react-dom';
import './public/stylesheets/index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(<App />, document.getElementById('quotes'));
registerServiceWorker();
