import React from 'react';
import {Link} from 'react-router';

export default (props) => {
  return (
    <div className="ui inverted segment">
      <div className="ui inverted secondary pointing menu page grid">
        <a className="brand item" href="#"><i className="map icon"></i>Beat Me!</a>
        <Link className="active item" to="/">Home</Link>
        <div className="right menu">
          <Link className="item" to="login">Login</Link>
          <Link className="item" to="register">Sign Up</Link>
          <a className="item" href="#">Help</a>
        </div>
      </div>
    </div>
  )
}
