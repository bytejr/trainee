import Modal from 'react-modal';
import { FiPlus, FiXSquare } from 'react-icons/fi';

import './styles.scss';
import { useState } from 'react';

export function CustomModal({ isOpen, action, openModal }){
  const [isIncome, setIsIncome] = useState(true);
  const [value, setValue] = useState('');
  const [date, setDate] = useState('');
  const [description, setDescription] = useState('');
  const [installments, setInstallments] = useState('');
  
  function formatDate(date){
    // date tem esse formato: '2022-10-28'  
    const [year,month,day] = date.split('-') // [2022,10,28]
    
    // return day + '/' + month + '/' + year
    return `${day}/${month}/${year}`;
  }

  function handleAddData(e){
    e.preventDefault();

    const newData = {
      id: parseInt(Math.random()*1000),
      income: isIncome,
      value: Number(value),
      date: formatDate(date),
      description
    };

    action(newData);
    openModal(false);
  }

  return(
    <Modal
      isOpen={isOpen}
      className="modal"
      overlayClassName="overlay"
      onRequestClose={()=>openModal(false)}
    >
      <form onSubmit={handleAddData}>
        <header>
          <h4>Cadastrar um novo ativo</h4>
          <div>
            <button className="add" type="submit">
              <FiPlus/>
              Adicionar
            </button>
            <button className="close" onClick={()=>openModal(false)}>
              <FiXSquare/>
            </button>
          </div>
        </header>

        <fieldset className="first-fieldset">
          <span>Entrada</span>
          <input 
            className={isIncome ? 'green' : ''}
            type="range"
            min="0"
            max="1"
            step="1"
            defaultValue="0"
            required
            onChange={()=>setIsIncome(!isIncome)}
          />
          <span>Saída</span>
        </fieldset>

        <fieldset className="second-fieldset">
          <input 
            type="number" 
            step="0.01"
            placeholder="Valor"
            required
            value={value}
            onChange={(e)=>setValue(e.target.value)}
          />

          <input 
            type="date" 
            required
            value={date}
            onChange={(e)=>setDate(e.target.value)}
          />

          <input 
            type="text" 
            placeholder="Descrição"
            required
            value={description}
            onChange={(e)=>setDescription(e.target.value)}
          />
          
          <input 
            type="number" 
            step="1"
            placeholder="Nº de parcelas"
            value={installments}
            onChange={(e)=>setInstallments(e.target.value)}
          />

        </fieldset>

      </form>
    </Modal>
  )
}