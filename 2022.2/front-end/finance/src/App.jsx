import Modal from 'react-modal';

import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';

import { Login } from './pages/Login';
import { Dashboard } from './pages/Dashboard';

import './styles/global.scss';

Modal.setAppElement('#root');

function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login/>}/>
        <Route path="/dashboard" element={<Dashboard/>}/>
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App
