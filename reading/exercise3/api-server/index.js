const express = require('express')
const fs    = require('fs');
const nconf = require('nconf');

nconf.argv()
   .env()
   .file({ file: 'reading/exercise3/api-server/config.json' });


const app = express()
const port = 3000

function sleep(seconds) {
    return new Promise((resolve) => {
      setTimeout(resolve, seconds * 1000);
    });
  } 

app.get('/', async (req, res) => {
  await sleep(nconf.get('delay'))
  res.send(`${new Date().toISOString()} - ${nconf.get('greeting')}`)
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
  console.log('With message:', nconf.get('greeting'))
  console.log('And delay:', nconf.get('delay'))
})
