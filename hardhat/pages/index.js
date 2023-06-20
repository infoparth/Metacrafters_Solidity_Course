import {useState, useEffect} from "react";
import {ethers} from "ethers";
import test_abi from "../artifacts/contracts/Assessment.sol/Assessment.json";

export default function HomePage() {
  const [ethWallet, setEthWallet] = useState(undefined);
  const [account, setAccount] = useState(undefined);
  const [evenTes, setevenTes] = useState(undefined);
  const [inputValue, setInputValue] = useState('');
  const [arrayData, setArrayData] = useState([]);

  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const evenTesABI = test_abi.abi;

  const getWallet = async() => {
    if (window.ethereum) {
      setEthWallet(window.ethereum);
    }

    if (ethWallet) {
      const account = await ethWallet.request({method: "eth_accounts"});
      handleAccount(account);
    }
  }

  const handleAccount = (account) => {
    if (account) {
      console.log ("Account connected: ", account);
      setAccount(account);
    }
    else {
      console.log("No account found");
    }
  }

  const connectAccount = async() => {
    if (!ethWallet) {
      alert('MetaMask wallet is required to connect');
      return;
    }
  
    const accounts = await ethWallet.request({ method: 'eth_requestAccounts' });
    handleAccount(accounts);
    
    // once wallet is set we can get a reference to our deployed contract
    getevenTesContract();
  };

  const getevenTesContract = () => {
    const provider = new ethers.providers.Web3Provider(ethWallet);
    const signer = provider.getSigner();
    const evenTesContract = new ethers.Contract(contractAddress, evenTesABI, signer);
 
    setevenTes(evenTesContract);
  }

  //starting the functions

  const handleInputChange = (event) => {
    setInputValue(event.target.value);
  }

  const handleSubmit = async (event) => {
    if (evenTes){
    event.preventDefault();
    // Call the contract function with the input value
    await evenTes.addMember(inputValue);
    // Do something after the contract function call
    console.log(`Address recieved`);
    }
  }

  const remMem = async() => {
    if (evenTes) {
      let tx = await evenTes.removeMember();
      await tx.wait()
    }
  }

  const getList = async() => {
    const array = await evenTes.getMembers();
    setArrayData(array);
  }


  const initUser = () => {
    // Check to see if user has Metamask
    if (!ethWallet) {
      return <p>Please install Metamask in order to use this evenTes.</p>
    }

    // Check to see if user is connected. If not, connect to their account
    if (!account) {
      return <button onClick={connectAccount}>Please connect your Metamask wallet</button>
    }


    return (
      <div>
        <p>Your Account: {account}</p>
        <div>
            <form onSubmit={handleSubmit}>
            <input type="text" value={inputValue} onChange={handleInputChange} />
            <button type="submit">Add Member</button>
            </form>
        </div>
        <button onClick={remMem}>Remove Member</button>
        <div>
            <button onClick={getList}>Fetch Array Data</button>
            {arrayData.map((item, index) => (
            <div key={index}>{item}</div>
    ))}
  </div>
      </div>
    )
  }
  useEffect(() => {
    getList();
  }, []);

  return (
    <main className="container">
      <header><h1>Idk What this is, but Welcome!</h1></header>
      {initUser()}
      <style jsx>{`
        .container {
          text-align: center
        }
      `}
      </style>
    </main>
  )
}