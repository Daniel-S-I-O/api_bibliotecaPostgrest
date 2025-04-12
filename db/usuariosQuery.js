import { config } from '../config.js';

/**
 * Carga la lista de usuarios
 */
const listarTodosusuariosQuery = async () => {
    try {
        const result = await config.query('SELECT * FROM usuarios');
        return result.rows;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

/**
 * Buscar un usuarios por su ID (llave primaria)
 */
const listarusuariosPorIdQuery = async (id) => {
    try {
        const result = await config.query('SELECT * FROM usuarios WHERE id = $1 LIMIT 1', [id]);
        return result.rows;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

/**
 * Guardar un nuevo usuarios
 */
const crearusuariosQuery = async (usuarios) => {
    const { nombre, copias, estante } = usuarios;
    try {
        const result = await config.query(
            'INSERT INTO usuarios (nombre, email, numero) VALUES ($1), ($1), ($1) RETURNING *',
            [nombre, copias, estante]
        );
        return result;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

/**
 * Actualizar un usuarios por su ID
 */
const actualizarusuariosQuery = async (id, usuarios) => {
    const { nombre } = usuarios;
    try {
        const result = await config.query(
            'UPDATE usuarios SET nombre = $1, WHERE id = $4 RETURNING *',
            [nombre, id]
        );
        return result;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

/**
 * Eliminar un usuarios por su ID
 */
const eliminarusuariosQuery = async (id) => {
    try {
        const result = await config.query(
            'DELETE FROM usuarios WHERE id = $1 RETURNING *',
            [id]
        );
        return result;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

// Exportar todas las funciones definidas en este archivo
export {
    listarTodosusuariosQuery,
    listarusuariosPorIdQuery,
    crearusuariosQuery,
    actualizarusuariosQuery,
    eliminarusuariosQuery   
}