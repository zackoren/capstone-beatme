import React from 'react';
import { Route, IndexRoute} from 'react-router';
import App from './components/App';
import HomePage from './components/HomePage';
import AboutPage from './components/AboutPage';
import Login from './components/Login';
import Register from './components/Register';

export default (
  <Route path="/" component={App}>
    <IndexRoute component={HomePage} />
    <Route path="login" component={Login} />
    <Route path="register" component={Register} />
    <Route path="about" component={AboutPage} />
  </Route>
);
