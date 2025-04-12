import {
    listarTodosprestamosQuery,
    listarprestamosPorIdQuery,
    crearprestamosQuery,
    actualizarprestamosQuery,
    eliminarprestamosQuery
  } from "../db/prestamosQuery.js";
  
  /**
   * Obtener todos los prestamos de la base de datos
   */
  const listarTodosprestamos = async (req, res) => {
    // Un bloque try-catch  sirve para validar si la peticion se obtiene o se devuelve un error
    // Try -> intentar
    // Catch -> capturar el error
    try {
      //  Ejecutar la consulta en la base de datos
      const prestamos = await listarTodosprestamosQuery();
      res.json(prestamos);
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Obtener el prestamos con el ID especificado en la query / url
   * @param {*} req 
   * @param {*} res 
   */
  
  const listarprestamosPorId = async (req, res) => { 
    try {
      //  Ejecutar la consulta en la base de datos
      const prestamos = await listarprestamosPorIdQuery(req.params.id);
      res.json(prestamos);
    } catch (error) {
      res.status(500).send(error);
    }
  };
  
  /**
   * Crear un prestamos
   */
  const crearprestamos = async (req, res) => {
    console.log(req.body)
    try {
        const datosprestamos = req.body;
        const resultado = await crearprestamosQuery(datosprestamos);
        res.json({ mensaje: 'prestamos creado con éxito', id: resultado.rows[0].id });
    } catch (error) {
        res.status(500).send(error);
    }
  };
  
  /**
   * Actualizar los datos de un prestamos
   */
  const actualizarprestamos = async (req, res) => {
    try {
        const id = req.params.id;
        const datosprestamos = req.body;
        const resultado = await actualizarprestamosQuery(id, datosprestamos);
        if (resultado.rowCount > 0) {
            res.json({ mensaje: 'prestamos actualizado con éxito', id: id });
        } else {
            res.status(404).json({ mensaje: 'prestamos no encontrado' });
        }
    } catch (error) {
        res.status(500).send(error);
    }
  };
  
  /**
   * Eliminar un prestamos
   */
  const eliminarprestamos = async (req, res) => {
    try {
        const id = req.params.id;
        const resultado = await eliminarprestamosQuery(id);
        if (resultado.rowCount > 0) {
            res.json({ mensaje: 'prestamos eliminado con éxito' });
        } else {
            res.status(404).json({ mensaje: 'prestamos no encontrado' });
        }
    } catch (error) {
        res.status(500).json({ mensaje: 'Error al eliminar el prestamos', error: error.message });
    }
  };
  
  export {
    listarTodosprestamos,
    listarprestamosPorId,
    crearprestamos,
    actualizarprestamos,
    eliminarprestamos,
  };