/// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <=0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "./SwapInstantaneo.sol";

contract CreadorDeContratosSwapAutomactico {

    // List of existing projects
    SwapInstantaneo[] private projects;

    // Event que se emite cuando se crea un nuevo contrato de swap automático
    event ProjectStarted(address contractAddress,address projectStarter,string projectTitle,uint256 goalAmount);

    // Function para asignar un contrato de swap automático a un negocio .
    // Title, del proyecto
    // amountToRaise, monto que activa el swap automático

    function startProject(string calldata title, uint amountToRaise) external {
              
        SwapInstantaneo newProject = new SwapInstantaneo(payable(msg.sender), title, amountToRaise);
        projects.push(newProject);
       
        emit ProjectStarted( address(newProject), msg.sender, title, amountToRaise );
    }                                                                                                                                   

    // Function para obtener todos los addresses de los contratos generados.
    function returnAllProjects() external view returns(SwapInstantaneo[] memory){
        return projects;
    }
}