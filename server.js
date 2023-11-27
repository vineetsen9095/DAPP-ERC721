const express = require("express");
const path = require("path");
const app = express();

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname + "/ERC721.html"));
})

app.listen(58000, "172.16.6.121", ()=>{
    console.log(`port is open on 56000`);
});

