<!DOCTYPE html>
<html>

<head>
    <title>ERC721 Token CONTRACT</title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/web3/1.2.7-rc.0/web3.min.js"></script>
    <style>
        body {
            background-color: rgb(71, 218, 13);
            font-size: 20px;
            text-align: center;
        }

        button {
            background-color: aquamarine;
            font-size: 22px;
            font-family: impact;
        }

        button:hover {
            background-color: yellow;
        }

        input {
            width: 22%;
            height: 22px;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <p>
    <h1><u>This is My ERC721 dApp</u></h1>
    </p>
    <button onclick="connectMetamask()">CONNECT TO METAMASK</button> <br>
    <p id="accountArea">Connection Status: NOT CONNECTED to Metamask </p>

    <button onclick="connectContract()">CONNECT TO CONTRACT</button> <br>
    <p id="contractArea">Connection Status: NOT CONNECTED to Smart Contract</p>

    <button onclick="readWord()">GET DATA FROM CONTRACT</button> <br>
    <p id="dataArea">Data Status: NO Data from Smart Contract </p>

    <input type="text" name="" id="to" placeholder="to (Address)">
    <input type="text" name="" id="uri" placeholder="Enter Your URI">
    <button onclick="safemints()">SAFEMINT TOKEN</button><br>
    <p id="mintArea"></p>
    <p id="mintAreaa"></p>

    <input type="number" name="" id="tokenId" placeholder="Enter TokenId">
    <button onclick="burnTokens()">BURN TOKEN</button><br>
    <p id="burnArea"></p>
    <p id="burnAreaa"></p>

    <input type="text" name="" id="Fadd" placeholder="Enter Your Sender(to) Address">
    <input type="text" name="" id="Tadd" placeholder="Enter Your Recipient(from) Address">
    <input type="number" id="tokenid" placeholder="Enter Your Token ID">
    <button onclick="safeTransfers()">SAFE TRANSFER FROM</button><br>
    <p id="transferArea"></p>
    <p id="transferAreaa"></p>

    <input type="text" name="" id="acc" placeholder="Enter Your Address">
    <button onclick="balCheck()">GET BALANCE</button>
    <p id="balArea"></p>


    <script>
        let account;
        const connectMetamask = async () => {
            if (window.ethereum !== "undefined") {
                const accounts = await ethereum.request({ method: "eth_requestAccounts" });
                account = accounts[0];
                document.getElementById("accountArea").innerHTML = `Account is: ${account}`;
            }

        }

        const connectContract = async () => {
            const ABI = [{ "inputs": [{ "internalType": "address", "name": "initialOwner", "type": "address" }], "stateMutability": "nonpayable", "type": "constructor" }, { "inputs": [{ "internalType": "address", "name": "sender", "type": "address" }, { "internalType": "uint256", "name": "tokenId", "type": "uint256" }, { "internalType": "address", "name": "owner", "type": "address" }], "name": "ERC721IncorrectOwner", "type": "error" }, { "inputs": [{ "internalType": "address", "name": "operator", "type": "address" }, { "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "ERC721InsufficientApproval", "type": "error" }, { "inputs": [{ "internalType": "address", "name": "approver", "type": "address" }], "name": "ERC721InvalidApprover", "type": "error" }, { "inputs": [{ "internalType": "address", "name": "operator", "type": "address" }], "name": "ERC721InvalidOperator", "type": "error" }, { "inputs": [{ "internalType": "address", "name": "owner", "type": "address" }], "name": "ERC721InvalidOwner", "type": "error" }, { "inputs": [{ "internalType": "address", "name": "receiver", "type": "address" }], "name": "ERC721InvalidReceiver", "type": "error" }, { "inputs": [{ "internalType": "address", "name": "sender", "type": "address" }], "name": "ERC721InvalidSender", "type": "error" }, { "inputs": [{ "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "ERC721NonexistentToken", "type": "error" }, { "inputs": [{ "internalType": "address", "name": "owner", "type": "address" }], "name": "OwnableInvalidOwner", "type": "error" }, { "inputs": [{ "internalType": "address", "name": "account", "type": "address" }], "name": "OwnableUnauthorizedAccount", "type": "error" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "owner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "approved", "type": "address" }, { "indexed": true, "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "Approval", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "owner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "operator", "type": "address" }, { "indexed": false, "internalType": "bool", "name": "approved", "type": "bool" }], "name": "ApprovalForAll", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "uint256", "name": "_fromTokenId", "type": "uint256" }, { "indexed": false, "internalType": "uint256", "name": "_toTokenId", "type": "uint256" }], "name": "BatchMetadataUpdate", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "uint256", "name": "_tokenId", "type": "uint256" }], "name": "MetadataUpdate", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "previousOwner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "newOwner", "type": "address" }], "name": "OwnershipTransferred", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "from", "type": "address" }, { "indexed": true, "internalType": "address", "name": "to", "type": "address" }, { "indexed": true, "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "Transfer", "type": "event" }, { "inputs": [{ "internalType": "address", "name": "to", "type": "address" }, { "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "approve", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "owner", "type": "address" }], "name": "balanceOf", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "stateMutability": "view", "type": "function" }, { "inputs": [{ "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "burnToken", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "getApproved", "outputs": [{ "internalType": "address", "name": "", "type": "address" }], "stateMutability": "view", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "owner", "type": "address" }, { "internalType": "address", "name": "operator", "type": "address" }], "name": "isApprovedForAll", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "name", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "owner", "outputs": [{ "internalType": "address", "name": "", "type": "address" }], "stateMutability": "view", "type": "function" }, { "inputs": [{ "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "ownerOf", "outputs": [{ "internalType": "address", "name": "", "type": "address" }], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "renounceOwnership", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "to", "type": "address" }, { "internalType": "string", "name": "uri", "type": "string" }], "name": "safeMint", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "from", "type": "address" }, { "internalType": "address", "name": "to", "type": "address" }, { "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "safeTransferFrom", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "from", "type": "address" }, { "internalType": "address", "name": "to", "type": "address" }, { "internalType": "uint256", "name": "tokenId", "type": "uint256" }, { "internalType": "bytes", "name": "data", "type": "bytes" }], "name": "safeTransferFrom", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "operator", "type": "address" }, { "internalType": "bool", "name": "approved", "type": "bool" }], "name": "setApprovalForAll", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "bytes4", "name": "interfaceId", "type": "bytes4" }], "name": "supportsInterface", "outputs": [{ "internalType": "bool", "name": "", "type": "bool" }], "stateMutability": "view", "type": "function" }, { "inputs": [], "name": "symbol", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "stateMutability": "view", "type": "function" }, { "inputs": [{ "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "tokenURI", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "stateMutability": "view", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "from", "type": "address" }, { "internalType": "address", "name": "to", "type": "address" }, { "internalType": "uint256", "name": "tokenId", "type": "uint256" }], "name": "transferFrom", "outputs": [], "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "internalType": "address", "name": "newOwner", "type": "address" }], "name": "transferOwnership", "outputs": [], "stateMutability": "nonpayable", "type": "function" }];
            const Address = "0x01483Ba82eCb79D7fc7AE6254f40124174705cE5";
            window.web3 = await new Web3(window.ethereum);
            window.contract = await new window.web3.eth.Contract(ABI, Address);
            document.getElementById("contractArea").innerHTML = "Connection Status: Success";
        }

        const readWord = async () => {
            try {
                const name = await window.contract.methods.name().call();
                const symbol = await window.contract.methods.symbol().call();
                const owner = await window.contract.methods.owner().call();

                document.getElementById("dataArea").innerHTML = `<p>
                        Name of token : ${name} <br>
                        Symbolof token : ${symbol} <br>
                        Owner of token : ${owner} <br>
                    </p>`;

            } catch (error) {
                console.error(error);
            }
        }

        const safemints = async () => {
            try {
                const to = document.getElementById('to').value;
                const uri = document.getElementById('uri').value;

                if (!web3.utils.isAddress(to) || uri === null) {
                    return;
                }

                const receipt = await window.contract.methods.safeMint(to, uri).send({ from: account });
                console.log("Our Trh", receipt);

                document.getElementById('mintArea').innerHTML = `NFT Minted to ${to} `;
                document.getElementById('mintAreaa').innerHTML = `Transaction hash is ${receipt.transactionHash} `;
            } catch (error) {
                console.error(error);
                document.getElementById('mintArea').innerHTML = 'Transaction failed';
            }
        }

        const burnTokens = async () => {
            try {
                const inputElement = document.getElementById('tokenId');
                const tokenId = parseInt(inputElement.value);

                if (isNaN(tokenId) || tokenId < 0) {
                    document.getElementById('burnArea').innerHTML = 'Invalid token ID';
                    return;
                }

                const trhas = await window.contract.methods.burnToken(tokenId).send({ from: account });

                document.getElementById('burnArea').innerHTML = `This token id ${tokenId} Burn`;
                document.getElementById('burnAreaa').innerHTML = `Transaction hash is ${trhas.transactionHash} `;
            } catch (error) {
                console.error(error);
                document.getElementById('burnArea').innerHTML = 'Transaction failed';
            }
        }

        const safeTransfers = async () => {
            try {
                const Fadd = document.getElementById('Fadd').value;
                const Tadd = document.getElementById('Tadd').value;
                const inputEle = document.getElementById('tokenid');
                const tokenid = parseInt(inputEle.value);

                if (!web3.utils.isAddress(Fadd) || !web3.utils.isAddress(Tadd) || isNaN(tokenid) || tokenid < 0) {
                    document.getElementById('transferArea').innerHTML = 'Invalid input values';
                    return;
                }

                const receipts = await window.contract.methods.safeTransferFrom(Fadd, Tadd, tokenid).send({ from: account });
                console.log("T Add is ", Fadd, Tadd);

                document.getElementById('transferArea').innerHTML = `NFT Transfer ${Fadd} to This ${Tadd} `;
                document.getElementById('transferAreaa').innerHTML = `Transaction hash is ${receipts.transactionHash} `;
            } catch (error) {
                console.error(error);
                document.getElementById('transferArea').innerHTML = 'Transaction failed';
            }
        }

        const balCheck = async () => {
            try {

                const add = document.getElementById('acc').value;

                if (!web3.utils.isAddress(add)) {
                    document.getElementById('balArea').innerHTML = 'Invalid input values';
                }
                const balanceOf = await window.contract.methods.balanceOf(add).call();

                document.getElementById("balArea").innerHTML = `Balance is: ${balanceOf}`;
            } catch (error) {
                console.error(error);
                document.getElementById('balArea').innerHTML = 'Transaction failed';
            }
        }

    </script>
</body>

</html>