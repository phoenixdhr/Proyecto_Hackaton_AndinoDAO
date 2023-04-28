# Swap_Automatico_EVM



**DESCRIPCION**

Contrato que permite recibir BNB y lo trasforma automaticamente en BUSD. El proceso funciona a través de un contrato inteligente generado por un comercio electrónico (o cualquier usuario). La dirección de este contrato permite recibir BNB. Durante la creación del contrato, se puede configurar un monto mínimo necesario para activar un intercambio automático o "swap", que convierte la criptomonedas recibida en stablecoins y las envía a una dirección del comercio electrónico.
Este sistema permite a los usuarios realizar transacciones con BNB y, al mismo tiempo, protege a los comerciantes de la volatilidad asociada, ya que recibirán stablecoin (BUSD), cuyo valor está vinculado a monedas fiduciarias u otros activos estables.


- Proyecto desarrollado en la Red de Binance Testnet: https://chainlist.org/chain/97.
- Faucet Binance Testnet: https://testnet.binance.org/faucet-smart.
- Explorador de Bloques BNB Testnet https://testnet.bscscan.com/

El proyecto consta de dos archivos .sol  **CreadorDeContratosSwapAutomatico.sol** y **SwapInstantaneo.sol**

## CreadorDeContratosSwapAutomatico.sol

**CreadorDeContratosSwapAutomatico.sol** internamente llama a  **SwapInstantaneo.sol** (depende de el) para  crear direcciones de Contrato que realizan  Swaps automáticos al llegar a un monto.

Además, **CreadorDeContratosSwapAutomatico.sol** almacena las direcciones creadas con **SwapInstantaneo.sol**
 
## SwapInstantaneo.sol
**SwapInstantaneo** crea un contrato que realizan Swaps cada vez que se le deposita, este contrato puede funcionar por si solo, independeintemente de **CreadorDeContratosSwapAutomatico.sol**.



https://drive.google.com/file/d/1yDDu1WglgzorzvGE2RSDRBLRPfK_gsGL/view
