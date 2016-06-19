import React from 'react';
import {Link} from 'react-router';

class Register extends React.Component {
  render() {
    return(
      <div className="ui middle aligned center aligned grid">
        <div className="column login">
          <h2 className="ui teal header">
            <div className="content">
              Sign in to your account
            </div>
          </h2>
          <form className="ui large form">
            <div className="ui stacked segment">
              <div className="field">
                <div className="ui left icon input">
                  <i className="user icon"></i>
                  <input type="text" name="email" placeholder="E-mail address" />
                </div>
              </div>
              <div className="field">
                <div className="ui left icon input">
                  <i className="lock icon"></i>
                  <input type="password" name="password" placeholder="Password" />
                </div>
              </div>
              <div className="ui fluid large teal submit button">Register</div>
            </div>

            <div className="ui error message"></div>

          </form>
          <div className="ui message">
            Already have an account? <Link to="login">Login</Link>
          </div>
        </div>
      </div>
    );
  }
}

export default Register;
