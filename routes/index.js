'use strict';

var express = require('express');
var router = express.Router();

const puppeteer = require('puppeteer');
const vm = require('vm');

/* GET home page. */
router.post('/', function(req, res) {
  // const str = `
  // async function run() {
  //   const browser = await puppeteer.launch();
  //   const page = await browser.newPage();
  //
  //   await page.goto('https://www.google.co.jp/');
  //   return await page.evaluate(() => document.body.innerHTML);
  //
  // }
  // `;

  const context = {
      puppeteer: puppeteer
  };

  console.log(req.body);

  vm.runInNewContext(req.body, context);
    context.run().then( function(raw) {
        // res.render('index', { title: raw });
        res.send(raw);
    })
});

module.exports = router;
