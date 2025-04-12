import { Router } from 'express';

import {
    listarTodosprestamos,
    listarprestamosPorId,
    crearprestamos,
    actualizarprestamos,
    eliminarprestamos
} from '../controllers/prestamosController.js';

const prestamosRouter = Router();

prestamosRouter.get('/', listarTodosprestamos);
prestamosRouter.get('/:id', listarprestamosPorId);

prestamosRouter.post('/', crearprestamos);
prestamosRouter.put('/:id', actualizarprestamos);
prestamosRouter.delete('/:id', eliminarprestamos);

export default prestamosRouter;