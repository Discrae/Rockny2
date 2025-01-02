import type Role from "../model/role.js";
import MySQLService from "../service/mysql_service.js";

class RoleRepository {
	// Nom de la table SQL
	private table = "role";

	// Récupérer tous les enregistrements
	// async: créer une promesse
	// La fonction renvoie un objet unknow lorsqu'une erreur est renvoyée
	public selectAll = async (): Promise<Role[] | unknown> => {
		//  Connexion au serveur MySQL
		const connection = await new MySQLService().connect();

		// Resquête SQL
		const sql = `
            SELECT
                ${this.table}.* 
            FROM
                ${process.env.MYSQL_DATABASE}.${this.table};
        `;


		// Exécuter la requête
		// try / catch: permet d'exécuter une instruction, si l'instruction échoue, une erreur est récupérer

		try {
			// Récupérer les resultats de la requete
			// results représente le premier indice du array renvoyé
			const [results] = await connection.execute(sql);

			// Si la requête à réussi
			return results;
		} catch (error) {
			// Si la requete à échoué
			return error;
		}
	};

	// Récupérer un enregistrement par sa clé primaire
	public selectOne = async (data:Partial<Role>): Promise<Role | unknown> => {	
		//  Connexion au serveur MySQL
		const connection = await new MySQLService().connect();

		// Resquête SQL
		// Créer une variable de requêtes SQL en préfixant le nom d'une variable par :
		const sql = `
            SELECT
                ${this.table}.* 
            FROM
                ${process.env.MYSQL_DATABASE}.${this.table}
			WHERE
				${this.table}.id = :id
			;	
        `;


		// Exécuter la requête
		// try / catch: permet d'exécuter une instruction, si l'instruction échoue, une erreur est récupérer
		try {
			// Récupérer les resultats de la requete
			// results: représente le premier indice du array renvoyé
			// Requêtes préparées avec des variables de requête SQL permettent d'éviter les injections SQL
			// data: permet de définir une valeur aux variables de requêtes SQL
			const [results] = await connection.execute(sql, data);

			// Si la requête à réussi
			return results;
		} catch (error) {
			// Si la requete à échoué
			return error;
		}
	};
}

export default RoleRepository;
