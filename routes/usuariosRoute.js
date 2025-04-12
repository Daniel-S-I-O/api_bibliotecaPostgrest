import { Router } from 'express';

import {
    listarTodosusuarios,
    listarusuariosPorId,
    crearusuarios,
    actualizarusuarios,
    eliminarusuarios
} from '../controllers/usuariosController.js';

const usuariosRouter = Router();

usuariosRouter.get('/', listarTodosusuarios);
usuariosRouter.get('/:id', listarusuariosPorId);

usuariosRouterRouter.post('/', crearusuarios);
usuariosRouter.put('/:id', actualizarusuarios);
usuariosRouter.delete('/:id', eliminarusuarios);

export default usuariosRouter;