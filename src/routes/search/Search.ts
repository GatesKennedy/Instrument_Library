import { Router, Response, Request, request } from 'express';
import { pool } from '../../db/db';

const searchRouter = Router();

//  GET ALL Entries 
//  @route      GET api/search
//  @desc       respond "list of all books and authors"
//  @access     PUBLIC
searchRouter.get('/', async (request: Request, response: Response, next) => {
    // const filter:string = request.query.filter;
    // const order:string = request.query.order

  const queryText: string = `
      SELECT *
      FROM lookup_bookAuthors AS l
      INNER JOIN tbl_books AS b ON l.bookID = b.ISBN
      ;`;
//   const queryText = `
//       SELECT *
//       FROM lookup_bookAuthors AS l
//       INNER JOIN tbl_books AS b ON l.bookID = b.ISBN
//       INNER JOIN tbl_authors AS a ON l.authorID = a.id;`;
  try {
    const { rows } = await pool.query(queryText);
    console.log('query ALL response', rows);

    response.status(200).send(JSON.stringify(rows));
  } catch (err: any) {
    console.error('(>_<) search.js > GET ALL > err.message: ' + err.message);
    return next(err);
  }
});


export default searchRouter;