import 'babel-polyfill';
import React from 'react';
import { render } from 'react-dom';
import { Router, browserHistory } from 'react-router';
import routes from './routes';
import '../node_modules/semantic-ui-css/semantic.min.css';
import './styles/styles.css';

render(
  <Router history={browserHistory} routes={routes} />,
  document.getElementById('app')
);
