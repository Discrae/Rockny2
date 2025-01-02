// Promise (promesse)
// exécution d'un code asynchrone
import mysql, { type PoolConnection } from "mysql2/promise";

class MySQLService {
	// Propriété statique:
	private static connection: PoolConnection;
	// async: permet de créer une focntion asynchrone
	public connect = async () => {
		// Tester si une connexion n'existe pas

		// await : à utiliser avec un code asynchrone (promesse)
		// créer un temps d'attente dans l'exécution du code
		// récupérer le contenu d'un promesse

		if (!MySQLService.connection) {
			MySQLService.connection = await mysql
				.createPool({
					host: process.env.MYSQL_HOST,
					user: process.env.MYSQL_USER,
					password: process.env.MYSQL_PASSWORD,
					database: process.env.MYSQL_DATABASE,
					namedPlaceholders: true,
				})
				.getConnection();
		}
		// Si la connexion existe
		return MySQLService.connection;
	};
}

export default MySQLService;
