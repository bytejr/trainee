import { Header } from '../../components/Header'; 
import { Footer } from '../../components/Footer';
import { CustomModal } from './Modal'

import { FiTrash, FiPlus, FiRotateCcw, FiBarChart2, FiList } from 'react-icons/fi';

import './styles.scss';

export function Dashboard(){
  function test(){
    return(
      <ul>
        <li>item 1</li>
        <li>item 2</li>
        <li>item 1</li>
      </ul>
    )
  }

  return(
    <div className="dash-container">
      <CustomModal/>
      { test() }
      <Header/>
      
      <main className="dashboard">
        <div className="table-container">
          <h4>Histórico deste mês</h4>

          <table>
            <tbody>
              <tr>
                <td>Entrada</td>
                <td>R$ 300,00</td>
                <td>Bolsa estudantil</td>
                <td>25/09/2022</td>
                <td><FiTrash/></td>
              </tr>

              <tr>
                <td>Entrada</td>
                <td>R$ 300,00</td>
                <td>Bolsa estudantil</td>
                <td>25/09/2022</td>
                <td><FiTrash/></td>
              </tr>

              <tr>
                <td>Entrada</td>
                <td>R$ 300,00</td>
                <td>Bolsa estudantil</td>
                <td>25/09/2022</td>
                <td><FiTrash/></td>
              </tr>
            </tbody>
          </table>

          <div>
            <button>
              <FiPlus/>
              <span>Nova entrada</span>
            </button>
          </div>

        </div>

        <aside className="aside-container">
          <div className="resume">
            <h4>Total do mês atual</h4>
            <div className="income-outcome-container">
              <div>
                <span>Entrou</span>
                <span className="value income">R$ 300,00</span>
              </div>

              <div>
                <span>Saiu</span>
                <span className="value outcome">R$ 100,00</span>
              </div>
            </div>
          </div>

          <input type="text" placeholder="Digite um filtro . . ."/>

          <nav>
            <a href="#historic"><FiRotateCcw/>Histórico geral</a>
            <a href="#statistics"><FiBarChart2/>Estatísticas</a>
            <a href="#options"><FiList/>Opções</a>
          </nav>
        </aside>
      </main>
      
      <Footer/>
    </div>
  )
}