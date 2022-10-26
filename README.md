# Proyecto_Hackaton_AndinoDAO

- Proyecto desarrollado en la Red de Binance Testnet: https://chainlist.org/chain/97.
- Faucet Binance Testnet: https://testnet.binance.org/faucet-smart.
- Explorador de Bloques BNB Testnet https://testnet.bscscan.com/address/0x0ac6c5d054f9bb68981c0116065773b3d83c9903.

El proyecto consta de dos archivos .sol  **CreadorDeContratosSwapAutomatico.sol** y **SwapInstantaneo.sol**

##CreadorDeContratosSwapAutomatico
**CreadorDeContratosSwapAutomatico.sol** internamente llama a  **SwapInstantaneo.sol** (depende de el) para  crear direcciones de Contrato que realizan  Swaps automáticos al llegar a un monto.

Además, **CreadorDeContratosSwapAutomatico.sol** almacena las direcciones creadas con **SwapInstantaneo.sol**
 
##SwapInstantaneo.sol
**SwapInstantaneo** crea un contrato que realizan Swaps cada vez que se le deposita, este contrato puede funcionar por si solo, independeintemente de **CreadorDeContratosSwapAutomatico.sol**.



htthttps://drive.google.com/file/d/1yDDu1WglgzorzvGE2RSDRBLRPfK_gsGL/viewp:// "Estructura Span"
