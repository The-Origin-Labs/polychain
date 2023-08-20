![](./assets/polychain.png)

> Blockchain integration for `Landate` Infrastructure

## Tech Stack
- `NodeJs`
- `Solidity`
- `Truffle` - Framework for smart contract development.
- `Web3.Js` - Smart contract interaction
- `Cypress` - E2E Testing

### 👌 Contract Features

The core of Polychain is a Solidity smart contract that facilitates property ownership, transfer, pricing, and shared ownership. Here's a breakdown of its features:

- `Property Creation`
  - Owners can create properties by specifying the location and price.
  - Each property is represented by a unique token with an associated property ID.

- `Property Transfer`
  - Owners can transfer property ownership to another address.
  - Ownership transfers are securely facilitated using the ERC721 standard.

- `Property Purchase`
  - Users can purchase properties by sending the required funds to the contract.
  - The contract ensures that the purchase price matches the property's price.

- `Property Price Update`
  - Owners can update the price of their properties.
  - An event is emitted to notify interested parties about the price change.

- `Shared Ownership`
  - Owners can share ownership of a property with others.
  - Shared ownership is represented by assigning ownership shares to multiple addresses.
  - Owners can adjust the ownership shares of each participant.

- `Ownership Percentage Calculation`
  - A function calculates the ownership percentage of a specific address for a given property.
  - It takes into account the ownership shares assigned to that address.

- `Nomination and Transfer of Shared Ownership (Future Enhancement)`
  - A nomination feature can be added to facilitate the transfer of shared ownership to another address.

#### Contract Deployment and Usage

- To deploy the `Property` Smart Contract, compile and migrate it using the Truffle framework.
- The contract provides a secure and decentralized way to manage property ownership and transactions.
- Use the provided Ethereum wallet addresses and functions to interact with the contract.
- The contract enforces ownership transfer rules and manages shared ownership transparently.


## Repository folder structure
```bash
├── README.md
├── build
├── contracts # solidity contract
├── controller 
├── cypress # e2e testing
├── cypress.config.js
├── migrations  # solidity contract migrations scripts
├── node_modules
├── package.json
├── routes
├── server.js
├── test # contract testing code
├── truffle-config.js # truffe configuration -> https://trufflesuite.com/docs/truffle/reference/configuration/
└── yarn.lock
```

## Installation

- Clone the repository:
```sh
git clone https://github.com/your-username/polychain.git
   cd polychain
```

### Install dependencies:
```sh
npm install
```

### Usage

Compile smart contracts and deploy on a local blockchain:

```sh
truffle compile
truffle migrate
```
- Start the server:
```sh
node server.js
```

- Run E2E tests:
```sh
npm run cypress
```

## Contributing

Contributions are welcome! If you have any ideas or improvements, feel free to open an issue or a pull request.

## License
This project is licensed under the [MIT License](./LICENSE).