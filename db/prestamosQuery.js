import { config } from '../config.js';

/**
 * Carga la lista de prestamos
 */
const listarTodosprestamosQuery = async () => {
    try {
        const result = await config.query('SELECT * FROM prestamos');
        return result.rows;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

/**
 * Buscar un prestamos por su ID (llave primaria)
 */
const listarprestamosPorIdQuery = async (id) => {
    try {
        const result = await config.query('SELECT * FROM prestamos WHERE id = $1 LIMIT 1', [id]);
        return result.rows;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

/**
 * Guardar un nuevo prestamos
 */
const crearprestamosQuery = async (prestamos) => {
    const { nombre, copias, estante } = prestamos;
    try {
        const result = await config.query(
            'INSERT INTO prestamos (nombre,) VALUES ($1) RETURNING *',
            [nombre, copias, estante]
        );
        return result;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

/**
 * Actualizar un prestamos por su ID
 */
const actualizarprestamosQuery = async (id, prestamos) => {
    const { nombre, copias, estante } = prestamos;
    try {
        const result = await config.query(
            'UPDATE prestamos SET nombre = $1, copias = $2, estante = $3 WHERE id = $4 RETURNING *',
            [nombre, copias, estante, id]
        );
        return result;
    } catch (err) {
        console.log(err);
        throw err;
    }
};

/**
 * Eliminar un prestamos por su ID
 */
const eliminarprestamosQuery = async (id) => {
    try {
        const result = await config.query(
            'DELETE FROM prestamos WHERE id = $1 RETURNING *',
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
    listarTodosprestamosQuery,
    listarprestamosPorIdQuery,
    crearprestamosQuery,
    actualizarprestamosQuery,
    eliminarprestamosQuery   
}