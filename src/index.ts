import express from 'express';
import http from 'http';

import authorRouter from './routes/admin/Authors';
import bookRouter from './routes/admin/Books';
import searchRouter from './routes/search/Search';

const app = express();

//~~~~~~~~~~~~~~~~~~~~~~~
//      ROUTES
//~~~~~~~~~~~~~~~~~~~~~~~
app.use('./routes/admin/Authors.ts', authorRouter);
app.use('./routes/admin/Books.ts', bookRouter);
app.use('./routes/search/Search.ts', searchRouter);

//~~~~~~~~~~~~~~~~~~~~~~~
//    Server Init
//~~~~~~~~~~~~~~~~~~~~~~~
const PORT: string = process.env.PORT || '5555';
const server: http.Server = http.createServer(app);
server.listen(PORT, () => {
    if (process.env.NODE_ENV === 'production') {
        console.log(`
        ~~~~~~~~~ server.js ~~~~~~~~~
        (^=^)   production listening on port ${PORT}
                Secure: https
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        `);
    } else if (process.env.NODE_ENV === 'development') {
        console.log(`
        ~~~~~~~~~ server.js ~~~~~~~~~
        (^=^)   development listening on port ${PORT}
                Insecure: http
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        `);
    }
});

module.exports = server;