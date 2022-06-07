import express from 'express';
import http from 'http';

import authorRouter from './routes/admin/Authors';
import bookRouter from './routes/admin/Books';
import searchRouter from './routes/search/Search';

const app = express();

class AppError extends Error {
    
    statusCode: number;
    status: string;
    isOperational: boolean;

    constructor(message: string, statusCode: number) {
      super(message);
  
      this.statusCode = statusCode;
      this.status = 'error';
      this.isOperational = true;
  
      Error.captureStackTrace(this, this.constructor);
    }
  }
//~~~~~~~~~~~~~~~~~~~~~~~
//      ROUTES
//~~~~~~~~~~~~~~~~~~~~~~~
app.use('/api/admin/authors', authorRouter);
app.use('/api/admin/books', bookRouter);
app.use('/api/search', searchRouter);
app.all('*', (req, res, next) => {
    next(new AppError(`Oops.. ${req.originalUrl} is not for you!`, 404));
  });

//~~~~~~~~~~~~~~~~~~~~~~~
//    Server Init
//~~~~~~~~~~~~~~~~~~~~~~~
const PORT: string = process.env.PORT || '5555';
const server: http.Server = http.createServer(app);
console.log(PORT);
process.env.NODE_ENV = 'development';
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
        ('=')   development listening on port ${PORT}
                Insecure: http
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        `);
    } else {
        console.log(`
        ~~~~~~~~~ server.js ~~~~~~~~~
        (-_-)   NODE_ENV = unknown | Port: ${PORT}
                Insecure: http
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        `);
    }
});

module.exports = server;