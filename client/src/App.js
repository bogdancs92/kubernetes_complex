import logo from "./logo.svg";
import "./App.css";
import { BrowserRouter as Router, Route, Link, Switch } from "react-router-dom";
import Fib from "./Fib";
import OtherPage from "./OtherPage";

function App() {
  return (
    <Router>
      <div className="App">
        <Link to="/">Home</Link>
        <Link to="/otherpage">Other page</Link>
        <div>
          <h3>Client App Update live ?</h3>
          <Switch>
            <Route path="/otherpage" component={OtherPage} />
            <Route exact path="/" component={Fib} />
          </Switch>
        </div>
      </div>
    </Router>
  );
}

export default App;
