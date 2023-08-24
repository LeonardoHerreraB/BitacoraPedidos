import express, {Request, Response} from 'express';
import dotenv from 'dotenv';
import cors from 'cors';

dotenv.config();
//iniciamos una instancia del express
const app = express();
const corsoptions ={
    origin : '*'
}

app.use(cors(corsoptions));
app.use(express.json());
app.use('/', (req: Request, res: Response)=>{res.send("HolaMundo");})
export default app;