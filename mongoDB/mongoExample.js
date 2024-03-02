import { crearBaseDeDatos, conectarDB } from './mongoExampleConnection.js'
import { ObjectId } from 'mongodb';

// 1. Listar todos los documentos en la colección "estudiantes" usando find():
async function listarEstudiantes() {
    try {
        const db = await conectarDB();
        const estudiantes = await db.collection('estudiantes').find().toArray();
        console.log(estudiantes);
    } catch (error) {
        console.error('Error al listar estudiantes:', error);
    }
}


// 2. Actualizar un documento de la colección "estudiantes" usando updateOne():
async function actualizarEstudiante() {
    try {
        const db = await conectarDB();
        await db.collection('estudiantes').updateOne(
            { "_id": ObjectId("1128MTC") }, 
            { $set: { "nombre": "Miguel Tabares Cuadros" } }
        );
    } catch (error) {
        console.error('Error al actualizar estudiante:', error);
    }
}

// 2.1 Actualizar varios documentos de la colección "estudiantes" usando updateMany():
async function actualizarVariosEstudiantes() {
    try {
        const db = await conectarDB();
        const resultado = await db.collection('estudiantes').updateMany(
            { "estado": "pendiente" },
            { $set: { "estado": "aprobado" } }
        );
        console.log(`Se han actualizado ${resultado.modifiedCount} estudiantes.`);
    } catch (error) {
        console.error('Error al actualizar estudiantes:', error);
    }
}


// 3. Eliminar documento de la colección "estudiantes" usando deleteOne():
async function eliminarEstudiante() {
    try {
        const db = await conectarDB();
        await db.collection('estudiantes').deleteOne({ "_id": ObjectId("1128MTC") });
    } catch (error) {
        console.error('Error al eliminar estudiante:', error);
    }
}

// 3.1 Eliminar varios documentos de la colección "estudiantes" usando deleteMany():
async function eliminarVariosEstudiantes() {
    try {
        const db = await conectarDB();
        const resultado = await db.collection('estudiantes').deleteMany(
            { "estado": "reprobado" }
        );
        console.log(`Se han eliminado ${resultado.deletedCount} estudiantes.`);
    } catch (error) {
        console.error('Error al eliminar estudiantes:', error);
    }
}


// 4. Insertar un documento en la colección "estudiantes" usando insertOne(): 
async function insertarEstudiante() {
    try {
        const db = await conectarDB();
        await db.collection('estudiantes').insertOne({ "nombre": "Keity Ortega", "correo": "keityortega@gmail.com" });
    } catch (error) {
        console.error('Error al insertar estudiante:', error);
    }
}

// 4.1 Insertar varios documentos en la colección "estudiantes" usando insertMany():
async function insertarVariosEstudiantes() {
    try {
        const db = await conectarDB();
        await db.collection('estudiantes').insertMany([
            { "nombre": "Miguel Tabares", "correo": "migueltabares@gmail.com" },
            { "nombre": "Leity Ortega", "correo": "leityortega@gmail.com" },
            { "nombre": "Josefina Ramírez", "correo": "joseframirez@gmail.com" },
            { "nombre": "Hernán Corteza", "correo": "corazahernan@gmail.com" },
            { "nombre": "Juliana Juárez", "correo": "juarezjuliana@gmail.com" }
        ]);
    } catch (error) {
        console.error('Error al insertar varios estudiantes:', error);
    }
}

// Ejecutar las funciones
(async () => {
    try {
        await crearBaseDeDatos(); // Crear la base de datos antes de llamar a otras funciones
        console.log('Base de datos creada correctamente.');

        // Llamar a las funciones de operaciones CRUD después de crear la base de datos
        await listarEstudiantes();
        console.log('Estudiantes listados correctamente.');

        await actualizarEstudiante();
        console.log('Estudiante actualizado correctamente.');

        await actualizarVariosEstudiantes();
        console.log('Varios estudiantes actualizados correctamente.');

        await eliminarEstudiante();
        console.log('Estudiante eliminado correctamente.');

        await eliminarVariosEstudiantes();
        console.log('Varios estudiantes eliminados correctamente.');

        await insertarEstudiante();
        console.log('Estudiante insertado correctamente.');

        await insertarVariosEstudiantes();
        console.log('Varios estudiantes insertados correctamente.');
    } catch (error) {
        console.error('Error en la ejecución de funciones:', error);
    }
})();



















