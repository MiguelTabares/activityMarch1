import { MongoClient} from 'mongodb';

async function crearBaseDeDatos() {
    // Crear una instancia del cliente de MongoDB
    const cliente = new MongoClient('mongodb://localhost:27017', { useNewUrlParser: true, useUnifiedTopology: true });

    try {
        // Conectar al servidor de MongoDB
        await cliente.connect();

        // Seleccionar la base de datos
        const db = cliente.db('software-training-center');

        // Verificar si la colección "estudiantes" ya existe
        const existeColeccion = await db.listCollections({ name: 'estudiantes' }).hasNext();
        if (!existeColeccion) {
            // Crear colección estudiantes
            await db.createCollection('estudiantes');
            console.log('La colección "estudiantes" se ha creado exitosamente.');
        } else {
            console.log('La colección "estudiantes" ya existe.');
        }

        // Insertar un documento en la colección estudiantes
        await db.collection('estudiantes').insertOne({"nombre": "Miguel Tabares", "correo": "silenceisbeautyofsoul@gmail.com"});
        console.log('El documento se ha insertado en la colección "estudiantes".');

        console.log('La base de datos se ha creado exitosamente.');
    } catch (error) {
        console.error('Error al crear la base de datos:', error);
    } finally {
        // Cerrar la conexión con el servidor
        await cliente.close();
    }
}


async function conectarDB() {
    // Crear una instancia del cliente de MongoDB
    const cliente = new MongoClient('mongodb://localhost:27017', { useNewUrlParser: true, useUnifiedTopology: true });

    try {
        // Conectar al servidor de MongoDB
        await cliente.connect();

        // Devolver la instancia de la base de datos
        return cliente.db('software-training-center');
    } catch (error) {
        console.error('Error al conectar con la base de datos:', error);
        throw error;
    }
}