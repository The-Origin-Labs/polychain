const { defineConfig } = require("cypress");
require('dotenv').config();

module.exports = defineConfig({
  e2e: {
    baseUrl: `http://localhost:${process.env.PORT}`,
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
