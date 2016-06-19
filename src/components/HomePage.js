import React, {Component} from 'react';
import {Link} from 'react-router';

class HomePage extends Component {
  render() {
    return (
      <div className="ui page grid">
        <div className="row">
          <div className="column">
            <div className="ui huge message main">
              <h1 className="ui huge header">Beat Me!</h1>
              <p>LEAVE A FOOTPRINT FOR CHALLENGE</p>
              <Link to="about" className="ui blue button">Learn more</Link>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default HomePage;
