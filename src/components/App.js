import React, {PropTypes} from 'react';
import Navbar from './navbar'

class App extends React.Component {
  render() {
    return (
      <div>
        <Navbar />
        <div>
          {this.props.children}
        </div>
      </div>
    );
  }
}

App.propTypes = {
  children: PropTypes.object.isRequired
};

export default App;
