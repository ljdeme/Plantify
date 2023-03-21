const functions = require("firebase-functions");
const https = require('https');
const cors = require('cors')({origin: true});
var axios = require('axios');

exports.getPlant = functions.https.onRequest((request, response) => {
    cors(reqeuest, response, () => {
        axios.get('https://perenual.com/api/species-list?key=[YOUR-API-KEY]&q=monstera');
    }),)
}