import { Pool } from "pg";

const envStr: string = JSON.stringify(process.env.NODE_ENV);
const DB_URL: string = process.env.DATABASE_URL || "http://localhost:5432";
const DB_USER: string = process.env.DB_USER || "pg";
const DB_NAME: string = process.env.DB_NAME || "db_library";
const DB_PASSWORD: string = process.env.DB_PASSWORD || "instrument";
const cxnStr = 
    process.env.NODE_ENV == 'development'
        ? `postgresql://${DB_USER}:${DB_PASSWORD}@${DB_URL}/${DB_NAME}`
        : DB_URL;

export const pool = new Pool({
    connectionString: cxnStr
});

//~~~~~~~~~~~~~
//  Log Check
//~~~~~~~~~~~~~
let logStr = `  ~~~~~~~~~~~ db.js ~~~~~~~~~~~`;
if (pool) logStr += `\n  (^=^)  PostgresDB Connected...`;
else logStr += `\n  (-_-)  BAD: PostgresDB Disconnected...`;
envStr
  ? (logStr += `\n  (^=^)  NODE_ENV = ` + envStr)
  : (logStr += `\n  (-_-)  NODE_ENV = *null*`);
logStr += `\n  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n`;
console.log(logStr);