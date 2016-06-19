import React, {PropTypes} from 'react';
import Navbar from './navbar'

class App extends React.Component {

  componentDidMount() {
    $('.menu .item').not('.brand').on('click', function() {
      $('.ui .item').removeClass('active');
      $(this).addClass('active');
    });
  }

  render() {
    return (
      <div>
        <Navbar />
        {this.props.children}
      </div>
    );
  }
}

App.propTypes = {
  children: PropTypes.object.isRequired
};

export default App;
