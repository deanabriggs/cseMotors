const { Pool } = require("pg");
require("dotenv").config();
/* ***************
 * Connection Pool
 * Hosted Postgres providers (Neon, Render, Supabase) require SSL.
 * Their certs aren't in Node's default trust store, so we use
 * { rejectUnauthorized: false } to encrypt without rejecting the cert.
 * The NODE_ENV check only adds query logging in development;
 * both branches connect with SSL.
 * *************** */
let pool;
if (process.env.NODE_ENV == "development") {
  pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false },
  });

  // Added for troubleshooting queries
  // during development
  module.exports = {
    async query(text, params) {
      try {
        const res = await pool.query(text, params);
        console.log("executed query", { text });
        return res;
      } catch (error) {
        console.error("error in query", { text });
        throw error;
      }
    },
  };
} else {
  pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false },
  });
  module.exports = pool;
}
