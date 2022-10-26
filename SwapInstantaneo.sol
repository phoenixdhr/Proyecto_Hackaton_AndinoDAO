/// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Router {
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts){}
}


contract SwapInstantaneo {
    
    enum State { Fundraising, Successful } // Estado del contrato 

    Router router = Router(0xD99D1c33F9fC3444f8101754aBC46c52416550D1);   // Direccion en Testnet de Pancakeswap como contrato
    ERC20 WBNB_token = ERC20(0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd); // Direccion en Testnet de WBNB como contrato
    ERC20 BUSD_token = ERC20(0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7); // Direccion en Testnet de BUSD como contrato

    // VARIABLES DE ESTADO
    address payable public creator; // Wallet del creador del contrato
    uint public amountGoal; // Monto que una vez superado hace que el swap se ejecute de forma inmediata
    uint256 public currentBalance;
    string public title;
    State public state = State.Fundraising; // Inicializacion del estado del contrato
    mapping (address => uint) public contributions; // Registro de pagos por cada wallet aportante


    // Event que se emite cada vez que se reciba algun pago
    event FundingReceived(address contributor, uint amount, uint currentTotal);
    // Event que se emite cuando se ha alcanzado el amountGoal y se realiza un swap
    event CreatorPaid(address recipient);


    // Modifier para verificar el estado del contrato
    modifier inState(State _state) {
        require(state == _state);
        _;
    }

    constructor
    (     
        string memory nombreNegocio,
        uint montoMeta
    )  {
        creator = payable(msg.sender);
        title = nombreNegocio;
        amountGoal = montoMeta;
        currentBalance = 0;
    }

    // @dev Function para recibir depositos
      
    function contribute() external inState(State.Fundraising) payable {
        contributions[msg.sender] = contributions[msg.sender] + msg.value;
        currentBalance = currentBalance + msg.value;
        emit FundingReceived(msg.sender, msg.value, currentBalance);
        checkIfFundingComplete();
    }

    // @dev function para cambiar el estado del proyecto dependiendo de las condiciones.
   
    function checkIfFundingComplete() public {
        if (currentBalance >= amountGoal) {
            state = State.Successful;
            swapBNBtoBUSD();
        }
    }

    function swapBNBtoBUSD() public payable inState(State.Successful) 
    {
        uint256 totalRaised = currentBalance;
        currentBalance = 0;

        address[] memory path = new address[](2);       // Se inicializa un array dinámico con una longitud inicial de 2 (0,1)
        path[0] = address(WBNB_token);  // Address en Testnet de WBNB
        path[1] = address(BUSD_token);  // Address en Testnet de BUSD

        router.swapExactETHForTokens{value: totalRaised}(0,path, creator, block.timestamp);
        emit CreatorPaid(creator);
        state = State.Fundraising;
       
        // Especificación del Swap
    } 

    function aprobarWBNB() private {
    WBNB_token.approve(address(this),9999999999999999999999999);   // Se autoriza al contrato hacer uso del fondo que se le deposita (para hacer swaps) 
    }

    //  @dev Function para devolver detalle de los fondos en el contrato
    
    function getDetails() public view returns 
    (
        address payable walletNegocio,
        string memory nombreNegocio,
        State currentState,
        uint256 fondoActual,
        uint256 montoMeta
    ) {
        walletNegocio = creator;
        nombreNegocio = title;
        currentState = state;
        fondoActual = currentBalance;
        montoMeta = amountGoal;
    }
}