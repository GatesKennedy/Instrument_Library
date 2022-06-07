import { Router, Response, Request, request } from 'express';
import { pool } from '../../db/db';
import bookRouter from '../admin/Books';

const searchRouter = Router();

//==============
//  End-Points
//==============
bookRouter.get('/', async (request: Request, response: Response, next) => {
    // const filter:string = request.query.filter;
    // const order:string = request.query.order

  const queryText = `
      SELECT *
      FROM lookup_bookAuthors AS l
      INNER JOIN tbl_books AS b ON l.bookID = b.ISBN
      INNER JOIN tbl_authors AS a ON l.authorID = a.id`;
  try {
    const { rows } = await pool.query(queryText);
    console.log('query ALL response', rows);

    response.status(200).json(rows[0]);
  } catch (err: any) {
    console.error('(>_<) auth.js > GET AUTH > err.message: ' + err.message);
    return next(err);
  }
});


export default searchRouter;