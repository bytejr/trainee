import Modal from 'react-modal';

import { Login } from './pages/Login';
import { Dashboard } from './pages/Dashboard';

import './styles/global.scss';

Modal.setAppElement('#root');

function App() {

  return (
    // <Login/>
    <Dashboard/>
  )
}

export default App
