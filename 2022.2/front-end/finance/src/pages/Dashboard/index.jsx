import { Header } from '../../components/Header'; 
import { Footer } from '../../components/Footer';
import { CustomModal } from './Modal'

import { FiTrash, FiPlus, FiRotateCcw, FiBarChart2, FiList } from 'react-icons/fi';

import './styles.scss';
import { useState } from 'react';

const staticData = [
  {
    id: 1,
    income: true,
    value: 100.00,
    description: 'Bolsa',
    date: '25/07/2022'
  },
  {
    id: 2,
    income: true,
    value: 50.00,
    description: 'Rifas',
    date: '28/07/2022'
  },
  {
    id: 3,
    income: false,
    value: 20.00,
    description: 'Subway',
    date: '28/07/2022'
  },
  {
    id: 4,
    income: false,
    value: 100.00,
    description: 'Tênis',
    date: '30/07/2022'
  },
  {
    id: 5,
    income: true,
    value: 50.00,
    description: 'Rifa',
    date: '01/08/2022'
  },
  {
    id: 6,
    income: false,
    value: 10.00,
    description: 'Sanduíche',
    date: '02/08/2022'
  },
  {
    id: 7,
    income: false,
    value: 40.00,
    description: 'Camiseta',
    date: '05/08/2022'
  },
  {
    id: 8,
    income: false,
    value: 300.00,
    description: 'Violão',
    date: '10/08/2022'
  },
  {
    id: 9,
    income: false,
    value: 100.00,
    description: 'Mercado',
    date: '15/08/2022'
  },
  {
    id: 10,
    income: true,
    value: 100.00,
    description: 'Bolsa',
    date: '25/08/2022'
  },
]

export function Dashboard(){
  const [data, setData] = useState(staticData);
  const [filteredData, setFilteredData] = useState(staticData);

  const [filterInputValue, setFilterInputValue] = useState('');
  const [isModalOpen, setIsModalOpen] = useState(false);

  const name = 'olaph@bytejr.com';
  const total = calculateTotal();

  function calculateTotal(){
    // let income = 0;
    // let outcome = 0;

    // for(let item of filteredData){
    //   if(item.income){
    //     income += item.value;
    //   }else{
    //     outcome += item.value;
    //   }
    // }

    const total = filteredData.reduce(function(total, item){
      if(item.income){
        const income = total.income + item.value;
        const newTotal = { income, outcome: total.outcome };
        return newTotal;
      }else{
        const outcome = total.outcome + item.value;
        const newTotal = { outcome, income: total.income };
        return newTotal;
      }
    }, { income: 0, outcome: 0 });

    return { income: total.income.toFixed(2), outcome: total.outcome.toFixed(2) };
  }

  function handleDelete(idToDelete){
    // aqui nao podemos declarar useState
    const newData = data.filter(function(item){
      return item.id !== idToDelete;
    });
    setData(newData);
    setFilteredData(newData);
    setFilterInputValue('');
  }

  function filterTable(value){
    const newData = data.filter(function(item){
      const filterValue = value.toLowerCase();
      const itemDescription = item.description.toLowerCase();
      return itemDescription.includes(filterValue);
    });

    setFilterInputValue(value);
    setFilteredData(newData);
  }

  function handleAddData(newRegister){
    let newData = data;
    newData.push(newRegister);

    setData(newData);
    setFilteredData(newData);
  }

  return(
    <div className="dash-container">
      <CustomModal
        isOpen={isModalOpen}
        action={handleAddData}
        openModal={setIsModalOpen}
      />

      <Header
        email={name}
        name="Olaph Jr."
      />
      
      <main className="dashboard">
        <div className="table-container">
          <h4>Histórico deste mês</h4>

          <table>
            <tbody>
              { filteredData.map(function(item){
                return(
                  <tr key={item.id}>
                    <td 
                      className={item.income ? 'green' : 'red'}
                      style={{ width: '15%' }}
                    >
                      {item.income ? 'Entrada' : 'Saída'}
                    </td>
                    <td style={{ width: '20%' }}>R$ {item.value}</td>
                    <td style={{ width: '32.5%' }}>{item.description}</td>
                    <td style={{ width: '25%' }}>{item.date}</td>
                    <td style={{ width: '7.5%' }}><FiTrash onClick={()=>handleDelete(item.id)}/></td>
                  </tr>
                )
              })
              }
            </tbody>
          </table>

          <div>
            <button onClick={()=>{setIsModalOpen(true)}}>
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
                <span className="value income">R$ {total.income}</span>
              </div>

              <div>
                <span>Saiu</span>
                <span className="value outcome">R$ {total.outcome}</span>
              </div>
            </div>
          </div>

          <input 
            type="text" 
            placeholder="Digite um filtro . . ."
            value={filterInputValue}
            onChange={(event)=>filterTable(event.target.value)}
          />

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